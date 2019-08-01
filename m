Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B3127DC67
	for <lists+reiserfs-devel@lfdr.de>; Thu,  1 Aug 2019 15:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728783AbfHANTK (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 1 Aug 2019 09:19:10 -0400
Received: from mail7.static.mailgun.info ([104.130.122.7]:25012 "EHLO
        mail7.static.mailgun.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728592AbfHANTK (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 1 Aug 2019 09:19:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1564665545; h=From: Date: Message-Id: To: Subject: Sender;
 bh=XW8Tkgv0uul/2HsIXq0e3PaDFejGmlglO+dpelwkooM=; b=D0T+b7wpSuzyL9vi5iGJVJ1jT3US3V65sgL3WCPxjME60RoOWa4QJNEKZbXKqX4uCz3r/f0C
 apY2uPLWVyBp04f8Suvutaw98hOQeMIySTQs0K2xh47PMh9Uy2LcOS7qwULYPS6V+Dm+ghvn
 H3BVvz9Ia1K/pnog+OGfkUXoT6M=
X-Mailgun-Sending-Ip: 104.130.122.7
X-Mailgun-Sid: WyIxM2M2YSIsICJyZWlzZXJmcy1kZXZlbEB2Z2VyLmtlcm5lbC5vcmciLCAiMTdiNTQiXQ==
Received: from huitzilopochtli.metztli-it.com (99-130-254-3.lightspeed.sntcca.sbcglobal.net [99.130.254.3])
 by mxa.mailgun.org with ESMTP id 5d42e6c7.7f02b3f6bc48-smtp-out-n03;
 Thu, 01 Aug 2019 13:19:03 -0000 (UTC)
Received: by huitzilopochtli.metztli-it.com (Postfix, from userid 1000)
        id 204EE40E5EB3; Thu,  1 Aug 2019 06:19:01 -0700 (PDT)
Subject: Reiser4 -enabled Linux kernels 5.0.xy do not hang in HP ProLiant Epyc -based bare hardware unit.
To:     <edward.shishkin@gmail.com>, <reiserfs-devel@vger.kernel.org>
X-Mailer: mail (GNU Mailutils 3.5)
Message-Id: <20190801131902.204EE40E5EB3@huitzilopochtli.metztli-it.com>
Date:   Thu,  1 Aug 2019 06:19:01 -0700 (PDT)
From:   Metztli Information Technology <jose.r.r@metztli.com>
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Nilze Ed-

As you may already know, I hacked a Debian 10 Buster recent netboot with a reiser4 for Linux 5.0.0 -patched kernel targeting AMD Ryzen/Epyc processors.

I am happy to report that unlike issues experienced in my aging development Intel CPU netbook hardware (see previous email, i.e.,
< https://www.spinics.net/lists/reiserfs-devel/msg05919.html >)

the remote target HP ProLiant DL325 Gen10 AMD EPYC 7351P 16-Core Processor, 2 threads per core / 64GB RAM, beast *does not* hang during kernel developments. Matter of fact, I recently I have built a couple of reiser4 -hacked 'Debianized' kernel 5.0.21-1 component sets in that Epyc beast.

Accordingly, I am beginning to suspect that software workarounds for Intel Spectre / Meltdown -bugged CPUs may be factors in reiser4 hang issues;
 for instance, HP conveys in following fragment:

"We aren’t for slowing down…
To add some further icing to the cake then the AMD EPYC™ platform also offers significant performance benefits when the mitigations for the aforementioned Meltdown and Foreshadow threats are applied, namely AMD does not currently believe to be affected by them. The default Linux kernel security mitigations for these threats degrade other x86 processors’ performance but leave the AMD EPYC™ processor running at close to 100% of its normal processing speed, with no real performance penalty."
< https://community.hpe.com/t5/Alliances/Advanced-Security-of-HPE-Servers-with-AMD-EPYC-processors/ba-p/7039600 >

< https://metztli.blog/index.php/amatl/aP1 > (short link)
< https://metztli.blog/index.php/amatl/reiser-nahui/metztli-reiser4-on-hp-proliant >

While Epyc beast was still running reiser4 -enabled linux 5.0.15-1 --after I had built my first kernel-- I executed a demesg (printed below):

P.S. I am thinking in suffixing reiser4 -enabled kernels targeted at AMD Ryzen/Epyc, as '+reizer4.0.2' (for current SFRN 4.0.2),
 to differentiate them visually from their Intel counterparts. That's how I have labeled my custom Metztli Debian-Installers (d-i).
 Hope you do not mind, Mr. Shishkin.

[    0.000000] Linux version 5.0.0-1+reiser4.0.2-amd64 (debian-kernel@lists.debian.org) (gcc version 8.3.0 (Debian 8.3.0-6)) #1 SMP Debian 5.0.15-1+reiser4.0.2 (2019-07-12)
[    0.000000] Command line: BOOT_IMAGE=/vmlinuz-5.0.0-1+reiser4.0.2-amd64 root=/dev/nvme0n1p5 ro quiet
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'compacted' format.
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000064f4ffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000064f50000-0x0000000064f52fff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000064f53000-0x0000000065478fff] usable
[    0.000000] BIOS-e820: [mem 0x0000000065479000-0x0000000065489fff] ACPI data
[    0.000000] BIOS-e820: [mem 0x000000006548a000-0x00000000654a1fff] usable
[    0.000000] BIOS-e820: [mem 0x00000000654a2000-0x00000000654a5fff] ACPI data
[    0.000000] BIOS-e820: [mem 0x00000000654a6000-0x00000000654eefff] usable
[    0.000000] BIOS-e820: [mem 0x00000000654ef000-0x00000000654f1fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000654f2000-0x0000000065509fff] usable
[    0.000000] BIOS-e820: [mem 0x000000006550a000-0x000000006550afff] reserved
[    0.000000] BIOS-e820: [mem 0x000000006550b000-0x000000006df6efff] usable
[    0.000000] BIOS-e820: [mem 0x000000006df6f000-0x000000006e796fff] reserved
[    0.000000] BIOS-e820: [mem 0x000000006e797000-0x000000006e797fff] usable
[    0.000000] BIOS-e820: [mem 0x000000006e798000-0x000000006e79cfff] reserved
[    0.000000] BIOS-e820: [mem 0x000000006e79d000-0x000000006e79dfff] usable
[    0.000000] BIOS-e820: [mem 0x000000006e79e000-0x000000006edcefff] reserved
[    0.000000] BIOS-e820: [mem 0x000000006edcf000-0x0000000076ecefff] usable
[    0.000000] BIOS-e820: [mem 0x0000000076ecf000-0x0000000076fcefff] type 20
[    0.000000] BIOS-e820: [mem 0x0000000076fcf000-0x0000000077fdefff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000077fdf000-0x0000000077feefff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x0000000077fef000-0x0000000077ffefff] ACPI data
[    0.000000] BIOS-e820: [mem 0x0000000077fff000-0x0000000077ffffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000078000000-0x000000008fffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed80000-0x00000000fed80fff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000107f1fffff] usable
[    0.000000] BIOS-e820: [mem 0x000000107f200000-0x000000107fffffff] reserved
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] efi: EFI v2.60 by HPE
[    0.000000] efi:  SMBIOS=0x6e7a0000  SMBIOS 3.0=0x6e79e000  ACPI=0x77ffe000  ACPI 2.0=0x77ffe014  MEMATTR=0x7154b018 
[    0.000000] secureboot: Secure boot could not be determined (mode 0)
[    0.000000] SMBIOS 3.1.1 present.
[    0.000000] DMI: HPE ProLiant DL325 Gen10/ProLiant DL325 Gen10, BIOS A41 06/07/2018
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 2395.439 MHz processor
[    0.004957] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.004959] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.004969] last_pfn = 0x107f200 max_arch_pfn = 0x400000000
[    0.004974] MTRR default type: uncachable
[    0.004974] MTRR fixed ranges enabled:
[    0.004976]   00000-9FFFF write-back
[    0.004977]   A0000-FFFFF uncachable
[    0.004978] MTRR variable ranges enabled:
[    0.004979]   0 base 000000000000 mask FFFF80000000 write-back
[    0.004981]   1 base 0000E4000000 mask FFFFFC000000 write-protect
[    0.004982]   2 base 000078000000 mask FFFFF8000000 uncachable
[    0.004983]   3 disabled
[    0.004983]   4 disabled
[    0.004984]   5 disabled
[    0.004984]   6 disabled
[    0.004985]   7 base 0000FF000000 mask FFFFFF000000 write-protect
[    0.004986] TOM2: 0000001080000000 aka 67584M
[    0.005621] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.005741] last_pfn = 0x78000 max_arch_pfn = 0x400000000
[    0.011165] Using GB pages for direct mapping
[    0.011168] BRK [0xa5e601000, 0xa5e601fff] PGTABLE
[    0.011170] BRK [0xa5e602000, 0xa5e602fff] PGTABLE
[    0.011171] BRK [0xa5e603000, 0xa5e603fff] PGTABLE
[    0.011203] BRK [0xa5e604000, 0xa5e604fff] PGTABLE
[    0.011205] BRK [0xa5e605000, 0xa5e605fff] PGTABLE
[    0.011305] BRK [0xa5e606000, 0xa5e606fff] PGTABLE
[    0.011340] BRK [0xa5e607000, 0xa5e607fff] PGTABLE
[    0.011432] BRK [0xa5e608000, 0xa5e608fff] PGTABLE
[    0.011645] BRK [0xa5e609000, 0xa5e609fff] PGTABLE
[    0.011689] BRK [0xa5e60a000, 0xa5e60afff] PGTABLE
[    0.011762] BRK [0xa5e60b000, 0xa5e60bfff] PGTABLE
[    0.011814] BRK [0xa5e60c000, 0xa5e60cfff] PGTABLE
[    0.011919] RAMDISK: [mem 0x37249000-0x3791bfff]
[    0.011927] ACPI: Early table checksum verification disabled
[    0.011932] ACPI: RSDP 0x0000000077FFE014 000024 (v02 HPE   )
[    0.011935] ACPI: XSDT 0x0000000065482188 0000F4 (v01 HPE    Server   00000001      01000013)
[    0.011941] ACPI: FACP 0x00000000654A2000 00010C (v06 HPE    Server   00000001 1590 00000001)
[    0.011947] ACPI: DSDT 0x000000006547E000 002B10 (v02 HPE    Server   00000002 HPAG 00020000)
[    0.011950] ACPI: FACS 0x0000000077FDF000 000040
[    0.011952] ACPI: SSDT 0x0000000077FFC000 0000D2 (v02 HPE    AMD ALIB 00000002 MSFT 04000000)
[    0.011954] ACPI: SSDT 0x0000000077FF7000 0046A4 (v01 HPE    AMD CPU  00000001 AMD  00000001)
[    0.011957] ACPI: SRAT 0x0000000077FF6000 0002D0 (v03 HPE    Server   00000001 AMD  00000001)
[    0.011960] ACPI: SLIT 0x0000000077FF5000 00003C (v01 HPE    Server   00000001 AMD  00000001)
[    0.011962] ACPI: CRAT 0x0000000077FF3000 001F70 (v01 HPE    Server   00000001 AMD  00000001)
[    0.011965] ACPI: CDIT 0x0000000077FF2000 000038 (v01 HPE    Server   00000001 AMD  00000001)
[    0.011967] ACPI: UEFI 0x0000000077FE4000 000042 (v01 HPE    Server   00000002      01000013)
[    0.011969] ACPI: HEST 0x0000000077FF1000 0000E8 (v01 HPE    Server   00000001 1590 00000001)
[    0.011972] ACPI: BERT 0x0000000077FF0000 000030 (v01 HPE    Server   00000001 1590 00000001)
[    0.011974] ACPI: ERST 0x0000000077FEF000 000250 (v01 HPE    Server   00000001 1590 00000001)
[    0.011976] ACPI: EINJ 0x00000000654A5000 000150 (v01 HPE    Server   00000001 1590 00000001)
[    0.011979] ACPI: FPDT 0x00000000654A4000 000034 (v01 HPE    Server   00000002      01000013)
[    0.011981] ACPI: BGRT 0x00000000654A3000 000038 (v01 HPE    Server   00000002 1590 01000013)
[    0.011983] ACPI: HPET 0x0000000065489000 000038 (v01 HPE    Server   00000001 1590 00000001)
[    0.011986] ACPI: APIC 0x0000000065488000 00023C (v03 HPE    Server   00000001 1590 00000001)
[    0.011988] ACPI: MCFG 0x0000000065487000 00003C (v01 HPE    Server   00000001 1590 00000001)
[    0.011990] ACPI: SPMI 0x0000000065486000 000041 (v05 HPE    Server   00000001 1590 00000001)
[    0.011993] ACPI: RASF 0x0000000065485000 000030 (v01 HPE    Server   00000001 1590 00000001)
[    0.011995] ACPI: SPCR 0x0000000065484000 000050 (v02 HPE    Server   00000001 1590 00000001)
[    0.011998] ACPI: MSCT 0x0000000065483000 000090 (v02 HPE    Server   00000001 1590 00000001)
[    0.012000] ACPI: WSMT 0x0000000077FFD000 000028 (v01 HPE    Server   00000001 1590 00000001)
[    0.012002] ACPI: PCCT 0x0000000065481000 000030 (v01 HPE    Server   00000001 1590 00000001)
[    0.012004] ACPI: SSDT 0x000000006547B000 002D77 (v02 HPE    PCISSDT  00000002 HPAG 00020000)
[    0.012007] ACPI: SSDT 0x000000006547A000 0001CB (v02 HPE    TIMESSDT 00000002 HPAG 00020000)
[    0.012009] ACPI: SSDT 0x0000000065479000 0002F2 (v01 HPE    pmab     00000001 INTL 20140828)
[    0.012017] ACPI: Local APIC address 0xfee00000
[    0.012057] SRAT: PXM 0 -> APIC 0x00 -> Node 0
[    0.012058] SRAT: PXM 0 -> APIC 0x01 -> Node 0
[    0.012059] SRAT: PXM 0 -> APIC 0x02 -> Node 0
[    0.012059] SRAT: PXM 0 -> APIC 0x03 -> Node 0
[    0.012060] SRAT: PXM 0 -> APIC 0x08 -> Node 0
[    0.012060] SRAT: PXM 0 -> APIC 0x09 -> Node 0
[    0.012061] SRAT: PXM 0 -> APIC 0x0a -> Node 0
[    0.012061] SRAT: PXM 0 -> APIC 0x0b -> Node 0
[    0.012062] SRAT: PXM 1 -> APIC 0x10 -> Node 1
[    0.012063] SRAT: PXM 1 -> APIC 0x11 -> Node 1
[    0.012063] SRAT: PXM 1 -> APIC 0x12 -> Node 1
[    0.012064] SRAT: PXM 1 -> APIC 0x13 -> Node 1
[    0.012064] SRAT: PXM 1 -> APIC 0x18 -> Node 1
[    0.012065] SRAT: PXM 1 -> APIC 0x19 -> Node 1
[    0.012066] SRAT: PXM 1 -> APIC 0x1a -> Node 1
[    0.012066] SRAT: PXM 1 -> APIC 0x1b -> Node 1
[    0.012067] SRAT: PXM 2 -> APIC 0x20 -> Node 2
[    0.012067] SRAT: PXM 2 -> APIC 0x21 -> Node 2
[    0.012068] SRAT: PXM 2 -> APIC 0x22 -> Node 2
[    0.012068] SRAT: PXM 2 -> APIC 0x23 -> Node 2
[    0.012069] SRAT: PXM 2 -> APIC 0x28 -> Node 2
[    0.012069] SRAT: PXM 2 -> APIC 0x29 -> Node 2
[    0.012070] SRAT: PXM 2 -> APIC 0x2a -> Node 2
[    0.012071] SRAT: PXM 2 -> APIC 0x2b -> Node 2
[    0.012071] SRAT: PXM 3 -> APIC 0x30 -> Node 3
[    0.012072] SRAT: PXM 3 -> APIC 0x31 -> Node 3
[    0.012072] SRAT: PXM 3 -> APIC 0x32 -> Node 3
[    0.012073] SRAT: PXM 3 -> APIC 0x33 -> Node 3
[    0.012073] SRAT: PXM 3 -> APIC 0x38 -> Node 3
[    0.012074] SRAT: PXM 3 -> APIC 0x39 -> Node 3
[    0.012074] SRAT: PXM 3 -> APIC 0x3a -> Node 3
[    0.012075] SRAT: PXM 3 -> APIC 0x3b -> Node 3
[    0.012077] ACPI: SRAT: Node 0 PXM 0 [mem 0x00000000-0x0009ffff]
[    0.012078] ACPI: SRAT: Node 0 PXM 0 [mem 0x00100000-0x7fffffff]
[    0.012079] ACPI: SRAT: Node 0 PXM 0 [mem 0x100000000-0x87fffffff]
[    0.012080] ACPI: SRAT: Node 2 PXM 2 [mem 0x880000000-0x107fffffff]
[    0.012083] NUMA: Initialized distance table, cnt=4
[    0.012086] NUMA: Node 0 [mem 0x00000000-0x0009ffff] + [mem 0x00100000-0x7fffffff] -> [mem 0x00000000-0x7fffffff]
[    0.012087] NUMA: Node 0 [mem 0x00000000-0x7fffffff] + [mem 0x100000000-0x87fffffff] -> [mem 0x00000000-0x87fffffff]
[    0.012093] NODE_DATA(0) allocated [mem 0x87fffb000-0x87fffffff]
[    0.012096] NODE_DATA(2) allocated [mem 0x107f1f9000-0x107f1fdfff]
[    0.012173] Zone ranges:
[    0.012173]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.012175]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.012176]   Normal   [mem 0x0000000100000000-0x000000107f1fffff]
[    0.012177]   Device   empty
[    0.012178] Movable zone start for each node
[    0.012178] Early memory node ranges
[    0.012179]   node   0: [mem 0x0000000000001000-0x000000000009ffff]
[    0.012180]   node   0: [mem 0x0000000000100000-0x0000000064f4ffff]
[    0.012181]   node   0: [mem 0x0000000064f53000-0x0000000065478fff]
[    0.012181]   node   0: [mem 0x000000006548a000-0x00000000654a1fff]
[    0.012182]   node   0: [mem 0x00000000654a6000-0x00000000654eefff]
[    0.012182]   node   0: [mem 0x00000000654f2000-0x0000000065509fff]
[    0.012183]   node   0: [mem 0x000000006550b000-0x000000006df6efff]
[    0.012183]   node   0: [mem 0x000000006e797000-0x000000006e797fff]
[    0.012184]   node   0: [mem 0x000000006e79d000-0x000000006e79dfff]
[    0.012184]   node   0: [mem 0x000000006edcf000-0x0000000076ecefff]
[    0.012185]   node   0: [mem 0x0000000077fff000-0x0000000077ffffff]
[    0.012185]   node   0: [mem 0x0000000100000000-0x000000087fffffff]
[    0.012186]   node   2: [mem 0x0000000880000000-0x000000107f1fffff]
[    0.012336] Zeroed struct page in unavailable ranges: 8203 pages
[    0.012338] Initmem setup node 0 [mem 0x0000000000001000-0x000000087fffffff]
[    0.012340] On node 0 totalpages: 8347637
[    0.012341]   DMA zone: 64 pages used for memmap
[    0.012342]   DMA zone: 25 pages reserved
[    0.012343]   DMA zone: 3999 pages, LIFO batch:0
[    0.012451]   DMA32 zone: 7490 pages used for memmap
[    0.012452]   DMA32 zone: 479318 pages, LIFO batch:63
[    0.026807]   Normal zone: 122880 pages used for memmap
[    0.026809]   Normal zone: 7864320 pages, LIFO batch:63
[    0.227413] Initmem setup node 2 [mem 0x0000000880000000-0x000000107f1fffff]
[    0.227417] On node 2 totalpages: 8385024
[    0.227419]   Normal zone: 131016 pages used for memmap
[    0.227419]   Normal zone: 8385024 pages, LIFO batch:63
[    0.442462] ACPI: PM-Timer IO Port: 0x408
[    0.442465] ACPI: Local APIC address 0xfee00000
[    0.442476] ACPI: LAPIC_NMI (acpi_id[0x00] high level lint[0x1])
[    0.442477] ACPI: LAPIC_NMI (acpi_id[0x01] high level lint[0x1])
[    0.442478] ACPI: LAPIC_NMI (acpi_id[0x02] high level lint[0x1])
[    0.442479] ACPI: LAPIC_NMI (acpi_id[0x03] high level lint[0x1])
[    0.442479] ACPI: LAPIC_NMI (acpi_id[0x08] high level lint[0x1])
[    0.442480] ACPI: LAPIC_NMI (acpi_id[0x09] high level lint[0x1])
[    0.442480] ACPI: LAPIC_NMI (acpi_id[0x0a] high level lint[0x1])
[    0.442481] ACPI: LAPIC_NMI (acpi_id[0x0b] high level lint[0x1])
[    0.442482] ACPI: LAPIC_NMI (acpi_id[0x10] high level lint[0x1])
[    0.442482] ACPI: LAPIC_NMI (acpi_id[0x11] high level lint[0x1])
[    0.442483] ACPI: LAPIC_NMI (acpi_id[0x12] high level lint[0x1])
[    0.442483] ACPI: LAPIC_NMI (acpi_id[0x13] high level lint[0x1])
[    0.442484] ACPI: LAPIC_NMI (acpi_id[0x18] high level lint[0x1])
[    0.442484] ACPI: LAPIC_NMI (acpi_id[0x19] high level lint[0x1])
[    0.442485] ACPI: LAPIC_NMI (acpi_id[0x1a] high level lint[0x1])
[    0.442486] ACPI: LAPIC_NMI (acpi_id[0x1b] high level lint[0x1])
[    0.442486] ACPI: LAPIC_NMI (acpi_id[0x20] high level lint[0x1])
[    0.442487] ACPI: LAPIC_NMI (acpi_id[0x21] high level lint[0x1])
[    0.442487] ACPI: LAPIC_NMI (acpi_id[0x22] high level lint[0x1])
[    0.442488] ACPI: LAPIC_NMI (acpi_id[0x23] high level lint[0x1])
[    0.442488] ACPI: LAPIC_NMI (acpi_id[0x28] high level lint[0x1])
[    0.442489] ACPI: LAPIC_NMI (acpi_id[0x29] high level lint[0x1])
[    0.442489] ACPI: LAPIC_NMI (acpi_id[0x2a] high level lint[0x1])
[    0.442490] ACPI: LAPIC_NMI (acpi_id[0x2b] high level lint[0x1])
[    0.442491] ACPI: LAPIC_NMI (acpi_id[0x30] high level lint[0x1])
[    0.442491] ACPI: LAPIC_NMI (acpi_id[0x31] high level lint[0x1])
[    0.442492] ACPI: LAPIC_NMI (acpi_id[0x32] high level lint[0x1])
[    0.442492] ACPI: LAPIC_NMI (acpi_id[0x33] high level lint[0x1])
[    0.442493] ACPI: LAPIC_NMI (acpi_id[0x38] high level lint[0x1])
[    0.442493] ACPI: LAPIC_NMI (acpi_id[0x39] high level lint[0x1])
[    0.442494] ACPI: LAPIC_NMI (acpi_id[0x3a] high level lint[0x1])
[    0.442494] ACPI: LAPIC_NMI (acpi_id[0x3b] high level lint[0x1])
[    0.442523] IOAPIC[0]: apic_id 128, version 33, address 0xfec00000, GSI 0-23
[    0.442528] IOAPIC[1]: apic_id 129, version 33, address 0xfda00000, GSI 24-55
[    0.442533] IOAPIC[2]: apic_id 130, version 33, address 0xe0a00000, GSI 56-87
[    0.442538] IOAPIC[3]: apic_id 131, version 33, address 0xc5a00000, GSI 88-119
[    0.442543] IOAPIC[4]: apic_id 132, version 33, address 0xaaa00000, GSI 120-151
[    0.442545] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.442547] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.442548] ACPI: IRQ0 used by override.
[    0.442549] ACPI: IRQ9 used by override.
[    0.442552] Using ACPI (MADT) for SMP configuration information
[    0.442554] ACPI: HPET id: 0x10228201 base: 0xfed00000
[    0.442569] ACPI: SPCR: Unexpected SPCR Access Width.  Defaulting to byte size
[    0.442572] ACPI: SPCR: console: uart,mmio,0x0,115200
[    0.442575] smpboot: Allowing 32 CPUs, 0 hotplug CPUs
[    0.442579] NODE_DATA(1) allocated [mem 0x107f1e6f80-0x107f1ebf7f]
[    0.442579]     NODE_DATA(1) on node 2
[    0.442584] Initmem setup node 1 [mem 0x0000000000000000-0x0000000000000000]
[    0.442585] On node 1 totalpages: 0
[    0.442587] NODE_DATA(3) allocated [mem 0x107f1e1f80-0x107f1e6f7f]
[    0.442588]     NODE_DATA(3) on node 2
[    0.442591] Initmem setup node 3 [mem 0x0000000000000000-0x0000000000000000]
[    0.442592] On node 3 totalpages: 0
[    0.442631] PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.442633] PM: Registered nosave memory: [mem 0x000a0000-0x000effff]
[    0.442634] PM: Registered nosave memory: [mem 0x000f0000-0x000fffff]
[    0.442636] PM: Registered nosave memory: [mem 0x64f50000-0x64f52fff]
[    0.442637] PM: Registered nosave memory: [mem 0x65479000-0x65489fff]
[    0.442640] PM: Registered nosave memory: [mem 0x654a2000-0x654a5fff]
[    0.442641] PM: Registered nosave memory: [mem 0x654ef000-0x654f1fff]
[    0.442643] PM: Registered nosave memory: [mem 0x6550a000-0x6550afff]
[    0.442645] PM: Registered nosave memory: [mem 0x6df6f000-0x6e796fff]
[    0.442647] PM: Registered nosave memory: [mem 0x6e798000-0x6e79cfff]
[    0.442648] PM: Registered nosave memory: [mem 0x6e79e000-0x6edcefff]
[    0.442650] PM: Registered nosave memory: [mem 0x76ecf000-0x76fcefff]
[    0.442651] PM: Registered nosave memory: [mem 0x76fcf000-0x77fdefff]
[    0.442651] PM: Registered nosave memory: [mem 0x77fdf000-0x77feefff]
[    0.442652] PM: Registered nosave memory: [mem 0x77fef000-0x77ffefff]
[    0.442654] PM: Registered nosave memory: [mem 0x78000000-0x8fffffff]
[    0.442654] PM: Registered nosave memory: [mem 0x90000000-0xfed7ffff]
[    0.442655] PM: Registered nosave memory: [mem 0xfed80000-0xfed80fff]
[    0.442655] PM: Registered nosave memory: [mem 0xfed81000-0xffffffff]
[    0.442658] [mem 0x90000000-0xfed7ffff] available for PCI devices
[    0.442659] Booting paravirtualized kernel on bare hardware
[    0.442663] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
[    0.555137] random: get_random_bytes called from start_kernel+0x93/0x506 with crng_init=0
[    0.555146] setup_percpu: NR_CPUS:512 nr_cpumask_bits:512 nr_cpu_ids:32 nr_node_ids:4
[    0.556664] percpu: Embedded 44 pages/cpu s143192 r8192 d28840 u262144
[    0.556675] pcpu-alloc: s143192 r8192 d28840 u262144 alloc=1*2097152
[    0.556677] pcpu-alloc: [0] 00 01 02 03 16 17 18 19 [1] 04 05 06 07 20 21 22 23 
[    0.556681] pcpu-alloc: [2] 08 09 10 11 24 25 26 27 [3] 12 13 14 15 28 29 30 31 
[    0.556725] Built 4 zonelists, mobility grouping on.  Total pages: 16471186
[    0.556726] Policy zone: Normal
[    0.556728] Kernel command line: BOOT_IMAGE=/vmlinuz-5.0.0-1+reiser4.0.2-amd64 root=/dev/nvme0n1p5 ro quiet
[    0.556771] printk: log_buf_len individual max cpu contribution: 4096 bytes
[    0.556772] printk: log_buf_len total cpu_extra contributions: 126976 bytes
[    0.556772] printk: log_buf_len min size: 131072 bytes
[    0.556819] printk: log_buf_len: 262144 bytes
[    0.556820] printk: early log buf free: 111848(85%)
[    0.564350] Calgary: detecting Calgary via BIOS EBDA area
[    0.564353] Calgary: Unable to locate Rio Grande table in EBDA - bailing!
[    0.740010] Memory: 65395216K/66930644K available (10243K kernel code, 1171K rwdata, 3252K rodata, 1580K init, 2344K bss, 1535428K reserved, 0K cma-reserved)
[    0.740291] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=32, Nodes=4
[    0.740301] ftrace: allocating 32020 entries in 126 pages
[    0.754025] rcu: Hierarchical RCU implementation.
[    0.754027] rcu: 	RCU restricting CPUs from NR_CPUS=512 to nr_cpu_ids=32.
[    0.754028] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.754029] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=32
[    0.756848] NR_IRQS: 33024, nr_irqs: 2856, preallocated irqs: 16
[    0.757019] rcu: 	Offload RCU callbacks from CPUs: (none).
[    0.757112] Console: colour dummy device 80x25
[    0.757120] printk: console [tty0] enabled
[    0.757149] mempolicy: Disabling automatic NUMA balancing. Configure with numa_balancing= or the kernel.numa_balancing sysctl
[    0.757150] ACPI: Core revision 20181213
[    0.757407] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 133484873504 ns
[    0.757433] hpet clockevent registered
[    0.757437] APIC: Switch to symmetric I/O mode setup
[    0.757440] Switched APIC routing to physical flat.
[    0.759230] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.777441] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x228762f193f, max_idle_ns: 440795312977 ns
[    0.777450] Calibrating delay loop (skipped), value calculated using timer frequency.. 4790.87 BogoMIPS (lpj=9581756)
[    0.777452] pid_max: default: 32768 minimum: 301
[    0.787731] LSM: Security Framework initializing
[    0.787733] Yama: disabled by default; enable with sysctl kernel.yama.*
[    0.787792] AppArmor: AppArmor initialized
[    0.796942] Dentry cache hash table entries: 8388608 (order: 14, 67108864 bytes)
[    0.801629] Inode-cache hash table entries: 4194304 (order: 13, 33554432 bytes)
[    0.801816] Mount-cache hash table entries: 131072 (order: 8, 1048576 bytes)
[    0.801962] Mountpoint-cache hash table entries: 131072 (order: 8, 1048576 bytes)
[    0.802281] mce: CPU supports 23 MCE banks
[    0.802331] LVT offset 2 assigned for vector 0xf4
[    0.802342] Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 512
[    0.802343] Last level dTLB entries: 4KB 1536, 2MB 1536, 4MB 768, 1GB 0
[    0.802344] Spectre V2 : Mitigation: Full AMD retpoline
[    0.802345] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    0.802354] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[    0.802355] Spectre V2 : User space: Vulnerable
[    0.802356] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl and seccomp
[    0.802614] Freeing SMP alternatives memory: 24K
[    0.805442] smpboot: CPU0: AMD EPYC 7351P 16-Core Processor (family: 0x17, model: 0x1, stepping: 0x2)
[    0.805442] Performance Events: Fam17h core perfctr, AMD PMU driver.
[    0.805442] ... version:                0
[    0.805442] ... bit width:              48
[    0.805442] ... generic registers:      6
[    0.805442] ... value mask:             0000ffffffffffff
[    0.805442] ... max period:             00007fffffffffff
[    0.805442] ... fixed-purpose events:   0
[    0.805442] ... event mask:             000000000000003f
[    0.805442] rcu: Hierarchical SRCU implementation.
[    0.805442] random: crng done (trusting CPU's manufacturer)
[    0.805442] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[    0.805442] smp: Bringing up secondary CPUs ...
[    0.805442] x86: Booting SMP configuration:
[    0.805442] .... node  #0, CPUs:        #1  #2  #3
[    0.809642] .... node  #1, CPUs:    #4  #5  #6  #7
[    0.817528] .... node  #2, CPUs:    #8  #9 #10 #11
[    0.827644] .... node  #3, CPUs:   #12 #13 #14 #15
[    0.837527] .... node  #0, CPUs:   #16 #17 #18 #19
[    0.847527] .... node  #1, CPUs:   #20 #21 #22 #23
[    0.855726] .... node  #2, CPUs:   #24 #25 #26 #27
[    0.865604] .... node  #3, CPUs:   #28 #29 #30 #31
[    0.873494] smp: Brought up 4 nodes, 32 CPUs
[    0.873494] smpboot: Max logical packages: 1
[    0.873494] smpboot: Total of 32 processors activated (153308.09 BogoMIPS)
[    0.882212] devtmpfs: initialized
[    0.882212] x86/mm: Memory block size: 128MB
[    0.886279] PM: Registering ACPI NVS region [mem 0x77fdf000-0x77feefff] (65536 bytes)
[    0.886279] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.886279] futex hash table entries: 8192 (order: 7, 524288 bytes)
[    0.886279] pinctrl core: initialized pinctrl subsystem
[    0.886279] NET: Registered protocol family 16
[    0.886279] audit: initializing netlink subsys (disabled)
[    0.886279] audit: type=2000 audit(1563468369.128:1): state=initialized audit_enabled=0 res=1
[    0.886279] cpuidle: using governor ladder
[    0.886279] cpuidle: using governor menu
[    0.886279] Invalid PCCT: 0 PCC subspaces
[    0.886279] ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
[    0.886279] ACPI: bus type PCI registered
[    0.886279] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.886279] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0x80000000-0x8fffffff] (base 0x80000000)
[    0.886279] PCI: MMCONFIG at [mem 0x80000000-0x8fffffff] reserved in E820
[    0.886279] PCI: Using configuration type 1 for base access
[    0.889532] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.889532] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.889641] ACPI: Added _OSI(Module Device)
[    0.889642] ACPI: Added _OSI(Processor Device)
[    0.889643] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.889643] ACPI: Added _OSI(Processor Aggregator Device)
[    0.889644] ACPI: Added _OSI(Linux-Dell-Video)
[    0.889645] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.889645] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.889946] ACPI: 6 ACPI AML tables successfully acquired and loaded
[    0.894221] ACPI: Interpreter enabled
[    0.894231] ACPI: (supports S0 S5)
[    0.894232] ACPI: Using IOAPIC for interrupt routing
[    0.894441] HEST: Table parsing has been initialized.
[    0.894443] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.894576] ACPI: Enabled 2 GPEs in block 00 to 1F
[    0.894576] ACPI: Power Resource [P0SA] (off)
[    0.894577] ACPI: Power Resource [P3SA] (off)
[    0.895822] ACPI: PCI Root Bridge [PC00] (domain 0000 [bus 00-3f])
[    0.895829] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI]
[    0.895910] acpi PNP0A08:00: _OSC: platform does not support [SHPCHotplug AER LTR]
[    0.895978] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME PCIeCapability]
[    0.895980] acpi PNP0A08:00: FADT indicates ASPM is unsupported, using BIOS configuration
[    0.896076] PCI host bridge to bus 0000:00
[    0.896078] pci_bus 0000:00: root bus resource [io  0x0000-0x03af window]
[    0.896079] pci_bus 0000:00: root bus resource [io  0x03e0-0x0cf7 window]
[    0.896080] pci_bus 0000:00: root bus resource [io  0x0d00-0x0fff window]
[    0.896080] pci_bus 0000:00: root bus resource [io  0x03b0-0x03bb window]
[    0.896081] pci_bus 0000:00: root bus resource [io  0x03c0-0x03df window]
[    0.896082] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    0.896083] pci_bus 0000:00: root bus resource [io  0x1000-0x3fff window]
[    0.896084] pci_bus 0000:00: root bus resource [mem 0xe1000000-0xfebfffff window]
[    0.896085] pci_bus 0000:00: root bus resource [mem 0x10000000000-0x2bf3fffffff window]
[    0.896086] pci_bus 0000:00: root bus resource [bus 00-3f]
[    0.896093] pci 0000:00:00.0: [1022:1450] type 00 class 0x060000
[    0.896178] pci 0000:00:01.0: [1022:1452] type 00 class 0x060000
[    0.896237] pci 0000:00:01.2: [1022:1453] type 01 class 0x060400
[    0.896589] pci 0000:00:01.2: PME# supported from D0 D3hot D3cold
[    0.896668] pci 0000:00:01.3: [1022:1453] type 01 class 0x060400
[    0.897539] pci 0000:00:01.3: PME# supported from D0 D3hot D3cold
[    0.897622] pci 0000:00:02.0: [1022:1452] type 00 class 0x060000
[    0.897695] pci 0000:00:03.0: [1022:1452] type 00 class 0x060000
[    0.897749] pci 0000:00:03.1: [1022:1453] type 01 class 0x060400
[    0.898542] pci 0000:00:03.1: PME# supported from D0 D3hot D3cold
[    0.898622] pci 0000:00:03.3: [1022:1453] type 01 class 0x060400
[    0.899554] pci 0000:00:03.3: PME# supported from D0 D3hot D3cold
[    0.899641] pci 0000:00:04.0: [1022:1452] type 00 class 0x060000
[    0.899697] pci 0000:00:04.1: [1022:1453] type 01 class 0x060400
[    0.900527] pci 0000:00:04.1: PME# supported from D0 D3hot D3cold
[    0.900620] pci 0000:00:07.0: [1022:1452] type 00 class 0x060000
[    0.900673] pci 0000:00:07.1: [1022:1454] type 01 class 0x060400
[    0.901445] pci 0000:00:07.1: enabling Extended Tags
[    0.901524] pci 0000:00:07.1: PME# supported from D0 D3hot D3cold
[    0.901607] pci 0000:00:08.0: [1022:1452] type 00 class 0x060000
[    0.901663] pci 0000:00:08.1: [1022:1454] type 01 class 0x060400
[    0.902456] pci 0000:00:08.1: enabling Extended Tags
[    0.902535] pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
[    0.902655] pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500
[    0.902823] pci 0000:00:14.3: [1022:790e] type 00 class 0x060100
[    0.903031] pci 0000:00:18.0: [1022:1460] type 00 class 0x060000
[    0.903075] pci 0000:00:18.1: [1022:1461] type 00 class 0x060000
[    0.903116] pci 0000:00:18.2: [1022:1462] type 00 class 0x060000
[    0.903158] pci 0000:00:18.3: [1022:1463] type 00 class 0x060000
[    0.903200] pci 0000:00:18.4: [1022:1464] type 00 class 0x060000
[    0.903242] pci 0000:00:18.5: [1022:1465] type 00 class 0x060000
[    0.903288] pci 0000:00:18.6: [1022:1466] type 00 class 0x060000
[    0.903329] pci 0000:00:18.7: [1022:1467] type 00 class 0x060000
[    0.903373] pci 0000:00:19.0: [1022:1460] type 00 class 0x060000
[    0.903419] pci 0000:00:19.1: [1022:1461] type 00 class 0x060000
[    0.903465] pci 0000:00:19.2: [1022:1462] type 00 class 0x060000
[    0.903510] pci 0000:00:19.3: [1022:1463] type 00 class 0x060000
[    0.903556] pci 0000:00:19.4: [1022:1464] type 00 class 0x060000
[    0.903601] pci 0000:00:19.5: [1022:1465] type 00 class 0x060000
[    0.903646] pci 0000:00:19.6: [1022:1466] type 00 class 0x060000
[    0.903691] pci 0000:00:19.7: [1022:1467] type 00 class 0x060000
[    0.903739] pci 0000:00:1a.0: [1022:1460] type 00 class 0x060000
[    0.903784] pci 0000:00:1a.1: [1022:1461] type 00 class 0x060000
[    0.903830] pci 0000:00:1a.2: [1022:1462] type 00 class 0x060000
[    0.903875] pci 0000:00:1a.3: [1022:1463] type 00 class 0x060000
[    0.903919] pci 0000:00:1a.4: [1022:1464] type 00 class 0x060000
[    0.903965] pci 0000:00:1a.5: [1022:1465] type 00 class 0x060000
[    0.904010] pci 0000:00:1a.6: [1022:1466] type 00 class 0x060000
[    0.904056] pci 0000:00:1a.7: [1022:1467] type 00 class 0x060000
[    0.904102] pci 0000:00:1b.0: [1022:1460] type 00 class 0x060000
[    0.904147] pci 0000:00:1b.1: [1022:1461] type 00 class 0x060000
[    0.904193] pci 0000:00:1b.2: [1022:1462] type 00 class 0x060000
[    0.904239] pci 0000:00:1b.3: [1022:1463] type 00 class 0x060000
[    0.904283] pci 0000:00:1b.4: [1022:1464] type 00 class 0x060000
[    0.904329] pci 0000:00:1b.5: [1022:1465] type 00 class 0x060000
[    0.904374] pci 0000:00:1b.6: [1022:1466] type 00 class 0x060000
[    0.904421] pci 0000:00:1b.7: [1022:1467] type 00 class 0x060000
[    0.904536] pci 0000:05:00.0: [144d:a808] type 00 class 0x010802
[    0.904559] pci 0000:05:00.0: reg 0x10: [mem 0xea200000-0xea203fff 64bit]
[    0.904731] pci 0000:00:01.2: PCI bridge to [bus 05]
[    0.904735] pci 0000:00:01.2:   bridge window [mem 0xea200000-0xea2fffff]
[    0.905479] pci 0000:00:01.3: PCI bridge to [bus 06]
[    0.905534] pci 0000:00:03.1: PCI bridge to [bus 07]
[    0.905621] pci 0000:04:00.0: [14e4:1657] type 00 class 0x020000
[    0.905648] pci 0000:04:00.0: reg 0x10: [mem 0xe9c90000-0xe9c9ffff 64bit pref]
[    0.905661] pci 0000:04:00.0: reg 0x18: [mem 0xe9ca0000-0xe9caffff 64bit pref]
[    0.905674] pci 0000:04:00.0: reg 0x20: [mem 0xe9cb0000-0xe9cbffff 64bit pref]
[    0.905682] pci 0000:04:00.0: reg 0x30: [mem 0x00000000-0x0003ffff pref]
[    0.905757] pci 0000:04:00.0: PME# supported from D0 D3hot D3cold
[    0.905793] pci 0000:04:00.0: 8.000 Gb/s available PCIe bandwidth, limited by 5 GT/s x2 link at 0000:00:03.3 (capable of 16.000 Gb/s with 5 GT/s x4 link)
[    0.905859] pci 0000:04:00.1: [14e4:1657] type 00 class 0x020000
[    0.905886] pci 0000:04:00.1: reg 0x10: [mem 0xe9c60000-0xe9c6ffff 64bit pref]
[    0.905899] pci 0000:04:00.1: reg 0x18: [mem 0xe9c70000-0xe9c7ffff 64bit pref]
[    0.905911] pci 0000:04:00.1: reg 0x20: [mem 0xe9c80000-0xe9c8ffff 64bit pref]
[    0.905920] pci 0000:04:00.1: reg 0x30: [mem 0x00000000-0x0003ffff pref]
[    0.905994] pci 0000:04:00.1: PME# supported from D0 D3hot D3cold
[    0.906078] pci 0000:04:00.2: [14e4:1657] type 00 class 0x020000
[    0.906105] pci 0000:04:00.2: reg 0x10: [mem 0xe9c30000-0xe9c3ffff 64bit pref]
[    0.906117] pci 0000:04:00.2: reg 0x18: [mem 0xe9c40000-0xe9c4ffff 64bit pref]
[    0.906130] pci 0000:04:00.2: reg 0x20: [mem 0xe9c50000-0xe9c5ffff 64bit pref]
[    0.906139] pci 0000:04:00.2: reg 0x30: [mem 0x00000000-0x0003ffff pref]
[    0.906213] pci 0000:04:00.2: PME# supported from D0 D3hot D3cold
[    0.906297] pci 0000:04:00.3: [14e4:1657] type 00 class 0x020000
[    0.906325] pci 0000:04:00.3: reg 0x10: [mem 0xe9c00000-0xe9c0ffff 64bit pref]
[    0.906338] pci 0000:04:00.3: reg 0x18: [mem 0xe9c10000-0xe9c1ffff 64bit pref]
[    0.906350] pci 0000:04:00.3: reg 0x20: [mem 0xe9c20000-0xe9c2ffff 64bit pref]
[    0.906359] pci 0000:04:00.3: reg 0x30: [mem 0x00000000-0x0003ffff pref]
[    0.906433] pci 0000:04:00.3: PME# supported from D0 D3hot D3cold
[    0.906529] pci 0000:00:03.3: PCI bridge to [bus 04]
[    0.906535] pci 0000:00:03.3:   bridge window [mem 0xe9c00000-0xe9cfffff 64bit pref]
[    0.906609] pci 0000:01:00.0: [103c:3306] type 00 class 0x088000
[    0.906628] pci 0000:01:00.0: reg 0x10: [io  0x1200-0x12ff]
[    0.906637] pci 0000:01:00.0: reg 0x14: [mem 0xe9ba6000-0xe9ba63ff]
[    0.906645] pci 0000:01:00.0: reg 0x18: [io  0x1100-0x11ff]
[    0.906654] pci 0000:01:00.0: reg 0x1c: [mem 0xe4000000-0xe7ffffff]
[    0.906662] pci 0000:01:00.0: reg 0x20: [mem 0xe9800000-0xe99fffff]
[    0.906782] pci 0000:01:00.1: [102b:0538] type 00 class 0x030000
[    0.906801] pci 0000:01:00.1: reg 0x10: [mem 0xe8000000-0xe8ffffff pref]
[    0.906810] pci 0000:01:00.1: reg 0x14: [mem 0xe9ba0000-0xe9ba3fff]
[    0.906818] pci 0000:01:00.1: reg 0x18: [mem 0xe9000000-0xe97fffff]
[    0.906861] pci 0000:01:00.1: BAR 0: assigned to efifb
[    0.906948] pci 0000:01:00.2: [103c:3307] type 00 class 0x088000
[    0.906967] pci 0000:01:00.2: reg 0x10: [io  0x1000-0x10ff]
[    0.906976] pci 0000:01:00.2: reg 0x14: [mem 0xe9ba5000-0xe9ba50ff]
[    0.906984] pci 0000:01:00.2: reg 0x18: [mem 0xe9a00000-0xe9afffff]
[    0.906992] pci 0000:01:00.2: reg 0x1c: [mem 0xe9b00000-0xe9b7ffff]
[    0.907000] pci 0000:01:00.2: reg 0x20: [mem 0xe9b90000-0xe9b97fff]
[    0.907008] pci 0000:01:00.2: reg 0x24: [mem 0xe9b80000-0xe9b8ffff]
[    0.907017] pci 0000:01:00.2: reg 0x30: [mem 0x00000000-0x0000ffff pref]
[    0.907063] pci 0000:01:00.2: PME# supported from D0 D3hot D3cold
[    0.907119] pci 0000:01:00.4: [103c:22f6] type 00 class 0x0c0320
[    0.907138] pci 0000:01:00.4: reg 0x10: [mem 0xe9ba4000-0xe9ba40ff]
[    0.907284] pci 0000:00:04.1: PCI bridge to [bus 01]
[    0.907287] pci 0000:00:04.1:   bridge window [io  0x1000-0x1fff]
[    0.907288] pci 0000:00:04.1:   bridge window [mem 0xe1000000-0xe9bfffff]
[    0.907538] pci 0000:03:00.0: [1022:145a] type 00 class 0x130000
[    0.907564] pci 0000:03:00.0: enabling Extended Tags
[    0.907628] pci 0000:03:00.2: [1022:1456] type 00 class 0x108000
[    0.907642] pci 0000:03:00.2: reg 0x18: [mem 0xea000000-0xea0fffff]
[    0.907650] pci 0000:03:00.2: reg 0x24: [mem 0xea100000-0xea101fff]
[    0.907656] pci 0000:03:00.2: enabling Extended Tags
[    0.907721] pci 0000:03:00.3: [1022:145f] type 00 class 0x0c0330
[    0.907732] pci 0000:03:00.3: reg 0x10: [mem 0xe9f00000-0xe9ffffff 64bit]
[    0.907747] pci 0000:03:00.3: enabling Extended Tags
[    0.907776] pci 0000:03:00.3: PME# supported from D0 D3hot D3cold
[    0.907830] pci 0000:00:07.1: PCI bridge to [bus 03]
[    0.907834] pci 0000:00:07.1:   bridge window [mem 0xe9f00000-0xea1fffff]
[    0.908501] pci 0000:02:00.0: [1022:1455] type 00 class 0x130000
[    0.908529] pci 0000:02:00.0: enabling Extended Tags
[    0.908594] pci 0000:02:00.1: [1022:1468] type 00 class 0x108000
[    0.908609] pci 0000:02:00.1: reg 0x18: [mem 0xe9d00000-0xe9dfffff]
[    0.908617] pci 0000:02:00.1: reg 0x24: [mem 0xe9e00000-0xe9e01fff]
[    0.908623] pci 0000:02:00.1: enabling Extended Tags
[    0.908701] pci 0000:00:08.1: PCI bridge to [bus 02]
[    0.908705] pci 0000:00:08.1:   bridge window [mem 0xe9d00000-0xe9efffff]
[    0.908733] pci_bus 0000:00: on NUMA node 0
[    0.908803] ACPI: PCI Interrupt Link [LNKA] (IRQs 4 5 7 10 *11 14 15)
[    0.908851] ACPI: PCI Interrupt Link [LNKB] (IRQs 4 5 7 10 *11 14 15)
[    0.908891] ACPI: PCI Interrupt Link [LNKC] (IRQs 4 *5 7 10 11 14 15)
[    0.908931] ACPI: PCI Interrupt Link [LNKD] (IRQs 4 5 7 10 *11 14 15)
[    0.908975] ACPI: PCI Interrupt Link [LNKE] (IRQs 4 5 7 10 *11 14 15)
[    0.909011] ACPI: PCI Interrupt Link [LNKF] (IRQs 4 5 7 10 *11 14 15)
[    0.909048] ACPI: PCI Interrupt Link [LNKG] (IRQs 4 5 7 *10 11 14 15)
[    0.909084] ACPI: PCI Interrupt Link [LNKH] (IRQs 4 5 7 10 11 14 15) *9
[    0.909235] ACPI: PCI Root Bridge [PC01] (domain 0000 [bus 40-7f])
[    0.909241] acpi PNP0A08:01: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI]
[    0.909314] acpi PNP0A08:01: _OSC: platform does not support [SHPCHotplug AER LTR]
[    0.909380] acpi PNP0A08:01: _OSC: OS now controls [PCIeHotplug PME PCIeCapability]
[    0.909381] acpi PNP0A08:01: FADT indicates ASPM is unsupported, using BIOS configuration
[    0.909452] PCI host bridge to bus 0000:40
[    0.909454] pci_bus 0000:40: root bus resource [io  0x4000-0x6fff window]
[    0.909455] pci_bus 0000:40: root bus resource [mem 0xc6000000-0xe0ffffff window]
[    0.909456] pci_bus 0000:40: root bus resource [mem 0x2bf40000000-0x47e7fffffff window]
[    0.909457] pci_bus 0000:40: root bus resource [bus 40-7f]
[    0.909461] pci 0000:40:00.0: [1022:1450] type 00 class 0x060000
[    0.909527] pci 0000:40:01.0: [1022:1452] type 00 class 0x060000
[    0.909581] pci 0000:40:01.1: [1022:1453] type 01 class 0x060400
[    0.909751] pci 0000:40:01.1: PME# supported from D0 D3hot D3cold
[    0.909850] pci 0000:40:02.0: [1022:1452] type 00 class 0x060000
[    0.909913] pci 0000:40:03.0: [1022:1452] type 00 class 0x060000
[    0.909967] pci 0000:40:03.1: [1022:1453] type 01 class 0x060400
[    0.910576] pci 0000:40:03.1: PME# supported from D0 D3hot D3cold
[    0.910674] pci 0000:40:04.0: [1022:1452] type 00 class 0x060000
[    0.910745] pci 0000:40:07.0: [1022:1452] type 00 class 0x060000
[    0.910794] pci 0000:40:07.1: [1022:1454] type 01 class 0x060400
[    0.910825] pci 0000:40:07.1: enabling Extended Tags
[    0.910906] pci 0000:40:07.1: PME# supported from D0 D3hot D3cold
[    0.910985] pci 0000:40:08.0: [1022:1452] type 00 class 0x060000
[    0.911036] pci 0000:40:08.1: [1022:1454] type 01 class 0x060400
[    0.911469] pci 0000:40:08.1: enabling Extended Tags
[    0.911552] pci 0000:40:08.1: PME# supported from D0 D3hot D3cold
[    0.911752] pci 0000:40:01.1: PCI bridge to [bus 43]
[    0.911819] pci 0000:40:03.1: PCI bridge to [bus 44]
[    0.911888] pci 0000:42:00.0: [1022:145a] type 00 class 0x130000
[    0.911918] pci 0000:42:00.0: enabling Extended Tags
[    0.911991] pci 0000:42:00.2: [1022:1456] type 00 class 0x108000
[    0.912007] pci 0000:42:00.2: reg 0x18: [mem 0xc6300000-0xc63fffff]
[    0.912016] pci 0000:42:00.2: reg 0x24: [mem 0xc6400000-0xc6401fff]
[    0.912023] pci 0000:42:00.2: enabling Extended Tags
[    0.912095] pci 0000:42:00.3: [1022:145f] type 00 class 0x0c0330
[    0.912108] pci 0000:42:00.3: reg 0x10: [mem 0xc6200000-0xc62fffff 64bit]
[    0.912125] pci 0000:42:00.3: enabling Extended Tags
[    0.912158] pci 0000:42:00.3: PME# supported from D0 D3hot D3cold
[    0.912217] pci 0000:40:07.1: PCI bridge to [bus 42]
[    0.912221] pci 0000:40:07.1:   bridge window [mem 0xc6200000-0xc64fffff]
[    0.912514] pci 0000:41:00.0: [1022:1455] type 00 class 0x130000
[    0.912546] pci 0000:41:00.0: enabling Extended Tags
[    0.912619] pci 0000:41:00.1: [1022:1468] type 00 class 0x108000
[    0.912636] pci 0000:41:00.1: reg 0x18: [mem 0xc6000000-0xc60fffff]
[    0.912645] pci 0000:41:00.1: reg 0x24: [mem 0xc6100000-0xc6101fff]
[    0.912651] pci 0000:41:00.1: enabling Extended Tags
[    0.912726] pci 0000:41:00.2: [1022:7901] type 00 class 0x010601
[    0.912757] pci 0000:41:00.2: reg 0x24: [mem 0xc6102000-0xc6102fff]
[    0.912765] pci 0000:41:00.2: enabling Extended Tags
[    0.912799] pci 0000:41:00.2: PME# supported from D3hot D3cold
[    0.912860] pci 0000:40:08.1: PCI bridge to [bus 41]
[    0.912864] pci 0000:40:08.1:   bridge window [mem 0xc6000000-0xc61fffff]
[    0.912886] pci_bus 0000:40: on NUMA node 1
[    0.913043] ACPI: PCI Root Bridge [PC02] (domain 0000 [bus 80-bf])
[    0.913048] acpi PNP0A08:02: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI]
[    0.913123] acpi PNP0A08:02: _OSC: platform does not support [SHPCHotplug AER LTR]
[    0.913190] acpi PNP0A08:02: _OSC: OS now controls [PCIeHotplug PME PCIeCapability]
[    0.913191] acpi PNP0A08:02: FADT indicates ASPM is unsupported, using BIOS configuration
[    0.913246] PCI host bridge to bus 0000:80
[    0.913247] pci_bus 0000:80: root bus resource [io  0x7000-0x9fff window]
[    0.913248] pci_bus 0000:80: root bus resource [mem 0xab000000-0xc5ffffff window]
[    0.913249] pci_bus 0000:80: root bus resource [mem 0x47e80000000-0x63dbfffffff window]
[    0.913250] pci_bus 0000:80: root bus resource [bus 80-bf]
[    0.913254] pci 0000:80:00.0: [1022:1450] type 00 class 0x060000
[    0.913321] pci 0000:80:01.0: [1022:1452] type 00 class 0x060000
[    0.913378] pci 0000:80:01.1: [1022:1453] type 01 class 0x060400
[    0.913430] pci 0000:80:01.1: enabling Extended Tags
[    0.913535] pci 0000:80:01.1: PME# supported from D0 D3hot D3cold
[    0.914056] pci 0000:80:02.0: [1022:1452] type 00 class 0x060000
[    0.914120] pci 0000:80:03.0: [1022:1452] type 00 class 0x060000
[    0.914171] pci 0000:80:03.2: [1022:1453] type 01 class 0x060400
[    0.914301] pci 0000:80:03.2: PME# supported from D0 D3hot D3cold
[    0.914386] pci 0000:80:04.0: [1022:1452] type 00 class 0x060000
[    0.914455] pci 0000:80:07.0: [1022:1452] type 00 class 0x060000
[    0.914504] pci 0000:80:07.1: [1022:1454] type 01 class 0x060400
[    0.914535] pci 0000:80:07.1: enabling Extended Tags
[    0.915385] pci 0000:80:07.1: PME# supported from D0 D3hot D3cold
[    0.915468] pci 0000:80:08.0: [1022:1452] type 00 class 0x060000
[    0.915519] pci 0000:80:08.1: [1022:1454] type 01 class 0x060400
[    0.915551] pci 0000:80:08.1: enabling Extended Tags
[    0.916151] pci 0000:80:08.1: PME# supported from D0 D3hot D3cold
[    0.916346] pci 0000:80:01.1: PCI bridge to [bus 83]
[    0.916422] pci 0000:80:03.2: PCI bridge to [bus 84]
[    0.916483] pci 0000:82:00.0: [1022:145a] type 00 class 0x130000
[    0.916513] pci 0000:82:00.0: enabling Extended Tags
[    0.916583] pci 0000:82:00.2: [1022:1456] type 00 class 0x108000
[    0.916599] pci 0000:82:00.2: reg 0x18: [mem 0xab200000-0xab2fffff]
[    0.916608] pci 0000:82:00.2: reg 0x24: [mem 0xab300000-0xab301fff]
[    0.916615] pci 0000:82:00.2: enabling Extended Tags
[    0.916697] pci 0000:80:07.1: PCI bridge to [bus 82]
[    0.916700] pci 0000:80:07.1:   bridge window [mem 0xab200000-0xab3fffff]
[    0.917049] pci 0000:81:00.0: [1022:1455] type 00 class 0x130000
[    0.917080] pci 0000:81:00.0: enabling Extended Tags
[    0.917151] pci 0000:81:00.1: [1022:1468] type 00 class 0x108000
[    0.917168] pci 0000:81:00.1: reg 0x18: [mem 0xab000000-0xab0fffff]
[    0.917177] pci 0000:81:00.1: reg 0x24: [mem 0xab100000-0xab101fff]
[    0.917183] pci 0000:81:00.1: enabling Extended Tags
[    0.917269] pci 0000:80:08.1: PCI bridge to [bus 81]
[    0.917273] pci 0000:80:08.1:   bridge window [mem 0xab000000-0xab1fffff]
[    0.917294] pci_bus 0000:80: on NUMA node 2
[    0.917316] ACPI: PCI Root Bridge [PC03] (domain 0000 [bus c0-ff])
[    0.917321] acpi PNP0A08:03: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI]
[    0.917394] acpi PNP0A08:03: _OSC: platform does not support [SHPCHotplug AER LTR]
[    0.917471] acpi PNP0A08:03: _OSC: OS now controls [PCIeHotplug PME PCIeCapability]
[    0.917472] acpi PNP0A08:03: FADT indicates ASPM is unsupported, using BIOS configuration
[    0.917537] PCI host bridge to bus 0000:c0
[    0.917539] pci_bus 0000:c0: root bus resource [io  0xa000-0xcfff window]
[    0.917540] pci_bus 0000:c0: root bus resource [mem 0x90000000-0xaaffffff window]
[    0.917541] pci_bus 0000:c0: root bus resource [mem 0x63dc0000000-0xffffffffffff window]
[    0.917542] pci_bus 0000:c0: root bus resource [bus c0-ff]
[    0.917546] pci 0000:c0:00.0: [1022:1450] type 00 class 0x060000
[    0.917613] pci 0000:c0:01.0: [1022:1452] type 00 class 0x060000
[    0.917669] pci 0000:c0:01.1: [1022:1453] type 01 class 0x060400
[    0.918180] pci 0000:c0:01.1: PME# supported from D0 D3hot D3cold
[    0.918272] pci 0000:c0:01.2: [1022:1453] type 01 class 0x060400
[    0.918450] pci 0000:c0:01.2: PME# supported from D0 D3hot D3cold
[    0.918549] pci 0000:c0:02.0: [1022:1452] type 00 class 0x060000
[    0.918615] pci 0000:c0:03.0: [1022:1452] type 00 class 0x060000
[    0.918668] pci 0000:c0:03.1: [1022:1453] type 01 class 0x060400
[    0.919168] pci 0000:c0:03.1: PME# supported from D0 D3hot D3cold
[    0.919257] pci 0000:c0:04.0: [1022:1452] type 00 class 0x060000
[    0.919328] pci 0000:c0:07.0: [1022:1452] type 00 class 0x060000
[    0.919382] pci 0000:c0:07.1: [1022:1454] type 01 class 0x060400
[    0.919413] pci 0000:c0:07.1: enabling Extended Tags
[    0.919494] pci 0000:c0:07.1: PME# supported from D0 D3hot D3cold
[    0.919576] pci 0000:c0:08.0: [1022:1452] type 00 class 0x060000
[    0.919628] pci 0000:c0:08.1: [1022:1454] type 01 class 0x060400
[    0.920284] pci 0000:c0:08.1: enabling Extended Tags
[    0.920367] pci 0000:c0:08.1: PME# supported from D0 D3hot D3cold
[    0.920577] pci 0000:c0:01.1: PCI bridge to [bus c3]
[    0.921098] pci 0000:c0:01.2: PCI bridge to [bus c4]
[    0.921160] pci 0000:c0:03.1: PCI bridge to [bus c5]
[    0.921221] pci 0000:c2:00.0: [1022:145a] type 00 class 0x130000
[    0.921250] pci 0000:c2:00.0: enabling Extended Tags
[    0.921322] pci 0000:c2:00.2: [1022:1456] type 00 class 0x108000
[    0.921338] pci 0000:c2:00.2: reg 0x18: [mem 0x90200000-0x902fffff]
[    0.921347] pci 0000:c2:00.2: reg 0x24: [mem 0x90300000-0x90301fff]
[    0.921353] pci 0000:c2:00.2: enabling Extended Tags
[    0.921435] pci 0000:c0:07.1: PCI bridge to [bus c2]
[    0.921438] pci 0000:c0:07.1:   bridge window [mem 0x90200000-0x903fffff]
[    0.921501] pci 0000:c1:00.0: [1022:1455] type 00 class 0x130000
[    0.921532] pci 0000:c1:00.0: enabling Extended Tags
[    0.921602] pci 0000:c1:00.1: [1022:1468] type 00 class 0x108000
[    0.921619] pci 0000:c1:00.1: reg 0x18: [mem 0x90000000-0x900fffff]
[    0.921628] pci 0000:c1:00.1: reg 0x24: [mem 0x90100000-0x90101fff]
[    0.921635] pci 0000:c1:00.1: enabling Extended Tags
[    0.921721] pci 0000:c0:08.1: PCI bridge to [bus c1]
[    0.921724] pci 0000:c0:08.1:   bridge window [mem 0x90000000-0x901fffff]
[    0.921751] pci_bus 0000:c0: on NUMA node 3
[    0.921914] pci 0000:01:00.1: vgaarb: setting as boot VGA device
[    0.921914] pci 0000:01:00.1: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.921914] pci 0000:01:00.1: vgaarb: bridge control possible
[    0.921914] vgaarb: loaded
[    0.921914] pps_core: LinuxPPS API ver. 1 registered
[    0.921914] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.921914] PTP clock support registered
[    0.921914] EDAC MC: Ver: 3.0.0
[    0.921914] Registered efivars operations
[    0.949871] PCI: Using ACPI for IRQ routing
[    0.966632] PCI: pci_cache_line_size set to 64 bytes
[    0.966786] e820: reserve RAM buffer [mem 0x64f50000-0x67ffffff]
[    0.966788] e820: reserve RAM buffer [mem 0x65479000-0x67ffffff]
[    0.966788] e820: reserve RAM buffer [mem 0x654a2000-0x67ffffff]
[    0.966789] e820: reserve RAM buffer [mem 0x654ef000-0x67ffffff]
[    0.966790] e820: reserve RAM buffer [mem 0x6550a000-0x67ffffff]
[    0.966790] e820: reserve RAM buffer [mem 0x6df6f000-0x6fffffff]
[    0.966791] e820: reserve RAM buffer [mem 0x6e798000-0x6fffffff]
[    0.966792] e820: reserve RAM buffer [mem 0x6e79e000-0x6fffffff]
[    0.966792] e820: reserve RAM buffer [mem 0x76ecf000-0x77ffffff]
[    0.966793] e820: reserve RAM buffer [mem 0x107f200000-0x107fffffff]
[    0.969500] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    0.969503] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
[    0.970701] clocksource: Switched to clocksource tsc-early
[    0.978297] VFS: Disk quotas dquot_6.6.0
[    0.978319] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.978430] AppArmor: AppArmor Filesystem Enabled
[    0.978444] pnp: PnP ACPI init
[    0.978635] pnp 00:00: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.978768] system 00:01: [io  0x0400-0x049f] has been reserved
[    0.978769] system 00:01: [io  0x0b00-0x0b0f] has been reserved
[    0.978771] system 00:01: [io  0x0b20-0x0b3f] has been reserved
[    0.978772] system 00:01: [io  0x0c00-0x0c01] has been reserved
[    0.978773] system 00:01: [io  0x0c14-0x0c15] has been reserved
[    0.978774] system 00:01: [io  0x0cd0-0x0cdf] has been reserved
[    0.978775] system 00:01: [mem 0xfec10000-0xfec10fff] has been reserved
[    0.978776] system 00:01: [mem 0xfed80000-0xfed80fff] has been reserved
[    0.978777] system 00:01: [mem 0xfed81d00-0xfed81dff] has been reserved
[    0.978778] system 00:01: [mem 0xfed81e00-0xfed81eff] has been reserved
[    0.978779] system 00:01: [mem 0xfedc0000-0xfedc1fff] has been reserved
[    0.978780] system 00:01: [mem 0xfedc4000-0xfeddffff] has been reserved
[    0.978781] system 00:01: [mem 0xfee00000-0xfeefffff] has been reserved
[    0.978782] system 00:01: [mem 0xff000000-0xffffffff] has been reserved
[    0.978785] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.978807] pnp 00:02: Plug and Play ACPI device, IDs PNP0501 (active)
[    0.978823] pnp 00:03: Plug and Play ACPI device, IDs PNP0501 (active)
[    0.979014] pnp: PnP ACPI: found 4 devices
[    0.984883] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.984898] pci 0000:00:01.2: bridge window [io  0x1000-0x0fff] to [bus 05] add_size 1000
[    0.984900] pci 0000:00:01.2: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 05] add_size 200000 add_align 100000
[    0.984905] pci 0000:00:01.3: bridge window [io  0x1000-0x0fff] to [bus 06] add_size 1000
[    0.984906] pci 0000:00:01.3: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 06] add_size 200000 add_align 100000
[    0.984908] pci 0000:00:01.3: bridge window [mem 0x00100000-0x000fffff] to [bus 06] add_size 200000 add_align 100000
[    0.984912] pci 0000:00:03.1: bridge window [io  0x1000-0x0fff] to [bus 07] add_size 1000
[    0.984913] pci 0000:00:03.1: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 07] add_size 200000 add_align 100000
[    0.984915] pci 0000:00:03.1: bridge window [mem 0x00100000-0x000fffff] to [bus 07] add_size 200000 add_align 100000
[    0.984939] pci 0000:00:01.2: BAR 15: assigned [mem 0x10000000000-0x100001fffff 64bit pref]
[    0.984940] pci 0000:00:01.3: BAR 14: assigned [mem 0xea300000-0xea4fffff]
[    0.984943] pci 0000:00:01.3: BAR 15: assigned [mem 0x10000200000-0x100003fffff 64bit pref]
[    0.984944] pci 0000:00:03.1: BAR 14: assigned [mem 0xea500000-0xea6fffff]
[    0.984947] pci 0000:00:03.1: BAR 15: assigned [mem 0x10000400000-0x100005fffff 64bit pref]
[    0.984948] pci 0000:00:03.3: BAR 14: assigned [mem 0xea700000-0xea7fffff]
[    0.984951] pci 0000:00:01.2: BAR 13: assigned [io  0x2000-0x2fff]
[    0.984953] pci 0000:00:01.3: BAR 13: assigned [io  0x3000-0x3fff]
[    0.984955] pci 0000:00:03.1: BAR 13: no space for [io  size 0x1000]
[    0.984956] pci 0000:00:03.1: BAR 13: failed to assign [io  size 0x1000]
[    0.984959] pci 0000:00:03.1: BAR 13: assigned [io  0x2000-0x2fff]
[    0.984961] pci 0000:00:01.3: BAR 13: assigned [io  0x3000-0x3fff]
[    0.984963] pci 0000:00:01.2: BAR 13: no space for [io  size 0x1000]
[    0.984963] pci 0000:00:01.2: BAR 13: failed to assign [io  size 0x1000]
[    0.984965] pci 0000:00:01.2: PCI bridge to [bus 05]
[    0.984968] pci 0000:00:01.2:   bridge window [mem 0xea200000-0xea2fffff]
[    0.984970] pci 0000:00:01.2:   bridge window [mem 0x10000000000-0x100001fffff 64bit pref]
[    0.984973] pci 0000:00:01.3: PCI bridge to [bus 06]
[    0.984974] pci 0000:00:01.3:   bridge window [io  0x3000-0x3fff]
[    0.984977] pci 0000:00:01.3:   bridge window [mem 0xea300000-0xea4fffff]
[    0.984978] pci 0000:00:01.3:   bridge window [mem 0x10000200000-0x100003fffff 64bit pref]
[    0.984981] pci 0000:00:03.1: PCI bridge to [bus 07]
[    0.984982] pci 0000:00:03.1:   bridge window [io  0x2000-0x2fff]
[    0.984984] pci 0000:00:03.1:   bridge window [mem 0xea500000-0xea6fffff]
[    0.984986] pci 0000:00:03.1:   bridge window [mem 0x10000400000-0x100005fffff 64bit pref]
[    0.984991] pci 0000:04:00.0: BAR 6: assigned [mem 0xea700000-0xea73ffff pref]
[    0.984992] pci 0000:04:00.1: BAR 6: assigned [mem 0xea740000-0xea77ffff pref]
[    0.984993] pci 0000:04:00.2: BAR 6: assigned [mem 0xea780000-0xea7bffff pref]
[    0.984994] pci 0000:04:00.3: BAR 6: assigned [mem 0xea7c0000-0xea7fffff pref]
[    0.984996] pci 0000:00:03.3: PCI bridge to [bus 04]
[    0.984998] pci 0000:00:03.3:   bridge window [mem 0xea700000-0xea7fffff]
[    0.985000] pci 0000:00:03.3:   bridge window [mem 0xe9c00000-0xe9cfffff 64bit pref]
[    0.985003] pci 0000:01:00.2: BAR 6: assigned [mem 0xe1000000-0xe100ffff pref]
[    0.985004] pci 0000:00:04.1: PCI bridge to [bus 01]
[    0.985006] pci 0000:00:04.1:   bridge window [io  0x1000-0x1fff]
[    0.985008] pci 0000:00:04.1:   bridge window [mem 0xe1000000-0xe9bfffff]
[    0.985013] pci 0000:00:07.1: PCI bridge to [bus 03]
[    0.985015] pci 0000:00:07.1:   bridge window [mem 0xe9f00000-0xea1fffff]
[    0.985019] pci 0000:00:08.1: PCI bridge to [bus 02]
[    0.985021] pci 0000:00:08.1:   bridge window [mem 0xe9d00000-0xe9efffff]
[    0.985027] pci_bus 0000:00: resource 4 [io  0x0000-0x03af window]
[    0.985028] pci_bus 0000:00: resource 5 [io  0x03e0-0x0cf7 window]
[    0.985029] pci_bus 0000:00: resource 6 [io  0x0d00-0x0fff window]
[    0.985029] pci_bus 0000:00: resource 7 [io  0x03b0-0x03bb window]
[    0.985030] pci_bus 0000:00: resource 8 [io  0x03c0-0x03df window]
[    0.985031] pci_bus 0000:00: resource 9 [mem 0x000a0000-0x000bffff window]
[    0.985032] pci_bus 0000:00: resource 10 [io  0x1000-0x3fff window]
[    0.985033] pci_bus 0000:00: resource 11 [mem 0xe1000000-0xfebfffff window]
[    0.985034] pci_bus 0000:00: resource 12 [mem 0x10000000000-0x2bf3fffffff window]
[    0.985035] pci_bus 0000:05: resource 1 [mem 0xea200000-0xea2fffff]
[    0.985036] pci_bus 0000:05: resource 2 [mem 0x10000000000-0x100001fffff 64bit pref]
[    0.985037] pci_bus 0000:06: resource 0 [io  0x3000-0x3fff]
[    0.985037] pci_bus 0000:06: resource 1 [mem 0xea300000-0xea4fffff]
[    0.985038] pci_bus 0000:06: resource 2 [mem 0x10000200000-0x100003fffff 64bit pref]
[    0.985039] pci_bus 0000:07: resource 0 [io  0x2000-0x2fff]
[    0.985040] pci_bus 0000:07: resource 1 [mem 0xea500000-0xea6fffff]
[    0.985041] pci_bus 0000:07: resource 2 [mem 0x10000400000-0x100005fffff 64bit pref]
[    0.985042] pci_bus 0000:04: resource 1 [mem 0xea700000-0xea7fffff]
[    0.985043] pci_bus 0000:04: resource 2 [mem 0xe9c00000-0xe9cfffff 64bit pref]
[    0.985044] pci_bus 0000:01: resource 0 [io  0x1000-0x1fff]
[    0.985045] pci_bus 0000:01: resource 1 [mem 0xe1000000-0xe9bfffff]
[    0.985046] pci_bus 0000:03: resource 1 [mem 0xe9f00000-0xea1fffff]
[    0.985047] pci_bus 0000:02: resource 1 [mem 0xe9d00000-0xe9efffff]
[    0.985074] pci 0000:40:01.1: bridge window [io  0x1000-0x0fff] to [bus 43] add_size 1000
[    0.985075] pci 0000:40:01.1: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 43] add_size 200000 add_align 100000
[    0.985076] pci 0000:40:01.1: bridge window [mem 0x00100000-0x000fffff] to [bus 43] add_size 200000 add_align 100000
[    0.985082] pci 0000:40:03.1: bridge window [io  0x1000-0x0fff] to [bus 44] add_size 1000
[    0.985083] pci 0000:40:03.1: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 44] add_size 200000 add_align 100000
[    0.985084] pci 0000:40:03.1: bridge window [mem 0x00100000-0x000fffff] to [bus 44] add_size 200000 add_align 100000
[    0.985094] pci 0000:40:01.1: BAR 14: assigned [mem 0xc6500000-0xc66fffff]
[    0.985096] pci 0000:40:01.1: BAR 15: assigned [mem 0x2bf40000000-0x2bf401fffff 64bit pref]
[    0.985097] pci 0000:40:03.1: BAR 14: assigned [mem 0xc6700000-0xc68fffff]
[    0.985099] pci 0000:40:03.1: BAR 15: assigned [mem 0x2bf40200000-0x2bf403fffff 64bit pref]
[    0.985100] pci 0000:40:01.1: BAR 13: assigned [io  0x4000-0x4fff]
[    0.985101] pci 0000:40:03.1: BAR 13: assigned [io  0x5000-0x5fff]
[    0.985102] pci 0000:40:01.1: PCI bridge to [bus 43]
[    0.985104] pci 0000:40:01.1:   bridge window [io  0x4000-0x4fff]
[    0.985107] pci 0000:40:01.1:   bridge window [mem 0xc6500000-0xc66fffff]
[    0.985110] pci 0000:40:01.1:   bridge window [mem 0x2bf40000000-0x2bf401fffff 64bit pref]
[    0.985114] pci 0000:40:03.1: PCI bridge to [bus 44]
[    0.985115] pci 0000:40:03.1:   bridge window [io  0x5000-0x5fff]
[    0.985119] pci 0000:40:03.1:   bridge window [mem 0xc6700000-0xc68fffff]
[    0.985121] pci 0000:40:03.1:   bridge window [mem 0x2bf40200000-0x2bf403fffff 64bit pref]
[    0.985126] pci 0000:40:07.1: PCI bridge to [bus 42]
[    0.985128] pci 0000:40:07.1:   bridge window [mem 0xc6200000-0xc64fffff]
[    0.985132] pci 0000:40:08.1: PCI bridge to [bus 41]
[    0.985134] pci 0000:40:08.1:   bridge window [mem 0xc6000000-0xc61fffff]
[    0.985139] pci_bus 0000:40: resource 4 [io  0x4000-0x6fff window]
[    0.985140] pci_bus 0000:40: resource 5 [mem 0xc6000000-0xe0ffffff window]
[    0.985141] pci_bus 0000:40: resource 6 [mem 0x2bf40000000-0x47e7fffffff window]
[    0.985142] pci_bus 0000:43: resource 0 [io  0x4000-0x4fff]
[    0.985142] pci_bus 0000:43: resource 1 [mem 0xc6500000-0xc66fffff]
[    0.985143] pci_bus 0000:43: resource 2 [mem 0x2bf40000000-0x2bf401fffff 64bit pref]
[    0.985144] pci_bus 0000:44: resource 0 [io  0x5000-0x5fff]
[    0.985145] pci_bus 0000:44: resource 1 [mem 0xc6700000-0xc68fffff]
[    0.985146] pci_bus 0000:44: resource 2 [mem 0x2bf40200000-0x2bf403fffff 64bit pref]
[    0.985146] pci_bus 0000:42: resource 1 [mem 0xc6200000-0xc64fffff]
[    0.985147] pci_bus 0000:41: resource 1 [mem 0xc6000000-0xc61fffff]
[    0.985164] pci 0000:80:01.1: bridge window [io  0x1000-0x0fff] to [bus 83] add_size 1000
[    0.985165] pci 0000:80:01.1: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 83] add_size 200000 add_align 100000
[    0.985166] pci 0000:80:01.1: bridge window [mem 0x00100000-0x000fffff] to [bus 83] add_size 200000 add_align 100000
[    0.985171] pci 0000:80:03.2: bridge window [io  0x1000-0x0fff] to [bus 84] add_size 1000
[    0.985172] pci 0000:80:03.2: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 84] add_size 200000 add_align 100000
[    0.985173] pci 0000:80:03.2: bridge window [mem 0x00100000-0x000fffff] to [bus 84] add_size 200000 add_align 100000
[    0.985182] pci 0000:80:01.1: BAR 14: assigned [mem 0xab400000-0xab5fffff]
[    0.985184] pci 0000:80:01.1: BAR 15: assigned [mem 0x47e80000000-0x47e801fffff 64bit pref]
[    0.985185] pci 0000:80:03.2: BAR 14: assigned [mem 0xab600000-0xab7fffff]
[    0.985187] pci 0000:80:03.2: BAR 15: assigned [mem 0x47e80200000-0x47e803fffff 64bit pref]
[    0.985188] pci 0000:80:01.1: BAR 13: assigned [io  0x7000-0x7fff]
[    0.985188] pci 0000:80:03.2: BAR 13: assigned [io  0x8000-0x8fff]
[    0.985190] pci 0000:80:01.1: PCI bridge to [bus 83]
[    0.985191] pci 0000:80:01.1:   bridge window [io  0x7000-0x7fff]
[    0.985195] pci 0000:80:01.1:   bridge window [mem 0xab400000-0xab5fffff]
[    0.985197] pci 0000:80:01.1:   bridge window [mem 0x47e80000000-0x47e801fffff 64bit pref]
[    0.985201] pci 0000:80:03.2: PCI bridge to [bus 84]
[    0.985202] pci 0000:80:03.2:   bridge window [io  0x8000-0x8fff]
[    0.985205] pci 0000:80:03.2:   bridge window [mem 0xab600000-0xab7fffff]
[    0.985206] pci 0000:80:03.2:   bridge window [mem 0x47e80200000-0x47e803fffff 64bit pref]
[    0.985210] pci 0000:80:07.1: PCI bridge to [bus 82]
[    0.985212] pci 0000:80:07.1:   bridge window [mem 0xab200000-0xab3fffff]
[    0.985216] pci 0000:80:08.1: PCI bridge to [bus 81]
[    0.985219] pci 0000:80:08.1:   bridge window [mem 0xab000000-0xab1fffff]
[    0.985223] pci_bus 0000:80: resource 4 [io  0x7000-0x9fff window]
[    0.985224] pci_bus 0000:80: resource 5 [mem 0xab000000-0xc5ffffff window]
[    0.985225] pci_bus 0000:80: resource 6 [mem 0x47e80000000-0x63dbfffffff window]
[    0.985226] pci_bus 0000:83: resource 0 [io  0x7000-0x7fff]
[    0.985226] pci_bus 0000:83: resource 1 [mem 0xab400000-0xab5fffff]
[    0.985227] pci_bus 0000:83: resource 2 [mem 0x47e80000000-0x47e801fffff 64bit pref]
[    0.985228] pci_bus 0000:84: resource 0 [io  0x8000-0x8fff]
[    0.985229] pci_bus 0000:84: resource 1 [mem 0xab600000-0xab7fffff]
[    0.985230] pci_bus 0000:84: resource 2 [mem 0x47e80200000-0x47e803fffff 64bit pref]
[    0.985231] pci_bus 0000:82: resource 1 [mem 0xab200000-0xab3fffff]
[    0.985232] pci_bus 0000:81: resource 1 [mem 0xab000000-0xab1fffff]
[    0.985242] pci 0000:c0:01.1: bridge window [io  0x1000-0x0fff] to [bus c3] add_size 1000
[    0.985243] pci 0000:c0:01.1: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus c3] add_size 200000 add_align 100000
[    0.985244] pci 0000:c0:01.1: bridge window [mem 0x00100000-0x000fffff] to [bus c3] add_size 200000 add_align 100000
[    0.985250] pci 0000:c0:01.2: bridge window [io  0x1000-0x0fff] to [bus c4] add_size 1000
[    0.985251] pci 0000:c0:01.2: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus c4] add_size 200000 add_align 100000
[    0.985252] pci 0000:c0:01.2: bridge window [mem 0x00100000-0x000fffff] to [bus c4] add_size 200000 add_align 100000
[    0.985256] pci 0000:c0:03.1: bridge window [io  0x1000-0x0fff] to [bus c5] add_size 1000
[    0.985258] pci 0000:c0:03.1: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus c5] add_size 200000 add_align 100000
[    0.985259] pci 0000:c0:03.1: bridge window [mem 0x00100000-0x000fffff] to [bus c5] add_size 200000 add_align 100000
[    0.985268] pci 0000:c0:01.1: BAR 14: assigned [mem 0x90400000-0x905fffff]
[    0.985270] pci 0000:c0:01.1: BAR 15: assigned [mem 0x63dc0000000-0x63dc01fffff 64bit pref]
[    0.985271] pci 0000:c0:01.2: BAR 14: assigned [mem 0x90600000-0x907fffff]
[    0.985272] pci 0000:c0:01.2: BAR 15: assigned [mem 0x63dc0200000-0x63dc03fffff 64bit pref]
[    0.985273] pci 0000:c0:03.1: BAR 14: assigned [mem 0x90800000-0x909fffff]
[    0.985275] pci 0000:c0:03.1: BAR 15: assigned [mem 0x63dc0400000-0x63dc05fffff 64bit pref]
[    0.985276] pci 0000:c0:01.1: BAR 13: assigned [io  0xa000-0xafff]
[    0.985276] pci 0000:c0:01.2: BAR 13: assigned [io  0xb000-0xbfff]
[    0.985277] pci 0000:c0:03.1: BAR 13: assigned [io  0xc000-0xcfff]
[    0.985279] pci 0000:c0:01.1: PCI bridge to [bus c3]
[    0.985281] pci 0000:c0:01.1:   bridge window [io  0xa000-0xafff]
[    0.985284] pci 0000:c0:01.1:   bridge window [mem 0x90400000-0x905fffff]
[    0.985286] pci 0000:c0:01.1:   bridge window [mem 0x63dc0000000-0x63dc01fffff 64bit pref]
[    0.985290] pci 0000:c0:01.2: PCI bridge to [bus c4]
[    0.985292] pci 0000:c0:01.2:   bridge window [io  0xb000-0xbfff]
[    0.985295] pci 0000:c0:01.2:   bridge window [mem 0x90600000-0x907fffff]
[    0.985298] pci 0000:c0:01.2:   bridge window [mem 0x63dc0200000-0x63dc03fffff 64bit pref]
[    0.985301] pci 0000:c0:03.1: PCI bridge to [bus c5]
[    0.985303] pci 0000:c0:03.1:   bridge window [io  0xc000-0xcfff]
[    0.985305] pci 0000:c0:03.1:   bridge window [mem 0x90800000-0x909fffff]
[    0.985307] pci 0000:c0:03.1:   bridge window [mem 0x63dc0400000-0x63dc05fffff 64bit pref]
[    0.985310] pci 0000:c0:07.1: PCI bridge to [bus c2]
[    0.985312] pci 0000:c0:07.1:   bridge window [mem 0x90200000-0x903fffff]
[    0.985317] pci 0000:c0:08.1: PCI bridge to [bus c1]
[    0.985319] pci 0000:c0:08.1:   bridge window [mem 0x90000000-0x901fffff]
[    0.985323] pci_bus 0000:c0: resource 4 [io  0xa000-0xcfff window]
[    0.985324] pci_bus 0000:c0: resource 5 [mem 0x90000000-0xaaffffff window]
[    0.985325] pci_bus 0000:c0: resource 6 [mem 0x63dc0000000-0xffffffffffff window]
[    0.985325] pci_bus 0000:c3: resource 0 [io  0xa000-0xafff]
[    0.985326] pci_bus 0000:c3: resource 1 [mem 0x90400000-0x905fffff]
[    0.985327] pci_bus 0000:c3: resource 2 [mem 0x63dc0000000-0x63dc01fffff 64bit pref]
[    0.985328] pci_bus 0000:c4: resource 0 [io  0xb000-0xbfff]
[    0.985329] pci_bus 0000:c4: resource 1 [mem 0x90600000-0x907fffff]
[    0.985330] pci_bus 0000:c4: resource 2 [mem 0x63dc0200000-0x63dc03fffff 64bit pref]
[    0.985331] pci_bus 0000:c5: resource 0 [io  0xc000-0xcfff]
[    0.985331] pci_bus 0000:c5: resource 1 [mem 0x90800000-0x909fffff]
[    0.985332] pci_bus 0000:c5: resource 2 [mem 0x63dc0400000-0x63dc05fffff 64bit pref]
[    0.985333] pci_bus 0000:c2: resource 1 [mem 0x90200000-0x903fffff]
[    0.985334] pci_bus 0000:c1: resource 1 [mem 0x90000000-0x901fffff]
[    0.985387] NET: Registered protocol family 2
[    0.985634] tcp_listen_portaddr_hash hash table entries: 32768 (order: 7, 524288 bytes)
[    0.985808] TCP established hash table entries: 524288 (order: 10, 4194304 bytes)
[    0.986413] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    0.986524] TCP: Hash tables configured (established 524288 bind 65536)
[    0.986606] UDP hash table entries: 32768 (order: 8, 1048576 bytes)
[    0.986747] UDP-Lite hash table entries: 32768 (order: 8, 1048576 bytes)
[    0.986991] NET: Registered protocol family 1
[    0.986996] NET: Registered protocol family 44
[    0.987085] pci 0000:01:00.1: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    0.987242] pci 0000:03:00.3: enabling device (0140 -> 0142)
[    0.987386] pci 0000:42:00.3: enabling device (0140 -> 0142)
[    0.987524] PCI: CLS 64 bytes, default 64
[    0.987566] Unpacking initramfs...
[    1.082870] Freeing initrd memory: 6988K
[    1.082876] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    1.082877] software IO TLB: mapped [mem 0x6014f000-0x6414f000] (64MB)
[    1.082916] amd_uncore: AMD NB counters detected
[    1.082921] amd_uncore: AMD LLC counters detected
[    1.084693] Initialise system trusted keyrings
[    1.084705] Key type blacklist registered
[    1.084806] workingset: timestamp_bits=40 max_order=24 bucket_order=0
[    1.085856] zbud: loaded
[    1.086619] Platform Keyring initialized
[    1.412740] Key type asymmetric registered
[    1.412741] Asymmetric key parser 'x509' registered
[    1.412754] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 247)
[    1.412834] io scheduler mq-deadline registered
[    1.419105] pcieport 0000:00:01.2: Signaling PME with IRQ 26
[    1.419130] pciehp 0000:00:01.2:pcie004: Slot #9 AttnBtn+ PwrCtrl+ MRL- AttnInd+ PwrInd+ HotPlug+ Surprise+ Interlock+ NoCompl- LLActRep+
[    1.425797] pcieport 0000:00:01.3: Signaling PME with IRQ 27
[    1.425812] pciehp 0000:00:01.3:pcie004: Slot #10 AttnBtn+ PwrCtrl+ MRL- AttnInd+ PwrInd+ HotPlug+ Surprise+ Interlock+ NoCompl- LLActRep+
[    1.430901] pcieport 0000:00:03.1: Signaling PME with IRQ 28
[    1.430918] pciehp 0000:00:03.1:pcie004: Slot #0 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise- Interlock- NoCompl+ LLActRep+
[    1.431767] pcieport 0000:00:03.3: Signaling PME with IRQ 29
[    1.432696] pcieport 0000:00:04.1: Signaling PME with IRQ 30
[    1.432887] pcieport 0000:00:07.1: Signaling PME with IRQ 31
[    1.433908] pcieport 0000:00:08.1: Signaling PME with IRQ 33
[    1.435097] pcieport 0000:40:01.1: Signaling PME with IRQ 34
[    1.435128] pciehp 0000:40:01.1:pcie004: Slot #0 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise- Interlock- NoCompl+ LLActRep+
[    1.435912] pcieport 0000:40:03.1: Signaling PME with IRQ 35
[    1.435933] pciehp 0000:40:03.1:pcie004: Slot #0 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise- Interlock- NoCompl+ LLActRep+
[    1.436206] pcieport 0000:40:07.1: Signaling PME with IRQ 36
[    1.436949] pcieport 0000:40:08.1: Signaling PME with IRQ 38
[    1.437568] pcieport 0000:80:01.1: Signaling PME with IRQ 39
[    1.437595] pciehp 0000:80:01.1:pcie004: Slot #0 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise- Interlock- NoCompl+ LLActRep+
[    1.438447] pcieport 0000:80:03.2: Signaling PME with IRQ 40
[    1.438463] pciehp 0000:80:03.2:pcie004: Slot #0 AttnBtn+ PwrCtrl+ MRL- AttnInd+ PwrInd+ HotPlug+ Surprise+ Interlock+ NoCompl- LLActRep+
[    1.439322] pcieport 0000:80:07.1: Signaling PME with IRQ 42
[    1.439576] pcieport 0000:80:08.1: Signaling PME with IRQ 44
[    1.440649] pcieport 0000:c0:01.1: Signaling PME with IRQ 45
[    1.440680] pciehp 0000:c0:01.1:pcie004: Slot #0 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise- Interlock- NoCompl+ LLActRep+
[    1.441521] pcieport 0000:c0:01.2: Signaling PME with IRQ 46
[    1.441542] pciehp 0000:c0:01.2:pcie004: Slot #0 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise- Interlock- NoCompl+ LLActRep+
[    1.442462] pcieport 0000:c0:03.1: Signaling PME with IRQ 47
[    1.442481] pciehp 0000:c0:03.1:pcie004: Slot #0 AttnBtn+ PwrCtrl+ MRL- AttnInd+ PwrInd+ HotPlug+ Surprise+ Interlock+ NoCompl- LLActRep+
[    1.442816] pcieport 0000:c0:07.1: Signaling PME with IRQ 49
[    1.443615] pcieport 0000:c0:08.1: Signaling PME with IRQ 51
[    1.443704] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    1.443718] efifb: probing for efifb
[    1.443736] efifb: framebuffer at 0xe8000000, using 3072k, total 3072k
[    1.443737] efifb: mode is 1024x768x32, linelength=4096, pages=1
[    1.443738] efifb: scrolling: redraw
[    1.443739] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    1.468977] Console: switching to colour frame buffer device 128x48
[    1.494061] fb0: EFI VGA frame buffer device
[    1.494092] Monitor-Mwait will be used to enter C-1 state
[    1.498134] ERST: Error Record Serialization Table (ERST) support is initialized.
[    1.498137] pstore: Registered erst as persistent store backend
[    1.498659] GHES: APEI firmware first mode is enabled by APEI bit and WHEA _OSC.
[    1.498732] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    1.519617] 00:02: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200) is a 16550A
[    1.540577] 00:03: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
[    1.540913] Linux agpgart interface v0.103
[    1.542167] AMD-Vi: AMD IOMMUv2 driver by Joerg Roedel <jroedel@suse.de>
[    1.542168] AMD-Vi: AMD IOMMUv2 functionality not available on this system
[    1.545434] i8042: PNP: No PS/2 controller found.
[    1.545434] i8042: Probing ports directly.
[    2.060575] i8042: Can't read CTR while initializing i8042
[    2.060838] i8042: probe of i8042 failed with error -5
[    2.060923] mousedev: PS/2 mouse device common for all mice
[    2.061089] rtc_cmos 00:00: RTC can wake from S4
[    2.061632] rtc_cmos 00:00: registered as rtc0
[    2.061645] rtc_cmos 00:00: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
[    2.062028] ledtrig-cpu: registered to indicate activity on CPUs
[    2.062773] NET: Registered protocol family 10
[    2.069364] Segment Routing with IPv6
[    2.069381] mip6: Mobile IPv6
[    2.069383] NET: Registered protocol family 17
[    2.069411] mpls_gso: MPLS GSO support
[    2.072024] microcode: CPU0: patch_level=0x08001227
[    2.072027] microcode: CPU1: patch_level=0x08001227
[    2.072108] microcode: CPU2: patch_level=0x08001227
[    2.072130] microcode: CPU3: patch_level=0x08001227
[    2.072151] microcode: CPU4: patch_level=0x08001227
[    2.072172] microcode: CPU5: patch_level=0x08001227
[    2.072194] microcode: CPU6: patch_level=0x08001227
[    2.072215] microcode: CPU7: patch_level=0x08001227
[    2.072235] microcode: CPU8: patch_level=0x08001227
[    2.072255] microcode: CPU9: patch_level=0x08001227
[    2.072277] microcode: CPU10: patch_level=0x08001227
[    2.072285] microcode: CPU11: patch_level=0x08001227
[    2.072296] microcode: CPU12: patch_level=0x08001227
[    2.072306] microcode: CPU13: patch_level=0x08001227
[    2.072318] microcode: CPU14: patch_level=0x08001227
[    2.072328] microcode: CPU15: patch_level=0x08001227
[    2.072333] microcode: CPU16: patch_level=0x08001227
[    2.072340] microcode: CPU17: patch_level=0x08001227
[    2.072346] microcode: CPU18: patch_level=0x08001227
[    2.072353] microcode: CPU19: patch_level=0x08001227
[    2.072361] microcode: CPU20: patch_level=0x08001227
[    2.072369] microcode: CPU21: patch_level=0x08001227
[    2.072377] microcode: CPU22: patch_level=0x08001227
[    2.072386] microcode: CPU23: patch_level=0x08001227
[    2.072394] microcode: CPU24: patch_level=0x08001227
[    2.072402] microcode: CPU25: patch_level=0x08001227
[    2.072409] microcode: CPU26: patch_level=0x08001227
[    2.072416] microcode: CPU27: patch_level=0x08001227
[    2.072423] microcode: CPU28: patch_level=0x08001227
[    2.072431] microcode: CPU29: patch_level=0x08001227
[    2.072439] microcode: CPU30: patch_level=0x08001227
[    2.072446] microcode: CPU31: patch_level=0x08001227
[    2.072488] microcode: Microcode Update Driver: v2.2.
[    2.072501] sched_clock: Marking stable (2072108917, 374420)->(2183411742, -110928405)
[    2.073860] registered taskstats version 1
[    2.073861] Loading compiled-in X.509 certificates
[    2.097470] tsc: Refined TSC clocksource calibration: 2395.499 MHz
[    2.097498] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x22879bb4636, max_idle_ns: 440795267109 ns
[    2.097642] clocksource: Switched to clocksource tsc
[    2.102921] Loaded X.509 cert 'Debian Secure Boot CA: 6ccece7e4c6c0d1f6149f3dd27dfcc5cbb419ea1'
[    2.102934] Loaded X.509 cert 'Debian Secure Boot Signer: 00a7468def'
[    2.102981] zswap: loaded using pool lzo/zbud
[    2.103884] pstore: Using crash dump compression: deflate
[    2.103897] AppArmor: AppArmor sha1 policy hashing enabled
[    2.105423] integrity: Loading X.509 certificate: UEFI:db
[    2.105451] integrity: Loaded X.509 cert 'Hewlett Packard Enterprise Company: HPE UEFI Secure Boot 2016 DB Key: a068bfe686eec826df935e3bb1cd36f1c2772560'
[    2.105452] integrity: Loading X.509 certificate: UEFI:db
[    2.105467] integrity: Loaded X.509 cert 'Hewlett-Packard Company: HP UEFI Secure Boot 2013 DB key: 1d7cf2c2b92673f69c8ee1ec7063967ab9b62bec'
[    2.105467] integrity: Loading X.509 certificate: UEFI:db
[    2.105485] integrity: Loaded X.509 cert 'Microsoft Corporation UEFI CA 2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
[    2.105485] integrity: Loading X.509 certificate: UEFI:db
[    2.105500] integrity: Loaded X.509 cert 'Microsoft Windows Production PCA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
[    2.105501] integrity: Loading X.509 certificate: UEFI:db
[    2.105516] integrity: Loaded X.509 cert 'SUSE Linux Enterprise Secure Boot Signkey: 3fb077b6cebc6ff2522e1c148c57c777c788e3e7'
[    2.105517] integrity: Loading X.509 certificate: UEFI:db
[    2.105555] integrity: Loaded X.509 cert 'VMware, Inc.: 4ad8ba0472073d28127706ddc6ccb9050441bbc7'
[    2.105555] integrity: Loading X.509 certificate: UEFI:db
[    2.105730] integrity: Loaded X.509 cert 'VMware, Inc.: VMware Secure Boot Signing: 04597f3e1ffb240bba0ff0f05d5eb05f3e15f6d7'
[    2.107966] rtc_cmos 00:00: setting system clock to 2019-07-18T16:46:10 UTC (1563468370)
[    2.109159] Freeing unused kernel image memory: 1580K
[    2.129679] Write protecting the kernel read-only data: 16384k
[    2.130546] Freeing unused kernel image memory: 2036K
[    2.130904] Freeing unused kernel image memory: 844K
[    2.138840] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    2.138845] Run /init as init process
[    2.227261] nvme nvme0: pci function 0000:05:00.0
[    2.227412] pcieport 0000:00:01.2: can't derive routing for PCI INT A
[    2.227414] nvme 0000:05:00.0: PCI INT A: no GSI
[    2.271783] Loading Reiser4 (format release: 4.0.2) See www.namesys.com for a description of Reiser4.
[    2.442109] nvme nvme0: missing or invalid SUBNQN field.
[    2.442138] nvme nvme0: Shutdown timeout set to 8 seconds
[    2.472983] nvme nvme0: 32/0/0 default/read/poll queues
[    2.483353]  nvme0n1: p1 p2 p3 p4 p5
[    3.316903] PM: Image not found (code -22)
[    3.335992] reiser4: nvme0n1p5: found disk format 4.0.2.
[    3.624421] reiser4: nvme0n1p5: using Hybrid Transaction Model.
[    3.683476] systemd[1]: Inserted module 'autofs4'
[    3.762624] systemd[1]: systemd 241 running in system mode. (+PAM +AUDIT +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD -IDN2 +IDN -PCRE2 default-hierarchy=hybrid)
[    3.781536] systemd[1]: Detected architecture x86-64.
[    3.803065] systemd[1]: Set hostname to <xochiquetzal>.
[    3.851265] systemd[1]: /lib/systemd/system/fail2ban.service:12: PIDFile= references path below legacy directory /var/run/, updating /var/run/fail2ban/fail2ban.pid → /run/fail2ban/fail2ban.pid; please update the unit file accordingly.
[    3.854854] systemd[1]: Listening on fsck to fsckd communication Socket.
[    3.854889] systemd[1]: Reached target Remote File Systems.
[    3.861201] systemd[1]: Created slice User and Session Slice.
[    3.861594] systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
[    3.861753] systemd[1]: Listening on Syslog Socket.
[    3.861912] systemd[1]: Listening on Journal Socket.
[    3.955003] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
[    3.955017] ACPI: Power Button [PWRB]
[    3.955141] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
[    3.955161] ACPI: Power Button [PWRF]
[    3.955988] power_meter ACPI000D:00: Found ACPI power meter.
[    3.956027] power_meter ACPI000D:00: Ignoring unsafe software power cap!
[    3.956352] power_meter ACPI000D:00: hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
[    3.957483] acpi_cpufreq: overriding BIOS provided _PSD data
[    3.966020] IPMI message handler: version 39.2
[    3.967638] acpi-tad ACPI000E:00: Unsupported capabilities
[    3.967673] ipmi device interface
[    3.970162] ipmi_si: IPMI System Interface driver
[    3.970202] ipmi_si dmi-ipmi-si.0: ipmi_platform: probing via SMBIOS
[    3.970205] ipmi_platform: ipmi_si: SMBIOS: io 0xca2 regsize 1 spacing 1 irq 0
[    3.970206] ipmi_si: Adding SMBIOS-specified kcs state machine
[    3.970249] ipmi_si IPI0001:00: ipmi_platform: probing via ACPI
[    3.970277] ipmi_si IPI0001:00: ipmi_platform: [io  0x0ca2-0x0ca3] regsize 1 spacing 1 irq 0
[    3.970278] ipmi_si dmi-ipmi-si.0: Removing SMBIOS-specified kcs state machine in favor of ACPI
[    3.970279] ipmi_si: Adding ACPI-specified kcs state machine
[    3.970400] ipmi_si: Trying ACPI-specified kcs state machine at i/o address 0xca2, slave address 0x20, irq 0
[    3.976826] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, revision 0
[    3.976829] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port selection
[    3.979442] hpwdt 0000:01:00.0: HPE Watchdog Timer Driver: NMI decoding initialized
[    3.979699] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
[    3.979964] sp5100-tco sp5100-tco: Using 0xfeb00000 for watchdog MMIO address
[    3.979970] hpwdt 0000:01:00.0: HPE Watchdog Timer Driver: Version: 2.0.2
[    3.979973] hpwdt 0000:01:00.0: timeout: 30 seconds (nowayout=0)
[    3.979974] hpwdt 0000:01:00.0: pretimeout: on.
[    3.980287] sp5100-tco sp5100-tco: initialized. heartbeat=60 sec (nowayout=0)
[    3.981806] ccp 0000:03:00.2: enabling device (0140 -> 0142)
[    3.983496] ccp 0000:03:00.2: ccp enabled
[    3.983715] ccp 0000:03:00.2: psp enabled
[    3.983717] ccp 0000:03:00.2: enabled
[    3.984128] ccp 0000:02:00.1: enabling device (0140 -> 0142)
[    3.987578] ccp 0000:02:00.1: ccp enabled
[    3.987581] ccp 0000:02:00.1: enabled
[    3.987700] ccp 0000:42:00.2: enabling device (0140 -> 0142)
[    3.988326] ACPI: bus type USB registered
[    3.988610] usbcore: registered new interface driver usbfs
[    3.988705] usbcore: registered new interface driver hub
[    3.988974] usbcore: registered new device driver usb
[    3.990488] ccp 0000:42:00.2: ccp enabled
[    3.990516] ccp 0000:42:00.2: psp enabled
[    3.990517] ccp 0000:42:00.2: enabled
[    3.992511] ccp 0000:41:00.1: enabling device (0140 -> 0142)
[    3.993107] EFI Variables Facility v0.08 2004-May-17
[    3.994716] tg3.c:v3.137 (May 11, 2014)
[    4.002050] ccp 0000:41:00.1: ccp enabled
[    4.002053] ccp 0000:41:00.1: enabled
[    4.002504] ccp 0000:82:00.2: enabling device (0140 -> 0142)
[    4.011806] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    4.012217] input: PC Speaker as /devices/platform/pcspkr/input/input2
[    4.012266] SCSI subsystem initialized
[    4.015316] ccp 0000:82:00.2: ccp enabled
[    4.015339] ccp 0000:82:00.2: psp enabled
[    4.015340] ccp 0000:82:00.2: enabled
[    4.015392] ccp 0000:81:00.1: enabling device (0140 -> 0142)
[    4.017417] ccp 0000:81:00.1: ccp enabled
[    4.017419] ccp 0000:81:00.1: enabled
[    4.017995] ccp 0000:c2:00.2: enabling device (0140 -> 0142)
[    4.018014] cryptd: max_cpu_qlen set to 1000
[    4.020870] ehci-pci: EHCI PCI platform driver
[    4.022791] ehci-pci 0000:01:00.4: EHCI Host Controller
[    4.022813] ehci-pci 0000:01:00.4: new USB bus registered, assigned bus number 1
[    4.023264] ehci-pci 0000:01:00.4: irq 85, io mem 0xe9ba4000
[    4.024864] ccp 0000:c2:00.2: ccp enabled
[    4.024885] ccp 0000:c2:00.2: psp enabled
[    4.024886] ccp 0000:c2:00.2: enabled
[    4.026964] ccp 0000:c1:00.1: enabling device (0140 -> 0142)
[    4.028311] ccp 0000:c1:00.1: ccp enabled
[    4.028312] ccp 0000:c1:00.1: enabled
[    4.032926] pstore: ignoring unexpected backend 'efi'
[    4.033232] tg3 0000:04:00.0 eth0: Tigon3 [partno(N/A) rev 5719001] (PCI Express) MAC address 20:67:7c:d6:38:98
[    4.033236] tg3 0000:04:00.0 eth0: attached PHY is 5719C (10/100/1000Base-T Ethernet) (WireSpeed[1], EEE[1])
[    4.033238] tg3 0000:04:00.0 eth0: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[1] TSOcap[1]
[    4.033240] tg3 0000:04:00.0 eth0: dma_rwctrl[00000001] dma_mask[64-bit]
[    4.033249] libata version 3.00 loaded.
[    4.038101] ahci 0000:41:00.2: version 3.0
[    4.038548] checking generic (e8000000 300000) vs hw (e8000000 1000000)
[    4.038553] fb0: switching to mgag200drmfb from EFI VGA
[    4.038671] ahci 0000:41:00.2: AHCI 0001.0301 32 slots 1 ports 6 Gbps 0x1 impl SATA mode
[    4.038676] ahci 0000:41:00.2: flags: 64bit ncq sntf ilck pm led clo only pmp fbs pio slum part 
[    4.038679] Console: switching to colour dummy device 80x25
[    4.039258] scsi host0: ahci
[    4.039259] AVX2 version of gcm_enc/dec engaged.
[    4.039261] AES CTR mode by8 optimization enabled
[    4.039864] ata1: SATA max UDMA/133 abar m4096@0xc6102000 port 0xc6102100 irq 107
[    4.040472] ccp 0000:03:00.2: firmware: failed to load amd/amd_sev_fam17h_model01h.sbin (-2)
[    4.040487] firmware_class: See https://wiki.debian.org/Firmware for information about missing firmware
[    4.040516] ccp 0000:03:00.2: firmware: failed to load amd/amd_sev_fam17h_model0xh.sbin (-2)
[    4.040540] ccp 0000:03:00.2: firmware: failed to load amd/sev.fw (-2)
[    4.045955] ehci-pci 0000:01:00.4: USB 2.0 started, EHCI 1.00
[    4.048005] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.00
[    4.048008] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    4.048010] usb usb1: Product: EHCI Host Controller
[    4.048011] usb usb1: Manufacturer: Linux 5.0.0-1+reiser4.0.2-amd64 ehci_hcd
[    4.048013] usb usb1: SerialNumber: 0000:01:00.4
[    4.048275] hub 1-0:1.0: USB hub found
[    4.048283] hub 1-0:1.0: 8 ports detected
[    4.048705] xhci_hcd 0000:03:00.3: xHCI Host Controller
[    4.048713] xhci_hcd 0000:03:00.3: new USB bus registered, assigned bus number 2
[    4.048851] xhci_hcd 0000:03:00.3: hcc params 0x0270f665 hci version 0x100 quirks 0x0000000000000410
[    4.049252] usb usb2: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.00
[    4.049255] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    4.049256] usb usb2: Product: xHCI Host Controller
[    4.049258] usb usb2: Manufacturer: Linux 5.0.0-1+reiser4.0.2-amd64 xhci-hcd
[    4.049259] usb usb2: SerialNumber: 0000:03:00.3
[    4.049655] hub 2-0:1.0: USB hub found
[    4.049664] hub 2-0:1.0: 2 ports detected
[    4.049974] xhci_hcd 0000:03:00.3: xHCI Host Controller
[    4.049979] xhci_hcd 0000:03:00.3: new USB bus registered, assigned bus number 3
[    4.049983] xhci_hcd 0000:03:00.3: Host supports USB 3.0  SuperSpeed
[    4.050002] usb usb3: We don't know the algorithms for LPM for this host, disabling LPM.
[    4.050050] usb usb3: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.00
[    4.050052] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    4.050053] usb usb3: Product: xHCI Host Controller
[    4.050055] usb usb3: Manufacturer: Linux 5.0.0-1+reiser4.0.2-amd64 xhci-hcd
[    4.050056] usb usb3: SerialNumber: 0000:03:00.3
[    4.050182] [TTM] Zone  kernel: Available graphics memory: 32895776 kiB
[    4.050183] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    4.050184] [TTM] Initializing pool allocator
[    4.050190] [TTM] Initializing DMA pool allocator
[    4.050315] hub 3-0:1.0: USB hub found
[    4.050323] hub 3-0:1.0: 2 ports detected
[    4.050776] xhci_hcd 0000:42:00.3: xHCI Host Controller
[    4.052556] xhci_hcd 0000:42:00.3: new USB bus registered, assigned bus number 4
[    4.052739] xhci_hcd 0000:42:00.3: hcc params 0x0270f665 hci version 0x100 quirks 0x0000000000000410
[    4.053139] usb usb4: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.00
[    4.053141] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    4.053143] usb usb4: Product: xHCI Host Controller
[    4.053144] usb usb4: Manufacturer: Linux 5.0.0-1+reiser4.0.2-amd64 xhci-hcd
[    4.053145] usb usb4: SerialNumber: 0000:42:00.3
[    4.053511] hub 4-0:1.0: USB hub found
[    4.053527] hub 4-0:1.0: 2 ports detected
[    4.053717] xhci_hcd 0000:42:00.3: xHCI Host Controller
[    4.053730] xhci_hcd 0000:42:00.3: new USB bus registered, assigned bus number 5
[    4.053733] xhci_hcd 0000:42:00.3: Host supports USB 3.0  SuperSpeed
[    4.053758] usb usb5: We don't know the algorithms for LPM for this host, disabling LPM.
[    4.053787] usb usb5: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.00
[    4.053789] usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    4.053790] usb usb5: Product: xHCI Host Controller
[    4.053791] usb usb5: Manufacturer: Linux 5.0.0-1+reiser4.0.2-amd64 xhci-hcd
[    4.053792] usb usb5: SerialNumber: 0000:42:00.3
[    4.054089] hub 5-0:1.0: USB hub found
[    4.054099] hub 5-0:1.0: 2 ports detected
[    4.060884] tg3 0000:04:00.1 eth1: Tigon3 [partno(N/A) rev 5719001] (PCI Express) MAC address 20:67:7c:d6:38:99
[    4.060887] tg3 0000:04:00.1 eth1: attached PHY is 5719C (10/100/1000Base-T Ethernet) (WireSpeed[1], EEE[1])
[    4.060888] tg3 0000:04:00.1 eth1: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[1] TSOcap[1]
[    4.060889] tg3 0000:04:00.1 eth1: dma_rwctrl[00000001] dma_mask[64-bit]
[    4.072200] ccp 0000:03:00.2: SEV API:0.16 build:12
[    4.079215] tg3 0000:04:00.2 eth2: Tigon3 [partno(N/A) rev 5719001] (PCI Express) MAC address 20:67:7c:d6:38:9a
[    4.079221] tg3 0000:04:00.2 eth2: attached PHY is 5719C (10/100/1000Base-T Ethernet) (WireSpeed[1], EEE[1])
[    4.079224] tg3 0000:04:00.2 eth2: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[1] TSOcap[1]
[    4.079227] tg3 0000:04:00.2 eth2: dma_rwctrl[00000001] dma_mask[64-bit]
[    4.087017] Adding 8000508k swap on /dev/nvme0n1p3.  Priority:-2 extents:1 across:8000508k SSFS
[    4.087173] fbcon: mgadrmfb (fb0) is primary device
[    4.087307] Console: switching to colour frame buffer device 128x48
[    4.145428] tg3 0000:04:00.3 eth3: Tigon3 [partno(N/A) rev 5719001] (PCI Express) MAC address 20:67:7c:d6:38:9b
[    4.145431] tg3 0000:04:00.3 eth3: attached PHY is 5719C (10/100/1000Base-T Ethernet) (WireSpeed[1], EEE[1])
[    4.145433] tg3 0000:04:00.3 eth3: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[1] TSOcap[1]
[    4.145434] tg3 0000:04:00.3 eth3: dma_rwctrl[00000001] dma_mask[64-bit]
[    4.152022] tg3 0000:04:00.1 eno2: renamed from eth1
[    4.180306] systemd-journald[421]: Received request to flush runtime journal from PID 1
[    4.195396] mgag200 0000:01:00.1: fb0: mgadrmfb frame buffer device
[    4.201940] tg3 0000:04:00.2 eno3: renamed from eth2
[    4.242003] [drm] Initialized mgag200 1.0.0 20110418 for 0000:01:00.1 on minor 0
[    4.267819] kvm: Nested Virtualization enabled
[    4.267833] kvm: Nested Paging enabled
[    4.267833] SVM: Virtual VMLOAD VMSAVE supported
[    4.267834] SVM: Virtual GIF supported
[    4.269639] MCE: In-kernel MCE decoding enabled.
[    4.271354] EDAC amd64: Node 0: DRAM ECC enabled.
[    4.271357] EDAC amd64: F17h detected (node 0).
[    4.271408] EDAC MC: UMC0 chip selects:
[    4.271409] EDAC amd64: MC: 0:     0MB 1:     0MB
[    4.271410] EDAC amd64: MC: 2: 32767MB 3: 32767MB
[    4.271411] EDAC amd64: MC: 4:     0MB 5:     0MB
[    4.271412] EDAC amd64: MC: 6:     0MB 7:     0MB
[    4.271415] EDAC MC: UMC1 chip selects:
[    4.271415] EDAC amd64: MC: 0:     0MB 1:     0MB
[    4.271416] EDAC amd64: MC: 2:     0MB 3:     0MB
[    4.271417] EDAC amd64: MC: 4:     0MB 5:     0MB
[    4.271417] EDAC amd64: MC: 6:     0MB 7:     0MB
[    4.271418] EDAC amd64: using x8 syndromes.
[    4.271418] EDAC amd64: MCT channel count: 1
[    4.271497] EDAC MC0: Giving out device to module amd64_edac controller F17h: DEV 0000:00:18.3 (INTERRUPT)
[    4.271501] EDAC amd64: Node 1: DRAM ECC disabled.
[    4.271502] EDAC amd64: ECC disabled in the BIOS or no ECC capability, module will not load.
                Either enable ECC checking or force module loading by setting 'ecc_enable_override'.
                (Note that use of the override may cause unknown side effects.)
