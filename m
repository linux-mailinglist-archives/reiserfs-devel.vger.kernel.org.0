Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A151E99D3
	for <lists+reiserfs-devel@lfdr.de>; Sun, 31 May 2020 20:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbgEaSXH (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sun, 31 May 2020 14:23:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbgEaSXH (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 31 May 2020 14:23:07 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1417AC061A0E;
        Sun, 31 May 2020 11:23:07 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id c3so9188341wru.12;
        Sun, 31 May 2020 11:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=fwDe9YGhg976uirr/xU2H5rmqQCzh+e/WhPhkoYiCmk=;
        b=eCnmP2mzsytL5T+APMgfwm2Jc8KjEJKR1MEsceH05NEgiNdmO4a/ETxmYmHWBCyzQI
         G8DWEMcRdZOPNsbAP4/p/cjoGNQ+sbLJLys0PPGJh/BMjxIhz8Z8a8FkzF25CmAyie/b
         COfSMHFsQkQf43o+VA3puE8bQY6EsFTYJBlLSC+iFsE4WnGf+lTeOpGYWUU9NWfTnMBd
         DIH6WqrctfJsnfBQ/qKmyRrg0jzAmIA2xabc3uk6TWyT7krHMK7ATtvFa5r1wOhHx8UF
         3DCnq8gLTEX0r6uxDOXm5sAr2KADtAg367c4rp7v+Wb9mWXbWpKHaFDP8cY3kMf4kSYm
         PPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fwDe9YGhg976uirr/xU2H5rmqQCzh+e/WhPhkoYiCmk=;
        b=On9+Bc2pn0MkaU+teQNxny+2lcHoaWqJsbvA3PtcwXLk19E1sFcvFU5JEXAd38KRYH
         EFjewyG204SkNnGqvUhBuqpnrPKTb60jbnJTcECJjqGBrFD03TVNP51CPBXb8Rbn/lll
         n6/J1u1ulUEqtGz8VqppnbWJ0zHjiKGE0cV9Su/n9wlPOTZC8Y4tyt4cASME8h5LZEkA
         k56MIRGcKYov6R0baxYH+U4o91PL5tdz9GEwbYW8XcI5gqI1YqraBUyrhBdudhWk2cvH
         d3YRvqCDtrKExEWiKIro+MmIhFm1I9tucSMYXRu7GxozctUrw2VBkOzZULI1uWjG3TI9
         hQDA==
X-Gm-Message-State: AOAM530cBLMm9koqI4kr7MQdK+JJGm5n3cf24qJQs/W4doG+jQlqw4xc
        ZFbLBbJR7AzQT6UU23nFsYdU60VH
X-Google-Smtp-Source: ABdhPJzV6EokOd6Fc9QNu8MC2BSJ/ZcGTMErMrCYLVUDoL+Vvag+pDEvIZHDfnCmuIJSi++lbmN/Dw==
X-Received: by 2002:adf:82d0:: with SMTP id 74mr17318772wrc.138.1590949385324;
        Sun, 31 May 2020 11:23:05 -0700 (PDT)
Received: from [192.168.0.48] (HSI-KBW-46-223-1-216.hsi.kabel-badenwuerttemberg.de. [46.223.1.216])
        by smtp.gmail.com with ESMTPSA id l19sm8092717wmj.14.2020.05.31.11.23.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 31 May 2020 11:23:04 -0700 (PDT)
Subject: Re: [ANNOUNCE] Reiser5: Data Tiering. Burst Buffers. Speedup
 synchronous modifications
To:     jose.r.r@metztli.com, linux-kernel@vger.kernel.org,
        reiserfs-devel@vger.kernel.org
References: <20200530123255.2075016FFF9@cohuatl.metztli.it>
From:   Edward Shishkin <edward.shishkin@gmail.com>
Message-ID: <4334243d-06f0-f234-741e-81dd1b1cc828@gmail.com>
Date:   Sun, 31 May 2020 20:23:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20200530123255.2075016FFF9@cohuatl.metztli.it>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On 05/30/2020 02:32 PM, jose.r.r@metztli.com wrote:
> On Mon, May 25, 2020 at 6:08 PM Edward Shishkin <edward.shishkin@gmail.com> wrote:
>>
>>                    Reiser5: Data Tiering. Burst Buffers
>>                     Speedup synchronous modifications
>>
>>
>>                Dumping peaks of IO load to a proxy device
>>
>>
>> Now you can add a small high-performance block device to your large
>> logical volume composed of relatively slow commodity disks and get
>> an impression that the whole your volume has throughput which is as
>> high, as the one of that "proxy" device!
>>
>> This is based on a simple observation that in real life IO load is
>> going by peaks, and the idea is to dump those peaks to a high-
>> performance "proxy" device. Usually you have enough time between peaks
>> to flush the proxy device, that is, to migrate the "hot data" from the
>> proxy device to slow media in background mode, so that your proxy
>> device is always ready to accept a new portion of "peaks".
>>
>> Such technique, which is also known as "Burst Buffers", initially
>> appeared in the area of HPC. Despite this fact, it is also important
>> for usual applications. In particular, it allows to speedup the ones,
>> which perform so-called "atomic updates".
>>
>>
>>                  Speedup "atomic updates" in user-space
>>
>>
>> There is a whole class of applications with high requirements to data
>> integrity. Such applications (typically data bases) want to be sure
>> that any data modifications either complete, or they don't. And they
>> don't appear as partially occurred. Some applications has weaker
>> requirements: with some restrictions they accept also partially
>> occurred modifications.
>>
>> Atomic updates in user space are performed via a sequence of 3 steps.
>> Suppose you need to modify data of some file "foo" in an atomic way.
>> For this you need to:
>>
>> 1. write a new temporary file "foo.tmp" with modified data
>> 2. issue fsync(2) against "foo.tmp"
>> 3. rename "foo.tmp" to "foo".
>>
>> At step 1 the file system populates page cache with new data
>> At step 2 the file system allocates disk addresses for all logical
>> blocks of the file foo.tmp and writes that file to disk. At step 3 all
>> blocks containing old data get released.
>>
>> Note that steps 2 and 3 become a reason of essential performance drop
>> on slow media. The situation gets improved, when all dirty data are
>> written to a dedicated high-performance proxy-disk, which exactly
>> happens in a file system with Burst Buffers support.
>>
>>
>>             Speedup all synchronous modifications (TODO)
>>                 Burst Buffers and transaction manager
>>
>>
>> Not only dirty data pages, but also dirty meta-data pages can be
>> dumped to the proxy-device, so that step (3) above also won't
>> contribute to the performance drop.
>>
>> Moreover, not only new logical data blocks can be dumped to the proxy
>> disk. All dirty data pages, including ones, which already have
>> location on the main (slow) storage can also be relocated to the proxy
>> disk, thus, speeding up synchronous modification of files in _all_
>> cases (not only in atomic updates via write-fsync-rename sequence
>> described above).
>>
>> Indeed, let's remind that any modified page is always written to disk
>> in a context of committing some transaction. Depending on the commit
>> strategy (there are 2 ones "relocate" and "overwrite"), for each such
>> modified dirty page there are only 2 possibility:
>>
>> a) to be written right away to a new location,
>> b) to be written first to a temporary location (journal), then to be
>>      written back to permanent location.
>>
>> With Burst buffers support in the case (a) the file system writes
>> dirty page right away to the proxy device. Then user should take care
>> to migrate it back to the permanent storage (see section "Flushing
>> proxy devise" below). In the case (b) the modified copy will be
>> written to the proxy device (wandering logs), then at checkpoint time
>> (playing a transaction) reiser4 transaction manager will write it to
>> the permanent location (on commodity disks). In this case user doesn't
>> need to worry on flushing proxy device, however, the procedure of
>> commit takes more time, as user should also wait for "checkpoint
>> completion".
>>
>> So from the standpoint of performance "write-anywhere" transaction
>> model (reiser4 mount option "txmod=wa") is more preferable then
>> journalling model (txmod=journal), or even hybrid model (txmod=hybrid)
>>
>>
>>               Predictable and non-predictable migration
>>                         Meta-data migration
>>
>>
>> As we already mentioned, not only dirty data pages, but also dirty
>> meta-data pages can be dumped to the proxy-device. Note, however, that
>> not predictable meta-data migration is not possible because of
>> chicken-eggish problem. Indeed, non-predictable migration means that
>> nobody knows, on what device of your logical volume a stripe of data
>> will be relocated in the future. Such migration requires to record
>> location of data stripes. Now note, that such records is always a part
>> of meta-data. Hence, you are now able to migrate meta-data in
>> non-predictable way.
>>
>> However, it is perfectly possible to distribute/migrate meta-data in a
>> predictable way (it will be supported in so-called "symmetric" logical
>> volumes - currently not implemented). Classic example of predictable
>> migration is RAID arrays (once you add, or remove a device to/from the
>> array, all data blocks migrate in predictable way during rebalancing).
>> If relocation is predictable, then it is not need to record locations
>> of data stripes - it can always be calculated.
>>
>> Thus, non-predictable migration is applicable to data only.
>>
>>
>>                     Definition of data tiering.
>>                Using proxy device to store hot data (TODO)
>>
>>
>> Now we can precisely define tiering as (meta-)data relocation in
>> accordance with some strategy (automatic, or user-defined), so that
>> every relocated unit always gets location on another device-component
>> of the logical volume.
>>
>> During such relocation block number B1 on device D1 gets released,
>> first address component is changed to D2, second component is changed
>> to 0 (which indicates not allocated block number), then the file
>> system allocates block number B2 on device D2:
>>
>>                   (D1, B1) -> (D2, 0) -> (D2, B2)
>>
>> Note that tiering is not defined for simple volumes (i.e. volumes,
>> consisting only of one device). Blocks relocation within one device
>> is always in a competence of a file system (to be precisely, of block
>> allocator.
>>
>> Burst buffers is just one of strategies, in accordance with which all
>> new logical blocks (optionally, all dirty pages) always get location
>> on a dedicated proxy device. As we have figured out, Burst Buffers is
>> useful for HPC applications, as well as for usual applications
>> executing fsync(2) frequently.
>>
>> There are other data tiering strategies, which can be useful for other
>> class of applications. All of them can be easily implemented in
>> Reiser5.
>>
>> For example, you can use proxy device to store hot data only. With
>> such strategy new logical blocks (which are always "cold") will always
>> go to the main storage (in contrast with Burst Buffers, where new
>> logical blocks first get written to the proxy disk). Once in a while
>> you need to scan your volume in order to push colder data out, and
>> pull hotter data in the proxy disk. Reiser5 contains a common
>> interface for this. It is possible to maintain per-file, or even per-
>> blocks-extent "temperature" of data (e.g. as a generation counter),
>> but we still don't have more or less satisfactory algorithms to
>> determine "critical temperature" for pushing data in/out proxy disk.
>>
>>
>>           Getting started with proxy disk over logical volume
>>
>>
>> Just follow the administration guide:
>> https://reiser4.wiki.kernel.org/index.php/Proxy_Device_Administration
>>
> Re:
>> WARNING: THE STUFF IS NOT STABLE! Don't store important data on
>> Reiser5 logical volumes till beta-stability announcement.
> Will you be releasing reiser4 Software Format Release Number 4.0.2 for Linux kernel 5.6 patch?

I've uploaded it.
Please, find here:

https://sourceforge.net/projects/reiser4/files/reiser4-for-linux-5.x/

Thanks,
Edward

> 
>  From personal experience SFRN 4.0.2 is stable and all my data, local and cloud virtual machines instances, as well as computing for the last six(6)+ years is in that format/environment. Although I have not tried an Debian based installation with this second iteration of SFRN 5 I have no use for the kernel/reiser4progs until they play well with Debian installer, python, etc..
> 
> Best Professional Regards.
> 
> 
