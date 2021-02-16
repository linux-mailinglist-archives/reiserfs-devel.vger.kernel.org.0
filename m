Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5486D31D158
	for <lists+reiserfs-devel@lfdr.de>; Tue, 16 Feb 2021 21:04:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbhBPUDj (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 16 Feb 2021 15:03:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbhBPUDg (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 16 Feb 2021 15:03:36 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B57B4C061574;
        Tue, 16 Feb 2021 12:02:55 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id lu16so3739038ejb.9;
        Tue, 16 Feb 2021 12:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mZW4t8h+kZdyqQIpfDflhncJk/oqnHMlyQ0U/SFjHLQ=;
        b=tqC0o5bqHbzcbwgSpisjLQ9e6KH094pG2AragxdfCCuSyflcpX3UdzxeoFioF7WZDr
         M+TOUYMV4Lu2OmHnCt3hLz48hY/h+63BHIbiDGgvkc2rr4PYA1phZ/10+ORtAJQHPeC+
         03jAs5Zr3nBRhKQ57su5tCUE7JL23regHzWJjjWTRJl1TWqad9wqn95IX+AFQ9CmmT9s
         NrU12//2O7oqPAd1TITNSYrYcTLU0+NW8gvtaiFDGnD+4nlntoa4GmOYsaMuI2IEh7ca
         SDvmr3niGz0/RFqtSXqvBImSxHbpKH2r6n+qjOnsWiEuppTuhH3Vf6wsgrRtv2lFF7Wv
         ytww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mZW4t8h+kZdyqQIpfDflhncJk/oqnHMlyQ0U/SFjHLQ=;
        b=DALl6bRhgu65W8UIYNjK+fQxiJX+YP9UaN4R8ogqgZ9UpKYhEw7OgLij1UOxo88FN7
         yjQAIlGplWYQviH6Ewsr1ZsDlUQHDfGZZ7En11FrfzUYnj/fk8AWSQJw2f8Vb2d9Y4lj
         jxrWCzUw4nJw+8P2Iw2yqOJAjLHG7tWMM3k6B6sP+n1LKWZK2scrPgH7/ToU2U2EyZub
         XO6ndV3IBbDduWQrfnYRVo/6ZPCYrQIFBI7rmf4hB7b4avLEHLb4XFXj9/bTubD5U/eg
         uvF5O2Vu3nT5KoZXxwj+7bsJS68GRllnzu98O6YoulNa+H9hSI/zi4fFFiHrUFDpxeLP
         q76A==
X-Gm-Message-State: AOAM531idZKadcJGtlI5G4OsbviYkomjvteVT0464T6tRVXgv1gHBz7b
        cI5iFxIxHyB9eJWwBlQcW0KDA0czGIw=
X-Google-Smtp-Source: ABdhPJzceF2u+Isj2weZUEUnIWwdnXBEOXHIEPp4aMpxTQkPkkmnMEAelM0dSGmPKBLRDcPcb2sOSQ==
X-Received: by 2002:a17:906:27cc:: with SMTP id k12mr4433611ejc.8.1613505774293;
        Tue, 16 Feb 2021 12:02:54 -0800 (PST)
Received: from [192.168.0.48] (HSI-KBW-046-005-005-002.hsi8.kabel-badenwuerttemberg.de. [46.5.5.2])
        by smtp.gmail.com with ESMTPSA id f20sm14811145edd.47.2021.02.16.12.02.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Feb 2021 12:02:53 -0800 (PST)
Subject: Re: [reiser4 SFRN 5.1.3] kernel [5.10.x] read not supported for file
 /test-exec \(pid: 10094 comm: debootstrap\)
To:     Jose R Rodriguez <jose.r.r@metztli.com>
Cc:     reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210208125427.CFC7C75EED90@huitzilopochtli.metztli-it.com>
 <e37d5585-318e-3130-82c9-7a740b9af8af@gmail.com>
 <97064703c2016908cebb8f1496d67d9751e21a67.camel@metztli.com>
From:   Edward Shishkin <edward.shishkin@gmail.com>
Message-ID: <d8c782ce-b602-8d46-3833-4aecf4578398@gmail.com>
Date:   Tue, 16 Feb 2021 21:02:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <97064703c2016908cebb8f1496d67d9751e21a67.camel@metztli.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org



On 02/16/2021 04:56 PM, Jose R Rodriguez wrote:
> On Mon, 2021-02-08 at 17:03 +0100, Edward Shishkin wrote:
>> On 02/08/2021 01:54 PM, Metztli Information Technology wrote:
>>> On Wed, Dec 23, 2020 at 3:40 PM Edward Shishkin <
>>> edward.shishkin@gmail.com> wrote:
>>>>
>>>> On 12/23/2020 05:01 PM, Metztli Information Technology wrote:
>>>>> Niltze [Ð—Ð´Ñ€Ð°Ð²Ñ Ñ‚Ð²ÑƒÐ¹Ñ‚Ðµ : Hello], Ed-
>>>>>
>>>>> I built Linux kernel 5.10.1-1 within the 'Debian way' -- as
>>>>> usual -- to generate a kernel component for my Debian-Installer
>>>>> (d-i).
>>>>> The patch I applied is reiser4-for-5.10-rc3.patch.gz from v5-
>>>>> unstable.
>>>>>
>>>>> Once I built the proper reiser4progs-2.0.4.tar.gz and generated
>>>>> one set of components for d-i I built the d-i image.
>>>>>
>>>>> Fact is, the installer throws an error in *both* bare metal and
>>>>> VirtualBox 6.1.16:
>>>>> ...
>>>>> Dec 22 20:19:56 main-menu[330]: INFO: Menu item 'bootstrap-
>>>>> base' selected
>>>>> Dec 22 20:19:56 debootstrap: /usr/sbin/debootstrap --
>>>>> components=main --debian-installer --resolve-deps --
>>>>> keyring=/usr/share/keyrings/archive.gpg buster /target
>>>>> http://deb.debian.org/debian/
>>>>> Dec 22 20:19:56 debootstrap: /usr/sbin/debootstrap: line 1596:
>>>>> /target/test-exec: Invalid argument
>>>>> Dec 22 20:19:56 kernel: [ 1018.632648] kernel read not
>>>>> supported for file /test-exec (pid: 10077 comm: debootstrap)
>>>>> Dec 22 20:19:56 debootstrap: E: NOEXEC
>>>>> Dec 22 20:19:56 debootstrap: EF: Cannot install into target
>>>>> '/target' mounted with noexec or nodev
>>>>> Dec 22 20:20:12 base-installer: error: exiting on error base-
>>>>> installer/debootstrap-failed
>>>>> Dec 22 20:20:14 main-menu[330]: WARNING **: Configuring
>>>>> 'bootstrap-base' failed with error code 1
>>>>> Dec 22 20:20:14 main-menu[330]: WARNING **: Menu item
>>>>> 'bootstrap-base' failed.
>>>>> Dec 22 20:20:15 main-menu[330]: INFO: Falling back to the
>>>>> package description for brltty-udeb
>>>>>
>>>>
>>>> [...]
>>>>
>>>>>
>>>>> Apparently, d-i [Debian-installer] complains about being unable
>>>>> to set the test file executable and causes the error when 1 is
>>>>> returned.
>>>>> Notwithstanding, I manually verified that I am able to touch a
>>>>> file and set it +x executable.
>>>>>
>>>>> Furthermore, tricking the function return value to 0 I am able
>>>>> to make d-i continue with the latest SFRN5 installation (see
>>>>> [*trick*] below); yet, subsequently halts again with
>>>>> an apparently related error --can not proceed any further.
>>>>>
>>>>> Digging deeper with dmesg, we can see that apparently it is the
>>>>> kernel which cannot 'read' properly. Please find a partial
>>>>> dmesg log with relevant output
>>>>> from an attempt on my physical development machine.
>>>>> ...
>>>>> [  508.614488] Loading Reiser4 (Software Framework Release:
>>>>> 5.1.3). See reiser4.wiki.kernel.org for a description of
>>>>> Reiser4.
>>>>> [  508.661951] SGI XFS with ACLs, security attributes,
>>>>> realtime, quota, no debug enabled
>>>>> [  509.326270] device-mapper: uevent: version 1.0.3
>>>>> [  509.326505] device-mapper: ioctl: 4.43.0-ioctl (2020-10-01)
>>>>> initialised: dm-devel@redhat.com
>>>>> [  509.902828]  sda: sda1 sda2 sda3 sda4 sda5 sda6
>>>>> [  509.915300]  sdb: sdb1 sdb2 sdb3
>>>>> [  511.973360]  sdb: sdb1 sdb2 sdb3
>>>>> [  627.525371] Adding 9765884k swap on /dev/sda3.  Priority:-2
>>>>> extents:1 across:9765884k FS
>>>>> [  636.240812] reiser4[mount(9430)]: reiser4_register_subvol
>>>>> (fs/reiser4/init_volume.c:222)[edward-1932]:
>>>>> [  636.240812] NOTICE: brick /dev/sda6 has been registered
>>>>> [  636.243003] reiser4 (sda6): found disk format 5.1.3.
>>>>> [  643.759971] reiser4 (/dev/sda6): using Hybrid Transaction
>>>>> Model.
>>>>> [  643.759980] reiser4: brick /dev/sda6 activated
>>>>> [  643.788537] EXT4-fs (sda1): mounting ext2 file system using
>>>>> the ext4 subsystem
>>>>> [  643.813474] EXT4-fs (sda1): mounted filesystem without
>>>>> journal. Opts: (null)
>>>>> [  643.813488] ext2 filesystem being mounted at /target/boot
>>>>> supports timestamps until 2038 (0x7fffffff)
>>>>> [  648.168730] kernel read not supported for file /test-exec
>>>>> (pid: 9876 comm: debootstrap) [*trick*]
>>>>> [  898.761385] reiser4: brick /dev/sda6 deactivated
>>>>> [  991.001332] reiser4 (sda6): found disk format 5.1.3.
>>>>> [  999.093471] reiser4 (/dev/sda6): using Hybrid Transaction
>>>>> Model.
>>>>> [  999.093480] reiser4: brick /dev/sda6 activated
>>>>> [ 1009.340117] EXT4-fs (sda1): mounting ext2 file system using
>>>>> the ext4 subsystem
>>>>> [ 1009.362722] EXT4-fs (sda1): mounted filesystem without
>>>>> journal. Opts: (null)
>>>>> [ 1009.362737] ext2 filesystem being mounted at /target/boot
>>>>> supports timestamps until 2038 (0x7fffffff)
>>>>> [ 6373.748413] kernel read not supported for file /test-exec
>>>>> (pid: 10094 comm: debootstrap)
>>>>> [ 6413.169920] kernel read not supported for file /usr/bin/true
>>>>> (pid: 15960 comm: chroot)
>>>>
>>>>
>>>> Hello.
>>>>
>>>> This is because of VFS changes in Linux-5.10.X.
>>>> Specifically, because of the following patch:
>>>> https://lkml.org/lkml/2020/8/17/174
>>>> In the upstream git repository it is commit
>>>> 4d03e3cc59828c82ee89ea6e2
>>>>
>>>> So, Christoph, what to do now for file systems which implement
>>>> ->read() method of file operations?
>>>
>>> *deafening silence* it appears that -- in the best of cases --
>>> Christoph engaged in an act of _iter masturbation [1];
>>> and in the worst of cases, the gentleman was aiming straight at
>>> reiser4.
>>>
>>>> ... It seems that chroot doesn't work
>>>> for them. And people are not able to release distros with
>>>> upgraded
>>>> kernels..
>>>
>>> Not only 'chroot doesn't work' for us, but even after replacing the
>>> kernel in a reiser4 (proper SFRN ;) instance and
>>>    upon an initial Linux 5.10.x kernel boot:
>>> ...
>>> kernel read not supported for file usr/lib/systemd/systemd (pid: 1
>>> comm: run-init)
>>> kernel panic -- not syncing: Attempted to kill init!
>>> exitcod=0x00000100
>>> ...
>>>
>>> Fact is some of us have commercial interests when deploying
>>> reiser4, both in cloud instances, baremetal, and on-premises.
>>>
>>> In the future if -- and only if -- our reiser4 efforts come to
>>> successful fruition, quite likely in due time we will be
>>>    able to financially commit to the Penguin's Linux Foundation
>>> temple, just like large corporations do
>>>    in exchange for indulgences[2] which virtue-wash their past
>>> and/or current corp. officers' *substantially darker deeds*;
>>>    heck, 'indulgence trafficking' seems to assuage->numb->arg(STFU)
>>> that 'virtuous' cult of GNU/Linux
>>>    developers/gatekeepers/maintainers' frivolous, *narcissist*,
>>> ethics and/or moralities so often piled up against
>>>    Reiser's work --which, paradoxically(!?), actually was largely
>>> implemented by Russian developers ;)
>>>
>>> In the meantime, I hacked a reverse patch that undoes some(all) of
>>> the surreptitious lethal attack on reiser4 fs
>>>    -- at least on AMD64 architectures (I did away with other
>>> arch/Kconfigs).
>>> And no, I am not a git pro-, undoing what I could of commit
>>> 4d03e3cc59828c82ee89ea6e27a2f3cdf95aaadf (as your hinted, Ed)
>>>    does not fix the 'kernel read' issue.
>>>
>>> Notwithstanding, I would appreciate if you can take a look at the
>>> attached patch. Probably it can be streamlined and/or improved
>>>    further to minimize pain on subsequent Linux kernel upgrades.
>>
>>
>> That patch is an attempt to swim against the current ;)
> In a sense all of us who prefer reiser4 do not have a herd mentality.
> So, yes, we 'swim against the current', if you will put it in those
> terms, because we value data integrity (atomicity).


