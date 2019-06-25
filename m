Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B42B05500D
	for <lists+reiserfs-devel@lfdr.de>; Tue, 25 Jun 2019 15:17:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727362AbfFYNRX (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 25 Jun 2019 09:17:23 -0400
Received: from mail7.static.mailgun.info ([104.130.122.7]:21196 "EHLO
        mail7.static.mailgun.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727579AbfFYNRX (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 25 Jun 2019 09:17:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1561468639; h=From: Date: Message-Id: To: Subject: Sender;
 bh=D5c/TVjHcupcejA3I3iuRUc9yURIFivXXhdIIEajZdo=; b=azOg9fYLMrdHtWk+7Vb79PlPJUa8Jrksby46Sz2g/VEdblHKA6fhfmwlp3OYXa4I/Ol6pLLq
 QpGv2Toh3O8oJKnrGrdQmj4VCpuhovG0IA/ra2yayR3S6uhRyg/mZkFRSI4OiOm36Q2nUQUQ
 fdKwqX3nCUVu1DZ1k3peMDHWxcY=
X-Mailgun-Sending-Ip: 104.130.122.7
X-Mailgun-Sid: WyIxM2M2YSIsICJyZWlzZXJmcy1kZXZlbEB2Z2VyLmtlcm5lbC5vcmciLCAiMTdiNTQiXQ==
Received: from huitzilopochtli.metztli-it.com (99-130-254-3.lightspeed.sntcca.sbcglobal.net [99.130.254.3])
 by mxa.mailgun.org with ESMTP id 5d121ede.7f012aae92b8-smtp-out-n02;
 Tue, 25 Jun 2019 13:17:18 -0000 (UTC)
Received: by huitzilopochtli.metztli-it.com (Postfix, from userid 1000)
        id 430343D8108A; Tue, 25 Jun 2019 06:17:17 -0700 (PDT)
Subject: Feedback on Reiser4 for 5.0.0 patch
To:     <edward.shishkin@gmail.com>, <reiserfs-devel@vger.kernel.org>
X-Mailer: mail (GNU Mailutils 3.1.1)
Message-Id: <20190625131717.430343D8108A@huitzilopochtli.metztli-it.com>
Date:   Tue, 25 Jun 2019 06:17:17 -0700 (PDT)
From:   jose.r.r@metztli.com (Metztli Information Technology)
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Niltze, Ed-


It appears that aspects of the hang issue that emerged in reiser4 patched 4.15.x, and up, continue to affect 5.0.xy kernels. Although I have a couple of 5.0.xy kernels online as web servers with apache from Debian and my own Nginx build performing fine, developing software has not been smooth.

Obviously I use the reiser4 kernels that I build in my local development machine. An aspect of my daily use is building software, like PHP, Nginx, etc., in addition to my reiser4 -patched kernels.

Frequently, during building PHP 7.x.y software, reiser4 -enhanced kernels 5.0.xy hang in both normal and transparent compression reiser4 formatted partitions. As a matter of fact with these last reiser4 -patched kernels I cannot even build another kernel software set.

Although initially I suspected hardware issues, the fact that I do fall back on my last 4.14.20 reiser4 -patched kernel

https://github.com/Metztli/reiser4-debian-kernel-packaging-4.14.20

 --which I have even enhanced to target AMD64 Ryzen processors--

https://sourceforge.net/projects/metztli-reiser4/files/metztli-reiser4-z.iso/download

 to finish/restart and complete building kernels and/or other software indicates these hang issues are not related to my development machine.

Here is a screenshot of a hang instance during one of my builds of PHP 7.x.y in my local development machine -- where the upper console shows tar process defunct during output of ps aux (hint? Probably).

https://metztli.it/readOnlyEphemeral/tar-defunct-2019-06-05_04-13-45.png


A dmesg log follows below.



Best Professional Regards.



[    0.000000] microcode: microcode updated early to revision 0x2e, date = 2018-04-10
[    0.000000] Linux version 5.0.0-1+reiser4.0.2-amd64 (debian-kernel@lists.debian.org) (gcc version 6.3.0 20170516 (Debian 6.3.0-18+deb9u1)) #1 SMP Debian 5.0.15-1+reiser4.0.2 (2019-05-11)
[    0.000000] Command line: BOOT_IMAGE=/ome/vmlinuz-5.0.0-1+reiser4.0.2-amd64 root=/dev/sda2 ro quiet
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'standard' format.
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009d7ff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009d800-0x000000000009ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000000e0000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000ace3efff] usable
[    0.000000] BIOS-e820: [mem 0x00000000ace3f000-0x00000000acebefff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000acebf000-0x00000000acfbefff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x00000000acfbf000-0x00000000acffefff] ACPI data
[    0.000000] BIOS-e820: [mem 0x00000000acfff000-0x00000000acffffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000ad000000-0x00000000af9fffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000feb00000-0x00000000feb03fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed10000-0x00000000fed19fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000ffd80000-0x00000000ffffffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000044fdfffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] SMBIOS 2.7 present.
[    0.000000] DMI: Hewlett-Packard HP Pavilion dv6 Notebook PC/17FC, BIOS F.1C 01/23/2013
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 2194.979 MHz processor
[    0.002160] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.002162] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.002169] last_pfn = 0x44fe00 max_arch_pfn = 0x400000000
[    0.002173] MTRR default type: uncachable
[    0.002174] MTRR fixed ranges enabled:
[    0.002175]   00000-9FFFF write-back
[    0.002176]   A0000-BFFFF uncachable
[    0.002177]   C0000-FFFFF write-protect
[    0.002178] MTRR variable ranges enabled:
[    0.002180]   0 base 000000000 mask F80000000 write-back
[    0.002181]   1 base 080000000 mask FC0000000 write-back
[    0.002182]   2 base 0AD000000 mask FFF000000 uncachable
[    0.002182]   3 base 0AE000000 mask FFE000000 uncachable
[    0.002183]   4 base 0B0000000 mask FF0000000 uncachable
[    0.002184]   5 base 0FFC00000 mask FFFC00000 write-protect
[    0.002185]   6 base 100000000 mask F00000000 write-back
[    0.002186]   7 base 200000000 mask E00000000 write-back
[    0.002187]   8 base 400000000 mask FC0000000 write-back
[    0.002188]   9 base 440000000 mask FF0000000 write-back
[    0.003083] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.003214] last_pfn = 0xad000 max_arch_pfn = 0x400000000
[    0.015290] found SMP MP-table at [mem 0x000fe1b0-0x000fe1bf]
[    0.015537] reserving inaccessible SNB gfx pages
[    0.015542] BRK [0x379401000, 0x379401fff] PGTABLE
[    0.015544] BRK [0x379402000, 0x379402fff] PGTABLE
[    0.015545] BRK [0x379403000, 0x379403fff] PGTABLE
[    0.015582] BRK [0x379404000, 0x379404fff] PGTABLE
[    0.015585] BRK [0x379405000, 0x379405fff] PGTABLE
[    0.015681] BRK [0x379406000, 0x379406fff] PGTABLE
[    0.015743] BRK [0x379407000, 0x379407fff] PGTABLE
[    0.015756] BRK [0x379408000, 0x379408fff] PGTABLE
[    0.015793] BRK [0x379409000, 0x379409fff] PGTABLE
[    0.016073] RAMDISK: [mem 0x3506f000-0x3682efff]
[    0.016080] ACPI: Early table checksum verification disabled
[    0.016169] ACPI: RSDP 0x00000000000FE020 000024 (v02 HPQOEM)
[    0.016173] ACPI: XSDT 0x00000000ACFFE120 00008C (v01 HPQOEM SLIC-MPC 00000001      01000013)
[    0.016179] ACPI: FACP 0x00000000ACFFC000 0000F4 (v04 HPQOEM SLIC-MPC 00000001 MSFT 01000013)
[    0.016184] ACPI: DSDT 0x00000000ACFEB000 00DB7F (v01 HP     INSYDE   00000000 MSFT 01000013)
[    0.016187] ACPI: FACS 0x00000000ACF6C000 000040
[    0.016190] ACPI: FACS 0x00000000ACF6C000 000040
[    0.016192] ACPI: ASF! 0x00000000ACFFD000 0000A5 (v32 HP     INSYDE   00000001 MSFT 01000013)
[    0.016195] ACPI: HPET 0x00000000ACFFB000 000038 (v01 HP     INSYDE   00000001 MSFT 01000013)
[    0.016198] ACPI: APIC 0x00000000ACFFA000 00008C (v02 HP     INSYDE   00000001 MSFT 01000013)
[    0.016201] ACPI: MCFG 0x00000000ACFF9000 00003C (v01 HP     INSYDE   00000001 MSFT 01000013)
[    0.016204] ACPI: SLIC 0x00000000ACFEA000 000176 (v01 HPQOEM SLIC-MPC 00000001 MSFT 01000013)
[    0.016207] ACPI: SSDT 0x00000000ACFE9000 00051F (v01 HP     INSYDE   00001000 MSFT 01000013)
[    0.016211] ACPI: BOOT 0x00000000ACFE7000 000028 (v01 HP     INSYDE   00000001 MSFT 01000013)
[    0.016214] ACPI: ASPT 0x00000000ACFE4000 000034 (v07 HP     INSYDE   00000001 MSFT 01000013)
[    0.016217] ACPI: SSDT 0x00000000ACFE3000 00094E (v01 HP     INSYDE   00003000 INTL 20100121)
[    0.016220] ACPI: SSDT 0x00000000ACFE2000 000996 (v01 HP     INSYDE   00003000 INTL 20100121)
[    0.016223] ACPI: SSDT 0x00000000ACFE1000 0002DA (v01 HP     INSYDE   00003000 INTL 20100121)
[    0.016226] ACPI: SSDT 0x00000000ACFE0000 00035D (v01 HP     INSYDE   00003000 INTL 20100121)
[    0.016235] ACPI: Local APIC address 0xfee00000
[    0.016324] No NUMA configuration found
[    0.016325] Faking a node at [mem 0x0000000000000000-0x000000044fdfffff]
[    0.016329] NODE_DATA(0) allocated [mem 0x44fdef000-0x44fdf3fff]
[    0.016366] Zone ranges:
[    0.016367]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.016368]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.016369]   Normal   [mem 0x0000000100000000-0x000000044fdfffff]
[    0.016370]   Device   empty
[    0.016371] Movable zone start for each node
[    0.016372] Early memory node ranges
[    0.016373]   node   0: [mem 0x0000000000001000-0x000000000009cfff]
[    0.016374]   node   0: [mem 0x0000000000100000-0x00000000ace3efff]
[    0.016374]   node   0: [mem 0x00000000acfff000-0x00000000acffffff]
[    0.016375]   node   0: [mem 0x0000000100000000-0x000000044fdfffff]
[    0.016645] Zeroed struct page in unavailable ranges: 12836 pages
[    0.016646] Initmem setup node 0 [mem 0x0000000000001000-0x000000044fdfffff]
[    0.016648] On node 0 totalpages: 4180956
[    0.016649]   DMA zone: 64 pages used for memmap
[    0.016650]   DMA zone: 156 pages reserved
[    0.016651]   DMA zone: 3996 pages, LIFO batch:0
[    0.016787]   DMA32 zone: 11001 pages used for memmap
[    0.016788]   DMA32 zone: 704064 pages, LIFO batch:63
[    0.041550]   Normal zone: 54264 pages used for memmap
[    0.041552]   Normal zone: 3472896 pages, LIFO batch:63
[    0.154319] Reserving Intel graphics memory at [mem 0xada00000-0xaf9fffff]
[    0.154634] ACPI: PM-Timer IO Port: 0x408
[    0.154635] ACPI: Local APIC address 0xfee00000
[    0.154654] IOAPIC[0]: apic_id 0, version 32, address 0xfec00000, GSI 0-23
[    0.154657] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.154658] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.154660] ACPI: IRQ0 used by override.
[    0.154661] ACPI: IRQ9 used by override.
[    0.154664] Using ACPI (MADT) for SMP configuration information
[    0.154666] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.154671] smpboot: Allowing 8 CPUs, 0 hotplug CPUs
[    0.154690] PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.154692] PM: Registered nosave memory: [mem 0x0009d000-0x0009dfff]
[    0.154692] PM: Registered nosave memory: [mem 0x0009e000-0x0009ffff]
[    0.154693] PM: Registered nosave memory: [mem 0x000a0000-0x000dffff]
[    0.154693] PM: Registered nosave memory: [mem 0x000e0000-0x000fffff]
[    0.154695] PM: Registered nosave memory: [mem 0xace3f000-0xacebefff]
[    0.154696] PM: Registered nosave memory: [mem 0xacebf000-0xacfbefff]
[    0.154696] PM: Registered nosave memory: [mem 0xacfbf000-0xacffefff]
[    0.154698] PM: Registered nosave memory: [mem 0xad000000-0xaf9fffff]
[    0.154699] PM: Registered nosave memory: [mem 0xafa00000-0xdfffffff]
[    0.154699] PM: Registered nosave memory: [mem 0xe0000000-0xefffffff]
[    0.154700] PM: Registered nosave memory: [mem 0xf0000000-0xfeafffff]
[    0.154700] PM: Registered nosave memory: [mem 0xfeb00000-0xfeb03fff]
[    0.154701] PM: Registered nosave memory: [mem 0xfeb04000-0xfebfffff]
[    0.154702] PM: Registered nosave memory: [mem 0xfec00000-0xfec00fff]
[    0.154702] PM: Registered nosave memory: [mem 0xfec01000-0xfed0ffff]
[    0.154703] PM: Registered nosave memory: [mem 0xfed10000-0xfed19fff]
[    0.154703] PM: Registered nosave memory: [mem 0xfed1a000-0xfed1bfff]
[    0.154704] PM: Registered nosave memory: [mem 0xfed1c000-0xfed1ffff]
[    0.154705] PM: Registered nosave memory: [mem 0xfed20000-0xfedfffff]
[    0.154705] PM: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
[    0.154706] PM: Registered nosave memory: [mem 0xfee01000-0xffd7ffff]
[    0.154707] PM: Registered nosave memory: [mem 0xffd80000-0xffffffff]
[    0.154708] [mem 0xafa00000-0xdfffffff] available for PCI devices
[    0.154709] Booting paravirtualized kernel on bare hardware
[    0.154712] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
[    0.277264] random: get_random_bytes called from start_kernel+0x94/0x4a8 with crng_init=0
[    0.277272] setup_percpu: NR_CPUS:512 nr_cpumask_bits:512 nr_cpu_ids:8 nr_node_ids:1
[    0.277490] percpu: Embedded 44 pages/cpu s142680 r8192 d29352 u262144
[    0.277498] pcpu-alloc: s142680 r8192 d29352 u262144 alloc=1*2097152
[    0.277499] pcpu-alloc: [0] 0 1 2 3 4 5 6 7 
[    0.277523] Built 1 zonelists, mobility grouping on.  Total pages: 4115471
[    0.277524] Policy zone: Normal
[    0.277525] Kernel command line: BOOT_IMAGE=/ome/vmlinuz-5.0.0-1+reiser4.0.2-amd64 root=/dev/sda2 ro quiet
[    0.281743] Calgary: detecting Calgary via BIOS EBDA area
[    0.281748] Calgary: Unable to locate Rio Grande table in EBDA - bailing!
[    0.330408] Memory: 16344504K/16723824K available (10243K kernel code, 1160K rwdata, 3256K rodata, 1600K init, 2372K bss, 379320K reserved, 0K cma-reserved)
[    0.330521] Kernel/User page tables isolation: enabled
[    0.330537] ftrace: allocating 31651 entries in 124 pages
[    0.345761] rcu: Hierarchical RCU implementation.
[    0.345763] rcu: 	RCU restricting CPUs from NR_CPUS=512 to nr_cpu_ids=8.
[    0.345764] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.345765] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
[    0.349400] NR_IRQS: 33024, nr_irqs: 488, preallocated irqs: 16
[    0.351554] Console: colour VGA+ 80x25
[    0.351559] printk: console [tty0] enabled
[    0.351581] ACPI: Core revision 20181213
[    0.351818] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 133484882848 ns
[    0.351829] hpet clockevent registered
[    0.351835] APIC: Switch to symmetric I/O mode setup
[    0.351905] x2apic: IRQ remapping doesn't support X2APIC mode
[    0.352339] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.371835] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x1fa3abaf14b, max_idle_ns: 440795286187 ns
[    0.371849] Calibrating delay loop (skipped), value calculated using timer frequency.. 4389.95 BogoMIPS (lpj=8779916)
[    0.371851] pid_max: default: 32768 minimum: 301
[    0.371904] LSM: Security Framework initializing
[    0.371905] Yama: disabled by default; enable with sysctl kernel.yama.*
[    0.371934] AppArmor: AppArmor initialized
[    0.374401] Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes)
[    0.375658] Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes)
[    0.375726] Mount-cache hash table entries: 32768 (order: 6, 262144 bytes)
[    0.375768] Mountpoint-cache hash table entries: 32768 (order: 6, 262144 bytes)
[    0.376027] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    0.376028] ENERGY_PERF_BIAS: View and update with x86_energy_perf_policy(8)
[    0.376033] mce: CPU supports 9 MCE banks
[    0.376053] process: using mwait in idle threads
[    0.376056] Last level iTLB entries: 4KB 512, 2MB 8, 4MB 8
[    0.376057] Last level dTLB entries: 4KB 512, 2MB 32, 4MB 32, 1GB 0
[    0.376059] Spectre V2 : Mitigation: Full generic retpoline
[    0.376059] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    0.376060] Spectre V2 : Enabling Restricted Speculation for firmware calls
[    0.376069] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[    0.376070] Spectre V2 : User space: Mitigation: STIBP via seccomp and prctl
[    0.376071] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl and seccomp
[    0.376235] Freeing SMP alternatives memory: 24K
[    0.379913] TSC deadline timer enabled
[    0.379916] smpboot: CPU0: Intel(R) Core(TM) i7-2670QM CPU @ 2.20GHz (family: 0x6, model: 0x2a, stepping: 0x7)
[    0.380036] Performance Events: PEBS fmt1+, SandyBridge events, 16-deep LBR, full-width counters, Intel PMU driver.
[    0.380060] ... version:                3
[    0.380061] ... bit width:              48
[    0.380061] ... generic registers:      4
[    0.380062] ... value mask:             0000ffffffffffff
[    0.380063] ... max period:             00007fffffffffff
[    0.380063] ... fixed-purpose events:   3
[    0.380064] ... event mask:             000000070000000f
[    0.380106] rcu: Hierarchical SRCU implementation.
[    0.381003] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[    0.381092] smp: Bringing up secondary CPUs ...
[    0.381199] x86: Booting SMP configuration:
[    0.381200] .... node  #0, CPUs:      #1 #2 #3 #4 #5 #6 #7
[    0.398345] smp: Brought up 1 node, 8 CPUs
[    0.398345] smpboot: Max logical packages: 1
[    0.398345] smpboot: Total of 8 processors activated (35119.66 BogoMIPS)
[    0.400405] devtmpfs: initialized
[    0.400405] x86/mm: Memory block size: 128MB
[    0.401457] PM: Registering ACPI NVS region [mem 0xacebf000-0xacfbefff] (1048576 bytes)
[    0.401457] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.401457] futex hash table entries: 2048 (order: 5, 131072 bytes)
[    0.401457] pinctrl core: initialized pinctrl subsystem
[    0.401457] NET: Registered protocol family 16
[    0.401457] audit: initializing netlink subsys (disabled)
[    0.401457] audit: type=2000 audit(1559719026.048:1): state=initialized audit_enabled=0 res=1
[    0.401457] cpuidle: using governor ladder
[    0.401457] cpuidle: using governor menu
[    0.401457] Simple Boot Flag at 0x44 set to 0x1
[    0.401457] ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
[    0.401457] ACPI: bus type PCI registered
[    0.401457] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.401457] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
[    0.401457] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E820
[    0.401457] PCI: Using configuration type 1 for base access
[    0.401457] core: PMU erratum BJ122, BV98, HSD29 worked around, HT is on
[    0.404194] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.404194] ACPI: Added _OSI(Module Device)
[    0.404194] ACPI: Added _OSI(Processor Device)
[    0.404194] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.404194] ACPI: Added _OSI(Processor Aggregator Device)
[    0.404194] ACPI: Added _OSI(Linux-Dell-Video)
[    0.404194] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.404194] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.414952] ACPI: 6 ACPI AML tables successfully acquired and loaded
[    0.416574] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.417044] ACPI: Dynamic OEM Table Load:
[    0.417051] ACPI: SSDT 0xFFFF9ED13D0E4800 000727 (v01 PmRef  Cpu0Cst  00003001 INTL 20100121)
[    0.417523] ACPI: Dynamic OEM Table Load:
[    0.417528] ACPI: SSDT 0xFFFF9ED13D0EB000 000303 (v01 PmRef  ApIst    00003000 INTL 20100121)
[    0.417828] ACPI: Dynamic OEM Table Load:
[    0.417833] ACPI: SSDT 0xFFFF9ED13D039400 000119 (v01 PmRef  ApCst    00003000 INTL 20100121)
[    0.419428] ACPI: EC: EC started
[    0.419428] ACPI: EC: interrupt blocked
[    0.422301] ACPI: \_SB_.PCI0.LPCB.EC__: Used as first EC
[    0.422303] ACPI: \_SB_.PCI0.LPCB.EC__: GPE=0x17, EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.422304] ACPI: \_SB_.PCI0.LPCB.EC__: Used as boot DSDT EC to handle transactions
[    0.422305] ACPI: Interpreter enabled
[    0.422331] ACPI: (supports S0 S3 S4 S5)
[    0.422332] ACPI: Using IOAPIC for interrupt routing
[    0.422363] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.422574] ACPI: Enabled 9 GPEs in block 00 to 3F
[    0.424401] acpi ABCDEFGH:00: ACPI dock station (docks/bays count: 1)
[    0.430104] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-fe])
[    0.430109] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI]
[    0.430149] acpi PNP0A08:00: _OSC failed (AE_ERROR); disabling ASPM
[    0.430671] PCI host bridge to bus 0000:00
[    0.430674] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.430675] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.430676] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    0.430678] pci_bus 0000:00: root bus resource [mem 0xafa00000-0xfeafffff window]
[    0.430679] pci_bus 0000:00: root bus resource [bus 00-fe]
[    0.430687] pci 0000:00:00.0: [8086:0104] type 00 class 0x060000
[    0.430792] pci 0000:00:02.0: [8086:0116] type 00 class 0x030000
[    0.430804] pci 0000:00:02.0: reg 0x10: [mem 0xc0000000-0xc03fffff 64bit]
[    0.430809] pci 0000:00:02.0: reg 0x18: [mem 0xb0000000-0xbfffffff 64bit pref]
[    0.430814] pci 0000:00:02.0: reg 0x20: [io  0x5000-0x503f]
[    0.430932] pci 0000:00:16.0: [8086:1c3a] type 00 class 0x078000
[    0.430958] pci 0000:00:16.0: reg 0x10: [mem 0xc6504000-0xc650400f 64bit]
[    0.431036] pci 0000:00:16.0: PME# supported from D0 D3hot D3cold
[    0.431133] pci 0000:00:1a.0: [8086:1c2d] type 00 class 0x0c0320
[    0.431841] pci 0000:00:1a.0: reg 0x10: [mem 0xc650a000-0xc650a3ff]
[    0.434161] pci 0000:00:1a.0: PME# supported from D0 D3hot D3cold
[    0.434264] pci 0000:00:1b.0: [8086:1c20] type 00 class 0x040300
[    0.434288] pci 0000:00:1b.0: reg 0x10: [mem 0xc6500000-0xc6503fff 64bit]
[    0.434368] pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
[    0.434463] pci 0000:00:1c.0: [8086:1c10] type 01 class 0x060400
[    0.434557] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.434658] pci 0000:00:1c.1: [8086:1c12] type 01 class 0x060400
[    0.434750] pci 0000:00:1c.1: PME# supported from D0 D3hot D3cold
[    0.434850] pci 0000:00:1c.2: [8086:1c14] type 01 class 0x060400
[    0.434942] pci 0000:00:1c.2: PME# supported from D0 D3hot D3cold
[    0.435041] pci 0000:00:1c.3: [8086:1c16] type 01 class 0x060400
[    0.435133] pci 0000:00:1c.3: PME# supported from D0 D3hot D3cold
[    0.435239] pci 0000:00:1d.0: [8086:1c26] type 00 class 0x0c0320
[    0.435841] pci 0000:00:1d.0: reg 0x10: [mem 0xc6509000-0xc65093ff]
[    0.438158] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
[    0.438256] pci 0000:00:1f.0: [8086:1c49] type 00 class 0x060100
[    0.438449] pci 0000:00:1f.2: [8086:1c03] type 00 class 0x010601
[    0.438469] pci 0000:00:1f.2: reg 0x10: [io  0x5088-0x508f]
[    0.438477] pci 0000:00:1f.2: reg 0x14: [io  0x509c-0x509f]
[    0.438485] pci 0000:00:1f.2: reg 0x18: [io  0x5080-0x5087]
[    0.438493] pci 0000:00:1f.2: reg 0x1c: [io  0x5098-0x509b]
[    0.438501] pci 0000:00:1f.2: reg 0x20: [io  0x5060-0x507f]
[    0.438510] pci 0000:00:1f.2: reg 0x24: [mem 0xc6508000-0xc65087ff]
[    0.438553] pci 0000:00:1f.2: PME# supported from D3hot
[    0.438638] pci 0000:00:1f.3: [8086:1c22] type 00 class 0x0c0500
[    0.438658] pci 0000:00:1f.3: reg 0x10: [mem 0xc6506000-0xc65060ff 64bit]
[    0.438680] pci 0000:00:1f.3: reg 0x20: [io  0x5040-0x505f]
[    0.438856] pci 0000:01:00.0: [10ec:8168] type 00 class 0x020000
[    0.438892] pci 0000:01:00.0: reg 0x10: [io  0x4000-0x40ff]
[    0.438927] pci 0000:01:00.0: reg 0x18: [mem 0xc0404000-0xc0404fff 64bit pref]
[    0.438948] pci 0000:01:00.0: reg 0x20: [mem 0xc0400000-0xc0403fff 64bit pref]
[    0.439074] pci 0000:01:00.0: supports D1 D2
[    0.439075] pci 0000:01:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.439221] pci 0000:00:1c.0: PCI bridge to [bus 01-06]
[    0.439225] pci 0000:00:1c.0:   bridge window [io  0x4000-0x4fff]
[    0.439229] pci 0000:00:1c.0:   bridge window [mem 0xc5500000-0xc64fffff]
[    0.439235] pci 0000:00:1c.0:   bridge window [mem 0xc0400000-0xc13fffff 64bit pref]
[    0.439440] pci 0000:07:00.0: [8086:008b] type 00 class 0x028000
[    0.439643] pci 0000:07:00.0: reg 0x10: [mem 0xc4500000-0xc4501fff 64bit]
[    0.440362] pci 0000:07:00.0: PME# supported from D0 D3hot D3cold
[    0.440754] pci 0000:00:1c.1: PCI bridge to [bus 07-0c]
[    0.440758] pci 0000:00:1c.1:   bridge window [io  0x3000-0x3fff]
[    0.440762] pci 0000:00:1c.1:   bridge window [mem 0xc4500000-0xc54fffff]
[    0.440767] pci 0000:00:1c.1:   bridge window [mem 0xc1400000-0xc23fffff 64bit pref]
[    0.440847] pci 0000:0d:00.0: [10ec:5209] type 00 class 0xff0000
[    0.440883] pci 0000:0d:00.0: reg 0x10: [mem 0xc3501000-0xc3501fff]
[    0.440971] pci 0000:0d:00.0: reg 0x30: [mem 0xffff0000-0xffffffff pref]
[    0.441064] pci 0000:0d:00.0: supports D1 D2
[    0.441065] pci 0000:0d:00.0: PME# supported from D1 D2 D3hot
[    0.441182] pci 0000:0d:00.1: [10ec:5209] type 00 class 0x080500
[    0.441219] pci 0000:0d:00.1: reg 0x10: [mem 0xc3500000-0xc35000ff]
[    0.441394] pci 0000:0d:00.1: supports D1 D2
[    0.441396] pci 0000:0d:00.1: PME# supported from D1 D2 D3hot
[    0.441531] pci 0000:00:1c.2: PCI bridge to [bus 0d-12]
[    0.441535] pci 0000:00:1c.2:   bridge window [io  0x2000-0x2fff]
[    0.441539] pci 0000:00:1c.2:   bridge window [mem 0xc3500000-0xc44fffff]
[    0.441544] pci 0000:00:1c.2:   bridge window [mem 0xc2400000-0xc33fffff 64bit pref]
[    0.441691] pci 0000:13:00.0: [1033:0194] type 00 class 0x0c0330
[    0.441777] pci 0000:13:00.0: reg 0x10: [mem 0xc3400000-0xc3401fff 64bit]
[    0.442152] pci 0000:13:00.0: PME# supported from D0 D3hot D3cold
[    0.442410] pci 0000:00:1c.3: PCI bridge to [bus 13]
[    0.442416] pci 0000:00:1c.3:   bridge window [mem 0xc3400000-0xc34fffff]
[    0.442952] ACPI: PCI Interrupt Link [LNKA] (IRQs 1 3 4 5 6 10 11 12 14 15) *7
[    0.443014] ACPI: PCI Interrupt Link [LNKB] (IRQs 1 *3 4 5 6 10 11 12 14 15)
[    0.443075] ACPI: PCI Interrupt Link [LNKC] (IRQs 1 3 4 5 6 *10 11 12 14 15)
[    0.443134] ACPI: PCI Interrupt Link [LNKD] (IRQs 1 3 4 5 6 *10 11 12 14 15)
[    0.443192] ACPI: PCI Interrupt Link [LNKE] (IRQs 1 3 4 5 6 10 11 12 14 15) *0, disabled.
[    0.443251] ACPI: PCI Interrupt Link [LNKF] (IRQs 1 3 *4 5 6 10 11 12 14 15)
[    0.443309] ACPI: PCI Interrupt Link [LNKG] (IRQs 1 3 4 *5 6 10 11 12 14 15)
[    0.443366] ACPI: PCI Interrupt Link [LNKH] (IRQs 1 3 4 5 6 10 *11 12 14 15)
[    0.444234] ACPI: EC: interrupt unblocked
[    0.444252] ACPI: EC: event unblocked
[    0.444260] ACPI: \_SB_.PCI0.LPCB.EC__: GPE=0x17, EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.444262] ACPI: \_SB_.PCI0.LPCB.EC__: Used as boot DSDT EC to handle transactions and events
[    0.444345] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.444345] pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.444345] pci 0000:00:02.0: vgaarb: bridge control possible
[    0.444345] vgaarb: loaded
[    0.444345] EDAC MC: Ver: 3.0.0
[    0.444345] PCI: Using ACPI for IRQ routing
[    0.452944] PCI: pci_cache_line_size set to 64 bytes
[    0.453100] e820: reserve RAM buffer [mem 0x0009d800-0x0009ffff]
[    0.453101] e820: reserve RAM buffer [mem 0xace3f000-0xafffffff]
[    0.453102] e820: reserve RAM buffer [mem 0xad000000-0xafffffff]
[    0.453103] e820: reserve RAM buffer [mem 0x44fe00000-0x44fffffff]
[    0.453220] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[    0.453220] hpet0: 8 comparators, 64-bit 14.318180 MHz counter
[    0.455865] clocksource: Switched to clocksource tsc-early
[    0.466629] VFS: Disk quotas dquot_6.6.0
[    0.466654] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.466775] AppArmor: AppArmor Filesystem Enabled
[    0.466796] pnp: PnP ACPI init
[    0.466979] system 00:00: [io  0x0680-0x069f] has been reserved
[    0.466981] system 00:00: [io  0x1000-0x100f] has been reserved
[    0.466983] system 00:00: [io  0x1010-0x1013] has been reserved
[    0.466985] system 00:00: [io  0xffff] has been reserved
[    0.466986] system 00:00: [io  0x0400-0x0453] has been reserved
[    0.466988] system 00:00: [io  0x0458-0x047f] has been reserved
[    0.466989] system 00:00: [io  0x0500-0x057f] has been reserved
[    0.466991] system 00:00: [io  0x164e-0x164f] has been reserved
[    0.466997] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.467026] pnp 00:01: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.467080] system 00:02: [io  0x0454-0x0457] has been reserved
[    0.467084] system 00:02: Plug and Play ACPI device, IDs INT3f0d PNP0c02 (active)
[    0.467136] pnp 00:03: Plug and Play ACPI device, IDs PNP0303 (active)
[    0.467185] pnp 00:04: Plug and Play ACPI device, IDs SYN1e47 SYN1e00 SYN0002 PNP0f13 (active)
[    0.467321] system 00:05: [mem 0xfed1c000-0xfed1ffff] has been reserved
[    0.467322] system 00:05: [mem 0xfed10000-0xfed17fff] has been reserved
[    0.467324] system 00:05: [mem 0xfed18000-0xfed18fff] has been reserved
[    0.467326] system 00:05: [mem 0xfed19000-0xfed19fff] has been reserved
[    0.467328] system 00:05: [mem 0xe0000000-0xefffffff] has been reserved
[    0.467329] system 00:05: [mem 0xfed20000-0xfed3ffff] has been reserved
[    0.467331] system 00:05: [mem 0xfed90000-0xfed93fff] has been reserved
[    0.467333] system 00:05: [mem 0xff000000-0xffffffff] could not be reserved
[    0.467335] system 00:05: [mem 0xfee00000-0xfeefffff] could not be reserved
[    0.467336] system 00:05: [mem 0xafa00000-0xafa00fff] has been reserved
[    0.467342] system 00:05: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.469264] system 00:06: [mem 0x20000000-0x201fffff] could not be reserved
[    0.469265] system 00:06: [mem 0x40000000-0x401fffff] could not be reserved
[    0.469270] system 00:06: Plug and Play ACPI device, IDs PNP0c01 (active)
[    0.469287] pnp: PnP ACPI: found 7 devices
[    0.475313] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.475318] pci 0000:0d:00.0: can't claim BAR 6 [mem 0xffff0000-0xffffffff pref]: no compatible bridge window
[    0.475356] pci 0000:00:1c.0: PCI bridge to [bus 01-06]
[    0.475360] pci 0000:00:1c.0:   bridge window [io  0x4000-0x4fff]
[    0.475365] pci 0000:00:1c.0:   bridge window [mem 0xc5500000-0xc64fffff]
[    0.475369] pci 0000:00:1c.0:   bridge window [mem 0xc0400000-0xc13fffff 64bit pref]
[    0.475375] pci 0000:00:1c.1: PCI bridge to [bus 07-0c]
[    0.475378] pci 0000:00:1c.1:   bridge window [io  0x3000-0x3fff]
[    0.475383] pci 0000:00:1c.1:   bridge window [mem 0xc4500000-0xc54fffff]
[    0.475387] pci 0000:00:1c.1:   bridge window [mem 0xc1400000-0xc23fffff 64bit pref]
[    0.475396] pci 0000:0d:00.0: BAR 6: assigned [mem 0xc3510000-0xc351ffff pref]
[    0.475398] pci 0000:00:1c.2: PCI bridge to [bus 0d-12]
[    0.475401] pci 0000:00:1c.2:   bridge window [io  0x2000-0x2fff]
[    0.475406] pci 0000:00:1c.2:   bridge window [mem 0xc3500000-0xc44fffff]
[    0.475410] pci 0000:00:1c.2:   bridge window [mem 0xc2400000-0xc33fffff 64bit pref]
[    0.475416] pci 0000:00:1c.3: PCI bridge to [bus 13]
[    0.475421] pci 0000:00:1c.3:   bridge window [mem 0xc3400000-0xc34fffff]
[    0.475430] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.475431] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.475433] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[    0.475434] pci_bus 0000:00: resource 7 [mem 0xafa00000-0xfeafffff window]
[    0.475435] pci_bus 0000:01: resource 0 [io  0x4000-0x4fff]
[    0.475436] pci_bus 0000:01: resource 1 [mem 0xc5500000-0xc64fffff]
[    0.475438] pci_bus 0000:01: resource 2 [mem 0xc0400000-0xc13fffff 64bit pref]
[    0.475439] pci_bus 0000:07: resource 0 [io  0x3000-0x3fff]
[    0.475440] pci_bus 0000:07: resource 1 [mem 0xc4500000-0xc54fffff]
[    0.475441] pci_bus 0000:07: resource 2 [mem 0xc1400000-0xc23fffff 64bit pref]
[    0.475443] pci_bus 0000:0d: resource 0 [io  0x2000-0x2fff]
[    0.475444] pci_bus 0000:0d: resource 1 [mem 0xc3500000-0xc44fffff]
[    0.475445] pci_bus 0000:0d: resource 2 [mem 0xc2400000-0xc33fffff 64bit pref]
[    0.475446] pci_bus 0000:13: resource 1 [mem 0xc3400000-0xc34fffff]
[    0.475542] NET: Registered protocol family 2
[    0.475722] tcp_listen_portaddr_hash hash table entries: 8192 (order: 5, 131072 bytes)
[    0.475785] TCP established hash table entries: 131072 (order: 8, 1048576 bytes)
[    0.476038] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    0.476175] TCP: Hash tables configured (established 131072 bind 65536)
[    0.476220] UDP hash table entries: 8192 (order: 6, 262144 bytes)
[    0.476278] UDP-Lite hash table entries: 8192 (order: 6, 262144 bytes)
[    0.476376] NET: Registered protocol family 1
[    0.476390] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    0.496012] pci 0000:00:1a.0: quirk_usb_early_handoff+0x0/0x6a0 took 19149 usecs
[    0.516001] pci 0000:00:1d.0: quirk_usb_early_handoff+0x0/0x6a0 took 19498 usecs
[    0.528344] pci 0000:13:00.0: quirk_usb_early_handoff+0x0/0x6a0 took 11999 usecs
[    0.528349] PCI: CLS 64 bytes, default 64
[    0.528392] Unpacking initramfs...
[    0.980013] Freeing initrd memory: 24320K
[    0.980026] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.980028] software IO TLB: mapped [mem 0xa8e3f000-0xace3f000] (64MB)
[    0.980815] Initialise system trusted keyrings
[    0.980874] workingset: timestamp_bits=40 max_order=22 bucket_order=0
[    0.980939] zbud: loaded
[    1.414849] Key type asymmetric registered
[    1.414851] Asymmetric key parser 'x509' registered
[    1.414869] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 248)
[    1.414906] io scheduler mq-deadline registered
[    1.415568] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    1.415583] intel_idle: MWAIT substates: 0x21120
[    1.415584] intel_idle: v0.4.1 model 0x2A
[    1.416034] intel_idle: lapic_timer_reliable_states 0xffffffff
[    1.418949] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    1.419533] Linux agpgart interface v0.103
[    1.419622] AMD-Vi: AMD IOMMUv2 driver by Joerg Roedel <jroedel@suse.de>
[    1.419623] AMD-Vi: AMD IOMMUv2 functionality not available on this system
[    1.420272] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0x60,0x64 irq 1,12
[    1.433806] serio: i8042 KBD port at 0x60,0x64 irq 1
[    1.433811] serio: i8042 AUX port at 0x60,0x64 irq 12
[    1.434049] mousedev: PS/2 mouse device common for all mice
[    1.434093] rtc_cmos 00:01: RTC can wake from S4
[    1.434290] rtc_cmos 00:01: registered as rtc0
[    1.434312] rtc_cmos 00:01: alarms up to one month, y3k, 242 bytes nvram, hpet irqs
[    1.434323] intel_pstate: Intel P-state driver initializing
[    1.435194] ledtrig-cpu: registered to indicate activity on CPUs
[    1.435952] NET: Registered protocol family 10
[    1.436612] Segment Routing with IPv6
[    1.436656] mip6: Mobile IPv6
[    1.436660] NET: Registered protocol family 17
[    1.436667] mpls_gso: MPLS GSO support
[    1.437989] microcode: sig=0x206a7, pf=0x10, revision=0x2e
[    1.438326] microcode: Microcode Update Driver: v2.2.
[    1.438349] sched_clock: Marking stable (1436068734, 2243464)->(1460325945, -22013747)
[    1.439032] registered taskstats version 1
[    1.439034] Loading compiled-in X.509 certificates
[    1.439292] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
[    1.486759] Loaded X.509 cert 'Debian Secure Boot CA: 6ccece7e4c6c0d1f6149f3dd27dfcc5cbb419ea1'
[    1.486775] Loaded X.509 cert 'Debian Secure Boot Signer: 00a7468def'
[    1.486795] zswap: loaded using pool lzo/zbud
[    1.486913] AppArmor: AppArmor sha1 policy hashing enabled
[    1.486917] ima: No TPM chip found, activating TPM-bypass!
[    1.486920] ima: Allocated hash algorithm: sha256
[    1.486927] No architecture policies found
[    1.487337] rtc_cmos 00:01: setting system clock to 2019-06-05T07:17:07 UTC (1559719027)
[    1.488465] Freeing unused kernel image memory: 1600K
[    1.535959] Write protecting the kernel read-only data: 16384k
[    1.537490] Freeing unused kernel image memory: 2036K
[    1.538099] Freeing unused kernel image memory: 840K
[    1.553518] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.553519] x86/mm: Checking user space page tables
[    1.561330] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.561332] Run /init as init process
[    1.646989] wmi_bus wmi_bus-PNP0C14:00: WQBC data block query control method not found
[    1.649309] i801_smbus 0000:00:1f.3: SMBus using PCI interrupt
[    1.652500] ACPI: bus type USB registered
[    1.652524] usbcore: registered new interface driver usbfs
[    1.652535] usbcore: registered new interface driver hub
[    1.652570] usbcore: registered new device driver usb
[    1.657025] SCSI subsystem initialized
[    1.657064] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.657498] r8169 0000:01:00.0: can't disable ASPM; OS doesn't have ASPM control
[    1.657624] cryptd: max_cpu_qlen set to 1000
[    1.658008] sdhci: Secure Digital Host Controller Interface driver
[    1.658009] sdhci: Copyright(c) Pierre Ossman
[    1.661024] libphy: r8169: probed
[    1.661504] r8169 0000:01:00.0 eth0: RTL8168evl/8111evl, 08:2e:5f:7f:b8:a4, XID 2c9, IRQ 24
[    1.661506] r8169 0000:01:00.0 eth0: jumbo features [frames: 9200 bytes, tx checksumming: ko]
[    1.662389] ehci-pci: EHCI PCI platform driver
[    1.662436] sdhci-pci 0000:0d:00.1: SDHCI controller found [10ec:5209] (rev 1)
[    1.662808] xhci_hcd 0000:13:00.0: xHCI Host Controller
[    1.662812] sdhci-pci 0000:0d:00.1: Will use DMA mode even though HW doesn't fully claim to support it.
[    1.662818] xhci_hcd 0000:13:00.0: new USB bus registered, assigned bus number 1
[    1.662837] mmc0 bounce up to 128 segments into one, max segment size 65536 bytes
[    1.662842] sdhci-pci 0000:0d:00.1: Will use DMA mode even though HW doesn't fully claim to support it.
[    1.662970] mmc0: SDHCI controller on PCI [0000:0d:00.1] using DMA
[    1.662983] xhci_hcd 0000:13:00.0: hcc params 0x014042cb hci version 0x96 quirks 0x0000000000000004
[    1.663404] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.00
[    1.663408] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.663409] usb usb1: Product: xHCI Host Controller
[    1.663411] usb usb1: Manufacturer: Linux 5.0.0-1+reiser4.0.2-amd64 xhci-hcd
[    1.663412] usb usb1: SerialNumber: 0000:13:00.0
[    1.663583] hub 1-0:1.0: USB hub found
[    1.663598] hub 1-0:1.0: 2 ports detected
[    1.663610] sdhci-pci 0000:0d:00.1: Will use DMA mode even though HW doesn't fully claim to support it.
[    1.663759] libata version 3.00 loaded.
[    1.663774] ehci-pci 0000:00:1a.0: EHCI Host Controller
[    1.663779] ehci-pci 0000:00:1a.0: new USB bus registered, assigned bus number 2
[    1.663804] xhci_hcd 0000:13:00.0: xHCI Host Controller
[    1.663807] ehci-pci 0000:00:1a.0: debug port 2
[    1.663809] xhci_hcd 0000:13:00.0: new USB bus registered, assigned bus number 3
[    1.663814] xhci_hcd 0000:13:00.0: Host supports USB 3.0  SuperSpeed
[    1.665305] AVX version of gcm_enc/dec engaged.
[    1.665306] AES CTR mode by8 optimization enabled
[    1.665347] ahci 0000:00:1f.2: version 3.0
[    1.666064] ahci 0000:00:1f.2: AHCI 0001.0300 32 slots 6 ports 6 Gbps 0x21 impl SATA mode
[    1.666068] ahci 0000:00:1f.2: flags: 64bit ncq sntf pm led clo pio slum part ems apst 
[    1.666713] usb usb3: We don't know the algorithms for LPM for this host, disabling LPM.
[    1.666737] usb usb3: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.00
[    1.666738] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.666739] usb usb3: Product: xHCI Host Controller
[    1.666740] usb usb3: Manufacturer: Linux 5.0.0-1+reiser4.0.2-amd64 xhci-hcd
[    1.666741] usb usb3: SerialNumber: 0000:13:00.0
[    1.666855] hub 3-0:1.0: USB hub found
[    1.666868] hub 3-0:1.0: 2 ports detected
[    1.667711] ehci-pci 0000:00:1a.0: cache line size of 64 is not supported
[    1.667732] ehci-pci 0000:00:1a.0: irq 16, io mem 0xc650a000
[    1.671633] r8169 0000:01:00.0 eno1: renamed from eth0
[    1.679982] ehci-pci 0000:00:1a.0: USB 2.0 started, EHCI 1.00
[    1.680076] usb usb2: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.00
[    1.680077] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.680078] usb usb2: Product: EHCI Host Controller
[    1.680079] usb usb2: Manufacturer: Linux 5.0.0-1+reiser4.0.2-amd64 ehci_hcd
[    1.680080] usb usb2: SerialNumber: 0000:00:1a.0
[    1.680247] hub 2-0:1.0: USB hub found
[    1.680260] hub 2-0:1.0: 2 ports detected
[    1.680595] ehci-pci 0000:00:1d.0: EHCI Host Controller
[    1.680600] ehci-pci 0000:00:1d.0: new USB bus registered, assigned bus number 4
[    1.680612] ehci-pci 0000:00:1d.0: debug port 2
[    1.680705] scsi host0: ahci
[    1.680859] scsi host1: ahci
[    1.680987] scsi host2: ahci
[    1.681115] scsi host3: ahci
[    1.681242] scsi host4: ahci
[    1.681358] scsi host5: ahci
[    1.681435] ata1: SATA max UDMA/133 abar m2048@0xc6508000 port 0xc6508100 irq 33
[    1.681437] ata2: DUMMY
[    1.681438] ata3: DUMMY
[    1.681438] ata4: DUMMY
[    1.681439] ata5: DUMMY
[    1.681442] ata6: SATA max UDMA/133 abar m2048@0xc6508000 port 0xc6508380 irq 33
[    1.684525] ehci-pci 0000:00:1d.0: cache line size of 64 is not supported
[    1.684540] ehci-pci 0000:00:1d.0: irq 20, io mem 0xc6509000
[    1.699964] ehci-pci 0000:00:1d.0: USB 2.0 started, EHCI 1.00
[    1.700551] usb usb4: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.00
[    1.700554] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.700556] usb usb4: Product: EHCI Host Controller
[    1.700558] usb usb4: Manufacturer: Linux 5.0.0-1+reiser4.0.2-amd64 ehci_hcd
[    1.700560] usb usb4: SerialNumber: 0000:00:1d.0
[    1.700987] hub 4-0:1.0: USB hub found
[    1.701051] hub 4-0:1.0: 2 ports detected
[    1.762040] thermal LNXTHERM:00: registered as thermal_zone0
[    1.762046] ACPI: Thermal Zone [THRM] (40 C)
[    1.983948] tsc: Refined TSC clocksource calibration: 2195.012 MHz
[    1.983973] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x1fa3cab9042, max_idle_ns: 440795210298 ns
[    1.984046] clocksource: Switched to clocksource tsc
[    1.995666] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    1.995707] ata6: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[    1.999770] ata6.00: ATAPI: hp       CDDVDW SN-208BB, HH01, max UDMA/100
[    2.006461] ata6.00: configured for UDMA/100
[    2.015950] usb 2-1: new high-speed USB device number 2 using ehci-pci
[    2.035945] usb 4-1: new high-speed USB device number 2 using ehci-pci
[    2.121766] ata1.00: ATA-10: ST2000LX001-1RG174, SDM1, max UDMA/133
[    2.121772] ata1.00: 3907029168 sectors, multi 16: LBA48 NCQ (depth 32), AA
[    2.172687] usb 2-1: New USB device found, idVendor=8087, idProduct=0024, bcdDevice= 0.00
[    2.172694] usb 2-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    2.173348] hub 2-1:1.0: USB hub found
[    2.173566] hub 2-1:1.0: 6 ports detected
[    2.192670] usb 4-1: New USB device found, idVendor=8087, idProduct=0024, bcdDevice= 0.00
[    2.192677] usb 4-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    2.193356] hub 4-1:1.0: USB hub found
[    2.193437] hub 4-1:1.0: 6 ports detected
[    2.208005] ata1.00: configured for UDMA/133
[    2.208659] scsi 0:0:0:0: Direct-Access     ATA      ST2000LX001-1RG1 SDM1 PQ: 0 ANSI: 5
[    2.216312] scsi 5:0:0:0: CD-ROM            hp       CDDVDW SN-208BB  HH01 PQ: 0 ANSI: 5
[    2.266527] sd 0:0:0:0: [sda] 3907029168 512-byte logical blocks: (2.00 TB/1.82 TiB)
[    2.266533] sd 0:0:0:0: [sda] 4096-byte physical blocks
[    2.266556] sd 0:0:0:0: [sda] Write Protect is off
[    2.266560] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    2.266597] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    2.270140]  sda: sda1 sda2 sda3 sda4 sda5
[    2.271268] sd 0:0:0:0: [sda] Attached SCSI disk
[    2.328271] sr 5:0:0:0: [sr0] scsi3-mmc drive: 24x/24x writer dvd-ram cd/rw xa/form2 cdda tray
[    2.328278] cdrom: Uniform CD-ROM driver Revision: 3.20
[    2.329147] sr 5:0:0:0: Attached scsi CD-ROM sr0
[    2.479920] usb 4-1.1: new low-speed USB device number 3 using ehci-pci
[    2.525431] psmouse serio1: synaptics: queried max coordinates: x [..5756], y [..4868]
[    2.531703] random: fast init done
[    2.613623] psmouse serio1: synaptics: Touchpad model: 1, fw: 7.5, id: 0x1e0b1, caps: 0xd00073/0x240000/0xa0400/0x0, board id: 1680, fw id: 726294
[    2.667443] input: SynPS/2 Synaptics TouchPad as /devices/platform/i8042/serio1/input/input2
[    2.674416] usb 4-1.1: New USB device found, idVendor=0e8f, idProduct=00a8, bcdDevice= 3.11
[    2.674422] usb 4-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    2.674426] usb 4-1.1: Product: 2.4G RX
[    2.674429] usb 4-1.1: Manufacturer: DaKai
[    2.680480] hidraw: raw HID events driver (C) Jiri Kosina
[    2.691605] usbcore: registered new interface driver usbhid
[    2.691606] usbhid: USB HID core driver
[    2.693750] input: DaKai 2.4G RX as /devices/pci0000:00/0000:00:1d.0/usb4/4-1/4-1.1/4-1.1:1.0/0003:0E8F:00A8.0001/input/input3
[    2.752435] hid-generic 0003:0E8F:00A8.0001: input,hidraw0: USB HID v1.10 Keyboard [DaKai 2.4G RX] on usb-0000:00:1d.0-1.1/input0
[    2.753118] input: DaKai 2.4G RX Mouse as /devices/pci0000:00/0000:00:1d.0/usb4/4-1/4-1.1/4-1.1:1.1/0003:0E8F:00A8.0002/input/input4
[    2.753458] input: DaKai 2.4G RX System Control as /devices/pci0000:00/0000:00:1d.0/usb4/4-1/4-1.1/4-1.1:1.1/0003:0E8F:00A8.0002/input/input5
[    2.755947] usb 4-1.2: new full-speed USB device number 4 using ehci-pci
[    2.812147] input: DaKai 2.4G RX Consumer Control as /devices/pci0000:00/0000:00:1d.0/usb4/4-1/4-1.1/4-1.1:1.1/0003:0E8F:00A8.0002/input/input6
[    2.812234] input: DaKai 2.4G RX as /devices/pci0000:00/0000:00:1d.0/usb4/4-1/4-1.1/4-1.1:1.1/0003:0E8F:00A8.0002/input/input7
[    2.812791] hid-generic 0003:0E8F:00A8.0002: input,hiddev0,hidraw1: USB HID v1.10 Mouse [DaKai 2.4G RX] on usb-0000:00:1d.0-1.1/input1
[    2.847047] Loading Reiser4 (format release: 4.0.2) See www.namesys.com for a description of Reiser4.
[    2.870608] usb 4-1.2: New USB device found, idVendor=062a, idProduct=4101, bcdDevice=81.13
[    2.870613] usb 4-1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    2.870616] usb 4-1.2: Product: 2.4G Keyboard Mouse
[    2.870628] usb 4-1.2: Manufacturer: MOSART Semi.
[    2.872552] input: MOSART Semi. 2.4G Keyboard Mouse as /devices/pci0000:00/0000:00:1d.0/usb4/4-1/4-1.2/4-1.2:1.0/0003:062A:4101.0003/input/input8
[    2.926241] PM: Image not found (code -22)
[    2.932327] hid-generic 0003:062A:4101.0003: input,hidraw2: USB HID v1.10 Keyboard [MOSART Semi. 2.4G Keyboard Mouse] on usb-0000:00:1d.0-1.2/input0
[    2.934793] input: MOSART Semi. 2.4G Keyboard Mouse as /devices/pci0000:00/0000:00:1d.0/usb4/4-1/4-1.2/4-1.2:1.1/0003:062A:4101.0004/input/input9
[    2.935145] input: MOSART Semi. 2.4G Keyboard Mouse Consumer Control as /devices/pci0000:00/0000:00:1d.0/usb4/4-1/4-1.2/4-1.2:1.1/0003:062A:4101.0004/input/input10
[    2.992102] input: MOSART Semi. 2.4G Keyboard Mouse System Control as /devices/pci0000:00/0000:00:1d.0/usb4/4-1/4-1.2/4-1.2:1.1/0003:062A:4101.0004/input/input11
[    2.992195] input: MOSART Semi. 2.4G Keyboard Mouse as /devices/pci0000:00/0000:00:1d.0/usb4/4-1/4-1.2/4-1.2:1.1/0003:062A:4101.0004/input/input12
[    2.992729] hid-generic 0003:062A:4101.0004: input,hiddev1,hidraw3: USB HID v1.10 Mouse [MOSART Semi. 2.4G Keyboard Mouse] on usb-0000:00:1d.0-1.2/input1
[    3.071942] usb 4-1.5: new full-speed USB device number 5 using ehci-pci
[    3.150985] reiser4: sda2: found disk format 4.0.2.
[    3.188798] usb 4-1.5: New USB device found, idVendor=8086, idProduct=0189, bcdDevice=69.19
[    3.188805] usb 4-1.5: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[   17.123459] random: crng init done
[   79.324998] reiser4: sda2: using Hybrid Transaction Model.
[   80.261792] systemd[1]: Inserted module 'autofs4'
[   80.325663] systemd[1]: systemd 241 running in system mode. (+PAM +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD -IDN2 +IDN -PCRE2 default-hierarchy=hybrid)
[   80.344293] systemd[1]: Detected architecture x86-64.
[   80.350660] systemd[1]: Set hostname to <huitzilopochtli>.
[   82.121171] systemd[1]: File /lib/systemd/system/systemd-journald.service:12 configures an IP firewall (IPAddressDeny=any), but the local system does not support BPF/cgroup based firewalling.
[   82.121181] systemd[1]: Proceeding WITHOUT firewalling in effect! (This warning is only shown for the first loaded unit using IP firewalling.)
[   82.367945] systemd[1]: /lib/systemd/system/minissdpd.service:10: PIDFile= references path below legacy directory /var/run/, updating /var/run/minissdpd.pid → /run/minissdpd.pid; please update the unit file accordingly.
[   82.426413] systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
[   82.426490] systemd[1]: Started Dispatch Password Requests to Console Directory Watch.
[   82.426852] systemd[1]: Created slice system-postfix.slice.
[   82.426973] systemd[1]: Listening on Journal Socket.
[   82.779157] reiser4[cached_setup_ke(328)]: reiser4_dirty_inode (/usr/tzinti/build/kernel/tekitl-5.1.linus/build2/linux/fs/reiser4/super_ops.c:181)[edward-2200]:
               WARNING: failed to make inode 65585 dirty (read-only FS)
