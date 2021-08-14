Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88BDA3EC22A
	for <lists+reiserfs-devel@lfdr.de>; Sat, 14 Aug 2021 13:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237914AbhHNLAi (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sat, 14 Aug 2021 07:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbhHNLAh (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sat, 14 Aug 2021 07:00:37 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ACD6C061764;
        Sat, 14 Aug 2021 04:00:09 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id f12-20020a05600c4e8c00b002e6bdd6ffe2so5647084wmq.5;
        Sat, 14 Aug 2021 04:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fB1jBEy4ZcpTnTunznV8ts4UnCGebxmPq6yYD+jKJUo=;
        b=Qo09iwekaKeyYOa8ONz+iP+5H0pyNiefTPidHb5JOvmXfc5C6ZChP3fyDrZkwgBhpo
         Wcb7S4IHMFYXx/29vZd/Wy35kqWQFBxXTwYHVzudkptPVJshUkotYWbjMU65og+kUWC/
         z9uxxyzXcRr7TMPeOGqG/g0vA1Z3AxmnG3y6ltmKzl4ustvlkQt7F1zn5RfAmSWUovfg
         Wn2ipdgDQFuXNvMalTnw17e3yU+9q4NbbioQr9B+iKDGam3aXx1phP1+jbhsYdNCOA99
         SbJKJvJQwkC/La34XFB9SzKfVBBHZWwuo78vQk8W/QlDO00G6MIJFmkMjGjudknouhfV
         tDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fB1jBEy4ZcpTnTunznV8ts4UnCGebxmPq6yYD+jKJUo=;
        b=X3f2g2PXpDed6FJeJXSmziVb6jZDT6nAKx4rUldJAkSuWoe8wpsSfoXXXjkMRHQhrt
         2hqvzvHBA177nC/vcEBdpmHPpTmo/8UwB5Ery9dv8qnlFSP4fFtcIQcTwTyeFmIb0gqM
         9TnqgRbpo2n8KAY4ZzWCmO/sE/7FJ2i4tRy6tYVu7dVs6xQSPZGHjLSKexoLvq+jBV++
         Tsal2QnsyIF8k8TF1HqTiW2OCDN3YDi/ziFMCRGyzZsVDto918VUFkwiZz6yG2eKZUnI
         5rBojfgHocufOzWchSAjrX/sgs87El0zzebMpnro4nqa7yuuGX+VMXzuzQos/rqKTU6w
         JHLw==
X-Gm-Message-State: AOAM532GmWx2jLCZ6CiK3Okj0FiZnz/DzNrwqLpAnLsLejKfOlFDAMCP
        NKLJ8ypPfKl8kDZgIos3Ors=
X-Google-Smtp-Source: ABdhPJwJgwOWDrwgLVVzPIYDXK+AeNJS/Q06qABEfR9AS49IaB7qNu6pYdplbhtzUGwuFnplDo8X0A==
X-Received: by 2002:a7b:c185:: with SMTP id y5mr6845707wmi.2.1628938807565;
        Sat, 14 Aug 2021 04:00:07 -0700 (PDT)
Received: from [192.168.0.48] (HSI-KBW-046-005-005-101.hsi8.kabel-badenwuerttemberg.de. [46.5.5.101])
        by smtp.gmail.com with ESMTPSA id o11sm3453802wrj.47.2021.08.14.04.00.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 14 Aug 2021 04:00:06 -0700 (PDT)
Subject: Re: [reiser4 SFRN 5.1.3] kernel [5.10.x] read not supported for file
 /test-exec \(pid: 10094 comm: debootstrap\)
To:     Metztli Information Technology <jose.r.r@metztli.com>
Cc:     reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
References: <20210208125427.CFC7C75EED90@huitzilopochtli.metztli-it.com>
 <e37d5585-318e-3130-82c9-7a740b9af8af@gmail.com>
 <d85555853f76b7f46ce3b7514d2890091b304c12.camel@metztli.com>
From:   Edward Shishkin <edward.shishkin@gmail.com>
Message-ID: <12924b25-baa4-2965-65de-bc64ed43069f@gmail.com>
Date:   Sat, 14 Aug 2021 13:00:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <d85555853f76b7f46ce3b7514d2890091b304c12.camel@metztli.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On 08/13/2021 05:20 PM, Metztli Information Technology wrote:

[...]

>>>
>>> Notwithstanding, I would appreciate if you can take a look at the
>>> attached patch. Probably it can be streamlined and/or improved
>>>    further to minimize pain on subsequent Linux kernel upgrades.
>>
>>
>> That patch is an attempt to swim against the current ;)
>>
>> I no longer remember, why they want to get rid of set_fs for already
>> 15
>> years, but ->read() and ->write() methods seem to be deprecated, and
>> the
>> correct way would be to implement the new ->read_iter() and
>> write_iter()
>> methods, where reiser4 works with "chunked" streams, represented by
>> iov_iter structure, rather than with "continuous" streams,
>> represented
>> by char __user *buf. The task is not that difficult, but rather time
>> consuming - I don't have a time for this right now..
> 
> On Sun, Jun 20, 2021 at 10:45 AM Edward Shishkin
> <edward.shishkin@gmail.com> wrote:
>        So, I have implemented ->read_iter() for all plugins (*). It is
>        included
>        to reiser4-for-5.12 stuff. Not sure if it is enough to make distro with
>        root over reiser4 though: ->write_iter() is not yet implemented (not so
>        trivial because of transactions).
>        
>        (*)
>        https://github.com/edward6/reiser4/commit/ac72aba7e8bb16a28755c1b2b762971927d17c3c
>        
>        https://github.com/edward6/reiser4/commit/4d3200fbcb2003c680cdb822e3f616d3fa83c391
>        
>        Edward.
>        

Hello,

Now the new striped file plugin implements ->write_iter():
https://github.com/edward6/reiser4/commit/a3795ffffbb841bfaa66bfb18c12fb317533d1ff

[...]

> I finally got around to creating an SFRN 5.1.3 -enabled Debian
> Installer (d-i) for upcoming Debian 11 (codenamed Bullseye). Applied
> your unstable reiser4 for 5.12 patch onto my debianized hack packaging
> for Linux kernel 5.12.19 EOL.
> 
> I gave the d-i a spin in VirtualBox 6.1.26 and it choked on the
> following code fragment:
> ---------------------------------------------------------------------
> setup_dev_linux () {
>          # Ensure static device nodes created during install are
> preserved
>          # Tests in MAKEDEV require this is done in the D-I environment
>          mkdir -p /dev/.static/dev
>          chmod 700 /dev/.static/
>          mount --bind /target/dev /dev/.static/dev
>          # Mirror device nodes in D-I environment to target
>          mount --bind /dev /target/dev/
> }
> -----------------------------------------------------------------------
> 
> specifically:
> mount --bind /target/dev /dev/.static/dev
> 
> See relevant code fragment next to VirtualBox VM, where I manually
> entered the above directive:
> < https://metztli.it/bullseye-reiser5/d-i-sfrn5-fail.jpg >
> 
> i.e., '--bind' is causing the SFRN5 -enabled installer to bail out
> *only* for this reiser4 unstable SFRN 5.1.3 -patched kernel. On the
> other hand, as reported previously, no such issue occurs with your
> reiser4 stable SFRN 4.0.2 patch applied to the *same* debianized kernel
> source tree, Ed.

I have checked - everything works for me (Linux-5.12).

# mount /dev/vdd1 /mnt/test
# volume.reiser4 /mnt/test

Logical Volume Info:
ID:             03ac5995-bf77-4851-a302-e875a6fd752f
volume:         0x1 (asym)
distribution:   0x1 (fsx32m)
stripe:         262144
segments:       1024
bricks total:   3
bricks in DSA:  3
slots:          3
map blocks:     2
balanced:       Yes
health:         OK

# mkdir bindmnt
# mount --bind /mnt/test bindmnt
# mount
[...]
/dev/vdd1 on /mnt/test type reiser4 
(rw,relatime,atom_max_size=0x3d88e,atom_max_age=0x927c0,atom_min_size=0x100,atom_max_flushers=0x1,cbk_cache_slots=0x10)
/dev/vdd1 on /root/bindmnt type reiser4 
(rw,relatime,atom_max_size=0x3d88e,atom_max_age=0x927c0,atom_min_size=0x100,atom_max_flushers=0x1,cbk_cache_slots=0x10)

Thanks,
Edward.
