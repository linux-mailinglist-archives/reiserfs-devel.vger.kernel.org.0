Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65AB02E2BE5
	for <lists+reiserfs-devel@lfdr.de>; Fri, 25 Dec 2020 17:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgLYQnZ (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 25 Dec 2020 11:43:25 -0500
Received: from mail7.static.mailgun.info ([104.130.122.7]:42704 "EHLO
        mail7.static.mailgun.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725856AbgLYQnY (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 25 Dec 2020 11:43:24 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1608914584; h=From: Date: Message-Id: To: Subject: Sender;
 bh=D8dsjwyIbw2D0rTAoDmAePncghQ+Sh1/g4Kj4NFhx9k=; b=W6igfA0aDeNsOpA5CQ+VfAoNNWjveVB9eX9UNGuYzfphRHYfJIUvfEkJGPdLmxnMLWfWFhUy
 HD7hWqel7O7IEewKsqTWppxisoqcEk2IdCQOZ0gOrslPt9IJu9AKpPpA90E2oaEudAMVu8QK
 2iwR9oxZdbWo4PpapWOluz7SVCU=
X-Mailgun-Sending-Ip: 104.130.122.7
X-Mailgun-Sid: WyIxM2M2YSIsICJyZWlzZXJmcy1kZXZlbEB2Z2VyLmtlcm5lbC5vcmciLCAiMTdiNTQiXQ==
Received: from huitzilopochtli.metztli-it.com
 (99-130-254-3.lightspeed.sntcca.sbcglobal.net [99.130.254.3]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5fe61678db8e07fa6c1184a9 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Fri, 25 Dec 2020 16:42:32 GMT
Sender: jose.r.r=metztli.com@mixtli.metztli.it
Received: by huitzilopochtli.metztli-it.com (Postfix, from userid 1000)
        id DC69673640EB; Fri, 25 Dec 2020 08:42:32 -0800 (PST)
Subject: Re: [reiser4 SFRN 5.1.3] kernel [5.10.x] read not supported for file /test-exec \(pid: 10094 comm: debootstrap\)
To:     <edward.shishkin@gmail.com>, <reiserfs-devel@vger.kernel.org>,
        <hch@lst.de>, <linux-kernel@vger.kernel.org>
X-Mailer: mail (GNU Mailutils 3.9)
Message-Id: <20201225164232.DC69673640EB@huitzilopochtli.metztli-it.com>
Date:   Fri, 25 Dec 2020 08:42:32 -0800 (PST)
From:   Metztli Information Technology <jose.r.r@metztli.com>
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Wed, Dec 23, 2020 at 3:40 PM Edward Shishkin <edward.shishkin@gmail.com> wrote:
>
> On 12/23/2020 05:01 PM, Metztli Information Technology wrote:
> > Niltze [Ð—Ð´Ñ€Ð°Ð²Ñ Ñ‚Ð²ÑƒÐ¹Ñ‚Ðµ : Hello], Ed-
> >
> > I built Linux kernel 5.10.1-1 within the 'Debian way' -- as usual -- to generate a kernel component for my Debian-Installer (d-i).
> > The patch I applied is reiser4-for-5.10-rc3.patch.gz from v5-unstable.
> >
> > Once I built the proper reiser4progs-2.0.4.tar.gz and generated one set of components for d-i I built the d-i image.
> >
> > Fact is, the installer throws an error in *both* bare metal and VirtualBox 6.1.16:
> > ...
> > Dec 22 20:19:56 main-menu[330]: INFO: Menu item 'bootstrap-base' selected
> > Dec 22 20:19:56 debootstrap: /usr/sbin/debootstrap --components=main --debian-installer --resolve-deps --keyring=/usr/share/keyrings/archive.gpg buster /target http://deb.debian.org/debian/
> > Dec 22 20:19:56 debootstrap: /usr/sbin/debootstrap: line 1596: /target/test-exec: Invalid argument
> > Dec 22 20:19:56 kernel: [ 1018.632648] kernel read not supported for file /test-exec (pid: 10077 comm: debootstrap)
> > Dec 22 20:19:56 debootstrap: E: NOEXEC
> > Dec 22 20:19:56 debootstrap: EF: Cannot install into target '/target' mounted with noexec or nodev
> > Dec 22 20:20:12 base-installer: error: exiting on error base-installer/debootstrap-failed
> > Dec 22 20:20:14 main-menu[330]: WARNING **: Configuring 'bootstrap-base' failed with error code 1
> > Dec 22 20:20:14 main-menu[330]: WARNING **: Menu item 'bootstrap-base' failed.
> > Dec 22 20:20:15 main-menu[330]: INFO: Falling back to the package description for brltty-udeb
> >
>
> [...]
>
> >
> > Apparently, d-i [Debian-installer] complains about being unable to set the test file executable and causes the error when 1 is returned.
> > Notwithstanding, I manually verified that I am able to touch a file and set it +x executable.
> >
> > Furthermore, tricking the function return value to 0 I am able to make d-i continue with the latest SFRN5 installation (see [*trick*] below); yet, subsequently halts again with
> > an apparently related error --can not proceed any further.
> >
> > Digging deeper with dmesg, we can see that apparently it is the kernel which cannot 'read' properly. Please find a partial dmesg log with relevant output
> > from an attempt on my physical development machine.
> > ...
> > [  508.614488] Loading Reiser4 (Software Framework Release: 5.1.3). See reiser4.wiki.kernel.org for a description of Reiser4.
> > [  508.661951] SGI XFS with ACLs, security attributes, realtime, quota, no debug enabled
> > [  509.326270] device-mapper: uevent: version 1.0.3
> > [  509.326505] device-mapper: ioctl: 4.43.0-ioctl (2020-10-01) initialised: dm-devel@redhat.com
> > [  509.902828]  sda: sda1 sda2 sda3 sda4 sda5 sda6
> > [  509.915300]  sdb: sdb1 sdb2 sdb3
> > [  511.973360]  sdb: sdb1 sdb2 sdb3
> > [  627.525371] Adding 9765884k swap on /dev/sda3.  Priority:-2 extents:1 across:9765884k FS
> > [  636.240812] reiser4[mount(9430)]: reiser4_register_subvol (fs/reiser4/init_volume.c:222)[edward-1932]:
> > [  636.240812] NOTICE: brick /dev/sda6 has been registered
> > [  636.243003] reiser4 (sda6): found disk format 5.1.3.
> > [  643.759971] reiser4 (/dev/sda6): using Hybrid Transaction Model.
> > [  643.759980] reiser4: brick /dev/sda6 activated
> > [  643.788537] EXT4-fs (sda1): mounting ext2 file system using the ext4 subsystem
> > [  643.813474] EXT4-fs (sda1): mounted filesystem without journal. Opts: (null)
> > [  643.813488] ext2 filesystem being mounted at /target/boot supports timestamps until 2038 (0x7fffffff)
> > [  648.168730] kernel read not supported for file /test-exec (pid: 9876 comm: debootstrap) [*trick*]
> > [  898.761385] reiser4: brick /dev/sda6 deactivated
> > [  991.001332] reiser4 (sda6): found disk format 5.1.3.
> > [  999.093471] reiser4 (/dev/sda6): using Hybrid Transaction Model.
> > [  999.093480] reiser4: brick /dev/sda6 activated
> > [ 1009.340117] EXT4-fs (sda1): mounting ext2 file system using the ext4 subsystem
> > [ 1009.362722] EXT4-fs (sda1): mounted filesystem without journal. Opts: (null)
> > [ 1009.362737] ext2 filesystem being mounted at /target/boot supports timestamps until 2038 (0x7fffffff)
> > [ 6373.748413] kernel read not supported for file /test-exec (pid: 10094 comm: debootstrap)
> > [ 6413.169920] kernel read not supported for file /usr/bin/true (pid: 15960 comm: chroot)
>
>
> Hello.
>
> This is because of VFS changes in Linux-5.10.X.
> Specifically, because of the following patch:
> https://lkml.org/lkml/2020/8/17/174
> In the upstream git repository it is commit 4d03e3cc59828c82ee89ea6e2

Earlier I spun up a Google Compute Engine (GCE) AMD Epyc instance from a snapshot with kernel 5.9.15-1
< https://metztli.it/buster/gce-amd-epyc-5.9.15-1.png >

and built an stable reiser4 SFRN 4.0.2 kernel within the Debian packaging for 5.10.2-1 framework.
Subsequently, I built my custom Debian-Installer (d-i) and gave it another try. Same kernel fail:
... tail -n 30 /var/log/syslog
Dec 25 10:23:06 kernel: [  164.409309] reiser4: sda7: found disk format 4.0.2.
Dec 25 10:23:06 kernel: [  164.459638] reiser4: sda7: using Hybrid Transaction Model.
Dec 25 10:23:07 apt-install: Queueing package jfsutils for later installation
Dec 25 10:23:07 apt-install: Queueing package reiser4progs for later installation
Dec 25 10:23:07 apt-install: Queueing package initramfs-tools for later installation
Dec 25 10:23:07 apt-install: Queueing package linux-base for later installation
Dec 25 10:23:07 main-menu[240]: (process:3056): File descriptor 3 (pipe:[8689]) leaked on pvs invocation.
Dec 25 10:23:07 main-menu[240]: (process:3056):  Parent PID 5687: /bin/sh
Dec 25 10:23:07 main-menu[240]: (process:3056): File descriptor 4 (/dev/pts/0) leaked on pvs invocation.
Dec 25 10:23:07 main-menu[240]: (process:3056):  Parent PID 5687: /bin/sh
Dec 25 10:23:07 main-menu[240]: (process:3056): File descriptor 5 (/dev/pts/0) leaked on pvs invocation.
Dec 25 10:23:07 main-menu[240]: (process:3056):  Parent PID 5687: /bin/sh
Dec 25 10:23:07 main-menu[240]: (process:3056): File descriptor 3 (pipe:[8689]) leaked on pvs invocation.
Dec 25 10:23:07 main-menu[240]: (process:3056):  Parent PID 5726: /bin/sh
Dec 25 10:23:07 main-menu[240]: (process:3056): File descriptor 4 (/dev/pts/0) leaked on pvs invocation.
Dec 25 10:23:07 main-menu[240]: (process:3056):  Parent PID 5726: /bin/sh
Dec 25 10:23:07 main-menu[240]: (process:3056): File descriptor 5 (/dev/pts/0) leaked on pvs invocation.
Dec 25 10:23:07 main-menu[240]: (process:3056):  Parent PID 5726: /bin/sh
Dec 25 10:23:07 main-menu[240]: INFO: Falling back to the package description for brltty-udeb
Dec 25 10:23:07 main-menu[240]: INFO: Falling back to the package description for brltty-udeb
Dec 25 10:23:07 main-menu[240]: INFO: Menu item 'bootstrap-base' selected
Dec 25 10:23:07 debootstrap: /usr/sbin/debootstrap --components=main --debian-installer --resolve-deps --keyring=/usr/share/keyrings/archive.gpg buster /target http://mirrors.namecheap.com/debian/
Dec 25 10:23:07 debootstrap: /usr/sbin/debootstrap:
Dec 25 10:23:07 debootstrap: line 1596:
Dec 25 10:23:07 debootstrap: /target/test-exec: Invalid argument
Dec 25 10:23:07 debootstrap:
Dec 25 10:23:07 debootstrap: E: NOEXEC
Dec 25 10:23:07 debootstrap: EF: Cannot install into target '/target' mounted with noexec or nodev
Dec 25 10:23:07 kernel: [  165.368737] kernel read not supported for file /test-exec (pid: 5940 comm: debootstrap)
Dec 25 10:24:57 init: starting pid 222, tty '/dev/tty3': '-/bin/sh'
...

and dmesg from within the installer environment:

...tail -n 20 /var/log/debian-5.10.2.1.dmesg
[  133.743458] raid6: sse2x2   xor()  7821 MB/s
[  133.825936] raid6: sse2x1   gen() 11332 MB/s
[  133.914288] raid6: sse2x1   xor()  7571 MB/s
[  133.914290] raid6: using algorithm sse2x2 gen() 15942 MB/s
[  133.914291] raid6: .... xor() 7821 MB/s, rmw enabled
[  133.914293] raid6: using ssse3x2 recovery algorithm
[  133.915254] xor: automatically using best checksumming function   avx
[  133.942598] Btrfs loaded, crc32c=crc32c-generic
[  133.970966] JFS: nTxBlock = 8192, nTxLock = 65536
[  133.994981] Loading Reiser4 (format release: 4.0.2) See www.namesys.com for a description of Reiser4.
[  134.047520] SGI XFS with ACLs, security attributes, realtime, quota, no debug enabled
[  134.529127] device-mapper: uevent: version 1.0.3
[  134.529484] device-mapper: ioctl: 4.43.0-ioctl (2020-10-01) initialised: dm-devel@redhat.com
[  163.693555]  sda: sda1 sda2 < sda5 sda6 sda7 >
[  164.012669] Adding 999420k swap on /dev/sda6.  Priority:-2 extents:1 across:999420k FS
[  164.375818] reiser4: sda5: found disk format 4.0.2.
[  164.393521] reiser4: sda5: using Hybrid Transaction Model.
[  164.409309] reiser4: sda7: found disk format 4.0.2.
[  164.459638] reiser4: sda7: using Hybrid Transaction Model.
[  165.368737] kernel read not supported for file /test-exec (pid: 5940 comm: debootstrap)
...

Please, note that I even replaced debootstrap UDEB with a newer source release to no avail.

>
> So, Christoph, what to do now for file systems which implement
> ->read() method of file operations? It seems that chroot doesn't work
> for them. And people are not able to release distros with upgraded
> kernels..
>
> Thanks,
> Edward.

Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Buster w/ Linux 5.9.15 AMD64
---------------------------------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
---------------------------------------------------------------------------------------------
or SFRN 5.1.3, Metztli Reiser5 https://sf.net/projects/debian-reiser4/
-------------------------------------------------------------------------------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/
