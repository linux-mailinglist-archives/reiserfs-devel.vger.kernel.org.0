Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D01261E18AA
	for <lists+reiserfs-devel@lfdr.de>; Tue, 26 May 2020 03:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388062AbgEZBIq (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 25 May 2020 21:08:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387888AbgEZBIq (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 25 May 2020 21:08:46 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05A58C061A0E;
        Mon, 25 May 2020 18:08:45 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id j21so22072319ejy.1;
        Mon, 25 May 2020 18:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=34VgtvRJWyOLpPfPUmIeZ0zAkJ0UNCHXr0jGHxGkpYs=;
        b=QVoxcWFzG/UmpqQhmAIfGMrbRzcG+DEhwVM/VK42vKjJl8a1BKjVYVyBMeIt265CsG
         DC6tYpKkQttqjBL9za5AM8iVpyDssCdrZvovm+DsyqrDrscOFwfMq3uBzdgQZ3ejzXHz
         QMQX1rUcBFKHzw+T4WTBpZFUDTrMGA/N0xyLv5jUkqLebnPGSN4LJhEv2oS1LtsAVVzJ
         o1cE6WqWXnEPWlBpZbmThWUbAjgJ/u9DCmFTPkhU/zoWd49/ZJMpct3cMlI/z7X9iTln
         pzR5ctMAZYPgtN9CypDn2PMCNXCzF0nsfz0U9c5p7R9HzS1xK4YHa9kmTGvT252JD2SS
         4apQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=34VgtvRJWyOLpPfPUmIeZ0zAkJ0UNCHXr0jGHxGkpYs=;
        b=gOPcwnXmIk7p3Vjnm9/pNYiCusYFYUcDtdLs47TS6hoBaJ05qW085hfqJTC5yGBCbt
         Ea3YatZpaGnlv99jtnqILJWf8CiV9nnDBSHonZYpyDbBJe/jb/sV+ZF8Prd9uVHl0NYr
         o1vY65S/EKginB1RW2hwehmJDUtC4nTDWd+Bc2uV+mMBEBkpqHiEgLxncFntGquz4HQV
         qPoeHoyPeewLi1Kv61YRa3ms7Gmz8CAfYoTnEEeZ1NneZdysr6JlQr1yQdIZMoUsIkQf
         opAM30o7ZDRmmVDMGlUxg1y3oZ6Slf0rykAWPf18DXZabxAIX+jXTJWH3QWMDV4R9YHa
         YBxA==
X-Gm-Message-State: AOAM532nAHA+CafImYGhIkhQXhPmAoZMXx6p7jRws9YYF1WaMuK7gLRt
        ZprKEHBOB3Bv4wRWATAPBTLsQloT
X-Google-Smtp-Source: ABdhPJyGZ5mfM4A+BF/2eBRnfH1fQGU+pl4AIo/XOeUEVXGfZdZIK2QvR5+1h4j788sNvrVQ0fg/nQ==
X-Received: by 2002:a17:906:14d3:: with SMTP id y19mr20551201ejc.466.1590455324148;
        Mon, 25 May 2020 18:08:44 -0700 (PDT)
Received: from [192.168.0.48] (HSI-KBW-46-223-1-228.hsi.kabel-badenwuerttemberg.de. [46.223.1.228])
        by smtp.gmail.com with ESMTPSA id w7sm16547604edq.94.2020.05.25.18.08.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 May 2020 18:08:43 -0700 (PDT)
From:   Edward Shishkin <edward.shishkin@gmail.com>
Subject: [ANNOUNCE] Reiser5: Data Tiering. Burst Buffers. Speedup synchronous
 modifications
To:     ReiserFS development mailing list 
        <reiserfs-devel@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <4f919dee-5b72-9269-2bd0-6818a7167864@gmail.com>
Date:   Tue, 26 May 2020 03:08:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

                  Reiser5: Data Tiering. Burst Buffers
                   Speedup synchronous modifications


              Dumping peaks of IO load to a proxy device


Now you can add a small high-performance block device to your large
logical volume composed of relatively slow commodity disks and get
an impression that the whole your volume has throughput which is as
high, as the one of that "proxy" device!

This is based on a simple observation that in real life IO load is
going by peaks, and the idea is to dump those peaks to a high-
performance "proxy" device. Usually you have enough time between peaks
to flush the proxy device, that is, to migrate the "hot data" from the
proxy device to slow media in background mode, so that your proxy
device is always ready to accept a new portion of "peaks".

Such technique, which is also known as "Burst Buffers", initially
appeared in the area of HPC. Despite this fact, it is also important
for usual applications. In particular, it allows to speedup the ones,
which perform so-called "atomic updates".


                Speedup "atomic updates" in user-space


There is a whole class of applications with high requirements to data
integrity. Such applications (typically data bases) want to be sure
that any data modifications either complete, or they don't. And they
don't appear as partially occurred. Some applications has weaker
requirements: with some restrictions they accept also partially
occurred modifications.

Atomic updates in user space are performed via a sequence of 3 steps.
Suppose you need to modify data of some file "foo" in an atomic way.
For this you need to:

1. write a new temporary file "foo.tmp" with modified data
2. issue fsync(2) against "foo.tmp"
3. rename "foo.tmp" to "foo".

At step 1 the file system populates page cache with new data
At step 2 the file system allocates disk addresses for all logical
blocks of the file foo.tmp and writes that file to disk. At step 3 all
blocks containing old data get released.

Note that steps 2 and 3 become a reason of essential performance drop
on slow media. The situation gets improved, when all dirty data are
written to a dedicated high-performance proxy-disk, which exactly
happens in a file system with Burst Buffers support.


           Speedup all synchronous modifications (TODO)
               Burst Buffers and transaction manager


Not only dirty data pages, but also dirty meta-data pages can be
dumped to the proxy-device, so that step (3) above also won't
contribute to the performance drop.

Moreover, not only new logical data blocks can be dumped to the proxy
disk. All dirty data pages, including ones, which already have
location on the main (slow) storage can also be relocated to the proxy
disk, thus, speeding up synchronous modification of files in _all_
cases (not only in atomic updates via write-fsync-rename sequence
described above).

Indeed, let's remind that any modified page is always written to disk
in a context of committing some transaction. Depending on the commit
strategy (there are 2 ones "relocate" and "overwrite"), for each such
modified dirty page there are only 2 possibility:

a) to be written right away to a new location,
b) to be written first to a temporary location (journal), then to be
    written back to permanent location.

