Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52A1B2E22D2
	for <lists+reiserfs-devel@lfdr.de>; Thu, 24 Dec 2020 00:42:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbgLWXlk (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 23 Dec 2020 18:41:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbgLWXlj (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 23 Dec 2020 18:41:39 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E734C06179C;
        Wed, 23 Dec 2020 15:40:59 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id ce23so1295777ejb.8;
        Wed, 23 Dec 2020 15:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=yQJoNH0SgauXmOfwgQWreiUi9P24nFhT4G3aQDOPn0w=;
        b=HJOQlGmf1M5AWEkueqZOjbzuGawBdLCMWKnbNahKbyGEF5+86C5y7YzEgepWQvIAnR
         2Avhne2ZNI3SqcithwGibejUVnGQC4EbnSKkXw5F7+gUWipfkO4XoeNzBz5PVkVdlDkN
         oH+8ZqT0QJ/T7IuLaC0aNYT9oN279+XYr/nTXLKiQK4wD7vdZUGJm2uVrRdzBAUAVvAx
         GD5CE6KKrxAMm2o//b/XVTReT7MJ9DSCa1nI0yaU3p+88rHMe+1rdjQvGS7ShFVjjdLO
         jtVq1x0xiQjcTnj0DjH/WY5+o/kdDTeOHFbtFphEUDj82pQmt7O6gilrcxF7bl9JunBI
         RplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yQJoNH0SgauXmOfwgQWreiUi9P24nFhT4G3aQDOPn0w=;
        b=TBSWuSdbz7wrh1ONQrKsIQ9TqNdZBU/flIFyv4i2i8sj17Ym/ynXSnHt6raDChX+eA
         ZpSMnKMgYaFpcaphPsb2q50/GaxArzGnKOc66QP5kq6IHlA4D2zc5ZutYzhwaOiAHrWg
         8+dFIp/w1t9P+urQkiU2IocghWur9W9Liziku3atyQ1WblD37mZMFSbqP4IwlyhT4/Wj
         868MH7xtxdWvJaDepoYdUiRDTYb1FYiNZOV/PvGCiU/TpAHHmmT5Z/GJujd/vXXw7noQ
         T0dRlxQ2kQW4Fb1iqJWbk1RAnmGG74lfPOMv137odFwJURIWbUBNXVUrGZoxD0MFZ7WJ
         Pohg==
X-Gm-Message-State: AOAM532b/3huDXaYbYQzyh8JZcfBDYs4iUlmLFof4Qjsg61Hhr9Pmgub
        r1tnkmShNPOI84GIkhuJVQnJTKGFgd4=
X-Google-Smtp-Source: ABdhPJwTnSNrOYeUbOMzMBM70Rzf12pudDcJI/rH/3VWycVV8PC4YnHxojwtPp2neh6o0d1sjCvjfg==
X-Received: by 2002:a17:907:3e85:: with SMTP id hs5mr26662622ejc.548.1608766857502;
        Wed, 23 Dec 2020 15:40:57 -0800 (PST)
Received: from [192.168.0.48] (HSI-KBW-046-005-005-003.hsi8.kabel-badenwuerttemberg.de. [46.5.5.3])
        by smtp.gmail.com with ESMTPSA id j7sm12301491ejj.27.2020.12.23.15.40.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Dec 2020 15:40:56 -0800 (PST)
Subject: Re: [reiser4 SFRN 5.1.3] kernel [5.10.x] read not supported for file
 /test-exec \(pid: 10094 comm: debootstrap\)
To:     Metztli Information Technology <jose.r.r@metztli.com>,
        ReiserFS development mailing list 
        <reiserfs-devel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20201223160113.C1A15732548B@huitzilopochtli.metztli-it.com>
From:   Edward Shishkin <edward.shishkin@gmail.com>
Message-ID: <d2284f1d-4b34-f3ad-0105-8bb61944db4a@gmail.com>
Date:   Thu, 24 Dec 2020 00:40:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20201223160113.C1A15732548B@huitzilopochtli.metztli-it.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On 12/23/2020 05:01 PM, Metztli Information Technology wrote:
> Niltze [Ð—Ð´Ñ€Ð°Ð²ÑÑ‚Ð²ÑƒÐ¹Ñ‚Ðµ : Hello], Ed-
> 
> I built Linux kernel 5.10.1-1 within the 'Debian way' -- as usual -- to generate a kernel component for my Debian-Installer (d-i).
> The patch I applied is reiser4-for-5.10-rc3.patch.gz from v5-unstable.
> 
> Once I built the proper reiser4progs-2.0.4.tar.gz and generated one set of components for d-i I built the d-i image.
> 
> Fact is, the installer throws an error in *both* bare metal and VirtualBox 6.1.16:
> ...
> Dec 22 20:19:56 main-menu[330]: INFO: Menu item 'bootstrap-base' selected
> Dec 22 20:19:56 debootstrap: /usr/sbin/debootstrap --components=main --debian-installer --resolve-deps --keyring=/usr/share/keyrings/archive.gpg buster /target http://deb.debian.org/debian/
> Dec 22 20:19:56 debootstrap: /usr/sbin/debootstrap: line 1596: /target/test-exec: Invalid argument
> Dec 22 20:19:56 kernel: [ 1018.632648] kernel read not supported for file /test-exec (pid: 10077 comm: debootstrap)
> Dec 22 20:19:56 debootstrap: E: NOEXEC
> Dec 22 20:19:56 debootstrap: EF: Cannot install into target '/target' mounted with noexec or nodev
> Dec 22 20:20:12 base-installer: error: exiting on error base-installer/debootstrap-failed
> Dec 22 20:20:14 main-menu[330]: WARNING **: Configuring 'bootstrap-base' failed with error code 1
> Dec 22 20:20:14 main-menu[330]: WARNING **: Menu item 'bootstrap-base' failed.
> Dec 22 20:20:15 main-menu[330]: INFO: Falling back to the package description for brltty-udeb
> 

[...]

> 
> Apparently, d-i [Debian-installer] complains about being unable to set the test file executable and causes the error when 1 is returned.
> Notwithstanding, I manually verified that I am able to touch a file and set it +x executable.
> 
> Furthermore, tricking the function return value to 0 I am able to make d-i continue with the latest SFRN5 installation (see [*trick*] below); yet, subsequently halts again with
> an apparently related error --can not proceed any further.
> 
> Digging deeper with dmesg, we can see that apparently it is the kernel which cannot 'read' properly. Please find a partial dmesg log with relevant output
> from an attempt on my physical development machine.
> ...
> [  508.614488] Loading Reiser4 (Software Framework Release: 5.1.3). See reiser4.wiki.kernel.org for a description of Reiser4.
> [  508.661951] SGI XFS with ACLs, security attributes, realtime, quota, no debug enabled
> [  509.326270] device-mapper: uevent: version 1.0.3
> [  509.326505] device-mapper: ioctl: 4.43.0-ioctl (2020-10-01) initialised: dm-devel@redhat.com
> [  509.902828]  sda: sda1 sda2 sda3 sda4 sda5 sda6
> [  509.915300]  sdb: sdb1 sdb2 sdb3
> [  511.973360]  sdb: sdb1 sdb2 sdb3
> [  627.525371] Adding 9765884k swap on /dev/sda3.  Priority:-2 extents:1 across:9765884k FS
> [  636.240812] reiser4[mount(9430)]: reiser4_register_subvol (fs/reiser4/init_volume.c:222)[edward-1932]:
> [  636.240812] NOTICE: brick /dev/sda6 has been registered
> [  636.243003] reiser4 (sda6): found disk format 5.1.3.
> [  643.759971] reiser4 (/dev/sda6): using Hybrid Transaction Model.
> [  643.759980] reiser4: brick /dev/sda6 activated
> [  643.788537] EXT4-fs (sda1): mounting ext2 file system using the ext4 subsystem
> [  643.813474] EXT4-fs (sda1): mounted filesystem without journal. Opts: (null)
> [  643.813488] ext2 filesystem being mounted at /target/boot supports timestamps until 2038 (0x7fffffff)
> [  648.168730] kernel read not supported for file /test-exec (pid: 9876 comm: debootstrap) [*trick*]
> [  898.761385] reiser4: brick /dev/sda6 deactivated
> [  991.001332] reiser4 (sda6): found disk format 5.1.3.
> [  999.093471] reiser4 (/dev/sda6): using Hybrid Transaction Model.
> [  999.093480] reiser4: brick /dev/sda6 activated
> [ 1009.340117] EXT4-fs (sda1): mounting ext2 file system using the ext4 subsystem
> [ 1009.362722] EXT4-fs (sda1): mounted filesystem without journal. Opts: (null)
> [ 1009.362737] ext2 filesystem being mounted at /target/boot supports timestamps until 2038 (0x7fffffff)
> [ 6373.748413] kernel read not supported for file /test-exec (pid: 10094 comm: debootstrap)
> [ 6413.169920] kernel read not supported for file /usr/bin/true (pid: 15960 comm: chroot)


Hello.

This is because of VFS changes in Linux-5.10.X.
Specifically, because of the following patch:
https://lkml.org/lkml/2020/8/17/174
In the upstream git repository it is commit 4d03e3cc59828c82ee89ea6e2

So, Christoph, what to do now for file systems which implement
->read() method of file operations? It seems that chroot doesn't work
for them. And people are not able to release distros with upgraded
kernels..

Thanks,
Edward.