[    4.271506] EDAC amd64: Node 2: DRAM ECC enabled.
[    4.271507] EDAC amd64: F17h detected (node 2).
[    4.271551] EDAC MC: UMC0 chip selects:
[    4.271552] EDAC amd64: MC: 0:     0MB 1:     0MB
[    4.271553] EDAC amd64: MC: 2: 32767MB 3: 32767MB
[    4.271553] EDAC amd64: MC: 4:     0MB 5:     0MB
[    4.271554] EDAC amd64: MC: 6:     0MB 7:     0MB
[    4.271556] EDAC MC: UMC1 chip selects:
[    4.271556] EDAC amd64: MC: 0:     0MB 1:     0MB
[    4.271557] EDAC amd64: MC: 2:     0MB 3:     0MB
[    4.271558] EDAC amd64: MC: 4:     0MB 5:     0MB
[    4.271558] EDAC amd64: MC: 6:     0MB 7:     0MB
[    4.271559] EDAC amd64: using x8 syndromes.
[    4.271559] EDAC amd64: MCT channel count: 1
[    4.271620] EDAC MC2: Giving out device to module amd64_edac controller F17h: DEV 0000:00:1a.3 (INTERRUPT)
[    4.271623] EDAC amd64: Node 3: DRAM ECC disabled.
[    4.271623] EDAC amd64: ECC disabled in the BIOS or no ECC capability, module will not load.
                Either enable ECC checking or force module loading by setting 'ecc_enable_override'.
                (Note that use of the override may cause unknown side effects.)
