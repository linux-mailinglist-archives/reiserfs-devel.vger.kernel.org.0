Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 142802981B8
	for <lists+reiserfs-devel@lfdr.de>; Sun, 25 Oct 2020 13:50:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1416113AbgJYMuW (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sun, 25 Oct 2020 08:50:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1416111AbgJYMuT (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 25 Oct 2020 08:50:19 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE143C0613CE
        for <reiserfs-devel@vger.kernel.org>; Sun, 25 Oct 2020 05:50:18 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id t25so9487503ejd.13
        for <reiserfs-devel@vger.kernel.org>; Sun, 25 Oct 2020 05:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=H5E9GB3TLRHPujUKjC2cGtVgVBsa40cOZjJ+b4GrHG4=;
        b=YvXfVtHcBesPPAdMquYzXFDLGUP5xJjn/h2b585wsx4qMLT/ZJ4yvkIlxX8bAhK3d1
         NuBj2X6gaR8/1P0e5M27gXu6UHleLHsnQD4/RGeiowUh815E/L2K+AHi1TfMqPwadD6f
         XqlFZ+W5IwG/4DhO2xnARZWSHGuw4wkPKII9XyzOgZeDhPcWIhGWoNSHNiR3dG+MgUjZ
         Wdl92pjZ4S3bbx0fTjnNtHCySgcUxqQALPNZ6XHJofnYQvW8uuJJ4Xj3hwSHiUggnZYy
         rRJr1aXiOJLze0QzOHj9p2oJDybH8FEYUfPnHbNFxAjUuze5L8ITuM7axyTYb4gfyj25
         Fq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H5E9GB3TLRHPujUKjC2cGtVgVBsa40cOZjJ+b4GrHG4=;
        b=IIff7U3f3PZ4qIrCTf/JeKmpoXp7h/lZlFRbxglvtFdmEXYKgnsN/nm9XWbAbh2Fwx
         WnUhweKVV58PT4yaoBemL+Q9Q30yb7rAiM1sMOAASDxp2XB4yUDsfylkO0by7O5Ycd/n
         UYWiF1OA+IXhZZXAHs4kRgXAuIN6HO3h5aZrwVCnyORN8lz2mucldHd88FQGV0Nc8JHI
         uTSPYKbgJe2xI82EMOwmOabHI2ax4p3a6SGI0iunjhgtb8PiLLkiQbs32wsbWaxPswfx
         iXFvUJ0nIKUyNJvlUzr0HUrxqHhA6/k05v5F6wolRTJRD2e+3Q7tl/kDxk2b0mt7hDPY
         pTJg==
X-Gm-Message-State: AOAM53260/zkAY6/mWW0K6XUgvrfALT10QIrOyql8da1fnv9/S3FIZ7S
        gMqgx5RRxO3yxHAGNozsuLFPWXbQsao=
X-Google-Smtp-Source: ABdhPJyzlmPokLsA2GSc9+0AxYIqryl4GiPRu9eww57Xtlq4Ug91xBOPk7itHddbVGG6xqhRDyQ0kw==
X-Received: by 2002:a17:906:3a02:: with SMTP id z2mr3695623eje.452.1603630216744;
        Sun, 25 Oct 2020 05:50:16 -0700 (PDT)
Received: from [192.168.0.48] (HSI-KBW-046-005-005-175.hsi8.kabel-badenwuerttemberg.de. [46.5.5.175])
        by smtp.gmail.com with ESMTPSA id v21sm3513154edt.80.2020.10.25.05.50.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 25 Oct 2020 05:50:16 -0700 (PDT)
From:   Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: PROBLEM: Reiser4 hard lockup
To:     David Niklas <Hgntkwis@vfemail.net>
Cc:     ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>
References: <20201024163630.1e5f2aca@Phenom-II-x6.niklas.com>
Message-ID: <d698b4e5-01b5-c964-65d6-e530891bf78f@gmail.com>
Date:   Sun, 25 Oct 2020 13:50:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20201024163630.1e5f2aca@Phenom-II-x6.niklas.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On 10/24/2020 10:36 PM, David Niklas wrote:
> Hello,
> 

Hi David,

Thanks for the comprehensive report, which is definitely useful!
Below you can find some hints and comments.


> # Intro
> Pardon my tardiness in reporting this, I was stalling my disk upgrade to
> help test a fix for a reiserfs problem. I needed to get my life going
> again before taking the time to report this.
> This is a heads up for a serious problem. I no longer use reiser4
> anymore because I can't have my kernel hard and soft locking up within
> hours of booting and I don't use the 5.7.13. Therefore, I can't test a
> fix for this, but I am willing to test future releases of reiser4 on a
> test partition.
> The problem might lie elsewhere in the Linux kernel considering how many
> panics it threw before hard locking up, but I am starting with the
> reiser4 maintainer and ML because kernel 5.8.X without loading the
> reiser4 module has been quite stable.
> 
> # 2. Description
> The Linux kernel hard and/or soft locks up only hours after booting when
> using reiser4. It throws several panics before hand. The applications that
> trigger this bug are rtorrent + dar + sync.
> 
> # 3. Keywords
> hard lockup, soft lockup, reiser4, rcu
> 
> # 4. Kernel information.
> 5.7.13 x86_64
> 
> # 5. Kernel without bug.
> NA
> 
> # 6. Oops message.
> Way too big. See attached.
> Here's something to wet your tongue:
> 
> [ 4483.173140] NMI backtrace for cpu 0
> [ 4483.173143] CPU: 0 PID: 21593 Comm: dar Not tainted
> 5.7.13-nopreempt-Radeon-SI-dav10 #4 [ 4483.173144] Hardware name:
> Gigabyte Technology Co., Ltd. To be filled by O.E.M./970A-DS3P, BIOS FD
> 02/26/2016 [ 4483.173145] Call Trace: [ 4483.173148]  <IRQ>
> [ 4483.173153]  dump_stack+0x66/0x8b
> [ 4483.173155]  nmi_cpu_backtrace+0x89/0x90
> [ 4483.173157]  ? lapic_can_unplug_cpu+0x90/0x90
> ...
> [ 4483.173213]  jput_final+0x303/0x320 [reiser4]
> [ 4483.173220]  reiser4_invalidate_list+0x3e/0x50 [reiser4]
> [ 4483.173228]  reiser4_write_logs+0x76/0x560 [reiser4]
> ...
> [ 4557.097894] NMI watchdog: Watchdog detected hard LOCKUP on cpu 2
> ...
> [ 4557.600871]  __schedule+0x288/0x5d0
> [ 4557.600874]  schedule+0x4a/0xb0
> [ 4557.600875]  schedule_timeout+0x14a/0x300
> ...
> 
> # 7. Shell script to trigger the problem.
> I tried to create an artificial workload using dd, cp, sync, and other
> programs to cause the fault without success.
>


It's a pity..
To be honest, I received complaints that reiser4 doesn't make
a friendship with torrents long time ago. Unfortunately, I am in Europe,
where it is impossible to use torrents that simply, without conflicts
with local legislation. Respectively, I am not able to reproduce it,
and the problem is still unfixed..


[snip]

> 
> # 9. Other notes.
> I have sync setup exactly like this: while true; do sleep 5m && sync; done
> Dar was run like this: dar -x ARCHIVE -R PATH -K bf: bell
> rtorrent was run using this command: ionice -c2 -n7 rtorrent
> It didn't seem to matter what rtorrent was downloading, so long as there
> was more than one file.
> Likewise, in dar's case it didn't matter if it was some large files or
> many small ones. I explicitly tested both possibilities.
> 
> With a mount time of 20m-30m, I was vexed when trying to debug reiser4.
> Maybe something could be done about that.


reiser4 mount option "dont_load_bitmap" is your friend.


> I had also to manually chew through all the kernel .o files to find where
> the kernel broke at (also attached).
> 
> The command I used to create the reiser4 FS was:
> mkfs.reiser4 -o
> create=reg40,fibration=ext_3_fibre,hash=r5_hash,key=key_large,node=node40,compress=lzo1,compressMode=conv /dev/md7p1
> I wanted to use reg40 as opposed to ccreg40 because I wanted an
> unencrypted partition.


You got confused. Reiser4 doesn't support encryption without special
patches (which are not public). With "create=reg40" you get a "classic"
setup without compression.

There is a "getting started" page, which provides some recommendations
on reiser4 mkfs and mount options:
https://reiser4.wiki.kernel.org/index.php/Reiser4_Howto


  Likewise, I changed the fibration to ext_3_fibre
> from ext_1_fibre. Other then that, everything is set to it's defaults.
> Interestingly, if I try to set the key to short and change the mode to
> tea (a time compute trade off AFAIK), I crashes mkfs.reiser4.
> I need to report this to the developers.


Short keys is an exotic option (are you restricted in disk space?).
But that crash needs to be fixed, of course. I'll create a ticket.


> 
> When trying to remount the FS after this crash I got an error from fsck
> that I needed to rebuild the super block. Considering that all
> transactions are atomic, this was quite a surprise to me.
> This failed because the format version was somehow greater than my tools
> version.


Absolutely.

SFRN (Software Framework Release Number) of your tools is 4.0.1.
SFRN of your reiser4 module is 4.0.2.
Right after formatting your partition had format 4.0.1.
After mounting to the kernel of greater SFRN, it was automatically
upgraded to 4.0.2, so you are not able to check that partition with
fsck of smaller SFRN anymore. All you needed was to upgrade your
reiser4progs.

More about compatibility is here:
https://reiser4.wiki.kernel.org/index.php/Reiser4_development_model


> I did double check this because it was such a strange error.


To check SFRN of any tool of reiser4progs package, run it with the
option -V and find "Format release". For example:

# mkfs.reiser4 -V
mkfs.reiser4 1.2.1
Format release: 4.0.2

"Format release" can be confusing, though. We might need to fix it to
"Framework release".


> Again, I'll have to report this to the developers.
> 
> # fsck /dev/md7p1
> fsck from util-linux 2.29.2
> *******************************************************************
> This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
> *******************************************************************
> 
> Fscking the /dev/md7p1 block device.
> Will check the consistency of the Reiser4 SuperBlock.
> Will check the consistency of the Reiser4 FileSystem.
> Continue?
> (Yes/No): ***** fsck.reiser4 started at Mon Sep 21 19:30:34 2020
> FSCK: /build/reiser4progs-sLVONq/reiser4progs-1.1.0/librepair/backup.c:
> 505: repair_backup_open: Found backup does not match to the on-disk
> filesystem metadata.
> Fatal: Format version (4.0.2) of the partition is greater than format
> release number (4.0.1) of reiser4progs. Please upgrade reiser4progs and
> try again. Fatal: Failed to open the format.
> Fatal: Cannot open the FileSystem on (/dev/md7p1).
> 
> 1 fatal corruptions were detected in SuperBlock. Run with --build-sb
> option to fix them.
> 
> # fsck.reiser4 --build-sb /dev/md7p1
> *******************************************************************
> This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
> *******************************************************************
> 
> Fscking the /dev/md7p1 block device.
> Will build the Reiser4 SuperBlock.
> Will check the consistency of the Reiser4 FileSystem.
> Continue?
> (Yes/No): ***** fsck.reiser4 started at Mon Sep 21 19:31:07 2020
> FSCK: /build/reiser4progs-sLVONq/reiser4progs-1.1.0/librepair/backup.c:
> 505: repair_backup_open: Found backup does not match to the on-disk
> filesystem metadata.
> Fatal: Format version (4.0.2) of the partition is greater than format
> release number (4.0.1) of reiser4progs. Please upgrade reiser4progs and
> try again. Fatal: Failed to open the format.
> Fatal: Cannot open the FileSystem on (/dev/md7p1).
> 
> 1 fatal corruptions were detected in SuperBlock. Run with --build-sb
> option to fix them.
> 


That suggestion to run with --build-sb is incorrect and should be
ignored. It is a side-effect of the primary reason (incompatible version
of reiser4progs). A fixup in fsck is required..


> One thing that was quite interesting about this is that the Linux kernel
> said I needed to upgrade my disk format of reiser 4.
> Sep 19 04:21:16 Phenom-II-x6 kernel: [   37.113970][ T2122]
> Loading Reiser4 (format release: 4.0.2) See www.namesys.com for a
> description of Reiser4.
> Sep 19 04:21:16 Phenom-II-x6 kernel: [   37.132956][ T2121]
> reiser4: md7p1: found disk format 4.0.2.
> Sep 19 04:21:16 Phenom-II-x6 kernel: [   37.133792][ T2121]
> reiser4: md7p1: use 'fsck.reiser4 --fix' to complete disk format upgrade.
>


It is expected, since you mounted partition 4.0.1 by reiser4 module
4.0.2. No hurry to complete disk format upgrade. It is needed by fsck
only.


> IDR If I tried to issue the above recommended command.
> 
> 
> Overall, after over a decade of development, I had hoped that reiser4
> would prove to be a fast, space efficient, and stable FS.


So, as I understand, the only problem is stability?
What can I say... We are not enterprise. We are like the upstream
vanilla kernel, which can always be corrupted in some configuration
under a specific workload, despite 30 years(!) of development history.
Motivation to fix bugs is driven mostly by users and their bug reports
(similar to ones that you have provided)..


  I'm a bit
> disappointed about the severity and sheer number of bugs that are so
> easily triggered at both the tooling and FS level.
> Again, I have the room on 1 HDD to test reiser4 further if you can get to
> the bottom of these problems.


Thanks again for the report.
Once we fix the problem with torrents, we'll let you know..

Edward.