[   82.803152] reiser4[(kmod)(331)]: reiser4_dirty_inode (/usr/tzinti/build/kernel/tekitl-5.1.linus/build2/linux/fs/reiser4/super_ops.c:181)[edward-2200]:
               WARNING: failed to make inode 65587 dirty (read-only FS)
[   82.952054] lp: driver loaded but no devices found
[   82.985876] ppdev: user-space parallel port driver
[   83.132686] systemd-journald[333]: Received request to flush runtime journal from PID 1
[   84.308153] input: HP Wireless hotkeys as /devices/virtual/input/input13
[   84.468257] hp_accel: laptop model unknown, using default axes configuration
[   84.470239] ACPI Warning: SystemIO range 0x0000000000000428-0x000000000000042F conflicts with OpRegion 0x0000000000000400-0x000000000000047F (\PMIO) (20181213/utaddress-213)
[   84.470251] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
[   84.470255] ACPI Warning: SystemIO range 0x0000000000000540-0x000000000000054F conflicts with OpRegion 0x0000000000000500-0x0000000000000563 (\GPIO) (20181213/utaddress-213)
[   84.470262] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
[   84.470263] ACPI Warning: SystemIO range 0x0000000000000530-0x000000000000053F conflicts with OpRegion 0x0000000000000500-0x0000000000000563 (\GPIO) (20181213/utaddress-213)
[   84.470269] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
[   84.470270] ACPI Warning: SystemIO range 0x0000000000000500-0x000000000000052F conflicts with OpRegion 0x0000000000000500-0x0000000000000563 (\GPIO) (20181213/utaddress-213)
[   84.470276] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
[   84.470277] lpc_ich: Resource conflict(s) found affecting gpio_ich
[   84.505874] lis3lv02d: 8 bits 3DC sensor found
[   84.543311] ACPI: AC Adapter [AC] (on-line)
[   84.635996] input: PC Speaker as /devices/platform/pcspkr/input/input14
[   84.777242] battery: ACPI: Battery Slot [BAT0] (battery present)
[   84.857488] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:01/PNP0C0D:00/input/input15
[   84.857543] ACPI: Lid Switch [LID]
[   84.857618] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input16
[   84.857663] ACPI: Power Button [PWRB]
[   84.857711] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input17
[   84.857750] ACPI: Power Button [PWRF]
[   84.865256] pci_bus 0000:01: Allocating resources
[   84.865278] pci_bus 0000:07: Allocating resources
[   84.865329] pci_bus 0000:0d: Allocating resources
[   84.865350] pci_bus 0000:13: Allocating resources
[   84.865415] pcieport 0000:00:1c.3: bridge window [io  0x1000-0x0fff] to [bus 13] add_size 1000
[   84.865419] pcieport 0000:00:1c.3: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 13] add_size 200000 add_align 100000
[   84.865428] pcieport 0000:00:1c.3: BAR 15: assigned [mem 0xafb00000-0xafcfffff 64bit pref]
[   84.865432] pcieport 0000:00:1c.3: BAR 13: assigned [io  0x6000-0x6fff]
[   84.869999] iTCO_vendor_support: vendor-support=0
[   84.872946] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[   84.873005] pci_bus 0000:01: Allocating resources
[   84.873028] pci_bus 0000:07: Allocating resources
[   84.873078] pci_bus 0000:0d: Allocating resources
[   84.873101] pci_bus 0000:13: Allocating resources
[   84.873305] cfg80211: Loaded X.509 cert 'Debian: Ben Hutchings: d3fb2ddbf08efa676d2f21994ceb4159e69dd8d5'
[   84.873595] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   84.932047] input: ST LIS3LV02DL Accelerometer as /devices/platform/lis3lv02d/input/input18
[   85.181950] hp_wmi: query 0xd returned error 0x5
[   85.182059] input: HP WMI hotkeys as /devices/virtual/input/input19
[   85.328806] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
[   85.328851] iTCO_wdt: Found a Cougar Point TCO device (Version=2, TCOBASE=0x0460)
[   85.329108] iTCO_wdt: initialized. heartbeat=30 sec (nowayout=0)
[   85.406086] RAPL PMU: API unit is 2^-32 Joules, 3 fixed counters, 163840 ms ovfl timer
[   85.406090] RAPL PMU: hw unit of domain pp0-core 2^-16 Joules
[   85.406092] RAPL PMU: hw unit of domain package 2^-16 Joules
[   85.406093] RAPL PMU: hw unit of domain pp1-gpu 2^-16 Joules
[   85.616771] sd 0:0:0:0: Attached scsi generic sg0 type 0
[   85.616865] sr 5:0:0:0: Attached scsi generic sg1 type 5
[   85.744915] Intel(R) Wireless WiFi driver for Linux
[   85.744916] Copyright(c) 2003- 2015 Intel Corporation
[   85.745122] iwlwifi 0000:07:00.0: can't disable ASPM; OS doesn't have ASPM control
[   85.758460] Bluetooth: Core ver 2.22
[   85.758472] NET: Registered protocol family 31
[   85.758472] Bluetooth: HCI device and connection manager initialized
[   85.758476] Bluetooth: HCI socket layer initialized
[   85.758478] Bluetooth: L2CAP socket layer initialized
[   85.758481] Bluetooth: SCO socket layer initialized
[   85.892575] iwlwifi 0000:07:00.0: firmware: direct-loading firmware iwlwifi-6000g2b-6.ucode
[   85.892695] iwlwifi 0000:07:00.0: loaded firmware version 18.168.6.1 op_mode iwldvm
[   86.123671] platform regulatory.0: firmware: direct-loading firmware regulatory.db
[   86.395237] usbcore: registered new interface driver btusb
[   86.417331] iwlwifi 0000:07:00.0: CONFIG_IWLWIFI_DEBUG disabled
[   86.417335] iwlwifi 0000:07:00.0: CONFIG_IWLWIFI_DEBUGFS disabled
[   86.417336] iwlwifi 0000:07:00.0: CONFIG_IWLWIFI_DEVICE_TRACING disabled
[   86.417339] iwlwifi 0000:07:00.0: Detected Intel(R) Centrino(R) Wireless-N 1030 BGN, REV=0xB0
[   86.447672] platform regulatory.0: firmware: direct-loading firmware regulatory.db.p7s
[   86.458661] ieee80211 phy0: Selected rate control algorithm 'iwl-agn-rs'
[   86.463069] iwlwifi 0000:07:00.0 wlo1: renamed from wlan0
[   86.637420] [drm] Replacing VGA console driver
[   86.637916] Console: switching to colour dummy device 80x25
[   86.637949] pmd_set_huge: Cannot satisfy [mem 0xb0000000-0xb0200000] with a huge-page mapping due to MTRR override.
[   86.638968] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   86.638969] [drm] Driver supports precise vblank timestamp query.
[   86.639555] i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=io+mem:owns=io+mem
[   86.669243] [drm] Initialized i915 1.6.0 20181204 for 0000:00:02.0 on minor 0
[   86.670821] ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
[   86.671714] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input20
[   86.671855] snd_hda_intel 0000:00:1b.0: Linked as a consumer to 0000:00:02.0
[   86.671952] snd_hda_intel 0000:00:1b.0: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
[   86.686686] fbcon: inteldrmfb (fb0) is primary device
[   87.422024] Console: switching to colour frame buffer device 170x48
[   87.443579] i915 0000:00:02.0: fb0: inteldrmfb frame buffer device
[   87.611378] intel_rapl: Found RAPL domain package
[   87.611379] intel_rapl: Found RAPL domain core
[   87.611380] intel_rapl: Found RAPL domain uncore
[   87.611384] intel_rapl: RAPL package 0 domain package locked by BIOS
[   87.686257] snd_hda_codec_idt hdaudioC0D0: autoconfig for 92HD81B1X5: line_outs=2 (0xf/0xd/0x0/0x0/0x0) type:speaker
[   87.686264] snd_hda_codec_idt hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[   87.686267] snd_hda_codec_idt hdaudioC0D0:    hp_outs=1 (0xb/0x0/0x0/0x0/0x0)
[   87.686270] snd_hda_codec_idt hdaudioC0D0:    mono: mono_out=0x0
[   87.686273] snd_hda_codec_idt hdaudioC0D0:    inputs:
[   87.686277] snd_hda_codec_idt hdaudioC0D0:      Internal Mic=0x11
[   87.686280] snd_hda_codec_idt hdaudioC0D0:      Mic=0xc
[   87.738504] Adding 9765884k swap on /dev/sda3.  Priority:-2 extents:1 across:9765884k FS
[   87.739017] input: HDA Digital PCBeep as /devices/pci0000:00/0000:00:1b.0/sound/card0/input21
[   87.739879] input: HDA Intel PCH Mic as /devices/pci0000:00/0000:00:1b.0/sound/card0/input22
[   87.740019] input: HDA Intel PCH Front Headphone as /devices/pci0000:00/0000:00:1b.0/sound/card0/input23
[   87.740090] input: HDA Intel PCH HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1b.0/sound/card0/input24
[   88.974017] EXT4-fs (sda1): mounting ext2 file system using the ext4 subsystem
[   88.997987] EXT4-fs (sda1): mounted filesystem without journal. Opts: (null)
[   89.378904] iwlwifi 0000:07:00.0: Radio type=0x2-0x2-0x1
[   89.486560] iwlwifi 0000:07:00.0: Radio type=0x2-0x2-0x1
[   89.732878] pci_bus 0000:01: Allocating resources
[   89.732917] pci_bus 0000:07: Allocating resources
[   89.732995] pci_bus 0000:0d: Allocating resources
[   89.733033] pci_bus 0000:13: Allocating resources
[   89.734485] pci_bus 0000:01: Allocating resources
[   89.734519] pci_bus 0000:07: Allocating resources
[   89.734593] pci_bus 0000:0d: Allocating resources
[   89.734632] pci_bus 0000:13: Allocating resources
[   90.617728] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   90.617730] Bluetooth: BNEP filters: protocol multicast
[   90.617735] Bluetooth: BNEP socket layer initialized
[   91.135372] r8169 0000:01:00.0: firmware: direct-loading firmware rtl_nic/rtl8168e-3.fw
[   91.135585] RTL8211E Gigabit Ethernet r8169-100:00: attached PHY driver [RTL8211E Gigabit Ethernet] (mii_bus:phy_addr=r8169-100:00, irq=IGNORE)
[   91.346511] r8169 0000:01:00.0 eno1: Link is Down
[   92.633837] NET: Registered protocol family 3
[   92.640012] NET: Registered protocol family 5
[   99.090895] iwlwifi 0000:07:00.0: Radio type=0x2-0x2-0x1
[   99.199605] iwlwifi 0000:07:00.0: Radio type=0x2-0x2-0x1
[   99.503473] RTL8211E Gigabit Ethernet r8169-100:00: attached PHY driver [RTL8211E Gigabit Ethernet] (mii_bus:phy_addr=r8169-100:00, irq=IGNORE)
[   99.710440] r8169 0000:01:00.0 eno1: Link is Down
[   99.940312] iwlwifi 0000:07:00.0: Radio type=0x2-0x2-0x1
[  100.038229] iwlwifi 0000:07:00.0: Radio type=0x2-0x2-0x1
[  102.691499] wlo1: authenticate with e0:22:03:71:5e:a5
[  102.697493] wlo1: send auth to e0:22:03:71:5e:a5 (try 1/3)
[  102.706702] wlo1: authenticated
[  102.707967] wlo1: associate with e0:22:03:71:5e:a5 (try 1/3)
[  102.711993] wlo1: RX AssocResp from e0:22:03:71:5e:a5 (capab=0x411 status=0 aid=3)
[  102.721567] wlo1: associated
[  102.805517] IPv6: ADDRCONF(NETDEV_CHANGE): wlo1: link becomes ready
[  316.959011] pci_bus 0000:01: Allocating resources
[  316.959036] pci_bus 0000:07: Allocating resources
[  316.959083] pci_bus 0000:0d: Allocating resources
[  316.959103] pci_bus 0000:13: Allocating resources
[  317.754474] fuse init (API version 7.28)
[  318.810834] Bluetooth: RFCOMM TTY layer initialized
[  318.810845] Bluetooth: RFCOMM socket layer initialized
[  318.810869] Bluetooth: RFCOMM ver 1.11
[ 4670.195522] perf: interrupt took too long (2504 > 2500), lowering kernel.perf_event_max_sample_rate to 79750
[ 6279.997051] perf: interrupt took too long (3149 > 3130), lowering kernel.perf_event_max_sample_rate to 63500
[ 7839.084248] perf: interrupt took too long (3943 > 3936), lowering kernel.perf_event_max_sample_rate to 50500
[ 9668.299429] INFO: task dpkg-deb:671 blocked for more than 120 seconds.
[ 9668.299441]       Not tainted 5.0.0-1+reiser4.0.2-amd64 #1 Debian 5.0.15-1+reiser4.0.2
[ 9668.299445] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 9668.299449] dpkg-deb        D    0   671    668 0x00000000
[ 9668.299455] Call Trace:
[ 9668.299475]  ? __schedule+0x3f5/0x880
[ 9668.299480]  ? __schedule+0x3fd/0x880
[ 9668.299487]  schedule+0x32/0x70
[ 9668.299495]  io_schedule+0x12/0x40
[ 9668.299501]  wait_on_page_bit+0x139/0x1f0
[ 9668.299507]  ? file_check_and_advance_wb_err+0xd0/0xd0
[ 9668.299558]  reiser4_wait_page_writeback+0x4e/0x80 [reiser4]
[ 9668.299597]  reiser4_uncapture_page+0xa0/0x190 [reiser4]
[ 9668.299643]  reiser4_invalidatepage+0xcd/0x1a0 [reiser4]
[ 9668.299650]  truncate_cleanup_page+0x6f/0xc0
[ 9668.299656]  truncate_inode_pages_range+0x220/0x8b0
[ 9668.299699]  reiser4_invalidate_pages+0x46/0x60 [reiser4]
[ 9668.299734]  kill_hook_extent+0x157/0x4a0 [reiser4]
[ 9668.299765]  ? create_hook_extent+0xd0/0xd0 [reiser4]
[ 9668.299798]  call_kill_hooks+0xa7/0xe0 [reiser4]
[ 9668.299829]  ? kill_units+0x80/0x80 [reiser4]
[ 9668.299856]  ? kill_head+0x20/0x20 [reiser4]
[ 9668.299882]  ? build_entry_key_seekable+0x80/0x80 [reiser4]
[ 9668.299912]  prepare_for_compact.isra.29+0x628/0x740 [reiser4]
[ 9668.299943]  ? lock_object+0x96/0x100 [reiser4]
[ 9668.299949]  ? _cond_resched+0x16/0x40
[ 9668.299971]  ? jload_gfp+0x73/0x1d0 [reiser4]
[ 9668.300002]  kill_node40+0x3d/0xe0 [reiser4]
[ 9668.300030]  carry_cut+0x54/0x90 [reiser4]
[ 9668.300058]  reiser4_carry+0x253/0x430 [reiser4]
[ 9668.300084]  ? reiser4_add_carry+0x24/0x40 [reiser4]
[ 9668.300113]  kill_node_content+0x143/0x210 [reiser4]
[ 9668.300140]  cut_tree_worker_common+0x207/0x3f0 [reiser4]
[ 9668.300168]  ? reiser4_delete_node+0x220/0x220 [reiser4]
[ 9668.300193]  reiser4_cut_tree_object+0xf2/0x200 [reiser4]
[ 9668.300237]  ? validate_extended_coord+0x70/0x70 [reiser4]
[ 9668.300271]  cut_file_items+0x11f/0x1c0 [reiser4]
[ 9668.300306]  shorten_file+0x31/0x320 [reiser4]
[ 9668.300338]  delete_object_unix_file+0x3a/0xa0 [reiser4]
[ 9668.300379]  reiser4_evict_inode+0x80/0xd0 [reiser4]
[ 9668.300387]  evict+0xc1/0x1c0
[ 9668.300392]  __dentry_kill+0xd3/0x180
[ 9668.300397]  dentry_kill+0x4d/0x1b0
[ 9668.300402]  dput+0xd7/0x130
[ 9668.300408]  __fput+0x105/0x220
[ 9668.300417]  task_work_run+0x8a/0xb0
[ 9668.300423]  exit_to_usermode_loop+0xe8/0xf0
[ 9668.300429]  do_syscall_64+0xfb/0x110
[ 9668.300435]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 9668.300441] RIP: 0033:0x7fa4a4d03f30
[ 9668.300453] Code: Bad RIP value.
[ 9668.300456] RSP: 002b:00007ffcaf5b3b68 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
[ 9668.300460] RAX: 0000000000000000 RBX: 00007ffcaf5b3c70 RCX: 00007fa4a4d03f30
[ 9668.300462] RDX: 00000000000169ec RSI: 0000000000000000 RDI: 000000000000000a
[ 9668.300465] RBP: 0000557138b59e90 R08: 0000557138b63e20 R09: 0000000000008010
[ 9668.300467] R10: 00000000000000a0 R11: 0000000000000246 R12: 000000000000000a
[ 9668.300470] R13: 0000557138b59ec0 R14: 000000005cf60c62 R15: 0000000000000012
[ 9668.300477] INFO: task dpkg-deb:675 blocked for more than 120 seconds.
[ 9668.300481]       Not tainted 5.0.0-1+reiser4.0.2-amd64 #1 Debian 5.0.15-1+reiser4.0.2
[ 9668.300484] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 9668.300488] dpkg-deb        D    0   675    670 0x00000000
[ 9668.300491] Call Trace:
[ 9668.300499]  ? __schedule+0x3f5/0x880
[ 9668.300506]  schedule+0x32/0x70
[ 9668.300535]  reiser4_go_to_sleep+0x5d/0x90 [reiser4]
[ 9668.300540]  ? remove_wait_queue+0x60/0x60
[ 9668.300566]  longterm_lock_znode+0x3d7/0x4f0 [reiser4]
[ 9668.300603]  traverse_tree+0x11a/0xa60 [reiser4]
[ 9668.300634]  ? append_last_extent+0x183/0x1e0 [reiser4]
[ 9668.300668]  ? find_file_item+0x119/0x160 [reiser4]
[ 9668.300704]  ? reiser4_seal_init+0x2f/0x60 [reiser4]
[ 9668.300734]  ? cbk_cache_search+0x6c/0x2e0 [reiser4]
[ 9668.300763]  reiser4_object_lookup+0x151/0x160 [reiser4]
[ 9668.300797]  reiser4_cut_tree_object+0x7f/0x200 [reiser4]
[ 9668.300802]  ? inode_get_bytes+0x19/0x40
[ 9668.300829]  ? longterm_unlock_znode+0xbf/0x2a0 [reiser4]
[ 9668.300865]  ? update_sd+0x116/0x480 [reiser4]
[ 9668.300898]  ? reiser4_grab+0x48/0xc0 [reiser4]
[ 9668.300928]  ? reiser4_grab_space+0x3c/0x80 [reiser4]
[ 9668.300963]  ? validate_extended_coord+0x70/0x70 [reiser4]
[ 9668.300993]  cut_file_items+0x11f/0x1c0 [reiser4]
[ 9668.301026]  shorten_file+0x31/0x320 [reiser4]
[ 9668.301057]  delete_object_unix_file+0x3a/0xa0 [reiser4]
[ 9668.301096]  reiser4_evict_inode+0x80/0xd0 [reiser4]
[ 9668.301102]  evict+0xc1/0x1c0
[ 9668.301106]  __dentry_kill+0xd3/0x180
[ 9668.301111]  dentry_kill+0x4d/0x1b0
[ 9668.301116]  dput+0xd7/0x130
[ 9668.301121]  __fput+0x105/0x220
[ 9668.301128]  task_work_run+0x8a/0xb0
[ 9668.301133]  exit_to_usermode_loop+0xe8/0xf0
[ 9668.301139]  do_syscall_64+0xfb/0x110
[ 9668.301144]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 9668.301147] RIP: 0033:0x7f1280c0af30
[ 9668.301153] Code: Bad RIP value.
[ 9668.301155] RSP: 002b:00007ffddef35f08 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
[ 9668.301159] RAX: 0000000000000000 RBX: 00007ffddef36010 RCX: 00007f1280c0af30
[ 9668.301161] RDX: 0000000000034acc RSI: 0000000000000000 RDI: 000000000000000a
[ 9668.301163] RBP: 000055c64afa4e90 R08: 000055c64afaf0b0 R09: 0000000000008010
[ 9668.301166] R10: 00000000000000a0 R11: 0000000000000246 R12: 000000000000000a
[ 9668.301168] R13: 000055c64afa3770 R14: 000000005cf60c62 R15: 0000000000000013
[ 9668.301173] INFO: task dpkg-deb:676 blocked for more than 120 seconds.
[ 9668.301177]       Not tainted 5.0.0-1+reiser4.0.2-amd64 #1 Debian 5.0.15-1+reiser4.0.2
[ 9668.301180] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 9668.301183] dpkg-deb        D    0   676    674 0x00000000
[ 9668.301187] Call Trace:
[ 9668.301196]  ? __schedule+0x3f5/0x880
[ 9668.301203]  schedule+0x32/0x70
[ 9668.301231]  reiser4_go_to_sleep+0x5d/0x90 [reiser4]
[ 9668.301235]  ? remove_wait_queue+0x60/0x60
[ 9668.301261]  longterm_lock_znode+0x3d7/0x4f0 [reiser4]
[ 9668.301296]  traverse_tree+0x1fb/0xa60 [reiser4]
[ 9668.301326]  ? cbk_cache_search+0x6c/0x2e0 [reiser4]
[ 9668.301354]  reiser4_object_lookup+0x151/0x160 [reiser4]
[ 9668.301387]  reiser4_cut_tree_object+0x7f/0x200 [reiser4]
[ 9668.301426]  ? update_sd+0x116/0x480 [reiser4]
[ 9668.301463]  ? reiser4_grab+0x48/0xc0 [reiser4]
[ 9668.301493]  ? reiser4_grab_space+0x3c/0x80 [reiser4]
[ 9668.301528]  ? validate_extended_coord+0x70/0x70 [reiser4]
[ 9668.301560]  cut_file_items+0x11f/0x1c0 [reiser4]
[ 9668.301594]  shorten_file+0x31/0x320 [reiser4]
[ 9668.301625]  delete_object_unix_file+0x3a/0xa0 [reiser4]
[ 9668.301663]  reiser4_evict_inode+0x80/0xd0 [reiser4]
[ 9668.301669]  evict+0xc1/0x1c0
[ 9668.301674]  __dentry_kill+0xd3/0x180
[ 9668.301679]  dentry_kill+0x4d/0x1b0
[ 9668.301683]  dput+0xd7/0x130
[ 9668.301688]  __fput+0x105/0x220
[ 9668.301695]  task_work_run+0x8a/0xb0
[ 9668.301701]  exit_to_usermode_loop+0xe8/0xf0
[ 9668.301706]  do_syscall_64+0xfb/0x110
[ 9668.301711]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 9668.301715] RIP: 0033:0x7f4388698f30
[ 9668.301720] Code: Bad RIP value.
[ 9668.301722] RSP: 002b:00007ffd17b90d78 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
[ 9668.301726] RAX: 0000000000000000 RBX: 00007ffd17b90e80 RCX: 00007f4388698f30
[ 9668.301728] RDX: 000000000001dc20 RSI: 0000000000000000 RDI: 000000000000000a
[ 9668.301730] RBP: 000055f67694f740 R08: 000055f67695b0a0 R09: 0000000000008010
[ 9668.301733] R10: 00000000000000a0 R11: 0000000000000246 R12: 000000000000000a
[ 9668.301735] R13: 000055f67694f1f0 R14: 000000005cf60c62 R15: 0000000000000015
[ 9668.301741] INFO: task dpkg-deb:707 blocked for more than 120 seconds.
[ 9668.301745]       Not tainted 5.0.0-1+reiser4.0.2-amd64 #1 Debian 5.0.15-1+reiser4.0.2
[ 9668.301748] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 9668.301751] dpkg-deb        D    0   707    666 0x00000000
[ 9668.301755] Call Trace:
[ 9668.301762]  ? __schedule+0x3f5/0x880
[ 9668.301769]  schedule+0x32/0x70
[ 9668.301774]  io_schedule+0x12/0x40
[ 9668.301779]  __lock_page+0x138/0x1f0
[ 9668.301784]  ? file_check_and_advance_wb_err+0xd0/0xd0
[ 9668.301817]  write_jnodes_to_disk_extent+0x37c/0x560 [reiser4]
[ 9668.301823]  ? vunmap_page_range+0x20f/0x330
[ 9668.301852]  write_jnode_list+0x7f/0xb0 [reiser4]
[ 9668.301887]  reiser4_write_fq+0x81/0x230 [reiser4]
[ 9668.301917]  ? flush_current_atom+0x397/0x8a0 [reiser4]
[ 9668.301944]  flush_current_atom+0x3bd/0x8a0 [reiser4]
[ 9668.301978]  commit_txnh+0x4a5/0x590 [reiser4]
[ 9668.302009]  ? reiser4_txn_restart+0x1e/0x80 [reiser4]
[ 9668.302036]  ? force_commit_atom+0x4f/0x60 [reiser4]
[ 9668.302071]  ? reiser4_sync_page+0x48/0x90 [reiser4]
[ 9668.302105]  ? reiser4_write_dispatch+0x11f/0x510 [reiser4]
[ 9668.302110]  ? __handle_mm_fault+0xb89/0x1200
[ 9668.302116]  ? common_file_perm+0x4e/0x110
[ 9668.302122]  ? vfs_write+0xb0/0x190
[ 9668.302126]  ? ksys_write+0x5a/0xd0
[ 9668.302132]  ? do_syscall_64+0x55/0x110
[ 9668.302137]  ? entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 9668.302143] INFO: task dpkg-deb:713 blocked for more than 120 seconds.
[ 9668.302147]       Not tainted 5.0.0-1+reiser4.0.2-amd64 #1 Debian 5.0.15-1+reiser4.0.2
[ 9668.302150] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
[ 9668.302153] dpkg-deb        D    0   713    667 0x00000000
[ 9668.302156] Call Trace:
[ 9668.302163]  ? __schedule+0x3f5/0x880
[ 9668.302170]  schedule+0x32/0x70
[ 9668.302200]  reiser4_go_to_sleep+0x5d/0x90 [reiser4]
[ 9668.302205]  ? remove_wait_queue+0x60/0x60
[ 9668.302232]  longterm_lock_znode+0x3d7/0x4f0 [reiser4]
[ 9668.302264]  traverse_tree+0x1fb/0xa60 [reiser4]
[ 9668.302293]  ? cbk_cache_search+0xc6/0x2e0 [reiser4]
[ 9668.302319]  coord_by_key+0xdd/0xf0 [reiser4]
[ 9668.302359]  find_cluster_item.constprop.71+0x2dd/0x430 [reiser4]
[ 9668.302366]  ? __add_to_page_cache_locked+0x18f/0x360
[ 9668.302372]  ? _cond_resched+0x16/0x40
[ 9668.302408]  ? key_by_inode_and_offset_common+0x1a/0x70 [reiser4]
[ 9668.302443]  get_disk_cluster_locked+0x9c/0xb0 [reiser4]
[ 9668.302474]  ctail_insert_unprepped_cluster+0x2d/0x130 [reiser4]
[ 9668.302507]  ? grab_page_cluster.part.68+0x55/0x1e0 [reiser4]
[ 9668.302540]  ? reiser4_grab+0x48/0xc0 [reiser4]
[ 9668.302575]  prepare_logical_cluster+0x273/0x8a0 [reiser4]
[ 9668.302609]  ? set_window_and_cluster+0x9f/0x140 [reiser4]
[ 9668.302640]  do_write_cryptcompress+0x37b/0x6a0 [reiser4]
[ 9668.302674]  write_cryptcompress+0x6d/0xb0 [reiser4]
[ 9668.302705]  reiser4_write_dispatch+0xf8/0x510 [reiser4]
[ 9668.302711]  ? common_file_perm+0x4e/0x110
[ 9668.302717]  vfs_write+0xb0/0x190
[ 9668.302722]  ksys_write+0x5a/0xd0
[ 9668.302728]  do_syscall_64+0x55/0x110
[ 9668.302733]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 9668.302736] RIP: 0033:0x7fde8593898d
[ 9668.302741] Code: Bad RIP value.
[ 9668.302744] RSP: 002b:00007ffe930bc510 EFLAGS: 00000293 ORIG_RAX: 0000000000000001
[ 9668.302747] RAX: ffffffffffffffda RBX: 00007ffe930be650 RCX: 00007fde8593898d
[ 9668.302750] RDX: 0000000000001000 RSI: 00007ffe930bd600 RDI: 000000000000000a
[ 9668.302752] RBP: 0000000000001000 R08: 0000000000000000 R09: 00007ffe930bd630
[ 9668.302755] R10: 0000000000000000 R11: 0000000000000293 R12: 0000000000000000
[ 9668.302757] R13: 00007ffe930bd600 R14: 000000000000000a R15: 00007ffe930bd600
[ 9729.465989] reiser4: sda4: found disk format 4.0.2.
[ 9762.177388] reiser4: sda4: using Hybrid Transaction Model.