[    4.271632] EDAC PCI0: Giving out device to module amd64_edac controller EDAC PCI controller: DEV 0000:00:18.0 (POLLED)
[    4.271632] AMD64 EDAC driver v3.5.0
[    4.278038] tg3 0000:04:00.3 eno4: renamed from eth3
[    4.309725] tg3 0000:04:00.0 eno1: renamed from eth0
[    4.353496] ipmi_si IPI0001:00: The BMC does not support clearing the recv irq bit, compensating, but the BMC needs to be fixed.
[    4.389504] usb 2-2: new high-speed USB device number 2 using xhci_hcd
[    4.401463] usb 4-1: new high-speed USB device number 2 using xhci_hcd
[    4.475439] EXT4-fs (nvme0n1p4): mounting ext2 file system using the ext4 subsystem
[    4.478009] EXT4-fs (nvme0n1p4): mounted filesystem without journal. Opts: (null)
[    4.501358] ipmi_si IPI0001:00: IPMI message handler: Found new BMC (man_id: 0x00b85c, prod_id: 0x2000, dev_id: 0x13)
[    4.502057] FAT-fs (nvme0n1p2): Volume was not properly unmounted. Some data may be corrupt. Please run fsck.
[    4.521472] ata1: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    4.521846] ata1.00: ATA-10: MM2000GEFRA, HPG8, max UDMA/133
[    4.521848] ata1.00: 3907029168 sectors, multi 0: LBA48 NCQ (depth 32), AA
[    4.522089] ata1.00: configured for UDMA/133
[    4.522527] scsi 0:0:0:0: Direct-Access     ATA      MM2000GEFRA      HPG8 PQ: 0 ANSI: 5
[    4.527261] scsi 0:0:0:0: Attached scsi generic sg0 type 0
[    4.529804] sd 0:0:0:0: [sda] 3907029168 512-byte logical blocks: (2.00 TB/1.82 TiB)
[    4.529808] sd 0:0:0:0: [sda] 4096-byte physical blocks
[    4.529833] sd 0:0:0:0: [sda] Write Protect is off
[    4.529838] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    4.529869] sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[    4.540385] usb 2-2: New USB device found, idVendor=0424, idProduct=2744, bcdDevice= 2.05
[    4.540390] usb 2-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    4.540393] usb 2-2: Product: USB2744
[    4.540395] usb 2-2: Manufacturer: Microchip Tech
[    4.552380] usb 4-1: New USB device found, idVendor=0424, idProduct=2744, bcdDevice= 2.05
[    4.552385] usb 4-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    4.552387] usb 4-1: Product: USB2744
[    4.552389] usb 4-1: Manufacturer: Microchip Tech
[    4.563494]  sda: sda1
[    4.564735] sd 0:0:0:0: [sda] Attached SCSI disk
[    4.594218] hub 2-2:1.0: USB hub found
[    4.594508] hub 2-2:1.0: 4 ports detected
[    4.597969] hub 4-1:1.0: USB hub found
[    4.598254] hub 4-1:1.0: 3 ports detected
[    4.665771] usb 3-2: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
[    4.681641] usb 5-1: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
[    4.688755] usb 3-2: New USB device found, idVendor=0424, idProduct=5744, bcdDevice= 2.05
[    4.688760] usb 3-2: New USB device strings: Mfr=2, Product=3, SerialNumber=0
[    4.688762] usb 3-2: Product: USB5744
[    4.688764] usb 3-2: Manufacturer: Microchip Tech
[    4.704755] usb 5-1: New USB device found, idVendor=0424, idProduct=5744, bcdDevice= 2.05
[    4.704759] usb 5-1: New USB device strings: Mfr=2, Product=3, SerialNumber=0
[    4.704760] usb 5-1: Product: USB5744
[    4.704761] usb 5-1: Manufacturer: Microchip Tech
[    4.706217] hub 3-2:1.0: USB hub found
[    4.706500] hub 3-2:1.0: 3 ports detected
[    4.725931] hub 5-1:1.0: USB hub found
[    4.726245] hub 5-1:1.0: 2 ports detected
[    4.759299] ipmi_si IPI0001:00: IPMI kcs interface initialized
[    4.762371] ipmi_ssif: IPMI SSIF Interface driver
[    4.949504] usb 2-2.1: new high-speed USB device number 3 using xhci_hcd
[    4.953583] usb 4-1.3: new high-speed USB device number 3 using xhci_hcd
[    5.050516] usb 2-2.1: New USB device found, idVendor=0424, idProduct=2660, bcdDevice= 8.01
[    5.050520] usb 2-2.1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    5.056382] usb 4-1.3: New USB device found, idVendor=0424, idProduct=2740, bcdDevice= 2.00
[    5.056386] usb 4-1.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    5.056389] usb 4-1.3: Product: Hub Controller
[    5.056391] usb 4-1.3: Manufacturer: Microchip Tech
[    5.106215] hub 2-2.1:1.0: USB hub found
[    5.106508] hub 2-2.1:1.0: 2 ports detected
[    5.185496] usb 2-2.4: new high-speed USB device number 4 using xhci_hcd
[    5.288382] usb 2-2.4: New USB device found, idVendor=0424, idProduct=2740, bcdDevice= 2.00
[    5.288387] usb 2-2.4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    5.288389] usb 2-2.4: Product: Hub Controller
[    5.288391] usb 2-2.4: Manufacturer: Microchip Tech
[    8.200316] tg3 0000:04:00.0 eno1: Link is up at 1000 Mbps, full duplex
[    8.200327] tg3 0000:04:00.0 eno1: Flow control is off for TX and off for RX
[    8.200331] tg3 0000:04:00.0 eno1: EEE is disabled
[    8.200358] IPv6: ADDRCONF(NETDEV_CHANGE): eno1: link becomes ready
[16544.715164] JFS: nTxBlock = 8192, nTxLock = 65536
[17354.078705]  sda: sda1
[17514.874311]  sda:
[17518.093014]  sda:
[17522.049683]  sda:
[17562.781178]  sda: sda1
[17571.918916]  sda: sda1
[20252.640415] reiser4: sda1: found disk format 4.0.2.
[20332.118965] reiser4: sda1: using Hybrid Transaction Model.
[376122.658137] perf: interrupt took too long (2505 > 2500), lowering kernel.perf_event_max_sample_rate to 79750
[535664.359887] perf: interrupt took too long (3162 > 3131), lowering kernel.perf_event_max_sample_rate to 63250


Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Stretch w/ Linux 5.0.15 AMD64
---------------------------------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-------------------------------------------------------------------------------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/
