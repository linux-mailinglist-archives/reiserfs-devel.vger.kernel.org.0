Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28BA94FECA0
	for <lists+reiserfs-devel@lfdr.de>; Wed, 13 Apr 2022 03:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231623AbiDMB6w (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 12 Apr 2022 21:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230354AbiDMB6w (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 12 Apr 2022 21:58:52 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D75AB19C3D
        for <reiserfs-devel@vger.kernel.org>; Tue, 12 Apr 2022 18:56:32 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id cw11so696592pfb.1
        for <reiserfs-devel@vger.kernel.org>; Tue, 12 Apr 2022 18:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OAPJ4RiBr1MWcfJTam0Ftt9Thrm/B4/MdfLiYADRXYo=;
        b=SAZ/ePtHteBAS0dUdDq6ySo9l5JZcwlUAoguinanTp0Vsuqt04Pl/8PQAbh9Bc4mH5
         hAtYovfLaZuf23WO3QyG6tyvl9gGXouiloelzcpzmBunJ8tgWH9fQb5iWV6DO6m6YyDG
         TZ55EahGojr1DZQYDVC3Cw/Rp8wfYlm457DNnEVBUv3t30pmh+ZUgA0M7FgE/sN5d+Tp
         h/3ojshSADaSIO+xbiAy6RyvO45HI/aHtQGx0xJlh+Er994bljwVZejZ58m6QrpysnDv
         gqpDFLF5AKkI4Gm8lgauONObkVyTx6cJ0UDNhidUgz6IR5aWa2/ZVHkS4QMr8KD5PEvs
         Zhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OAPJ4RiBr1MWcfJTam0Ftt9Thrm/B4/MdfLiYADRXYo=;
        b=yViUNt5Zy6FgllTrd7rcHcfWCYFku1eOMvvWicgpKna+m813swUo2vdSUfEXz9Qi6N
         Ebz+NUnfwvAOdqBF7eY8A3q5wpsW5l9ck8ggw41zH0DBssTl+72uaMpv+pM7FYPUYgrU
         0VMXf1HBkELnTVxq5fwfvVgurhhO5xxRkc2SkzRe45HRWGBqD3aysi0Bz1VKwTSA/0qh
         Av7UusFsZusmCC4EMII1D61qGgw4EJChpIPWkHShSsF2N1r64gHBQqslGHqz2XrrkXlk
         Rbzv0uPeRZkgveimIG/BRnPC/K/ocCucI9V9jc6ydq+GEX+PS3T6hRaApiRYoxGFav4E
         CwOg==
X-Gm-Message-State: AOAM532nxQEnynAU5LcLP1SuTMILKB9vpvVSveYVsU9qF+ONutmnIn1J
        h+cfPGq1Bn73uDfh5q7q363OlVUNPWw=
X-Google-Smtp-Source: ABdhPJxurWDh0FBcellrXOfQoncq9bQC7zLoxE/oObjKnoFI11glezDIx1Z9F9rDaW8Izqsl+3pGSg==
X-Received: by 2002:a63:3441:0:b0:39d:a27b:e594 with SMTP id b62-20020a633441000000b0039da27be594mr3508526pga.98.1649814992370;
        Tue, 12 Apr 2022 18:56:32 -0700 (PDT)
Received: from [192.168.1.100] ([147.10.197.145])
        by smtp.gmail.com with ESMTPSA id j9-20020a056a00130900b004f73df40914sm39444123pfu.82.2022.04.12.18.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 18:56:31 -0700 (PDT)
Message-ID: <2e1311cd-008a-b689-c43c-bcdc0dc773fc@gmail.com>
Date:   Wed, 13 Apr 2022 11:56:27 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Reiser4 on an inherently read-only block device
Content-Language: en-GB
To:     Edward Shishkin <edward.shishkin@gmail.com>,
        reiserfs-devel@vger.kernel.org
Cc:     John Nicholls <john@thinlinx.com>
References: <c80ff400-479f-0730-506b-5a1e8edf9e82@thinlinx.com>
 <879c3df3-e369-797f-a412-022621d738be@gmail.com>
From:   Paul Whittaker <pawhitt69@gmail.com>
In-Reply-To: <879c3df3-e369-797f-a412-022621d738be@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org


>> Reiser4 is almost perfect for our (thinlinx.com's) needs except for 
>> one problem: it wants to write to the block device even when mounted 
>> read-only,
>
> After issuing a "mount -o ro" command, reiser4 can potentially issue
> write IO requests in the following cases:
>
> 1) Upgrading Format Version (it happens when you mount a reiser4 volume
>    of format 4.X.A in the system with reiser4 module of software version
>    4.X.B, where B > A).
> 2) Your volume has uncommitted transactions, that should be replayed.
> 3) Other possible mount-time cases that I don't remember.
> 4) Possible bugs in reiser4 code (e.g. ignoring the read-only flag in
>    the write(2) context, etc).
>
> From your message it is not clear, which one takes place in your case.

I'm not sure either.  I thought I could rule out (1) and (2), but now 
I'm not so sure.  (1) could potentially be a problem, but we can work 
around that procedurally if necessary.

