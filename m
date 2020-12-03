Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3EE2CD430
	for <lists+reiserfs-devel@lfdr.de>; Thu,  3 Dec 2020 12:03:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730264AbgLCLDm (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 3 Dec 2020 06:03:42 -0500
Received: from mail7.static.mailgun.info ([104.130.122.7]:35771 "EHLO
        mail7.static.mailgun.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729085AbgLCLDl (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 3 Dec 2020 06:03:41 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1606993398; h=From: Date: Message-Id: To: Subject: Sender;
 bh=a/iQyvOBHTSdKTJi84R10a6QiLIbxT3kr2ZgAHPk5Zs=; b=JPLB+KYcm77c6rYS7id2SYRRU9hyyTLtvQc7lLpzun4KKPOfRn3sTBBV2XPTKVk9B1KnozjA
 5H/NIWtTf3lOm905Yov2txQcYFFZjWwELLTjH/C7Gj885eTfQ0d71VUQyuIJkAarM51CzXP2
 uRDQ88gOfAaK8K08kQxeGdZtzV4=
X-Mailgun-Sending-Ip: 104.130.122.7
X-Mailgun-Sid: WyIxM2M2YSIsICJyZWlzZXJmcy1kZXZlbEB2Z2VyLmtlcm5lbC5vcmciLCAiMTdiNTQiXQ==
Received: from huitzilopochtli.metztli-it.com
 (99-130-254-3.lightspeed.sntcca.sbcglobal.net [99.130.254.3]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5fc8c5d73ea99bd03b9a5b3a (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Thu, 03 Dec 2020 11:02:47 GMT
Sender: jose.r.r=metztli.com@mixtli.metztli.it
Received: by huitzilopochtli.metztli-it.com (Postfix, from userid 1000)
        id 8E30F71DB8F0; Thu,  3 Dec 2020 03:02:58 -0800 (PST)
Subject: Re: Bug#976258: linux: hibernation attempt results in shutdown and unclean filesystem
To:     <tg@mirbsd.de>, <976258@bugs.debian.org>, <submit@bugs.debian.org>,
        <edward.shishkin@gmail.com>, <reiserfs-devel@vger.kernel.org>
X-Mailer: mail (GNU Mailutils 3.9)
Message-Id: <20201203110258.8E30F71DB8F0@huitzilopochtli.metztli-it.com>
Date:   Thu,  3 Dec 2020 03:02:58 -0800 (PST)
From:   Metztli Information Technology <jose.r.r@metztli.com>
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Wed, Dec 2, 2020 at 2:03 AM Thorsten Glaser <tg@mirbsd.de> wrote:
>
> Package: src:linux
> Version: 5.9.9-1
> Severity: critical
> Justification: causes serious data loss
> X-Debbugs-Cc: tg@mirbsd.de,reply+AAGSHFU5KLM2QB2DOZDXPPF5Z5JYDEVBNHHCVEXQJU@reply.github.com
>
> A bit of backstory, since this is not the first place I had to
> report this to (feels like being sent from Pontius to Pilatus):
>
> I’ve switched from consolekit to elogind once it became usable.
>
> I accidentally hit Fn-F12 on a Thinkad X61, causing elogind to
> attempt “hibernation” (sudpend to disc): Debian #971644
>
> My system is not set up for hibernation as the swap space is
> *much* smaller than the memory size, and no HIBERFIL.SYS is
> set up. I do not use hibernation, nor do I want it.
>
>
> tglase@tglase-nb:~ $ free
>               total        used        free      shared  buff/cache   available
> Mem:        8080564      350456     7152308       15316      577800     7481152
> Swap:       3206140           0     3206140
> tglase@tglase-nb:~ $ fdisk -l /dev/sda
> fdisk: cannot open /dev/sda: Permission denied
> 1|tglase@tglase-nb:~ $ doch
> Disk /dev/sda: 149.05 GiB, 160041885696 bytes, 312581808 sectors
> Disk model: INTEL SSDSA2M160
> Units: sectors of 1 * 512 = 512 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> Disklabel type: dos
> Disk identifier: 0x00011447
>
> Device     Boot    Start       End   Sectors  Size Id Type
> /dev/sda1  *        2048   2099200   2097153    1G 83 Linux
> /dev/sda2        2101248   8513535   6412288  3.1G 82 Linux swap / Solaris
> /dev/sda3        8513536  50456575  41943040   20G 27 Hidden NTFS WinRE
> /dev/sda4       50456576 312581807 262125232  125G 83 Linux
>
>
> The problem here is that, even if hibernation fails, the system
> powers off but the filesystem is not in a clean state (as can be
> seen easily from the e2fsck messages upon next powerup). This can
> cause serious user data loss.

Alternatively, you may want to hack your own (and/or request the inclusion of a) more robust file system, like reiser4:
'Reiser4 is an atomic filesystem, which means that your filesystem operations either entirely occur, or they entirely don't, and they don't corrupt due to half occuring. We do this without significant performance losses, because we invented algorithms to do it without copying the data twice.'
< https://reiser4.wiki.kernel.org/index.php/V4 >
< https://metztli.blog/amatl/reiser-nahui/reiser4-design >

> I expect that a hibernation failure
> will cause a message in syslog and otherwise the system to con‐
> tinue working as normally, or at worst, a clean(!) shutdown (but
> with still a message in syslog as to allow diagnosis).
>
> I believe I’ve since figured out how to disable this in elogind.
> From this, it might also affect systemd-based installations. I
> might switch to no logind again…
>
> In https://github.com/elogind/elogind/issues/177 the elogind upstream
> maintainer asked me to do this:
>
> # echo /dev/sda2 >/sys/power/resume
> # cat /sys/power/resume
> 8:2
> # echo platform >/sys/power/disk
> # cat /sys/power/disk
> [platform] shutdown reboot suspend test_resume
> # echo disk >/sys/power/state
>
> This indeed crashed my system just the same. The elogind maintainer
> insists that “elogind has absolutely nothing to do with it.”
>
> So this is probably a kernel issue.
>
>
> -- Package-specific info:
> ** Version:
> Linux version 5.9.0-3-amd64 (debian-kernel@lists.debian.org) (gcc-10 (Debian 10.2.0-17) 10.2.0, GNU ld (GNU Binutils for Debian) 2.35.1) #1 SMP Debian 5.9.9-1 (2020-11-19)
>
> ** Command line:
> BOOT_IMAGE=/vmlinuz-5.9.0-3-amd64 root=/dev/sda4 ro rootdelay=5 syscall.x32=y vsyscall=emulate net.ifnames=0 kaslr pcie_aspm=force consoleblank=0
>
> ** Not tainted
>
> ** Kernel log:
> [    3.164490] ata3.00: Enabling discard_zeroes_data
> [    3.165962] input: TPPS/2 IBM TrackPoint as /devices/platform/i8042/serio1/input/input2
> [    3.168150]  sda: sda1 sda2 sda3 sda4
> [    3.170404] ata3.00: Enabling discard_zeroes_data
> [    3.172392] sd 1:0:0:0: [sda] Attached SCSI disk
> [    9.250311] EXT4-fs (sda4): mounted filesystem with ordered data mode. Opts: (null)
> [    9.535687] random: crng init done
> [    9.595778] Not activating Mandatory Access Control as /sbin/tomoyo-init does not exist.
> [   10.197469] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input4
> [   10.212554] ACPI: Lid Switch [LID]
> [   10.213750] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input5
> [   10.218942] ACPI: Sleep Button [SLPB]
> [   10.220538] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input6
> [   10.221685] ACPI: Power Button [PWRF]
> [   10.255108] parport_pc 00:06: reported by Plug and Play ACPI
> [   10.269593] ACPI: AC Adapter [AC] (on-line)
> [   10.269899] parport0: PC-style at 0x378, irq 7 [PCSPP,TRISTATE,EPP]
> [   10.341046] Non-volatile memory driver v1.3
> [   10.359109] yenta_cardbus 0000:05:00.0: CardBus bridge found [17aa:20c6]
> [   10.365576] iTCO_vendor_support: vendor-support=0
> [   10.401729] thinkpad_acpi: ThinkPad ACPI Extras v0.26
> [   10.403014] thinkpad_acpi: http://ibm-acpi.sf.net/
> [   10.404302] thinkpad_acpi: ThinkPad BIOS 7NET30WW (1.11 ), EC 7MHT24WW-1.02
> [   10.405666] thinkpad_acpi: Lenovo ThinkPad X61, model 7673AG4
> [   10.411265] thinkpad_acpi: radio switch found; radios are enabled
> [   10.412683] thinkpad_acpi: This ThinkPad has standard ACPI backlight brightness control, supported by the ACPI video driver
> [   10.414121] thinkpad_acpi: Disabling thinkpad-acpi brightness events by default...
> [   10.417637] input: PC Speaker as /devices/platform/pcspkr/input/input8
> [   10.421930] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
> [   10.425037] iTCO_wdt: Found a ICH8M-E TCO device (Version=2, TCOBASE=0x1060)
> [   10.436736] sd 1:0:0:0: Attached scsi generic sg0 type 0
> [   10.445480] thinkpad_acpi: Standard ACPI backlight interface available, not loading native one
> [   10.447379] iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)
> [   10.449699] thinkpad_acpi: secondary fan support enabled
> [   10.451676] thinkpad_acpi: battery 1 registered (start 0, stop 0)
> [   10.451684] battery: new extension: ThinkPad Battery Extension
> [   10.455216] input: ThinkPad Extra Buttons as /devices/platform/thinkpad_acpi/input/input7
> [   10.491020] cfg80211: Loading compiled-in X.509 certificates for regulatory database
> [   10.493740] cfg80211: Loaded X.509 cert 'benh@debian.org: 577e021cb980e0e820821ba7b54b4961b8b4fadf'
> [   10.495868] cfg80211: Loaded X.509 cert 'romain.perier@gmail.com: 3abbc6ec146e09d1b6016ab9d6cf71dd233f0328'
> [   10.501004] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
> [   10.512965] yenta_cardbus 0000:05:00.0: ISA IRQ mask 0x0c38, PCI irq 16
> [   10.514630] yenta_cardbus 0000:05:00.0: Socket status: 30000006
> [   10.520302] platform regulatory.0: firmware: direct-loading firmware regulatory.db
> [   10.522246] platform regulatory.0: firmware: direct-loading firmware regulatory.db.p7s
> [   10.524756] yenta_cardbus 0000:05:00.0: pcmcia: parent PCI bridge window: [io  0x4000-0x7fff]
> [   10.527421] yenta_cardbus 0000:05:00.0: pcmcia: parent PCI bridge window: [mem 0xd4000000-0xd7efffff]
> [   10.530101] snd_hda_intel 0000:00:1b.0: probe_mask set to 0x1 for device 17aa:20ac
> [   10.533022] pcmcia_socket pcmcia_socket0: cs: memory probe 0xd4000000-0xd7efffff:
> [   10.534831]  excluding 0xd7b10000-0xd7efffff
> [   10.536562] yenta_cardbus 0000:05:00.0: pcmcia: parent PCI bridge window: [mem 0xd8000000-0xdbffffff 64bit pref]
> [   10.558553] pcmcia_socket pcmcia_socket0: cs: memory probe 0xd8000000-0xdbffffff:
> [   10.562620]  excluding 0xd8000000-0xdbffffff
> [   10.637400] ppdev: user-space parallel port driver
> [   10.787094] pcmcia_socket pcmcia_socket0: cs: memory probe 0x0c0000-0x0fffff:
> [   10.787102]  excluding 0xc0000-0xd3fff 0xe0000-0xfffff
> [   10.787130] pcmcia_socket pcmcia_socket0: cs: memory probe 0xa0000000-0xa0ffffff:
> [   10.787141]  excluding 0xa0000000-0xa0ffffff
> [   10.787161] pcmcia_socket pcmcia_socket0: cs: memory probe 0x60000000-0x60ffffff:
> [   10.787172]  excluding 0x60000000-0x60ffffff
> [   10.843832] intel_powerclamp: No package C-state available
> [   10.874454] iwl4965: Intel(R) Wireless WiFi 4965 driver for Linux, in-tree:
> [   10.875278] intel_powerclamp: No package C-state available
> [   10.876844] iwl4965: Copyright(c) 2003-2011 Intel Corporation
> [   10.881787] iwl4965 0000:03:00.0: Detected Intel(R) Wireless WiFi Link 4965AGN, REV=0x4
> [   10.922972] iwl4965 0000:03:00.0: device EEPROM VER=0x36, CALIB=0x5
> [   10.925251] iwl4965 0000:03:00.0: Tunable channels: 13 802.11bg, 19 802.11a channels
> [   10.929532] iwl4965 0000:03:00.0: firmware: direct-loading firmware iwlwifi-4965-2.ucode
> [   10.931810] iwl4965 0000:03:00.0: loaded firmware version 228.61.2.24
> [   10.936156] ieee80211 phy0: Selected rate control algorithm 'iwl-4965-rs'
> [   10.961697] snd_hda_codec_analog hdaudioC0D0: autoconfig for AD1984: line_outs=1 (0x12/0x0/0x0/0x0/0x0) type:speaker
> [   10.966403] snd_hda_codec_analog hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
> [   10.968743] snd_hda_codec_analog hdaudioC0D0:    hp_outs=1 (0x11/0x0/0x0/0x0/0x0)
> [   10.971128] snd_hda_codec_analog hdaudioC0D0:    mono: mono_out=0x0
> [   10.973453] snd_hda_codec_analog hdaudioC0D0:    inputs:
> [   10.975661] snd_hda_codec_analog hdaudioC0D0:      Internal Mic=0x15
> [   10.977819] snd_hda_codec_analog hdaudioC0D0:      Mic=0x14
> [   10.979925] snd_hda_codec_analog hdaudioC0D0:      Dock Mic=0x1c
> [   10.996745] input: HDA Intel Mic as /devices/pci0000:00/0000:00:1b.0/sound/card0/input9
> [   11.003371] input: HDA Intel Dock Mic as /devices/pci0000:00/0000:00:1b.0/sound/card0/input10
> [   11.005819] input: HDA Intel Headphone as /devices/pci0000:00/0000:00:1b.0/sound/card0/input11
> [   11.280250] Adding 3206140k swap on /dev/sda2.  Priority:-2 extents:1 across:3206140k SSDscFS
> [   11.315103] EXT4-fs (sda4): re-mounted. Opts: errors=remount-ro,auto_da_alloc
> [   11.756430] EXT4-fs (sda1): mounted filesystem with ordered data mode. Opts: auto_da_alloc
> [   12.045571] tun: Universal TUN/TAP device driver, 1.6
> [   19.211027] elogind-daemon[1639]: New seat seat0.
> [   19.214969] elogind-daemon[1639]: Watching system buttons on /dev/input/event5 (Power Button)
> [   19.240422] elogind-daemon[1639]: Watching system buttons on /dev/input/event3 (Lid Switch)
> [   19.242514] elogind-daemon[1639]: Watching system buttons on /dev/input/event4 (Sleep Button)
> [   19.304531] elogind-daemon[1639]: Watching system buttons on /dev/input/event0 (AT Translated Set 2 keyboard)
> [   19.306548] elogind-daemon[1639]: Watching system buttons on /dev/input/event7 (ThinkPad Extra Buttons)
> [   51.705101] wlan0: authenticate with 38:10:d5:48:ea:c0
> [   51.713970] wlan0: send auth to 38:10:d5:48:ea:c0 (try 1/3)
> [   51.718486] wlan0: authenticated
> [   51.720245] wlan0: associate with 38:10:d5:48:ea:c0 (try 1/3)
> [   51.727350] wlan0: RX AssocResp from 38:10:d5:48:ea:c0 (capab=0x1431 status=0 aid=4)
> [   51.755717] wlan0: associated
> [   51.858329] cryptd: max_cpu_qlen set to 1000
> [   52.045848] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
> [   52.046440] wlan0: Limiting TX power to 20 (20 - 0) dBm as advertised by 38:10:d5:48:ea:c0
>
> ** Model information
> sys_vendor: LENOVO
> product_name: 7673AG4
> product_version: ThinkPad X61
> chassis_vendor: LENOVO
> chassis_version: Not Available
> bios_vendor: LENOVO
> bios_version: 7NET30WW (1.11 )
> board_vendor: LENOVO
> board_name: 7673AG4
> board_version: Not Available
>
> ** Loaded modules:
> ctr
> aes_generic
> libaes
> crypto_simd
> cryptd
> glue_helper
> ccm
> cpufreq_conservative
> cpufreq_ondemand
> cpufreq_userspace
> cpufreq_powersave
> binfmt_misc
> nft_counter
> nft_chain_nat
> xt_MASQUERADE
> nf_nat
> nf_conntrack
> nf_defrag_ipv6
> nf_defrag_ipv4
> libcrc32c
> nft_compat
> nf_tables
> x_tables
> nfnetlink
> tun
> snd_seq_midi
> snd_seq_midi_event
> snd_rawmidi
> snd_seq
> snd_seq_device
> msr
> snd_hda_codec_analog
> snd_hda_codec_generic
> iwl4965
> iwlegacy
> coretemp
> kvm_intel
> mac80211
> kvm
> pcmcia
> ppdev
> snd_hda_intel
> snd_intel_dspcfg
> snd_hda_codec
> irqbypass
> cfg80211
> snd_hda_core
> snd_hwdep
> pcspkr
> sg
> iTCO_wdt
> snd_pcm_oss
> intel_pmc_bxt
> serio_raw
> thinkpad_acpi
> snd_mixer_oss
> iTCO_vendor_support
> yenta_socket
> watchdog
> libarc4
> snd_pcm
> pcmcia_rsrc
> nvram
> pcmcia_core
> ledtrig_audio
> snd_timer
> snd
> soundcore
> ac
> rfkill
> parport_pc
> parport
> evdev
> acpi_cpufreq
> button
> ext4
> crc16
> mbcache
> jbd2
> crc32c_generic
> sd_mod
> t10_pi
> crc_t10dif
> crct10dif_generic
> crct10dif_common
> ata_generic
> i915
> ahci
> libahci
> ata_piix
> libata
> e1000e
> ehci_pci
> sdhci_pci
> uhci_hcd
> ehci_hcd
> cqhci
> sdhci
> scsi_mod
> usbcore
> psmouse
> mmc_core
> i2c_i801
> i2c_smbus
> lpc_ich
> i2c_algo_bit
> drm_kms_helper
> cec
> drm
> ptp
> pps_core
> usb_common
> battery
> video
>
> ** Network interface configuration:
> *** /etc/network/interfaces: unreadable
>
> ** Network status:
> *** IP interfaces and addresses:
> 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
>     link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
>     inet 127.0.0.1/8 scope host lo
>        valid_lft forever preferred_lft forever
>     inet6 ::1/128 scope host
>        valid_lft forever preferred_lft forever
> 2: eth0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group default qlen 1000
>     link/ether 00:1d:72:84:b1:b1 brd ff:ff:ff:ff:ff:ff
>     altname enp0s25
> 3: wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
>     link/ether 00:1f:3b:0d:cb:b1 brd ff:ff:ff:ff:ff:ff
>     altname wlp3s0
>     altname wls3
>     inet 192.168.178.50/24 brd 192.168.178.255 scope global dynamic wlan0
>        valid_lft 863842sec preferred_lft 863842sec
>     inet6 2a0a:a540:3d34:0:21f:3bff:fe0d:cbb1/64 scope global dynamic mngtmpaddr
>        valid_lft 7168sec preferred_lft 3568sec
>     inet6 fe80::21f:3bff:fe0d:cbb1/64 scope link
>        valid_lft forever preferred_lft forever
> 4: tap4: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast state DOWN group default qlen 1000
>     link/ether 2e:33:30:0e:c5:ba brd ff:ff:ff:ff:ff:ff
>     inet 192.168.10.205 peer 192.168.10.206/32 brd 192.168.10.205 scope global tap4
>        valid_lft forever preferred_lft forever
>
> *** Device statistics:
> Inter-|   Receive                                                |  Transmit
>  face |bytes    packets errs drop fifo frame compressed multicast|bytes    packets errs drop fifo colls carrier compressed
>     lo:   15499      56    0    0    0     0          0         0    15499      56    0    0    0     0       0          0
>   eth0:       0       0    0    0    0     0          0         0        0       0    0    0    0     0       0          0
>  wlan0:  879322    1522    0    0    0     0          0         0   358111    1241    0    0    0     0       0          0
>   tap4:       0       0    0    0    0     0          0         0        0       0    0    0    0     0       0          0
>
> *** Protocol statistics:
> Ip:
>     Forwarding: 1
>     387 total packets received
>     0 forwarded
>     0 incoming packets discarded
>     379 incoming packets delivered
>     277 requests sent out
>     73 dropped because of missing route
> Icmp:
>     3 ICMP messages received
>     0 input ICMP message failed
>     ICMP input histogram:
>         destination unreachable: 3
>     0 ICMP messages sent
>     0 ICMP messages failed
>     ICMP output histogram:
> IcmpMsg:
>         InType3: 3
> Tcp:
>     22 active connection openings
>     0 passive connection openings
>     0 failed connection attempts
>     0 connection resets received
>     1 connections established
>     907 segments received
>     1005 segments sent out
>     5 segments retransmitted
>     0 bad segments received
>     20 resets sent
> Udp:
>     275 packets received
>     0 packets to unknown port received
>     0 packet receive errors
>     197 packets sent
>     0 receive buffer errors
>     0 send buffer errors
> UdpLite:
> TcpExt:
>     16 packets pruned from receive queue because of socket buffer overrun
>     2 TCP sockets finished time wait in fast timer
>     10 delayed acks sent
>     621 packet headers predicted
>     75 acknowledgments not containing data payload received
>     76 predicted acknowledgments
>     TCPLostRetransmit: 2
>     TCPTimeouts: 3
>     TCPLossProbes: 2
>     TCPLossProbeRecovery: 2
>     9 connections reset due to unexpected data
>     TCPRcvCoalesce: 46
>     TCPAutoCorking: 6
>     TCPWantZeroWindowAdv: 2
>     TCPSynRetrans: 3
>     TCPOrigDataSent: 258
>     TCPDelivered: 279
>     TcpTimeoutRehash: 1
> IpExt:
>     InNoRoutes: 1
>     InMcastPkts: 143
>     OutMcastPkts: 63
>     InOctets: 157101
>     OutOctets: 32949
>     InMcastOctets: 12291
>     OutMcastOctets: 7142
>     InNoECTPkts: 387
>
>
> ** PCI devices:
> 00:00.0 Host bridge [0600]: Intel Corporation Mobile PM965/GM965/GL960 Memory Controller Hub [8086:2a00] (rev 0c)
>         Subsystem: Lenovo ThinkPad T61/R61 [17aa:20b3]
>         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx-
>         Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort+ >SERR- <PERR- INTx-
>         Latency: 0
>         Capabilities: <access denied>
>
> 00:02.0 VGA compatible controller [0300]: Intel Corporation Mobile GM965/GL960 Integrated Graphics Controller (primary) [8086:2a02] (rev 0c) (prog-if 00 [VGA controller])
>         Subsystem: Lenovo GM965 [X3100] on ThinkPad T61/R61 [17aa:20b5]
>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
>         Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0
>         Interrupt: pin A routed to IRQ 16
>         Region 0: Memory at f8000000 (64-bit, non-prefetchable) [size=1M]
>         Region 2: Memory at e0000000 (64-bit, prefetchable) [size=256M]
>         Region 4: I/O ports at 1800 [size=8]
>         Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
>         Capabilities: <access denied>
>         Kernel driver in use: i915
>         Kernel modules: i915
>
> 00:02.1 Display controller [0380]: Intel Corporation Mobile GM965/GL960 Integrated Graphics Controller (secondary) [8086:2a03] (rev 0c)
>         Subsystem: Lenovo GM965 [X3100] on ThinkPad T61/R61 [17aa:20b5]
>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
>         Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0
>         Region 0: Memory at f8100000 (64-bit, non-prefetchable) [size=1M]
>         Capabilities: <access denied>
>
> 00:19.0 Ethernet controller [0200]: Intel Corporation 82566MM Gigabit Network Connection [8086:1049] (rev 03)
>         Subsystem: Lenovo 82566MM Gigabit Network Connection [17aa:20de]
>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx+
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0
>         Interrupt: pin A routed to IRQ 27
>         Region 0: Memory at f8200000 (32-bit, non-prefetchable) [size=128K]
>         Region 1: Memory at f8225000 (32-bit, non-prefetchable) [size=4K]
>         Region 2: I/O ports at 1840 [size=32]
>         Capabilities: <access denied>
>         Kernel driver in use: e1000e
>         Kernel modules: e1000e
>
> 00:1a.0 USB controller [0c03]: Intel Corporation 82801H (ICH8 Family) USB UHCI Controller #4 [8086:2834] (rev 03) (prog-if 00 [UHCI])
>         Subsystem: Lenovo ThinkPad T61/R61 [17aa:20aa]
>         Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
>         Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0
>         Interrupt: pin A routed to IRQ 20
>         Region 4: I/O ports at 1860 [size=32]
>         Kernel driver in use: uhci_hcd
>         Kernel modules: uhci_hcd
>
> 00:1a.1 USB controller [0c03]: Intel Corporation 82801H (ICH8 Family) USB UHCI Controller #5 [8086:2835] (rev 03) (prog-if 00 [UHCI])
>         Subsystem: Lenovo Thinkpad T61/R61 [17aa:20aa]
>         Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
>         Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0
>         Interrupt: pin B routed to IRQ 21
>         Region 4: I/O ports at 1880 [size=32]
>         Kernel driver in use: uhci_hcd
>         Kernel modules: uhci_hcd
>
> 00:1a.7 USB controller [0c03]: Intel Corporation 82801H (ICH8 Family) USB2 EHCI Controller #2 [8086:283a] (rev 03) (prog-if 20 [EHCI])
>         Subsystem: Lenovo ThinkPad T61/R61 [17aa:20ab]
>         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx-
>         Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0
>         Interrupt: pin C routed to IRQ 22
>         Region 0: Memory at f8426c00 (32-bit, non-prefetchable) [size=1K]
>         Capabilities: <access denied>
>         Kernel driver in use: ehci-pci
>         Kernel modules: ehci_pci
>
> 00:1b.0 Audio device [0403]: Intel Corporation 82801H (ICH8 Family) HD Audio Controller [8086:284b] (rev 03)
>         Subsystem: Lenovo ThinkPad T61/R61 [17aa:20ac]
>         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx+
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0, Cache Line Size: 64 bytes
>         Interrupt: pin B routed to IRQ 28
>         Region 0: Memory at f8220000 (64-bit, non-prefetchable) [size=16K]
>         Capabilities: <access denied>
>         Kernel driver in use: snd_hda_intel
>         Kernel modules: snd_hda_intel
>
> 00:1c.0 PCI bridge [0604]: Intel Corporation 82801H (ICH8 Family) PCI Express Port 1 [8086:283f] (rev 03) (prog-if 00 [Normal decode])
>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx+
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0, Cache Line Size: 64 bytes
>         Interrupt: pin A routed to IRQ 24
>         Bus: primary=00, secondary=02, subordinate=02, sec-latency=0
>         I/O behind bridge: 00002000-00002fff [size=4K]
>         Memory behind bridge: f4000000-f5ffffff [size=32M]
>         Prefetchable memory behind bridge: 00000000f8500000-00000000f85fffff [size=1M]
>         Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort+ <SERR- <PERR-
>         BridgeCtl: Parity- SERR+ NoISA+ VGA- VGA16- MAbort- >Reset- FastB2B-
>                 PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>         Capabilities: <access denied>
>         Kernel driver in use: pcieport
>
> 00:1c.1 PCI bridge [0604]: Intel Corporation 82801H (ICH8 Family) PCI Express Port 2 [8086:2841] (rev 03) (prog-if 00 [Normal decode])
>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx+
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0, Cache Line Size: 64 bytes
>         Interrupt: pin B routed to IRQ 25
>         Bus: primary=00, secondary=03, subordinate=03, sec-latency=0
>         I/O behind bridge: 00003000-00003fff [size=4K]
>         Memory behind bridge: f6000000-f7ffffff [size=32M]
>         Prefetchable memory behind bridge: 00000000f8600000-00000000f86fffff [size=1M]
>         Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort+ <SERR- <PERR-
>         BridgeCtl: Parity- SERR+ NoISA+ VGA- VGA16- MAbort- >Reset- FastB2B-
>                 PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>         Capabilities: <access denied>
>         Kernel driver in use: pcieport
>
> 00:1d.0 USB controller [0c03]: Intel Corporation 82801H (ICH8 Family) USB UHCI Controller #1 [8086:2830] (rev 03) (prog-if 00 [UHCI])
>         Subsystem: Lenovo ThinkPad T61/R61 [17aa:20aa]
>         Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
>         Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0
>         Interrupt: pin A routed to IRQ 16
>         Region 4: I/O ports at 18a0 [size=32]
>         Kernel driver in use: uhci_hcd
>         Kernel modules: uhci_hcd
>
> 00:1d.1 USB controller [0c03]: Intel Corporation 82801H (ICH8 Family) USB UHCI Controller #2 [8086:2831] (rev 03) (prog-if 00 [UHCI])
>         Subsystem: Lenovo ThinkPad T61/R61 [17aa:20aa]
>         Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
>         Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0
>         Interrupt: pin B routed to IRQ 17
>         Region 4: I/O ports at 18c0 [size=32]
>         Kernel driver in use: uhci_hcd
>         Kernel modules: uhci_hcd
>
> 00:1d.7 USB controller [0c03]: Intel Corporation 82801H (ICH8 Family) USB2 EHCI Controller #1 [8086:2836] (rev 03) (prog-if 20 [EHCI])
>         Subsystem: Lenovo ThinkPad T61/R61 [17aa:20ab]
>         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx-
>         Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0
>         Interrupt: pin D routed to IRQ 19
>         Region 0: Memory at f8427000 (32-bit, non-prefetchable) [size=1K]
>         Capabilities: <access denied>
>         Kernel driver in use: ehci-pci
>         Kernel modules: ehci_pci
>
> 00:1e.0 PCI bridge [0604]: Intel Corporation 82801 Mobile PCI Bridge [8086:2448] (rev f3) (prog-if 01 [Subtractive decode])
>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0
>         Bus: primary=00, secondary=05, subordinate=08, sec-latency=32
>         I/O behind bridge: 00004000-00007fff [size=16K]
>         Memory behind bridge: d4000000-d7efffff [size=63M]
>         Prefetchable memory behind bridge: 00000000d8000000-00000000dbffffff [size=64M]
>         Secondary status: 66MHz- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort+ <SERR- <PERR-
>         BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
>                 PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
>         Capabilities: <access denied>
>
> 00:1f.0 ISA bridge [0601]: Intel Corporation 82801HEM (ICH8M-E) LPC Interface Controller [8086:2811] (rev 03)
>         Subsystem: Lenovo ThinkPad T61/R61 [17aa:20b6]
>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0
>         Capabilities: <access denied>
>         Kernel driver in use: lpc_ich
>         Kernel modules: lpc_ich
>
> 00:1f.1 IDE interface [0101]: Intel Corporation 82801HM/HEM (ICH8M/ICH8M-E) IDE Controller [8086:2850] (rev 03) (prog-if 8a [ISA Compatibility mode controller, supports both channels switched to PCI native mode, supports bus mastering])
>         Subsystem: Lenovo ThinkPad T61/R61 [17aa:20a6]
>         Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
>         Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx+
>         Latency: 0
>         Interrupt: pin C routed to IRQ 16
>         Region 0: Memory at 000001f0 (32-bit, non-prefetchable) [virtual] [size=8]
>         Region 1: Memory at 000003f0 (type 3, non-prefetchable) [virtual]
>         Region 2: Memory at 00000170 (32-bit, non-prefetchable) [virtual] [size=8]
>         Region 3: Memory at 00000370 (type 3, non-prefetchable) [virtual]
>         Region 4: I/O ports at 18e0 [virtual] [size=16]
>         Kernel driver in use: ata_piix
>         Kernel modules: ata_piix, ata_generic
>
> 00:1f.2 SATA controller [0106]: Intel Corporation 82801HM/HEM (ICH8M/ICH8M-E) SATA Controller [AHCI mode] [8086:2829] (rev 03) (prog-if 01 [AHCI 1.0])
>         Subsystem: Lenovo ThinkPad T61/R61 [17aa:20a7]
>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
>         Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0
>         Interrupt: pin B routed to IRQ 26
>         Region 0: I/O ports at 1c30 [size=8]
>         Region 1: I/O ports at 1c24 [size=4]
>         Region 2: I/O ports at 1c28 [size=8]
>         Region 3: I/O ports at 1c20 [size=4]
>         Region 4: I/O ports at 1c00 [size=32]
>         Region 5: Memory at f8426000 (32-bit, non-prefetchable) [size=2K]
>         Capabilities: <access denied>
>         Kernel driver in use: ahci
>         Kernel modules: ahci
>
> 00:1f.3 SMBus [0c05]: Intel Corporation 82801H (ICH8 Family) SMBus Controller [8086:283e] (rev 03)
>         Subsystem: Lenovo ThinkPad T61/R61 [17aa:20a9]
>         Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx-
>         Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Interrupt: pin A routed to IRQ 23
>         Region 0: Memory at f8427400 (32-bit, non-prefetchable) [size=256]
>         Region 4: I/O ports at 1c40 [size=32]
>         Kernel driver in use: i801_smbus
>         Kernel modules: i2c_i801
>
> 03:00.0 Network controller [0280]: Intel Corporation PRO/Wireless 4965 AG or AGN [Kedron] Network Connection [8086:4230] (rev 61)
>         Subsystem: Intel Corporation PRO/Wireless 4965 AG or AGN [Kedron] Network Connection [8086:1011]
>         Physical Slot: 3
>         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx-
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0, Cache Line Size: 64 bytes
>         Interrupt: pin A routed to IRQ 29
>         Region 0: Memory at f7f00000 (64-bit, non-prefetchable) [size=8K]
>         Capabilities: <access denied>
>         Kernel driver in use: iwl4965
>         Kernel modules: iwl4965
>
> 05:00.0 CardBus bridge [0607]: Ricoh Co Ltd RL5c476 II [1180:0476] (rev ba)
>         Subsystem: Lenovo ThinkPad R61/T400 [17aa:20c6]
>         Physical Slot: 1
>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 168
>         Interrupt: pin A routed to IRQ 16
>         Region 0: Memory at d7eff000 (32-bit, non-prefetchable) [size=4K]
>         Bus: primary=05, secondary=06, subordinate=07, sec-latency=176
>         Memory window 0: d8000000-dbffffff (prefetchable)
>         Memory window 1: c0000000-c3ffffff
>         I/O window 0: 00004000-000040ff
>         I/O window 1: 00004400-000044ff
>         BridgeCtl: Parity- SERR- ISA- VGA- MAbort- >Reset- 16bInt+ PostWrite+
>         16-bit legacy interface ports at 0001
>         Capabilities: <access denied>
>         Kernel driver in use: yenta_cardbus
>         Kernel modules: yenta_socket
>
> 05:00.2 SD Host controller [0805]: Ricoh Co Ltd R5C822 SD/SDIO/MMC/MS/MSPro Host Adapter [1180:0822] (rev 21)
>         Subsystem: Lenovo ThinkPad T400/W500 [17aa:20c8]
>         Physical Slot: 1
>         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 64
>         Interrupt: pin C routed to IRQ 18
>         Region 0: Memory at d7efec00 (32-bit, non-prefetchable) [size=256]
>         Capabilities: <access denied>
>         Kernel driver in use: sdhci-pci
>         Kernel modules: sdhci_pci
>
>
> ** USB devices:
> Bus 004 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 006 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
> Bus 005 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
> Bus 002 Device 002: ID 17ef:1000 Lenovo ThinkPad X6 UltraBase
> Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 003 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
> Bus 001 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
>
>
> -- System Information:
> Debian Release: bullseye/sid
>   APT prefers unstable-debug
>   APT policy: (500, 'unstable-debug'), (500, 'oldstable-updates'), (500, 'buildd-unstable'), (500, 'unstable'), (500, 'oldstable'), (1, 'experimental-debug'), (1, 'experimental')
> Architecture: amd64 (x86_64)
> Foreign Architectures: i386
>
> Kernel: Linux 5.9.0-3-amd64 (SMP w/2 CPU threads)
> Locale: LANG=C.UTF-8, LC_CTYPE=C.UTF-8 (charmap=UTF-8), LANGUAGE not set
> Shell: /bin/sh linked to /bin/lksh
> Init: sysvinit (via /sbin/init)
>
> Versions of packages linux-image-5.9.0-3-amd64 depends on:
> ii  initramfs-tools [linux-initramfs-tool]  0.139
> ii  kmod                                    27+20200310-2
> ii  linux-base                              4.6
>
> Versions of packages linux-image-5.9.0-3-amd64 recommends:
> pn  apparmor             <none>
> ii  firmware-linux-free  20200122-1
>
> Versions of packages linux-image-5.9.0-3-amd64 suggests:
> pn  debian-kernel-handbook  <none>
> ii  grub-pc                 2.04-10
> pn  linux-doc-5.9           <none>
>
> Versions of packages linux-image-5.9.0-3-amd64 is related to:
> ii  firmware-amd-graphics     20200918-1
> pn  firmware-atheros          <none>
> pn  firmware-bnx2             <none>
> pn  firmware-bnx2x            <none>
> pn  firmware-brcm80211        <none>
> pn  firmware-cavium           <none>
> pn  firmware-intel-sound      <none>
> pn  firmware-intelwimax       <none>
> pn  firmware-ipw2x00          <none>
> pn  firmware-ivtv             <none>
> ii  firmware-iwlwifi          20200918-1
> pn  firmware-libertas         <none>
> ii  firmware-linux-nonfree    20200918-1
> ii  firmware-misc-nonfree     20200918-1
> pn  firmware-myricom          <none>
> pn  firmware-netxen           <none>
> pn  firmware-qlogic           <none>
> pn  firmware-realtek          <none>
> pn  firmware-samsung          <none>
> pn  firmware-siano            <none>
> pn  firmware-ti-connectivity  <none>
> pn  xen-hypervisor            <none>
>
> -- no debconf information


Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Buster w/ Linux 5.9.3 AMD64
---------------------------------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-------------------------------------------------------------------------------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/
