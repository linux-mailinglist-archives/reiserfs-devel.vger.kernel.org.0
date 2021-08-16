Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF9563EDDD0
	for <lists+reiserfs-devel@lfdr.de>; Mon, 16 Aug 2021 21:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbhHPTWz (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 16 Aug 2021 15:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbhHPTWz (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 16 Aug 2021 15:22:55 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28D21C0613C1
        for <reiserfs-devel@vger.kernel.org>; Mon, 16 Aug 2021 12:22:21 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id d9so15108960qty.12
        for <reiserfs-devel@vger.kernel.org>; Mon, 16 Aug 2021 12:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=AQDl3/h6ZmlJMTNQ0/Ak5TGO+G6HIuh2vcGomLmr81I=;
        b=bbgelVpbhdXzWfJZobqv1dAbjsjTDqet0r3c3kAzn7X3Lij5To+GkCJ3Sa9iWfQWBt
         PpNbUCfxNX63ygcJGzMSujz438Ou1Jyv2JwaBQ0wfQ6adfVXgd7EyXmOKHZ1ColvO25u
         6RbHywaRZJweDLUwyiZLe0/HIezaPJOHJwEbhJiXV8b9RSz+YDrXc1QxREZSuLmuhYPu
         rykPZN7egCjZZW/Kj44Emo51mrMQoSG51HQE1+1/Je8Qp8DsnvAjOLFjJXt6+hYp2wEi
         IZJw2kcn7d/K/DBjHGVN6KX/cvAdq8tYhEz+bjmK74x2W9Bf9ngW0Eyfn5dxIUXj7RJe
         kS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=AQDl3/h6ZmlJMTNQ0/Ak5TGO+G6HIuh2vcGomLmr81I=;
        b=OsT+KbW1ZS8LlGMy3zlD/VerSJgIlFfVspO9yp2LGO9KUSJRcpMpEtFWOrRAYc4uuo
         +LlFGhgoFB+8p4afqIIt8sbzmA1bRkEx3NqXDboat3LVthfmrPR0pDFmm7X09X8VekpJ
         rsx7eHh4JMROySyBKFV4jcHfRzbkmRVYD6kIlpYRz8BXbQsNEbO5hRAy0OUcuWdxvts5
         KBol4BDOyFKTgRJdx9N/VZQo8OGVaweI+NMOxZXdGalO7aY8zaoGvOap4SJQceFuTWRu
         uRw61NMm+g1nfTgO5Msnp6f6oMdYWiOaD0fOIZtI7KCsdsFSYsOKLTnAn2ENKJBfNSR/
         KDKQ==
X-Gm-Message-State: AOAM5335qv4edds4chJRrqQwIaK73uQVB8lBWQokKoIf8WC28Wln6RcR
        iEaPgJyWB8yaQWft5G+pLJOzMbMBY0aGArUy
X-Google-Smtp-Source: ABdhPJwPCmRpw8q2JPIriaZMiffa1Ozk3nvSBF0zI2czkYYmIeNBfL1Q4yJkRCyIfdesndMtGc8P2w==
X-Received: by 2002:ac8:1106:: with SMTP id c6mr490578qtj.20.1629141740254;
        Mon, 16 Aug 2021 12:22:20 -0700 (PDT)
Received: from ?IPv6:2600:1700:6470:27a0:4e80:93ff:fe00:3ff7? ([2600:1700:6470:27a0:4e80:93ff:fe00:3ff7])
        by smtp.gmail.com with ESMTPSA id d26sm89340qto.75.2021.08.16.12.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Aug 2021 12:22:19 -0700 (PDT)
Subject: Re: [reiser4 SFRN 5.1.3] kernel [5.10.x] read not supported for file
 /test-exec \(pid: 10094 comm: debootstrap\)
To:     Edward Shishkin <edward.shishkin@gmail.com>
Cc:     reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
References: <20210208125427.CFC7C75EED90@huitzilopochtli.metztli-it.com>
 <e37d5585-318e-3130-82c9-7a740b9af8af@gmail.com>
 <d85555853f76b7f46ce3b7514d2890091b304c12.camel@metztli.com>
 <12924b25-baa4-2965-65de-bc64ed43069f@gmail.com>
From:   Metztli Information Technology <jose.r.r@metztli.com>
Message-ID: <1fb139b8-7c96-54c6-5bb7-2ee88399395c@metztli.com>
Date:   Mon, 16 Aug 2021 12:22:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <12924b25-baa4-2965-65de-bc64ed43069f@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org


On 8/14/21 4:00 AM, Edward Shishkin wrote:
> On 08/13/2021 05:20 PM, Metztli Information Technology wrote:
>
> [...]
>
>>>>
>>>> Notwithstanding, I would appreciate if you can take a look at the
>>>> attached patch. Probably it can be streamlined and/or improved
>>>>    further to minimize pain on subsequent Linux kernel upgrades.
>>>
>>>
>>> That patch is an attempt to swim against the current ;)
>>>
>>> I no longer remember, why they want to get rid of set_fs for already
>>> 15
>>> years, but ->read() and ->write() methods seem to be deprecated, and
>>> the
>>> correct way would be to implement the new ->read_iter() and
>>> write_iter()
>>> methods, where reiser4 works with "chunked" streams, represented by
>>> iov_iter structure, rather than with "continuous" streams,
>>> represented
>>> by char __user *buf. The task is not that difficult, but rather time
>>> consuming - I don't have a time for this right now..
>>
>> On Sun, Jun 20, 2021 at 10:45 AM Edward Shishkin
>> <edward.shishkin@gmail.com> wrote:
>>        So, I have implemented ->read_iter() for all plugins (*). It is
>>        included
>>        to reiser4-for-5.12 stuff. Not sure if it is enough to make 
>> distro with
>>        root over reiser4 though: ->write_iter() is not yet 
>> implemented (not so
>>        trivial because of transactions).
>>               (*)
>> https://github.com/edward6/reiser4/commit/ac72aba7e8bb16a28755c1b2b762971927d17c3c
>> https://github.com/edward6/reiser4/commit/4d3200fbcb2003c680cdb822e3f616d3fa83c391
>>               Edward.
>
> Hello,
>
> Now the new striped file plugin implements ->write_iter():
> https://github.com/edward6/reiser4/commit/a3795ffffbb841bfaa66bfb18c12fb317533d1ff 
>

Wow! That must have been a lot of extra work on your part, Sir, Спасибо!

Debian Installer (d-i) makes use of BusyBox. Notwithstanding, for 
whatever reason, BusyBox barebones (link) mount utility failed with 
similar message -- even though I took care to build the latest from source:

< https://www.busybox.net/ >

I had to hack a mount-udeb small package, wrapping mount and umount within:

< https://metztli.it/readOnlyEphemeral/mount-udeb_2.37.1-1_amd64.udeb >

by utilizing debian packaging for previous version of util-linux
< https://packages.debian.org/sid/util-linux >

and a more recent util linux source
< https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.37/ >

That solved the d-i 'mount -o bind' and/or 'mount --bind' issue on /dev 
resources (i.e., red underlined)

< https://metztli.it/bullseye-reiser5/non-busybox-mount-d-i.png >

> [...]
>
>> I finally got around to creating an SFRN 5.1.3 -enabled Debian
>> Installer (d-i) for upcoming Debian 11 (codenamed Bullseye). Applied
>> your unstable reiser4 for 5.12 patch onto my debianized hack packaging
>> for Linux kernel 5.12.19 EOL.
>>
>> I gave the d-i a spin in VirtualBox 6.1.26 and it choked on the
>> following code fragment:
>> ---------------------------------------------------------------------
>> setup_dev_linux () {
>>          # Ensure static device nodes created during install are
>> preserved
>>          # Tests in MAKEDEV require this is done in the D-I environment
>>          mkdir -p /dev/.static/dev
>>          chmod 700 /dev/.static/
>>          mount --bind /target/dev /dev/.static/dev
>>          # Mirror device nodes in D-I environment to target
>>          mount --bind /dev /target/dev/
>> }
>> -----------------------------------------------------------------------
>>
>> specifically:
>> mount --bind /target/dev /dev/.static/dev
>>
>> See relevant code fragment next to VirtualBox VM, where I manually
>> entered the above directive:
>> < https://metztli.it/bullseye-reiser5/d-i-sfrn5-fail.jpg >
>>
>> i.e., '--bind' is causing the SFRN5 -enabled installer to bail out
>> *only* for this reiser4 unstable SFRN 5.1.3 -patched kernel. On the
>> other hand, as reported previously, no such issue occurs with your
>> reiser4 stable SFRN 4.0.2 patch applied to the *same* debianized kernel
>> source tree, Ed.
>
> I have checked - everything works for me (Linux-5.12).
>
> # mount /dev/vdd1 /mnt/test
> # volume.reiser4 /mnt/test
>
> Logical Volume Info:
> ID:             03ac5995-bf77-4851-a302-e875a6fd752f
> volume:         0x1 (asym)
> distribution:   0x1 (fsx32m)
> stripe:         262144
> segments:       1024
> bricks total:   3
> bricks in DSA:  3
> slots:          3
> map blocks:     2
> balanced:       Yes
> health:         OK
>
> # mkdir bindmnt
> # mount --bind /mnt/test bindmnt
> # mount
> [...]
> /dev/vdd1 on /mnt/test type reiser4 
> (rw,relatime,atom_max_size=0x3d88e,atom_max_age=0x927c0,atom_min_size=0x100,atom_max_flushers=0x1,cbk_cache_slots=0x10)
> /dev/vdd1 on /root/bindmnt type reiser4 
> (rw,relatime,atom_max_size=0x3d88e,atom_max_age=0x927c0,atom_min_size=0x100,atom_max_flushers=0x1,cbk_cache_slots=0x10)

Summarizing...

Your modified reiser4 SFRN 4.0.2 patch implementing '->read_iter() for 
all plugins (*)' successfully enabled Debian Installer netboot for 
bullseye to install upcoming Debian 11 Bullseye for AMD64 with hacked 
Linux kernel 5.12.19-2 EOL

< https://metztli.it/bullseye-reiser5/guided-install-sfrn4.jpg >


Analogously, your modified reiser4 SFRN 5.1.3 patch implementing 
'->read_iter() for all plugins (*)' and ' ->write_iter()' successfully 
enabled Debian Installer netboot for bullseye to install upcoming Debian 
11 Bullseye for AMD64 with hacked Linux kernel 5.12.19-2 EOL

guided installation (which defaults to MSDOS partitioning) with sample 
from one of three options: /home and / root reiser4 but /boot JFS

< https://metztli.it/bullseye-reiser5/guided-install-sfrn5.jpg >


Or expert, which enables GPT partitioning; here is a / reiser4 and /boot 
JFS VirtualBox 6.1.26 VM JPG snapshot:

< https://metztli.it/bullseye-reiser5/expert-install-sfrn5.jpg >

and the PoC reiser4 SFRN 5.1.3 -enabled Debian Installer (d-i):

< https://metztli.it/bullseye-reiser5/netboot-ng/metztli-reiser4-sfrn5.iso >

< 
https://metztli.it/bullseye-reiser5/netboot-ng/metztli-reiser4-sfrn5.iso.SHA256SUM 
 >

I have not tested the bricks feature for which you specifically created 
the SFRN 5.1.3 enhancement. Other Linux users are welcomed to test that 
feature and provide feedback to you, Sir. The entry into reiser4 is 
substantially lowered with a native reiser4 installer, which is what I 
have done with the above ISO images freely made available but with *NO 
IMPLICIT NOR EXPLICIT WARRANTIES*


Best Professional Regards.


P.S. Reiser4 quirk: If during expert installation of reiser4 -enhanced 
Debian /tmp is formatted in other than reiser4, after a reboot 
attempting a MySQL/MariaDB installation will fail. I experienced that in 
a remote bare metal server.



