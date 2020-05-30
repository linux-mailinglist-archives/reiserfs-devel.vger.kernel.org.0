Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AEA21E9138
	for <lists+reiserfs-devel@lfdr.de>; Sat, 30 May 2020 14:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728433AbgE3MiO (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sat, 30 May 2020 08:38:14 -0400
Received: from mail7.static.mailgun.info ([104.130.122.7]:12809 "EHLO
        mail7.static.mailgun.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728304AbgE3MiN (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sat, 30 May 2020 08:38:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1590842292; h=Date: Message-Id: Content-Transfer-Encoding:
 Content-Type: MIME-Version: Subject: To: From: Sender;
 bh=93m5urWKaiht797IHZkVVeRdL/r2AZAZTM7P7++rbpo=; b=JcORmJbTGYmTnfluVbGJnGPSek8c/zFU+WdIFd/6CDkkbH9oGKMRlhWxi1QyeezOY6vHO/3f
 DucgF4UfQwe0dxWNCYziNTFef+Xo+tT8r2iGPo30LN6xiwb7Tacm+o3MqOvRCuGyT3nrkwRc
 1LouAmcUFE5DDY0edmd9bv9OS+o=
X-Mailgun-Sending-Ip: 104.130.122.7
X-Mailgun-Sid: WyIxM2M2YSIsICJyZWlzZXJmcy1kZXZlbEB2Z2VyLmtlcm5lbC5vcmciLCAiMTdiNTQiXQ==
Received: from cohuatl.metztli.it (cohuatl.metztli.it [35.236.101.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5ed25278cb045869332aa52b (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Sat, 30 May 2020 12:32:56 GMT
Received: by cohuatl.metztli.it (Postfix, from userid 1000)
        id 2075016FFF9; Sat, 30 May 2020 05:32:55 -0700 (PDT)
From:   jose.r.r@metztli.com
To:     linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org
Subject: Re: [ANNOUNCE] Reiser5: Data Tiering. Burst Buffers. Speedup synchronous modifications
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20200530123255.2075016FFF9@cohuatl.metztli.it>
Date:   Sat, 30 May 2020 05:32:55 -0700 (PDT)
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Mon, May 25, 2020 at 6:08 PM Edward Shishkin <edward.shishkin@gmail.com> wrote:
>
>                   Reiser5: Data Tiering. Burst Buffers
>                    Speedup synchronous modifications
>
>
>               Dumping peaks of IO load to a proxy device
>
>
> Now you can add a small high-performance block device to your large
> logical volume composed of relatively slow commodity disks and get
> an impression that the whole your volume has throughput which is as
> high, as the one of that "proxy" device!
>
> This is based on a simple observation that in real life IO load is
> going by peaks, and the idea is to dump those peaks to a high-
> performance "proxy" device. Usually you have enough time between peaks
> to flush the proxy device, that is, to migrate the "hot data" from the
> proxy device to slow media in background mode, so that your proxy
> device is always ready to accept a new portion of "peaks".
>
> Such technique, which is also known as "Burst Buffers", initially
> appeared in the area of HPC. Despite this fact, it is also important
> for usual applications. In particular, it allows to speedup the ones,
> which perform so-called "atomic updates".
>
>
>                 Speedup "atomic updates" in user-space
>
>
> There is a whole class of applications with high requirements to data
> integrity. Such applications (typically data bases) want to be sure
> that any data modifications either complete, or they don't. And they
> don't appear as partially occurred. Some applications has weaker
> requirements: with some restrictions they accept also partially
> occurred modifications.
>
> Atomic updates in user space are performed via a sequence of 3 steps.
> Suppose you need to modify data of some file "foo" in an atomic way.
> For this you need to:
>
> 1. write a new temporary file "foo.tmp" with modified data
> 2. issue fsync(2) against "foo.tmp"
> 3. rename "foo.tmp" to "foo".
>
> At step 1 the file system populates page cache with new data
> At step 2 the file system allocates disk addresses for all logical
> blocks of the file foo.tmp and writes that file to disk. At step 3 all
> blocks containing old data get released.
>
> Note that steps 2 and 3 become a reason of essential performance drop
> on slow media. The situation gets improved, when all dirty data are
> written to a dedicated high-performance proxy-disk, which exactly
> happens in a file system with Burst Buffers support.
>
>
>            Speedup all synchronous modifications (TODO)
>                Burst Buffers and transaction manager
>
>
> Not only dirty data pages, but also dirty meta-data pages can be
> dumped to the proxy-device, so that step (3) above also won't
> contribute to the performance drop.
>
> Moreover, not only new logical data blocks can be dumped to the proxy
> disk. All dirty data pages, including ones, which already have
> location on the main (slow) storage can also be relocated to the proxy
> disk, thus, speeding up synchronous modification of files in _all_
> cases (not only in atomic updates via write-fsync-rename sequence
> described above).
>
> Indeed, let's remind that any modified page is always written to disk
> in a context of committing some transaction. Depending on the commit
> strategy (there are 2 ones "relocate" and "overwrite"), for each such
> modified dirty page there are only 2 possibility:
>
> a) to be written right away to a new location,
> b) to be written first to a temporary location (journal), then to be
>     written back to permanent location.
>
> With Burst buffers support in the case (a) the file system writes
> dirty page right away to the proxy device. Then user should take care
> to migrate it back to the permanent storage (see section "Flushing
> proxy devise" below). In the case (b) the modified copy will be
> written to the proxy device (wandering logs), then at checkpoint time
> (playing a transaction) reiser4 transaction manager will write it to
> the permanent location (on commodity disks). In this case user doesn't
> need to worry on flushing proxy device, however, the procedure of
> commit takes more time, as user should also wait for "checkpoint
> completion".
>
> So from the standpoint of performance "write-anywhere" transaction
> model (reiser4 mount option "txmod=wa") is more preferable then
> journalling model (txmod=journal), or even hybrid model (txmod=hybrid)
>
>
>              Predictable and non-predictable migration
>                        Meta-data migration
>
>
> As we already mentioned, not only dirty data pages, but also dirty
> meta-data pages can be dumped to the proxy-device. Note, however, that
> not predictable meta-data migration is not possible because of
> chicken-eggish problem. Indeed, non-predictable migration means that
> nobody knows, on what device of your logical volume a stripe of data
> will be relocated in the future. Such migration requires to record
> location of data stripes. Now note, that such records is always a part
> of meta-data. Hence, you are now able to migrate meta-data in
> non-predictable way.
>
> However, it is perfectly possible to distribute/migrate meta-data in a
> predictable way (it will be supported in so-called "symmetric" logical
> volumes - currently not implemented). Classic example of predictable
> migration is RAID arrays (once you add, or remove a device to/from the
> array, all data blocks migrate in predictable way during rebalancing).
> If relocation is predictable, then it is not need to record locations
> of data stripes - it can always be calculated.
>
> Thus, non-predictable migration is applicable to data only.
>
>
>                    Definition of data tiering.
>               Using proxy device to store hot data (TODO)
>
>
> Now we can precisely define tiering as (meta-)data relocation in
> accordance with some strategy (automatic, or user-defined), so that
> every relocated unit always gets location on another device-component
> of the logical volume.
>
> During such relocation block number B1 on device D1 gets released,
> first address component is changed to D2, second component is changed
> to 0 (which indicates not allocated block number), then the file
> system allocates block number B2 on device D2:
>
>                  (D1, B1) -> (D2, 0) -> (D2, B2)
>
> Note that tiering is not defined for simple volumes (i.e. volumes,
> consisting only of one device). Blocks relocation within one device
> is always in a competence of a file system (to be precisely, of block
> allocator.
>
> Burst buffers is just one of strategies, in accordance with which all
> new logical blocks (optionally, all dirty pages) always get location
> on a dedicated proxy device. As we have figured out, Burst Buffers is
> useful for HPC applications, as well as for usual applications
> executing fsync(2) frequently.
>
> There are other data tiering strategies, which can be useful for other
> class of applications. All of them can be easily implemented in
> Reiser5.
>
> For example, you can use proxy device to store hot data only. With
> such strategy new logical blocks (which are always "cold") will always
> go to the main storage (in contrast with Burst Buffers, where new
> logical blocks first get written to the proxy disk). Once in a while
> you need to scan your volume in order to push colder data out, and
> pull hotter data in the proxy disk. Reiser5 contains a common
> interface for this. It is possible to maintain per-file, or even per-
> blocks-extent "temperature" of data (e.g. as a generation counter),
> but we still don't have more or less satisfactory algorithms to
> determine "critical temperature" for pushing data in/out proxy disk.
>
>
>          Getting started with proxy disk over logical volume
>
>
> Just follow the administration guide:
> https://reiser4.wiki.kernel.org/index.php/Proxy_Device_Administration
>
Re:
> WARNING: THE STUFF IS NOT STABLE! Don't store important data on
> Reiser5 logical volumes till beta-stability announcement.
Will you be releasing reiser4 Software Format Release Number 4.0.2 for Linux kernel 5.6 patch?

From personal experience SFRN 4.0.2 is stable and all my data, local and cloud virtual machines instances, as well as computing for the last six(6)+ years is in that format/environment. Although I have not tried an Debian based installation with this second iteration of SFRN 5 I have no use for the kernel/reiser4progs until they play well with Debian installer, python, etc..

Best Professional Regards.


-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Buster w/ Linux 5.5.19 AMD64
---------------------------------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-------------------------------------------------------------------------------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/
