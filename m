Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC6C18F4C7
	for <lists+reiserfs-devel@lfdr.de>; Mon, 23 Mar 2020 13:39:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728018AbgCWMjI (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 23 Mar 2020 08:39:08 -0400
Received: from mail7.static.mailgun.info ([104.130.122.7]:49768 "EHLO
        mail7.static.mailgun.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727980AbgCWMjH (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 23 Mar 2020 08:39:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1584967146; h=From: Date: Message-Id: To: Subject: Sender;
 bh=tuyzo8OtB5C+xq4lG78jqDzAgG4dFM+KPIw1Aet+t8w=; b=U/LtQGkjdijwj4SIy/kqk6rjkcX6xdw3OUBiWioOcnhgc7ZOI9Vt+xewjwvUJ65tiF8Yx/t+
 QcWsh/7tq+nzR9ly7NaddWRxML6dxB4dbRRmGw4H3hHuXF4DuBA/Wdwy2HHjJmxaq/N2aczP
 arQKja+Dzu7sI6kRSyP8Ts2thIo=
X-Mailgun-Sending-Ip: 104.130.122.7
X-Mailgun-Sid: WyIxM2M2YSIsICJyZWlzZXJmcy1kZXZlbEB2Z2VyLmtlcm5lbC5vcmciLCAiMTdiNTQiXQ==
Received: from huitzilopochtli.metztli-it.com (99-130-254-3.lightspeed.sntcca.sbcglobal.net [99.130.254.3])
 by mxa.mailgun.org with ESMTP id 5e78adea.7f17a5b6e468-smtp-out-n02;
 Mon, 23 Mar 2020 12:39:06 -0000 (UTC)
Received: by huitzilopochtli.metztli-it.com (Postfix, from userid 1000)
        id 66F0B57F96CD; Mon, 23 Mar 2020 05:39:04 -0700 (PDT)
Subject: Re: Feedback: segfault on Reiser4 SFRN 5.1.3
To:     <edward.shishkin@gmail.com>, <reiserfs-devel@vger.kernel.org>
X-Mailer: mail (GNU Mailutils 3.5)
Message-Id: <20200323123904.66F0B57F96CD@huitzilopochtli.metztli-it.com>
Date:   Mon, 23 Mar 2020 05:39:04 -0700 (PDT)
From:   Metztli Information Technology <jose.r.r@metztli.com>
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Wed, Mar 11, 2020 at 3:09 PM Edward Shishkin <edward.shishkin@gmail.com> wrote:
>
> On 03/10/2020 11:24 PM, Edward Shishkin wrote:
> > On 03/10/2020 09:25 PM, Edward Shishkin wrote:
> >> On 03/10/2020 06:36 AM, Metztli Information Technology wrote:
> >>> Niltze, Ed-
> >>>
> >>>
> >>> I am experiencing segfault when using dpkg (package manager for
> >>> debian) utility to unpack software.
> >>>
> >>> It happens *both* during reiser4 sfrn 5.1.3 -enabled Debian Installer
> >>> (d-i) *and* in a pure sfrn 5.1.3 Debian Buster environment,
> >>> i.e., formatted in sfrn 5.1.3 and running reiser4progs 2.0.0 and
> >>> corresponding kernel. It happens in VirtualBox 6.1.4
> >>
> >> Do you have any bootable image I could download and reproduce that
> >> oops on my virtual machine?
> >
> > Ah, I see a mistake, which most likely causes that oops.
> > Will provide a fixup soon..
>
>
> Please, apply the attached patch (from the directory ./fs/reiser4)

Applied your patch, ed, and the reiser4 SFRN 5.1.3 native installation proceeds a little further --until after the kernel is selected-- the locales package fails.

Here is a little background. The Debian Installer (d-i) utilizes Busybox utilities --especifically unxz-- once the 'Install base system' option starts.

Notwithstanding, for whatever reason unxz fails with:

...
unxz: compressed data not read from terminal, use -f to force it
usage: /usr/lib/debootstrap/pkgdetails PKGS mirror packagesfile pkgs..
   or: /usr/lib/debootstrap/pkgdetails FIELD field mirror packagesfile pkgs..
   or: /usr/lib/debootstrap/pkgdetails GETDEPS packagesfile pkgs..
   or: /usr/lib/debootstrap/pkgdetails STANZAS packagesfile pkgs..
   or: /usr/lib/debootstrap/pkgdetails WGET% low high end reason
mknod: /target/dev/null: No such file or directory

I tried a couple (at least) of methods to bypass the issue.
I located /usr/share/debootstrap/functions and modified Busybox command invocation as: unxz -f

Additionally, I built another Busybox hack which included the full unxz command along with the proper *.so library support built from bleeding edge git source.
< https://github.com/xz-mirror/xz >

Fact is non-busybox unxz command does not require -f switch to continue the installation onto reiser4 SFRN5 formatted media:
< https://metztli.it/buster-reiser5/reg42/metztli-reiser4-sfrn5.iso >
< https://metztli.it/buster-reiser5/reg42/metztli-reiser4-sfrn5.iso.SHA256SUM >

At this point is when the patch that you provided proved its worth --as the segfault was not experienced any longer and the installation continued.

Notwithstanding, after selecting the kernel to be installed, for which the locales package is a requirement, the installer Python 'thinks' --like busybox unxz before--
that it is running in a terminal:
sed: couldn't edit /etc/locale.gen: is a terminal

Thinking that a newer Python3 version 3.8.2 might make a difference, I hacked a Debian UDEB component so as to provide Python3 3.8.2 support into
the environment. Nevertheless, the issue persists, the Debian Installer continues to 'think' it is running in a terminal (read only? ) and not being installed
into reiser4 SFRN5 formatted filesystem ( isatty() issues?)

We can verify we are running non-busybox unxz utility:
unxz --version

and latest Python3 support:
python3 --version

Please be aware, sir, that even in a VirtualBox 6.1.4 virtual machine converted from reiser4 SFRN 4.0.2 to SFRN 5.1.3 by the cp -a back-and-forth method
and subsequent fine tuning, i.e., /etc/fstab modification, /boot/grub/grub.cfg, reiser4progs 2.0.0 proper installation, etc.,
existing Python3 7.x.y from Debian repositories is used by the Debian package manager to install and upgrade software packages.
Accordingly, that older Python3 version fails to detect that it is operating on a file system and, like the installer, 'thinks' it is in a terminal.
Evidently, most software installation/upgrade operations fail with a python prompt:
>>>

Finally, I have hacked a couple of newer Debian package utilities with newer Python3 3.8.2 in an attempt to observe if something changes without any luck.
apt_2.0.0+nmu1_amd64.deb
apt-utils_2.0.0+nmu1_amd64.deb
libapt-pkg6.0_2.0.0+nmu1_amd64.deb

python3-apt_1.9.10+nmu1_amd64.deb
python-apt_1.9.10+nmu1_amd64.deb
python-apt-common_1.9.10+nmu1_all.deb

In summary, a new busybox 1.31.1 unxz utility and Python3 7.x.y / 3.8.2 cannot detect the underlying reiser5 file system where they are to operate.
I am able to replace unxz to advance the installation but I cannot make Python3 to recognize the reiser5 filesystem on which it is to operate --as
it erroneously 'believes' it is running in a terminal.

By the way, the current Debian Installer (d-i) netboot framework for *both* reiser4 SFRN 4.0.2 and referenced SFRN 5.1.3 is very similar for the Linux 5.5.8 version.
Yet the installer has no issues detecting a reiser4 4.0.2 -formatted media whereas unxz and python3 in reiser4 5.1.3 fail and possibly detect it as a terminal.

>
> Thanks,
> Edward.
>
> >
> >>
> >>   as well as in actual
> >>> physical hardware, same BUG line.
> >>>
> >>> This BUG makes it impossible to carry out a native Debian Buster
> >>> installation onto a default reiser4 SFRN 5.1.3 -formatted
> >>> partition, i.e., reg42, with or without specifying a stripe, i.e., -t
> >>> 256K. Accordingly, even if a user uses cp -a back-and-forth
> >>> to hack a pure SFRN5 Debian system whenever a software upgrade occurs
> >>> a segmentation fault will follow.
> >>>
> >>> Unaware if other package managers, like RPM/YUM utilities, etc., will
> >>> cause a segfault as well.
> >>>
> >>>
> >>> Mar  8 20:20:19 debootstrap: Selecting previously unselected package
> >>> base-passwd.
> >>> Mar  8 20:20:19 debootstrap: (Reading database ... 0 files and
> >>> directories currently installed.)
> >>> Mar  8 20:20:19 debootstrap: Preparing to unpack
> >>> .../base-passwd_3.5.46_amd64.deb ...
> >>> Mar  8 20:20:19 debootstrap: Segmentation fault
> >>> Mar  8 20:20:19 kernel: [  794.378009] ------------[ cut here
> >>> ]------------
> >>> Mar  8 20:20:19 kernel: [  794.378017] kernel BUG at
> >>> fs/reiser4/plugin/item/extent_stripe_ops.c:466!
> >>> Mar  8 20:20:19 kernel: [  794.378031] invalid opcode: 0000 [#1] SMP PTI
> >>> Mar  8 20:20:19 kernel: [  794.378044] CPU: 6 PID: 18587 Comm: dpkg
> >>> Tainted: G            E     5.5.0-1+reiser4-5.1.3-amd64 #1 Debian
> >>> 5.5.7-1+reiser4~5.1.3
> >>> Mar  8 20:20:19 kernel: [  794.378048] Hardware name: Hewlett-Packard
> >>> HP Pavilion dv6 Notebook PC/17FC, BIOS F.1C 01/23/2013
> >>> Mar  8 20:20:19 kernel: [  794.378103] RIP:
> >>> 0010:find_or_create_extent_stripe+0x169/0x1d0 [reiser4]
> >>> Mar  8 20:20:19 kernel: [  794.378110] Code: 48 89 58 50 eb b3 4c 89
> >>> ef e8 43 40 fd ff eb 85 4c 89 e7 41 89 de e8 a6 2a d4 ee eb a2 4c 89
> >>> e7 e8 bc 3e d4 ee e9 11 ff ff ff <0f> 0b 48 89 df e8 bd 42 fb ff eb
> >>> 89 e8 26 1e be ee f0 ff 4b 0c 74
> >>> Mar  8 20:20:19 kernel: [  794.378114] RSP: 0018:ffff9f90cd873c30
> >>> EFLAGS: 00010246
> >>> Mar  8 20:20:19 kernel: [  794.378120] RAX: 0000000000000000 RBX:
> >>> ffff8ab298d12240 RCX: 0000000000000000
> >>> Mar  8 20:20:19 kernel: [  794.378123] RDX: 0000000000000000 RSI:
> >>> ffff8ab2a5b366f8 RDI: ffff8ab2a5b36600
> >>> Mar  8 20:20:19 kernel: [  794.378127] RBP: ffff9f90cd873d20 R08:
> >>> 0000000000000001 R09: 000000000000000c
> >>> Mar  8 20:20:19 kernel: [  794.378130] R10: 0000000000000024 R11:
> >>> ffff8ab29f350a82 R12: ffffd75c5061c1c0
> >>> Mar  8 20:20:19 kernel: [  794.378134] R13: ffff8ab298d8a418 R14:
> >>> 0000000000000000 R15: ffff8ab2b2905800
> >>> Mar  8 20:20:19 kernel: [  794.378139] FS:  00007fc29b9f4380(0000)
> >>> GS:ffff8ab2bfb80000(0000) knlGS:0000000000000000
> >>> Mar  8 20:20:19 kernel: [  794.378143] CS:  0010 DS: 0000 ES: 0000
> >>> CR0: 0000000080050033
> >>> Mar  8 20:20:19 kernel: [  794.378147] CR2: 00005616aa3b0a81 CR3:
> >>> 00000004187d4002 CR4: 00000000000606e0
> >>> Mar  8 20:20:19 kernel: [  794.378150] Call Trace:
> >>> Mar  8 20:20:19 kernel: [  794.378211]  ? shorten_stripe+0x39b/0x4d0
> >>> [reiser4]
> >>> Mar  8 20:20:19 kernel: [  794.378221]  ? _cond_resched+0x15/0x30
> >>> Mar  8 20:20:19 kernel: [  794.378266]  shorten_stripe+0x39b/0x4d0
> >>> [reiser4]
> >>> Mar  8 20:20:19 kernel: [  794.378317]
> >>> reiser4_setattr_generic+0x150/0x200 [reiser4]
> >>> Mar  8 20:20:19 kernel: [  794.378362]  ? shorten_stripe+0x4d0/0x4d0
> >>> [reiser4]
> >>> Mar  8 20:20:19 kernel: [  794.378371]  notify_change+0x339/0x4a0
> >>> Mar  8 20:20:19 kernel: [  794.378378]  do_truncate+0x74/0xc0
> >>> Mar  8 20:20:19 kernel: [  794.378386]  do_sys_ftruncate+0x130/0x180
> >>> Mar  8 20:20:19 kernel: [  794.378395]  do_syscall_64+0x52/0x170
> >>> Mar  8 20:20:19 kernel: [  794.378401]
> >>> entry_SYSCALL_64_after_hwframe+0x44/0xa9
> >>> Mar  8 20:20:19 kernel: [  794.378406] RIP: 0033:0x7fc29bb81947
> >>> Mar  8 20:20:19 kernel: [  794.378412] Code: 77 01 c3 48 8b 15 49 85
> >>> 0c 00 f7 d8 64 89 02 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00
> >>> 0f 1f 40 00 b8 4d 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 8b
> >>> 15 19 85 0c 00 f7 d8 64 89 02 b8
> >>> Mar  8 20:20:19 kernel: [  794.378416] RSP: 002b:00007fff8148a888
> >>> EFLAGS: 00000206 ORIG_RAX: 000000000000004d
> >>> Mar  8 20:20:19 kernel: [  794.378421] RAX: ffffffffffffffda RBX:
> >>> 00005616aa3ad4f0 RCX: 00007fc29bb81947
> >>> Mar  8 20:20:19 kernel: [  794.378425] RDX: 0000000000000000 RSI:
> >>> 0000000000000098 RDI: 0000000000000009
> >>> Mar  8 20:20:19 kernel: [  794.378428] RBP: 00005616aa3ac260 R08:
> >>> 00005616aa3ac340 R09: 00007fc29b9f4380
> >>> Mar  8 20:20:19 kernel: [  794.378432] R10: 0000000000000000 R11:
> >>> 0000000000000206 R12: 0000000000000098
> >>> Mar  8 20:20:19 kernel: [  794.378435] R13: 00007fff8148b2f0 R14:
> >>> 00005616aa3b32a5 R15: 0000000000000000
> >>> Mar  8 20:20:19 kernel: [  794.378440] Modules linked in: dm_mod(E)
> >>> md_mod(E) xfs(E) reiser4(E) jfs(E) btrfs(E) xor(E) raid6_pq(E)
> >>> libcrc32c(E) zstd_compress(E) zstd_decompress(E) ext4(E) crc16(E)
> >>> mbcache(E) jbd2(E) crc32c_generic(E) r8169(E) realtek(E) libphy(E)
> >>> ctr(E) ccm(E) iwldvm(E) mac80211(E) libarc4(E) iwlwifi(E) cfg80211(E)
> >>> rfkill(E) nls_ascii(E) nls_cp437(E) vfat(E) fat(E) hid_generic(E)
> >>> usbhid(E) hid(E) sr_mod(E) cdrom(E) sd_mod(E) uas(E) usb_storage(E)
> >>> ahci(E) libahci(E) xhci_pci(E) ehci_pci(E) xhci_hcd(E) sdhci_pci(E)
> >>> ehci_hcd(E) cqhci(E) libata(E) rtsx_pci_sdmmc(E) sdhci(E) usbcore(E)
> >>> mmc_core(E) scsi_mod(E) rtsx_pci(E) mfd_core(E) usb_common(E) wmi(E)
> >>> battery(E) video(E) [last unloaded: libphy]
> >>> Mar  8 20:20:19 kernel: [  794.378508] ---[ end trace
> >>> c7be9d76279fc2ea ]---
> >>> Mar  8 20:20:19 kernel: [  794.378544] RIP:
> >>> 0010:find_or_create_extent_stripe+0x169/0x1d0 [reiser4]
> >>> Mar  8 20:20:19 kernel: [  794.378550] Code: 48 89 58 50 eb b3 4c 89
> >>> ef e8 43 40 fd ff eb 85 4c 89 e7 41 89 de e8 a6 2a d4 ee eb a2 4c 89
> >>> e7 e8 bc 3e d4 ee e9 11 ff ff ff <0f> 0b 48 89 df e8 bd 42 fb ff eb
> >>> 89 e8 26 1e be ee f0 ff 4b 0c 74
> >>> Mar  8 20:20:19 kernel: [  794.378554] RSP: 0018:ffff9f90cd873c30
> >>> EFLAGS: 00010246
> >>> Mar  8 20:20:19 kernel: [  794.378558] RAX: 0000000000000000 RBX:
> >>> ffff8ab298d12240 RCX: 0000000000000000
> >>> Mar  8 20:20:19 kernel: [  794.378562] RDX: 0000000000000000 RSI:
> >>> ffff8ab2a5b366f8 RDI: ffff8ab2a5b36600
> >>> Mar  8 20:20:19 kernel: [  794.378565] RBP: ffff9f90cd873d20 R08:
> >>> 0000000000000001 R09: 000000000000000c
> >>> Mar  8 20:20:19 kernel: [  794.378568] R10: 0000000000000024 R11:
> >>> ffff8ab29f350a82 R12: ffffd75c5061c1c0
> >>> Mar  8 20:20:19 kernel: [  794.378572] R13: ffff8ab298d8a418 R14:
> >>> 0000000000000000 R15: ffff8ab2b2905800
> >>> Mar  8 20:20:19 kernel: [  794.378576] FS:  00007fc29b9f4380(0000)
> >>> GS:ffff8ab2bfb80000(0000) knlGS:0000000000000000
> >>> Mar  8 20:20:19 kernel: [  794.378580] CS:  0010 DS: 0000 ES: 0000
> >>> CR0: 0000000080050033
> >>> Mar  8 20:20:19 kernel: [  794.378584] CR2: 00005616aa3b0a81 CR3:
> >>> 00000004187d4002 CR4: 00000000000606e0
> >>>
> >>>

Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Buster w/ Linux 5.5.8 AMD64
---------------------------------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-------------------------------------------------------------------------------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/
