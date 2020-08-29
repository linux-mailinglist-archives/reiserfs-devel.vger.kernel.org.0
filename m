Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDC662566B2
	for <lists+reiserfs-devel@lfdr.de>; Sat, 29 Aug 2020 11:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbgH2Jyu (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sat, 29 Aug 2020 05:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbgH2Jyt (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sat, 29 Aug 2020 05:54:49 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22EDBC061236;
        Sat, 29 Aug 2020 02:54:49 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id l63so1249533edl.9;
        Sat, 29 Aug 2020 02:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=pom5xppV9mtO5WyaZENR28MllTG1A0kT+Zjkh+342Fc=;
        b=ldA3UovvJJmF0vWzRdFoykZN58eC2rdSQlN7ui2zSOar4ZSWhA+p2K2gW6z4z5Ol0X
         aQMJ07i5P5xtueceJSz/A33fDwQHaLidpRPRqkvQr3fj8hIVTX9BcuehIVk0uLLXnb3u
         1JL8h8A2aJpt3SfcvT4GTm727dy87t+dXKmIpXJLWP82iI7e2k0qzT/rs27Fvm7PWx23
         G62s5cRlqoXsaN9p6DQst94VWSoq00PG+HdzK2K7DStKsvl35gk/rEMY+/aLry4rN9Up
         Hb2JC+QU6FmJyYLtLdnu0cau3xE7dqPr9L2u7WM5k9zbyoCC/brMnCLsTeh0RUZGmT80
         w3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pom5xppV9mtO5WyaZENR28MllTG1A0kT+Zjkh+342Fc=;
        b=FgyP/bzaJYLY/lqlL2kZKA5w/MhmyW/tVQvWAL1eVO9MeDcSS+9Z4nn2p3Vr1HM3aa
         3V3gpbSmP79YMZZ0uW5sJ4Ai/SP3QxmCbB6HyUOmf9/jm8HoT8yFCd3m7JkQWBVhoXzE
         5uHx2EBucnXtYtNd2tQVT5KhugEuZAks+dSR93HYuoKfMpKdkWaahUNCoZgZnvLUDcRm
         V4q1aABCkeiSzBQqdo6WfVVkSKRf9/nLo/EVKYWmhqAI3Ugml5W5CH33XiYITw9/osRA
         RmjvEu9GZf2iwsORDe/NCYB/yZSTBNhprE35h33TG46w/FQvRhpXgVg/5LkZfoptU1vx
         W2LQ==
X-Gm-Message-State: AOAM5301y2+Q/JWs63zTljfUJVrHlsai67pWQwvICXqLp8+GvxGircPL
        LiII1PdpGYR09uObXtZ2WSqQEo/dcP4=
X-Google-Smtp-Source: ABdhPJzf7KBEn/NhS3jAEvsqTbkgBhrMdENZfi2+TFzsu2p+7UuP2tiDWGgCEgmdYT24tUrWV2W6yw==
X-Received: by 2002:a50:b046:: with SMTP id i64mr2869158edd.9.1598694885021;
        Sat, 29 Aug 2020 02:54:45 -0700 (PDT)
Received: from [192.168.0.48] (HSI-KBW-046-005-005-126.hsi8.kabel-badenwuerttemberg.de. [46.5.5.126])
        by smtp.gmail.com with ESMTPSA id i35sm1696573edi.41.2020.08.29.02.54.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Aug 2020 02:54:44 -0700 (PDT)
From:   Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [ANNOUNCE] Reiser5: Selective File Migration - User Interface
To:     Metztli Information Technology <jose.r.r@metztli.com>,
        reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200827215351.620A468F3402@huitzilopochtli.metztli-it.com>
 <62dc962d-1dfd-641d-08ca-4abf62b50917@gmail.com>
Message-ID: <d53eaaec-3150-b86f-254f-c12e60b2130c@gmail.com>
Date:   Sat, 29 Aug 2020 11:54:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <62dc962d-1dfd-641d-08ca-4abf62b50917@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On 08/28/2020 01:50 AM, Edward Shishkin wrote:
> 
> 
> On 08/27/2020 11:53 PM, Metztli Information Technology wrote:
>> On Wed, Aug 26, 2020 at 2:13 PM Edward Shishkin 
>> <edward.shishkin@gmail.com> wrote:
>>>
>>> [...]
>>>
>>>>
>>>> FYI Although not officially, the Debian metaframework Buster AMD64 
>>>> distribution might be the first to support native installation of 
>>>> Reiser4 SFRN 5.1.3, kernel and reiser4progs 2.0.3, file system 
>>>> utilities.
>>>>
>>>> I have already made a couple of successful Metztli Reiser4 SFRN 5 
>>>> native installations onto ~100 GB slices, which root file system is 
>>>> formatted in 'Reiser5' and 1 GB /boot in JFS.
>>>> https://metztli.it/reiser5 (Screenshot 600x338 size)
>>>>
>>>> The upgraded netboot installation media metztli-reiser4-sfrn5.iso is 
>>>> available at:
>>>> https://sourceforge.net/projects/debian-reiser4/
>>>> as well as
>>>> https://metztli.it/buster-reiser5/metztli-reiser4-sfrn5.iso
>>>> https://metztli.it/buster-reiser5/metztli-reiser4-sfrn5.iso.SHA256SUM
>>>>
>>>> Likely the brick/volume feature(s) will be useful in Cloud fabric 
>>>> infrastructures, like Google's, where reiser4 excels.
>>>>
>>>> The current SFRN 5.1.3 -patched Zstd -compressed kernel in the 
>>>> installation media is Debian's 5.7.10.
>>>
>>>
>>> wow, reiser5 from the box? I might want to try..
>> Well, it is more of a 'reference implementation' as there are persons 
>> who reached out to me because their builds succeeded, they were able 
>> to format in reiser4 SFRN x.y.z, but they were not able to mount their 
>> partition(s).
>> Turns out, they were inadvertently mixing SFRN 4.0.2 with 5.1.3, 
>> either in the reiser4 kernel patch -- released with the same in both 
>> instances -- or in the reiser4progs.
> 
> 
> Yeah, some confusion can take place. Plus unsupported old 4.0.2
> volumes (a special build with CONFIG_REISER4_OLD=y is required to
> mount them), which is a payment for performance.
> 
> 
>>
>>>
>>>>
>>>> The installer defaults to create the root system reiser5 -formatted 
>>>> partition as:
>>>> mkfs.reiser4 -yo "create=reg42"
>>>
>>>
>>> "reg42" is default profile in reiser4progs-2.0.3 (check by
>>> "mkfs.reiser4 -p") - there is no need to specify it via option.
>> Acknowledged. Thanks.
>>
>>>
>>> Have you had a chance to play with logical volumes (add/remove
>>> bricks, etc)?
>> That is coming up. I still have to create/customize an image of 
>> Metztli Reiser4 SFRN5 for a Google Compute Engine (GCE) minimal ~200GB 
>> instance for evaluation.
>> Fact is 'not all clouds are created equal' -- even if KVM -based. For 
>> instance, reiser4 SFRN 4.0.2 on a trial Linode small ~80GB SSD 
>> slice(s) with 2 virtual cpus frequently hung under short sustained 
>> disk/network I/O usage.
>> I have not experienced that with reiser4 SFRN 4.0.2 on GCE -- where 
>> sometimes I allocate eight to sixteen virtual cpus with 16, 32, or 
>> even 64, GBs of RAM, on a region hosting AMD Epyc, for fast kernel 
>> building ops.
>>
>> But testing a relatively small bootable image first will usually 
>> provide insight if adding one, two... eight, TB slices will make sense 
>> later on.
> 
> 
> I played with your media on a virtual machine. The basic volume
> operations work, however, I guess, adding brick(s) to "/" will cause
> problems at next boot: someone has to register all the bricks before
> mounting "/"...


It is important to register all bricks *before* mounting "/", as the
registration procedure collects information need for volume activation
(including transaction replay, etc).

So at boot time before mounting "/" we need to scan the system and for
each found block device call a brick registration procedure. The problem
is that I don't know what do we actually have before mounting "/".

Brick registration can be performed by calling "volume.reiser4 -g".
However, it accepts device name, that we obviously don't have, as all
the names are in "/", which is not yet mounted.

I guess that solution exists (and possibly locates in initrd), because,
it is perfectly possible to boot e.g. with root over LVM (a special
utility scans the system and collects information about devices-
components of the logical volume). Any ideas?

Thanks,
Edward.