What is sufficient to guarantee that the volume has no uncommitted 
transactions?  Simply unmounting cleanly?  If not, would integrity 
checking it with fsck.reiser4 do this?

>> and handles errors ungracefully (read as: crashes and burns) when it 
>> can't - specifically, when performing the umount operation.  I 
>
> So what exactly happens at umount?
A kernel thread panic somewhere in the reiser4 code that results in the 
umount operation getting permanently stuck.  I'll provide the exact 
error messages if/when I can reproduce it (see below).
>> haven't been able to devise a simple reproducer for this, e.g. using 
>> a tiny ISO9660 filesystem, so there must be some subtleties that I am 
>> unaware of, but it happens 100% of the time when using our real data.

My apologies, this is apparently no longer true.  I evidently haven't 
re-tested this for some time, and am now having trouble reproducing it 
at all, even with our real data.  I'll test further and get back to 
you.  It's possible that my preparation methods are at fault, and I am 
not being careful enough to ensure all transactions have been 
committed.  It's also possible that my problem got fixed since I last 
tested (but I'm pretty sure that there have been no relevant commits 
since then, so that seems less likely).

> Yeah, some "non-enterprise bits" still take place in reiser4, mostly
> because of restricted development resources. Right now I can help only
> with 100% reproducible scenarios provided..
Understood - I'll try to find a simple and reliable reproducer.
>> We have a couple of use cases that necessarily involve inherently 
>> read-only block devices:
>>
>> 1) We want to provide an ISO9660-based installer for our O/S that 
>> contains a Reiser4 (kinda-sorta-)root filesystem image that the 
>> installer would mount read-only via loopback to inspect certain files 
>> prior to dd'ing it to a target disk.
>>
>> 2) We want to share a copy of the Reiser4 (kinda-sorta-)root 
>> filesystem, which is mounted read-only on a writeable medium, 
>> read-only via the ATA-over-Ethernet protocol for use by 
>> network-booted instances of our O/S (this is feasible because the 
>> *real* root filesystem is AUFS with a couple of additional writeable 
>> layers).  The resulting /dev/etherd/eX.Y block device is inherently 
>> read-only - if it isn't, we risk write contention and Bad Things.

I don't think I explained that clearly enough, given your comments below.

Under normal (product use) circumstances, the Reiser4 filesystem in 
question is *never* mounted read-write.  It's intended as a base 
"firmware" layer for our embedded Linux thin client appliance, and on 
top of that we have a persistent writeable middle layer (an ext3 
filesystem) and a non-persistent tmpfs top layer, amalgamated via AUFS 
into a root filesystem.  Changes occur in the top layer, so that in the 
event of sudden power loss the system will always reset to a known good 
state (base layer + middle layer + empty top layer, changes since last 
reboot lost). During a graceful shutdown, top layer changes are 
*selectively* committed to the middle layer in a *brief* write burst, 
minimising writes to what is likely to be flash storage (the majority of 
our customers use Raspberry Pi hardware with SD cards as storage) and 
also minimising the potential-for-data -loss window (further mitigated 
by ext3 journaling).  If something goes wrong, the user has the option 
of reinitializing the midlayer (and the top layer also, of course) to 
effect a reset to "factory defaults".  At no time, other than during the 
development process, is the Resier4 base layer ever updated.

You're probably wondering why we are even interested in Reiser4 for such 
a use case, since we're failing to make much use of the vast majority of 
its features.  The answer is, we need (i) compression, (ii) support for 
volume labels and UUIDs, (iii) something that works under AUFS, and (iv) 
for our own convenience, preferably something writeable (it is extremely 
inconvenient to have to recreate an entire filesystem to test a trivial 
change!). Ext2/3/4 - which we used to use - fails (i), SquashFS fails 
(ii) and (iv), Btrfs fails (iii).  Reiser4 ticks all boxes.  The only 
other thing that satisfied all these requirements was E2compr[.sf.net], 
and it is 99% dead.

>> Unless I'm missing something, Reiser4 doesn't provide any mount 
>> option that would permit safe operation in the above use cases. Btrfs 
>> provides a "norecovery" a.k.a. "nologreplay" option that allows 
>> suppression of transaction log replay in situations in which the 
>> integrity of the filesystem is already guaranteed.
>
> What are you going to do in cases when the integrity is not guaranteed
> without log replay?

That situation shouldn't ever arise.  If it does, the fault is mine and 
not Reiser4's.

>> Is it possible to add a comparable mount option in Reiser4?  It seems 
>> to me that read-only should mean **read only**!
>
> Yeah, it is possible. Reiser4 does not distinguish between critical and
> non-critical logs though. However, it is possible to use a 
> "write-anywhere" transaction mode (mount option "txmod=wa"), in which 
> only
> system blocks are logged. So that *all* logs are critical and you can
> not simply ignore them without breaking consistency. Again, here is an
> interesting question: what to do with not cleanly unmounted volumes,
> specifically, if there are logs to replay? Refuse to mount? Are such
> failures acceptable for you? 

Absolutely.   That should never occur at any time - if it does, it's 
because I've misunderstood something about how Resier4 works.


