Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70CAB2E1F13
	for <lists+reiserfs-devel@lfdr.de>; Wed, 23 Dec 2020 17:04:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728023AbgLWQCD (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 23 Dec 2020 11:02:03 -0500
Received: from mail7.static.mailgun.info ([104.130.122.7]:51325 "EHLO
        mail7.static.mailgun.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728012AbgLWQCD (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 23 Dec 2020 11:02:03 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1608739296; h=From: Date: Message-Id: To: Subject: Sender;
 bh=xJFtBzfS7E6+Xdbxd/wS6+QLKcMARMOYidq4m/2wBYQ=; b=jqzf1pOQzrgDUe2dAFTZ8lTUize00zRT2x+g9qieNsyzn/G8t2Jz8Ax6FM4560hedCjWqw1u
 00mxvPVA0GG1euAVxrs5M0SDmTlVGiEKqnZmnm4YCj9SRlGUcPDOwg5fVYtbdWluJMJqsIog
 TCMYaTgAM+NVYj4GfHvUtgrW7pw=
X-Mailgun-Sending-Ip: 104.130.122.7
X-Mailgun-Sid: WyIxM2M2YSIsICJyZWlzZXJmcy1kZXZlbEB2Z2VyLmtlcm5lbC5vcmciLCAiMTdiNTQiXQ==
Received: from huitzilopochtli.metztli-it.com
 (99-130-254-3.lightspeed.sntcca.sbcglobal.net [99.130.254.3]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5fe369c01d5c1fa42798e096 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Wed, 23 Dec 2020 16:01:04 GMT
Sender: jose.r.r=metztli.com@mixtli.metztli.it
Received: by huitzilopochtli.metztli-it.com (Postfix, from userid 1000)
        id C1A15732548B; Wed, 23 Dec 2020 08:01:13 -0800 (PST)
Subject: [reiser4 SFRN 5.1.3] kernel [5.10.x] read not supported for file /test-exec \(pid: 10094 comm: debootstrap\)
To:     <edward.shishkin@gmail.com>, <reiserfs-devel@vger.kernel.org>
X-Mailer: mail (GNU Mailutils 3.9)
Message-Id: <20201223160113.C1A15732548B@huitzilopochtli.metztli-it.com>
Date:   Wed, 23 Dec 2020 08:01:13 -0800 (PST)
From:   Metztli Information Technology <jose.r.r@metztli.com>
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org


Niltze [Здравствуйте : Hello], Ed-

I built Linux kernel 5.10.1-1 within the 'Debian way' -- as usual -- to generate a kernel component for my Debian-Installer (d-i).
The patch I applied is reiser4-for-5.10-rc3.patch.gz from v5-unstable.

Once I built the proper reiser4progs-2.0.4.tar.gz and generated one set of components for d-i I built the d-i image.

Fact is, the installer throws an error in *both* bare metal and VirtualBox 6.1.16:
...
Dec 22 20:19:56 main-menu[330]: INFO: Menu item 'bootstrap-base' selected
Dec 22 20:19:56 debootstrap: /usr/sbin/debootstrap --components=main --debian-installer --resolve-deps --keyring=/usr/share/keyrings/archive.gpg buster /target http://deb.debian.org/debian/
Dec 22 20:19:56 debootstrap: /usr/sbin/debootstrap: line 1596: /target/test-exec: Invalid argument
Dec 22 20:19:56 kernel: [ 1018.632648] kernel read not supported for file /test-exec (pid: 10077 comm: debootstrap)
Dec 22 20:19:56 debootstrap: E: NOEXEC
Dec 22 20:19:56 debootstrap: EF: Cannot install into target '/target' mounted with noexec or nodev
Dec 22 20:20:12 base-installer: error: exiting on error base-installer/debootstrap-failed
Dec 22 20:20:14 main-menu[330]: WARNING **: Configuring 'bootstrap-base' failed with error code 1
Dec 22 20:20:14 main-menu[330]: WARNING **: Menu item 'bootstrap-base' failed.
Dec 22 20:20:15 main-menu[330]: INFO: Falling back to the package description for brltty-udeb

< https://metztli.it/buster-reiser5/sfrn5-5.10.x/1_installer-failure.png >

In a virtual console, i.e., under the hood of the installer screen,
< https://metztli.it/buster-reiser5/sfrn5-5.10.x/2_installer-failure-under.png >

dmesg shows 'kernel read not supported'
< https://metztli.it/buster-reiser5/sfrn5-5.10.x/3_installer-failure-dmesg.png >

I even manually tried balancing the volume shown mounted at d-i /target:
volume.reiser4 -b /target (where the root fs is mounted) prior to installing the debian base system:
< https://metztli.it/buster-reiser5/sfrn5-5.10.x/4_installer-failure-vol-reiser4.png >

...

Line 1596 corresponds to a function of debootstrap which tests to install the [Debian] base system, which relevant section is:

...
        SH="/bin/sh"
        [ -x "$SH" ] || SH="$(which sh)"

        cat > "$1/test-exec" <<EOF
#! $SH
:
EOF
        chmod +x "$1/test-exec"
        if ! "$1/test-exec"; then // this is line 1596
                rm -f "$1/test-exec"
                return 1
        fi
        rm -f "$1/test-exec"

        return 0
}
...

Apparently, d-i [Debian-installer] complains about being unable to set the test file executable and causes the error when 1 is returned.
Notwithstanding, I manually verified that I am able to touch a file and set it +x executable.

Furthermore, tricking the function return value to 0 I am able to make d-i continue with the latest SFRN5 installation (see [*trick*] below); yet, subsequently halts again with
an apparently related error --can not proceed any further.

Digging deeper with dmesg, we can see that apparently it is the kernel which cannot 'read' properly. Please find a partial dmesg log with relevant output
from an attempt on my physical development machine.
...
[  508.614488] Loading Reiser4 (Software Framework Release: 5.1.3). See reiser4.wiki.kernel.org for a description of Reiser4.
[  508.661951] SGI XFS with ACLs, security attributes, realtime, quota, no debug enabled
[  509.326270] device-mapper: uevent: version 1.0.3
[  509.326505] device-mapper: ioctl: 4.43.0-ioctl (2020-10-01) initialised: dm-devel@redhat.com
[  509.902828]  sda: sda1 sda2 sda3 sda4 sda5 sda6
[  509.915300]  sdb: sdb1 sdb2 sdb3
[  511.973360]  sdb: sdb1 sdb2 sdb3
[  627.525371] Adding 9765884k swap on /dev/sda3.  Priority:-2 extents:1 across:9765884k FS
[  636.240812] reiser4[mount(9430)]: reiser4_register_subvol (fs/reiser4/init_volume.c:222)[edward-1932]:
[  636.240812] NOTICE: brick /dev/sda6 has been registered
[  636.243003] reiser4 (sda6): found disk format 5.1.3.
[  643.759971] reiser4 (/dev/sda6): using Hybrid Transaction Model.
[  643.759980] reiser4: brick /dev/sda6 activated
[  643.788537] EXT4-fs (sda1): mounting ext2 file system using the ext4 subsystem
[  643.813474] EXT4-fs (sda1): mounted filesystem without journal. Opts: (null)
[  643.813488] ext2 filesystem being mounted at /target/boot supports timestamps until 2038 (0x7fffffff)
[  648.168730] kernel read not supported for file /test-exec (pid: 9876 comm: debootstrap) [*trick*]
[  898.761385] reiser4: brick /dev/sda6 deactivated
[  991.001332] reiser4 (sda6): found disk format 5.1.3.
[  999.093471] reiser4 (/dev/sda6): using Hybrid Transaction Model.
[  999.093480] reiser4: brick /dev/sda6 activated
[ 1009.340117] EXT4-fs (sda1): mounting ext2 file system using the ext4 subsystem
[ 1009.362722] EXT4-fs (sda1): mounted filesystem without journal. Opts: (null)
[ 1009.362737] ext2 filesystem being mounted at /target/boot supports timestamps until 2038 (0x7fffffff)
[ 6373.748413] kernel read not supported for file /test-exec (pid: 10094 comm: debootstrap)
[ 6413.169920] kernel read not supported for file /usr/bin/true (pid: 15960 comm: chroot)
*End of dmesg executed inside Debian-Instaler (d-i)*

And indeed the issue is with reiser4-for-5.10-rc3.patch.gz from v5-unstable:
< https://metztli.it/buster-reiser5/sfrn5-5.10.x/metztli-reiser4-sfrn5-ng.iso >
< https://metztli.it/buster-reiser5/sfrn5-5.10.x/metztli-reiser4-sfrn5-ng.iso.SHA256SUM >

The installer components, i.e., busybox, etc., with the exception of reiser4progs and the reiser4 SFRNs -patched linux kernel, are the same as in:
< https://metztli.it/buster-reiser5/metztli-reiser4-sfrn5.iso >
< https://metztli.it/buster-reiser5/metztli-reiser4-sfrn5.iso.SHA256SUM >
--this latter has reiser4progs-2.0.3.tar.gz and reiser4-for-5.9.2.patch.gz from v5-unstable applied to a Debianized linux kernel 5.9.15-1

I made a successful installation with the latter ISO image into a VirtualBox 6.1.16 reiser4 instance. Subsequently,
I installed the newer kernel/meta packages over the successfully installed 5.9.15-1 versions:

< https://metztli.it/buster-reiser5/sfrn5-5.10.x/linux-image-5.10.0-1+reiser4-5.1.3-amd64_5.10.1-1+reiser4~5.1.3_amd64.deb >
< https://metztli.it/buster-reiser5/sfrn5-5.10.x/linux-image-5.10.0-1+reiser4-5.1.3-amd64_5.10.1-1+reiser4~5.1.3_amd64.deb.SHA256SUM >

< https://metztli.it/buster-reiser5/sfrn5-5.10.x/linux-image-amd64_5.10.1-1+reiser4~5.1.3_amd64.deb >
< https://metztli.it/buster-reiser5/sfrn5-5.10.x/linux-image-amd64_5.10.1-1+reiser4~5.1.3_amd64.deb.SHA256SUM >

And installed, as well, reiser4progs SFRN5 utilities over the 2.0.3-1.1 version:
< https://metztli.it/buster-reiser5/sfrn5-5.10.x/reiser4progs_2.0.4-1.1_amd64.deb >
< https://metztli.it/buster-reiser5/sfrn5-5.10.x/reiser4progs_2.0.4-1.1_amd64.deb.SHA256SUM >

(as root)
dpkg -i linux-image-amd64_5.10.1-1+reiser4~5.1.3_amd64.deb \
linux-image-5.10.0-1+reiser4-5.1.3-amd64_5.10.1-1+reiser4~5.1.3_amd64.deb \
reiser4progs_2.0.4-1.1_amd64.deb

Then upon a reboot of the Debian OS the SFRN5 kernel 5.10.0-1 became stuck on checking the file system,
< https://metztli.it/buster-reiser5/sfrn5-5.10.x/5_hung-kernel-5.10.0-1.png >
i.e., booting routine did not advance any further.

Rebooting the hung system and selecting the SFRN5 5.9.15-1 kernel from the GRUB advanced menu the boot procedure actually proceeds *apparently* successfully...
until -- as root user -- one types the command volume.reiser4 -l which shows no PSO volumes --heck not even the root filesystem.

Now, downgrading to the previous SFRN5 reiser4progs 2.0.3-1.1 utilities --which after a successful Metztli Reiser4 SFRN5 installation are moved to /var/log/ --
and upon rebooting the system once again we select the SFRN5 5.10.0-1 kernel from the Grub menu, the system hangs upon checking the disk output.

Performing the above, Ed, I believe it is an educated conclussion that reiser4-for-5.10-rc3.patch.gz from v5-unstable has introduced a critical issue.


Best Professional Regards.

P.S. Do not re-use previosly downloaded ISO images, i.e., before December 21, 2020, as I belatedly was made aware of BusyBox related SSL download failures.

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
