Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EA012980EE
	for <lists+reiserfs-devel@lfdr.de>; Sun, 25 Oct 2020 10:09:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1414699AbgJYJJL (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sun, 25 Oct 2020 05:09:11 -0400
Received: from mail7.static.mailgun.info ([104.130.122.7]:45457 "EHLO
        mail7.static.mailgun.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1414697AbgJYJJJ (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 25 Oct 2020 05:09:09 -0400
X-Greylist: delayed 303 seconds by postgrey-1.27 at vger.kernel.org; Sun, 25 Oct 2020 05:09:06 EDT
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1603616947; h=From: Date: Message-Id: To: Subject: Sender;
 bh=sYEXOSwR0+X2ZL5oajONKKAoAoh4gpCUnCOVWhEsNuQ=; b=q//tG0ykwSs5qvwP6evfa5QNBWVCJyZWPgSQkVLoFqgvon3MYlZZ7WbbbVcfG9N+/Jt6VUrM
 xReO+XAFlBKjRhzXx5Uvf7987RCZSTRkjkKAdnw4TsaHJprfpWoZfcMplN9SjsYfExLERiEO
 VlmIYFeUzUR55sVl9Ljm2c7u5eg=
X-Mailgun-Sending-Ip: 104.130.122.7
X-Mailgun-Sid: WyIxM2M2YSIsICJyZWlzZXJmcy1kZXZlbEB2Z2VyLmtlcm5lbC5vcmciLCAiMTdiNTQiXQ==
Received: from huitzilopochtli.metztli-it.com
 (99-130-254-3.lightspeed.sntcca.sbcglobal.net [99.130.254.3]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f953f8301fa194102c8c369 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Sun, 25 Oct 2020 09:04:03 GMT
Sender: jose.r.r=metztli.com@mixtli.metztli.it
Received: by huitzilopochtli.metztli-it.com (Postfix, from userid 1000)
        id D80F56FB40E1; Sun, 25 Oct 2020 02:04:22 -0700 (PDT)
Subject: Re: PROBLEM: Reiser4 hard lockup
To:     <Hgntkwis@vfemail.net>, <edward.shishkin@gmail.com>,
        <linux-kernel@vger.kernel.org>, <reiserfs-devel@vger.kernel.org>
X-Mailer: mail (GNU Mailutils 3.9)
Message-Id: <20201025090422.D80F56FB40E1@huitzilopochtli.metztli-it.com>
Date:   Sun, 25 Oct 2020 02:04:22 -0700 (PDT)
From:   Metztli Information Technology <jose.r.r@metztli.com>
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Niltze, David-

A few observations are in order below:

On Sat, Oct 24, 2020 at 1:39 PM David Niklas <Hgntkwis@vfemail.net> wrote:
>
> Hello,
>
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
> 02/26/2016 [ 4483.173145] Call Trace: [ 4483.173148]  <IRQ>
> [ 4483.173153]  dump_stack+0x66/0x8b
> [ 4483.173155]  nmi_cpu_backtrace+0x89/0x90
> [ 4483.173157]  ? lapic_can_unplug_cpu+0x90/0x90
> ...
> [ 4483.173213]  jput_final+0x303/0x320 [reiser4]
> [ 4483.173220]  reiser4_invalidate_list+0x3e/0x50 [reiser4]
> [ 4483.173228]  reiser4_write_logs+0x76/0x560 [reiser4]
> ...
> [ 4557.097894] NMI watchdog: Watchdog detected hard LOCKUP on cpu 2
> ...
> [ 4557.600871]  __schedule+0x288/0x5d0
> [ 4557.600874]  schedule+0x4a/0xb0
> [ 4557.600875]  schedule_timeout+0x14a/0x300
> ...
>
> # 7. Shell script to trigger the problem.
> I tried to create an artificial workload using dd, cp, sync, and other
> programs to cause the fault without success.
>
> # 8. Enviroment.
> % dar --version
>
>  dar version 2.5.17, Copyright (C) 2002-2052 Denis Corbin
>    Long options support       : YES
>
>  Using libdar 5.13.0 built with compilation time options:
>    Libz compression (gzip)      : YES
>    Libbz2 compression (bzip2)   : YES
>    Liblzo2 compression (lzo)    : YES
>    Liblzma compression (xz)     : YES
>    Strong encryption (libgcrypt): YES
>    Public key ciphers (gpgme)   : NO
>    Extended Attributes support  : YES
>    Large files support (> 2GB)  : YES
>    ext2fs NODUMP flag support   : YES
>    Special allocation scheme    : NO
>    Integer size used            : unlimited
>    Thread safe support          : YES
>    Furtive read mode support    : YES
>    Linux ext2/3/4 FSA support   : YES
>    Mac OS X HFS+ FSA support    : NO
>    Detected system/CPU endian   : little
>    Posix fadvise support        : YES
>    Large dir. speed optimi.     : YES
>    Timestamp read accuracy      : 1 microsecond
>    Timestamp write accuracy     : 1 microsecond
>    Restores dates of symlinks   : YES
>
>  compiled the Nov 23 2018 with GNUC version 6.3.0 20170516
>  dar is part of the Disk ARchive suite (Release 2.5.17)
>
> %  rtorrent -h
> Rakshasa's BitTorrent client version 0.9.6.
>
> %  sync --version
> sync (GNU coreutils) 8.26
>
> % mkfs.reiser4 --version
> mkfs.reiser4 1.1.0
> Format release: 4.0.1
>
> % fsck.reiser4 --version
> fsck.reiser4 1.1.0
> Format release: 4.0.1
reiser4progs 1.1.x Software Framework Release Number (SFRN) 4.0.1 file system utilities should not be used to check/fix media formatted 'a priori' in SFRN 4.0.2 and vice-versa.

>
> % head -n28 /proc/cpuinfo # The info in just repeated for all the%  cores.
> processor       : 0
> vendor_id       : AuthenticAMD
> cpu family      : 16
> model           : 10
> model name      : AMD Phenom(tm) II X6 1090T Processor
> stepping        : 0
> microcode       : 0x10000bf
> cpu MHz         : 2011.953
> cache size      : 512 KB
> physical id     : 0
> siblings        : 5
> core id         : 0
> cpu cores       : 5
> apicid          : 0
> initial apicid  : 0
> fpu             : yes
> fpu_exception   : yes
> cpuid level     : 6
> wp              : yes
> flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
> mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext
> fxsr_opt pdpe1gb rdtscp lm 3dnowext 3dnow constant_tsc rep_good nopl
> nonstop_tsc cpuid extd_apicid aperfmperf pni monitor cx16 popcnt lahf_lm
> cmp_legacy svm extapic cr8_legacy abm sse4a misalignsse 3dnowprefetch
> osvw ibs skinit wdt nodeid_msr cpb hw_pstate vmmcall npt lbrv svm_lock
> nrip_save pausefilter bugs            : tlb_mmatch apic_c1e fxsave_leak
> sysret_ss_attrs null_seg amd_e400 spectre_v1 spectre_v2 bogomips        :
> 7368.27 TLB size        : 1024 4K pages clflush size    : 64
> cache_alignment : 64 address sizes   : 48 bits physical, 48 bits virtual
> power management: ts ttp tm stc 100mhzsteps hwpstate cpb
>
> [8.3.] Module information (from /proc/modules):
> Not available. If you really need this I can boot the old kernel and
> insert mod.
> Here's the linked in modules, I it's probably equivalent:
> nls_iso8859_1
> nls_cp437
> fuse
> snd_emu10k1_synth
> snd_emux_synth
> snd_seq_midi_emul
> snd_seq_virmidi
> snd_seq_dummy
> snd_seq_midi
> snd_seq_oss
> snd_seq_midi_event
> snd_seq
> ip6table_filter
> ip6_tables
> iptable_filter
> ip_tables
> x_tables
> cpufreq_conservative
> cpufreq_powersave
> cpufreq_userspace
> cpufreq_ondemand
> bnep
> bluetooth
> ecdh_generic
> ecc
> uinput
> it87
> hwmon_vid
> parport_pc
> ppdev
> lp
> parport
> reiserfs
> reiser4
> dm_crypt
> dm_mod
> raid456
> async_raid6_recov
> async_memcpy
> async_pq
> async_xor
> async_tx
> xor
> sr_mod
> cdrom
> raid6_pq
> joydev
> hid_generic
> usbhid
> hid
> input_leds
> led_class
> kvm_amd
> kvm
> irqbypass
> snd_emu10k1
> k10temp
> snd_util_mem
> snd_ac97_codec
> pcspkr
> serio_raw
> raid0
> ac97_bus
> snd_rawmidi
> uas
> firewire_ohci
> usb_storage
> sata_promise
> snd_seq_device
> firewire_core
> crc_itu_t
> snd_hda_codec_realtek
> snd_hda_codec_generic
> ledtrig_audio
> snd_hda_codec_hdmi
> r8169
> snd_hda_intel
> snd_intel_dspcfg
> snd_hda_codec
> realtek
> snd_hda_core
> libphy
> snd_hwdep
> snd_pcm_oss
> ohci_pci
> snd_mixer_oss
> snd_pcm
> snd_timer
> snd
> ehci_pci
> ehci_hcd
> sp5100_tco
> soundcore
> tiny_power_button
> i2c_piix4
>
> # 8.4. Loaded driver and hardware information
> (/proc/ioports, /proc/iomem):
> Not available. If you really need this I can boot the old kernel and
> insert mod.
>
> # 8.5. PCI information ('lspci -vvv' as root):
> Attached, but again, this has changed since I got my computer restored
> and began using it again.
>
> # 8.6. SCSI information (from /proc/scsi/scsi):
> Now that I've restored my system I have fewer disks attached and they're
> connected on different ports.
> %  cat /proc/scsi/scsi
> Attached devices:
> Host: scsi0 Channel: 00 Id: 00 Lun: 00
>   Vendor: ATA      Model: WDC WD60EDAZ-11B Rev: 0A80
>   Type:   Direct-Access                    ANSI  SCSI revision: 05
> Host: scsi1 Channel: 00 Id: 00 Lun: 00
>   Vendor: ATA      Model: WDC WD60EDAZ-11B Rev: 0A80
>   Type:   Direct-Access                    ANSI  SCSI revision: 05
> Host: scsi4 Channel: 00 Id: 00 Lun: 00
>   Vendor: ATA      Model: WDC WD80EDAZ-11T Rev: 0A81
>   Type:   Direct-Access                    ANSI  SCSI revision: 05
> Host: scsi5 Channel: 00 Id: 00 Lun: 00
>   Vendor: ATA      Model: HUS726060ALA640  Rev: T1F3
>   Type:   Direct-Access                    ANSI  SCSI revision: 05
> Host: scsi9 Channel: 00 Id: 00 Lun: 00
>   Vendor: ATA      Model: WDC WD7500BPVX-2 Rev: 1A01
>   Type:   Direct-Access                    ANSI  SCSI revision: 05
> Host: scsi10 Channel: 00 Id: 00 Lun: 00
>   Vendor: HL-DT-ST Model: BD-RE  WH14NS40  Rev: 1.02
>   Type:   CD-ROM                           ANSI  SCSI revision: 05
> Host: scsi12 Channel: 00 Id: 00 Lun: 00
>   Vendor: HL-DT-ST Model: DVD-RAM GH22LP20 Rev: 1.04
>   Type:   CD-ROM                           ANSI  SCSI revision: 05
> Host: scsi13 Channel: 00 Id: 00 Lun: 00
>   Vendor: Monster  Model: MONSTER DIGITAL  Rev: PMAP
>   Type:   Direct-Access                    ANSI  SCSI revision: 06
> Host: scsi2 Channel: 00 Id: 00 Lun: 00
>   Vendor: ATA      Model: WDC WD120EMFZ-11 Rev: 0A81
>   Type:   Direct-Access                    ANSI  SCSI revision: 05
> Host: scsi3 Channel: 00 Id: 00 Lun: 00
>   Vendor: ATA      Model: WDC WD120EMFZ-11 Rev: 0A81
>   Type:   Direct-Access                    ANSI  SCSI revision: 05
>
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
> I had also to manually chew through all the kernel .o files to find where
> the kernel broke at (also attached).
>
> The command I used to create the reiser4 FS was:
> mkfs.reiser4 -o
> create=reg40,fibration=ext_3_fibre,hash=r5_hash,key=key_large,node=node40,compress=lzo1,compressMode=conv /dev/md7p1
> I wanted to use reg40 as opposed to ccreg40 because I wanted an
> unencrypted partition. Likewise, I changed the fibration to ext_3_fibre
> from ext_1_fibre. Other then that, everything is set to it's defaults.
> Interestingly, if I try to set the key to short and change the mode to
> tea (a time compute trade off AFAIK), I crashes mkfs.reiser4.
> I need to report this to the developers.
>
> When trying to remount the FS after this crash I got an error from fsck
> that I needed to rebuild the super block. Considering that all
> transactions are atomic, this was quite a surprise to me.
> This failed because the format version was somehow greater than my tools
> version. I did double check this because it was such a strange error.
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
> release number (4.0.1) of reiser4progs.
What I mentioned in prior comment: SFRN 4.0.1 and 4.0.2 should not be mixed.
You must first upgrade from SFRN 4.0.1 to SFRN 4.0.2 *both* your reiser4progs 1.2.x and disk media.

Beginning with linux kernel 4.14.xy, the corresponding reiser4 patches for *both* the kernel and reiser4progs file system utilities *were upgraded* to SFRN 4.0.2.
Reiterating, seems you are -- inadvertently, of course -- utilizing the early reiser4progs file system utilities for the older SFRN 4.0.1 with an SFRN 4.0.2 kernel (i.e., greater than 4.14.xy) and/or reiser4progs SFRN 4.0.2 -formatted media.

"In accordance with Reiser4 development model we announce a new
software framework release 4.0.2 of Reiser4 kernel module and
Reiser4progs. So, before the next mount session please don't forget
to check your old reiser4 partitions by new fsck to update things
(not urgently)."
< https://marc.info/?l=reiserfs-devel&m=151173731709826&w=2 >

> Please upgrade reiser4progs and
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
> release number (4.0.1) of reiser4progs.
Indeed, partition is SFRN 4.0.2 but reiser4progs disk utilities are still SFRN 4.0.1

> Please upgrade reiser4progs and
> try again. Fatal: Failed to open the format.
> Fatal: Cannot open the FileSystem on (/dev/md7p1).
>
> 1 fatal corruptions were detected in SuperBlock. Run with --build-sb
> option to fix them.
>
> One thing that was quite interesting about this is that the Linux kernel
> said I needed to upgrade my disk format of reiser 4.
Indeed. You are using kernels newer than 4.14.xy
< https://marc.info/?l=reiserfs-devel&m=151173731709826&w=2 >

> Sep 19 04:21:16 Phenom-II-x6 kernel: [   37.113970][ T2122]
> Loading Reiser4 (format release: 4.0.2) See www.namesys.com for a
> description of Reiser4.
> Sep 19 04:21:16 Phenom-II-x6 kernel: [   37.132956][ T2121]
> reiser4: md7p1: found disk format 4.0.2.
> Sep 19 04:21:16 Phenom-II-x6 kernel: [   37.133792][ T2121]
> reiser4: md7p1: use 'fsck.reiser4 --fix' to complete disk format upgrade.
>
> IDR If I tried to issue the above recommended command.
>
>
>
>
> Overall, after over a decade of development, I had hoped that reiser4
> would prove to be a fast, space efficient, and stable FS. I'm a bit
> disappointed about the severity and sheer number of bugs that are so
> easily triggered at both the tooling and FS level.
> Again, I have the room on 1 HDD to test reiser4 further if you can get to
> the bottom of these problems.
>
>
> Thanks for your hard work on reiser4. I hope this helps!
> David

Conclusion: I suggest you read up on the published reiser4 documentation and build *both* your kernel and reiser4progs utilities conforming to the more recent stable SFRN 4.0.2.

Prior to build reiser4progs 1.2.1 SFRN 4.0.2:
libaal-1.0.7.tar.gz
< https://sourceforge.net/projects/reiser4/files/reiser4-utils/ >

then build reiser4progs-1.2.1.tar.gz SFRN 4.0.2
< https://sourceforge.net/projects/reiser4/files/reiser4-utils/reiser4progs/ >

as any reiser4 patches for kernel 4.14 and higher conform to SFRN 4.0.2:
https://sourceforge.net/projects/reiser4/files/reiser4-for-linux-5.x/

citing, for the third time, reference email documenting the change, i.e. '2017-11-26 23:01:53 reiser4 SFRN 4.0.2 is not your father's reiser4 SFRN 4.0.1'
< https://marc.info/?l=reiserfs-devel&m=151173731709826&w=2 >

If you are going to use reiser4 kernel patches for linux 4.15.xy - 5.4.5 range, please make sure to *also* apply:
[PATCH] reiser4: prevent system lockups:
< https://marc.info/?l=reiserfs-devel&m=158086248927420&w=2 >

Although I do not use your relevant applications 'per se' I have been running reiser4 since SFRN 4.0.1 to stable SFRN 4.0.2, both locally and on a few bare metal remote servers provisioned for me, for building my reiser4 kernelsm reiser4progs, MariaDB, etc. -- as well as hosting ruby, PHP, perl, MariaDB, Nginx, HTTPD/Apache web applications. Here is a typical snapshot of one of my custom rootfs reiser4 -formatted Google Compute Engine (GCE) instances in the cloud running kernel 5.7.19-1 prior to upgrading to kernel 5.8.15-1, which I am currently running locally, as well:
uname -a
Linux huitzilopochtli 5.8.0-3+reiser4.0.2-amd64 #1 SMP Debian 5.8.15-1+reiser4.0.2 (2020-10-16) x86_64 GNU/Linux

 When neoftech utility took the PNG screenshot below, GCE cloud instance had been running for 45 days, 9 hours, etc., prior to be rebooted.

< https://metztli.blog/media/blogs/ixiptli/quick-uploads/initramfs-tools-zstd/reizer4-5.7.19-1-on-epyc-at-gce.png?mtime=1603614915 >
Note: in the screenshot reizer4 is merely a cosmetic label that I use for AMD Epyc/Ryzen CPUs to differentiate from a couple of kernel configuration settings which differ from kernel configuration for Intel CPUs. And please note, too, that I am using the proper reiser4progs 1.2.1 to match the reiser4 SFRN 4.0.2 for linux 5.7.x, as well as formatted disk media.

And now I am beginning to test, on-and-off, reiser4 Software Framework Release Number (SFRN) 5.1.3, aka 'reiser5' -- which obviously should not be mixed with previous SFRNs -- with the exception of SFRN 4.0.2 *if* kernel configuration compatibility setting is enabled *before* kernel build. Read the docs.

Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Buster w/ Linux 5.7.19 AMD64
---------------------------------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-------------------------------------------------------------------------------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/