With Burst buffers support in the case (a) the file system writes
dirty page right away to the proxy device. Then user should take care
to migrate it back to the permanent storage (see section "Flushing
proxy devise" below). In the case (b) the modified copy will be
written to the proxy device (wandering logs), then at checkpoint time
(playing a transaction) reiser4 transaction manager will write it to
the permanent location (on commodity disks). In this case user doesn't
need to worry on flushing proxy device, however, the procedure of
commit takes more time, as user should also wait for "checkpoint
completion".

So from the standpoint of performance "write-anywhere" transaction
model (reiser4 mount option "txmod=wa") is more preferable then
journalling model (txmod=journal), or even hybrid model (txmod=hybrid)


             Predictable and non-predictable migration
                       Meta-data migration


As we already mentioned, not only dirty data pages, but also dirty
meta-data pages can be dumped to the proxy-device. Note, however, that
not predictable meta-data migration is not possible because of
chicken-eggish problem. Indeed, non-predictable migration means that
nobody knows, on what device of your logical volume a stripe of data
will be relocated in the future. Such migration requires to record
location of data stripes. Now note, that such records is always a part
of meta-data. Hence, you are now able to migrate meta-data in
non-predictable way.

However, it is perfectly possible to distribute/migrate meta-data in a
predictable way (it will be supported in so-called "symmetric" logical
volumes - currently not implemented). Classic example of predictable
migration is RAID arrays (once you add, or remove a device to/from the
array, all data blocks migrate in predictable way during rebalancing).
If relocation is predictable, then it is not need to record locations
of data stripes - it can always be calculated.

Thus, non-predictable migration is applicable to data only.


                   Definition of data tiering.
              Using proxy device to store hot data (TODO)


Now we can precisely define tiering as (meta-)data relocation in
accordance with some strategy (automatic, or user-defined), so that
every relocated unit always gets location on another device-component
of the logical volume.

During such relocation block number B1 on device D1 gets released,
first address component is changed to D2, second component is changed
to 0 (which indicates not allocated block number), then the file
system allocates block number B2 on device D2:

                 (D1, B1) -> (D2, 0) -> (D2, B2)

Note that tiering is not defined for simple volumes (i.e. volumes,
consisting only of one device). Blocks relocation within one device
is always in a competence of a file system (to be precisely, of block
allocator.

Burst buffers is just one of strategies, in accordance with which all
new logical blocks (optionally, all dirty pages) always get location
on a dedicated proxy device. As we have figured out, Burst Buffers is
useful for HPC applications, as well as for usual applications
executing fsync(2) frequently.

There are other data tiering strategies, which can be useful for other
class of applications. All of them can be easily implemented in
Reiser5.

For example, you can use proxy device to store hot data only. With
such strategy new logical blocks (which are always "cold") will always
go to the main storage (in contrast with Burst Buffers, where new
logical blocks first get written to the proxy disk). Once in a while
you need to scan your volume in order to push colder data out, and
pull hotter data in the proxy disk. Reiser5 contains a common
interface for this. It is possible to maintain per-file, or even per-
blocks-extent "temperature" of data (e.g. as a generation counter),
but we still don't have more or less satisfactory algorithms to
determine "critical temperature" for pushing data in/out proxy disk.


         Getting started with proxy disk over logical volume


Just follow the administration guide:
https://reiser4.wiki.kernel.org/index.php/Proxy_Device_Administration

WARNING: THE STUFF IS NOT STABLE! Don't store important data on
Reiser5 logical volumes till beta-stability announcement.