Cool.
Do you have resources to support such fork?


> 
> Notwithstanding, it is only an ephemeral hack for AMD64 architectures.
> I have running locally reiser4 -enabled 5.10.13-2, 5.10.14-2, whereas I
> have an Google Compute Engine (GCE), on an AMD Epyc (reizer4 label)
> zone, custom instance testing with a cloud kernel 5.10.15-2.
> 
> < https://metztli.it/buster/cloud-5.10.15-2+reizer4_0_2.png >
> 
> Heck, I have updated the reiser4, Software Framework Release Number
> (SFRN) 5.1.3, d-i netboot installer media with a test kernel 5.10.16-2
> < https://metztli.it/buster-reiser5/5.10.x/metztli-reiser4-sfrn5-ng.iso


Note that fsck.reiser4 still doesn't work with 5.1.3

Thanks,
Edward.


>>
> <
> https://metztli.it/buster-reiser5/5.10.x/metztli-reiser4-sfrn5-ng.iso.SHA256SUM
>>
> 
> ... крутые?
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
>>
>> Thanks,
>> Edward.
>>
>>>
>>> The patch has been tested in my local development machine
>>> environment --
>>>    as I intalled the generated reiser4 -enabled linux 5.10.13/14
>>> meta/kernel into a Debian Bullseye already running reiser4 (with
>>> proper SFRN)
>>>    and the kernel booted nicely. Subsequently, after installing the
>>> linux headers, etc. I built a couple of upgraded kernels
>>>    in Debian Buster GCC-8 and Bullseye GCC-10 environments -- thus
>>> the hack seems to be stable.
>>>
>>> Additionally, I have just made a Debian-Installer (d-i) with a
>>> 'kernel read' -patched Linux 5.10.14.1 which successfully installed
>>>    into a VirtualBox 6.1.18 VM:
>>> <
>>> https://metztli.it/buster/reiser4_0_2-linux-5.10.14-kernel-read-patched.png
>>>   >
>>>
>>>>
>>>> Thanks,
>>>> Edward.
>>>
>>> Best Professional Regards.
>>>
>>> [1]
>>> "The bug was fixed, again way back in 2010, and over time chip-
>>> designers have moved on to improved memory management techniques.
>>> Torvalds wrote that this sort of memory space override has been
>>> banished from the x86, powerpc, s390 and RISC-V architectures."
>>> < https://www.theregister.com/2020/10/25/linux_5_10_rc1/ >
>>>
>>> [2] https://www.britannica.com/topic/indulgence
>>>
> 
> Best Professional Regards.
> 
