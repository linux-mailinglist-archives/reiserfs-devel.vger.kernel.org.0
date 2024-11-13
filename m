Return-Path: <reiserfs-devel+bounces-162-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCDB9C7A23
	for <lists+reiserfs-devel@lfdr.de>; Wed, 13 Nov 2024 18:44:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67FD7B245AF
	for <lists+reiserfs-devel@lfdr.de>; Wed, 13 Nov 2024 16:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62BA816DEA2;
	Wed, 13 Nov 2024 16:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OVgbwQVo"
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3381632E5
	for <reiserfs-devel@vger.kernel.org>; Wed, 13 Nov 2024 16:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731516808; cv=none; b=TD26Zng2O4TSlMOe1lPTH81+Ey38ETO2N3NusQ0PJKMtk/6o4lIbz2Xip37oUiNPRH0X8KRGtisRB5r7PUVbb6S0uri4dEb7+X4CmM+cl7UTsslc89fYZ66WZu9qZcgwcZlPbjyciRQs7wStvj0sr6/vCdGsvTEJELn8MfSZqmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731516808; c=relaxed/simple;
	bh=dQj2ROcRnR04bbKden8dl8nK5tnDNpo6/bNE+GV7u4I=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kVZTkTbkJj6yJEVccyfZKoAtCSo5I11/SS7uQhzwcuaGBVK2K/wBEgBRUtdqgbmxhDU+OhgtZLAtMy5ooMDlf7jQ6I4wpmVIQt2ijCE8dloz0rItBSz75bqXbhdAkQp8sn/OdMc2lf6VftAYtNG7JrndZVyRK50lRU8pth9xV6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OVgbwQVo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C64BCC4CECF
	for <reiserfs-devel@vger.kernel.org>; Wed, 13 Nov 2024 16:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731516805;
	bh=dQj2ROcRnR04bbKden8dl8nK5tnDNpo6/bNE+GV7u4I=;
	h=From:To:Subject:Date:From;
	b=OVgbwQVo+EULhULHZhyqU/GItmAihmZ9547yzSMQg3GbZFEo24+uJ8yGdR3l+h9iI
	 APWNq5z+vlmJ0ARZL9PegqW0Y2xUe7sCfWkCAHtW7eb2Pqs/4r0QUuE/l+wwwBrQ6g
	 WUsZ3VRxaEjKGKwnsM+IVZy5QAsEckA5+AVKunRsdjChKo4rJxpCi6qKcmZMnBxiuY
	 ky3S9hTYdXOYbU4Z+5kvGnREiYwRy4GaTtxu2CB3PGHHSHr3YEYaE9AxLRDSUrOyI2
	 SsJkIVSQs/ryAKj/tZyuWk7MZVTT/lUHCoMUzWNERQHG+tAzpS/0M8N2VclP4ONbiO
	 i0QsM7HTnEo1A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B6A1BCAB781; Wed, 13 Nov 2024 16:53:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: reiserfs-devel@vger.kernel.org
Subject: [Bug 219497] New: stress-ng file size stressor causes reiserfs panic
Date: Wed, 13 Nov 2024 16:53:25 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: File System
X-Bugzilla-Component: ReiserFS
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: colin.i.king@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: reiserfs-devel@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-219497-695@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D219497

            Bug ID: 219497
           Summary: stress-ng file size stressor causes reiserfs panic
           Product: File System
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: ReiserFS
          Assignee: reiserfs-devel@vger.kernel.org
          Reporter: colin.i.king@gmail.com
        Regression: No

Kernel: Linux 6.12.0-rc7, x86-64

Running current stress-ng fsize stressor I triggered a reiserfs panic:

git clone https://github.com/ColinIanKing/stress-ng
cd stress-ng
make clean; make -j 8

run:

stress-ng --fsize 8 --temp-path ${PATH_TO_REISERFS_FILESYSTEM}

[18798.636806] CPU: 5 UID: 0 PID: 2696180 Comm: stress-ng-fsize Tainted: G=
=20=20=20=20=20
  W          6.12.0-rc7+ #12
[18798.636836] Tainted: [W]=3DWARN
[18798.636838] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
2024.02-2 03/11/2024
[18798.636840] Call Trace:
[18798.897269]  <TASK>
[18798.897290]  dump_stack_lvl+0xad/0x100
[18798.897321]  dump_stack+0x13/0x1f
[18798.897331]  __reiserfs_panic+0x77/0x90 [reiserfs]
[18798.897462]  check_internal_node+0x170/0x170 [reiserfs]
[18798.897543]  do_balance+0x2ed/0x880 [reiserfs]
[18798.897622]  ? fix_nodes+0xa8f/0x21f0 [reiserfs]
[18798.897712]  reiserfs_paste_into_item+0x5ab/0x820 [reiserfs]
[18798.897895]  reiserfs_get_block+0xa3c/0x1c10 [reiserfs]
[18798.898001]  __block_write_begin_int+0x185/0x940
[18799.068215]  ? __pfx_reiserfs_get_block+0x10/0x10 [reiserfs]
[18799.068330]  __block_write_begin+0x15/0x30
[18799.072085]  reiserfs_write_begin+0x14e/0x360 [reiserfs]
[18799.072207]  generic_perform_write+0x119/0x3b0
[18799.075953]  __generic_file_write_iter+0xf8/0x150
[18799.082804]  generic_file_write_iter+0x86/0x150
[18799.082835]  vfs_write+0x29b/0x6e0
[18799.082855]  ksys_write+0x81/0x190
[18799.082868]  __x64_sys_write+0x1d/0x30
[18799.082879]  x64_sys_call+0x2e55/0x40b0
[18799.082889]  do_syscall_64+0xc9/0x270
[18799.082909]  ? arch_exit_to_user_mode_prepare.isra.0+0x2a/0xf0
[18799.082926]  ? syscall_exit_to_user_mode+0x84/0x3b0
[18799.082940]  ? do_syscall_64+0xdd/0x270
[18799.082950]  ? aa_file_perm+0x1eb/0x760
[18799.083009]  ? common_file_perm+0x7e/0x210
[18799.083019]  ? arch_exit_to_user_mode_prepare.isra.0+0x2a/0xf0
[18799.083035]  ? apparmor_file_permission+0x20/0x30
[18799.083045]  ? security_file_permission+0xdd/0x280
[18799.083057]  ? vfs_fallocate+0xa4/0x590
[18799.083070]  ? ksys_fallocate+0x4e/0xb0
[18799.083081]  ? arch_exit_to_user_mode_prepare.isra.0+0x2a/0xf0
[18799.083095]  ? syscall_exit_to_user_mode+0x84/0x3b0
[18799.083108]  ? do_syscall_64+0xdd/0x270
[18799.083118]  ? ksys_lseek+0x8f/0x110
[18799.083126]  ? arch_exit_to_user_mode_prepare.isra.0+0x2a/0xf0
[18799.083140]  ? syscall_exit_to_user_mode+0x84/0x3b0
[18799.083152]  ? do_syscall_64+0xdd/0x270
[18799.083162]  ? clear_bhb_loop+0x45/0xa0
[18799.083176]  ? clear_bhb_loop+0x45/0xa0
[18799.083187]  ? clear_bhb_loop+0x45/0xa0
[18799.083199]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[18799.083212] RIP: 0033:0x7f411390fd90
[18799.083280] Code: 10 0e 00 64 c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e =
0f
1f 84 00 00 00 00 00 80 3d d9 92 0e 00 00 74 17 b8 01 00 00 00 0f 05 <48> 3=
d 00
f0 ff ff 77 58 c3 0f 1f 80 00 00 00 00 48 83 ec 28 48 89
[18799.083290] RSP: 002b:00007ffe4f0181b8 EFLAGS: 00000202 ORIG_RAX:
0000000000000001
[18799.083304] RAX: ffffffffffffffda RBX: 0000000000000001 RCX:
00007f411390fd90
[18799.083312] RDX: 0000000000000001 RSI: 00007ffe4f0181c0 RDI:
0000000000000004
[18799.083318] RBP: 0000000000000004 R08: 0000000000000000 R09:
0000000000000000
[18799.083324] R10: 0000000000000001 R11: 0000000000000202 R12:
00007ffe4f0181c0
[18799.083331] R13: 0000000000000000 R14: 00000000fffffffe R15:
0000000000000000
[18799.083347]  </TASK>
[18799.083552] REISERFS panic: assertion failure check_internal_node: (!(!b=
h))
at fs/reiserfs/do_balan.c:1616:check_internal_node: PAP-12336: bh =3D=3D 0

[18799.083627] ------------[ cut here ]------------
[18799.083635] kernel BUG at fs/reiserfs/prints.c:390!
[18799.084818] Oops: invalid opcode: 0000 [#1] PREEMPT SMP PTI
[18799.085491] CPU: 5 UID: 0 PID: 2696180 Comm: stress-ng-fsize Tainted: G=
=20=20=20=20=20
  W          6.12.0-rc7+ #12
[18799.086230] Tainted: [W]=3DWARN
[18799.086935] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
2024.02-2 03/11/2024
[18799.087700] RIP: 0010:__reiserfs_panic.cold+0x35/0x9d [reiserfs]
[18799.088577] Code: 74 68 48 c7 c2 9f 00 0e c3 49 c7 c0 60 21 0a c3 4c 89 =
e9
4c 89 e6 48 c7 c7 e2 00 0e c3 e8 bb 79 19 d5 48 83 05 7b d3 01 00 01 <0f> 0=
b 48
83 05 49 d3 01 00 01 4d 85 e4 74 45 48 c7 c1 9f 00 0e c3
[18799.090262] RSP: 0018:ffffbcf04478f430 EFLAGS: 00010202
[18799.090525] RAX: 0000000000000087 RBX: 0000000000000000 RCX:
0000000000000000
[18799.090798] RDX: 0000000000000000 RSI: ffff9d7939ca18c0 RDI:
ffff9d7939ca18c0
[18799.091073] RBP: ffffbcf04478f498 R08: 0000000000000000 R09:
ffffbcf04478f238
[18799.091355] R10: ffffffff99786bb8 R11: 3a63696e61702053 R12:
ffffffffc30df27a
[18799.091642] R13: ffffffffc30d01f0 R14: ffff9d77c14b0000 R15:
0000000000000070
[18799.091939] FS:  00007f4110926000(0000) GS:ffff9d7939c80000(0000)
knlGS:0000000000000000
[18799.092244] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[18799.092552] CR2: 00007f4110925be8 CR3: 0000000226664001 CR4:
0000000000372ef0
[18799.092877] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[18799.093200] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[18799.093524] Call Trace:
[18799.093856]  <TASK>
[18799.094183]  ? show_regs.cold+0x21/0x2f
[18799.094503]  ? __die_body+0x22/0xa0
[18799.094843]  ? __die+0x33/0x43
[18799.095160]  ? die+0x3a/0x80
[18799.095482]  ? do_trap+0x10a/0x140
[18799.095811]  ? do_error_trap+0xb1/0x100
[18799.096152]  ? __reiserfs_panic.cold+0x35/0x9d [reiserfs]
[18799.096501]  ? exc_invalid_op+0x64/0x80
[18799.096831]  ? __reiserfs_panic.cold+0x35/0x9d [reiserfs]
[18799.097184]  ? asm_exc_invalid_op+0x16/0x20
[18799.097519]  ? __reiserfs_panic.cold+0x35/0x9d [reiserfs]
[18799.097889]  check_internal_node+0x170/0x170 [reiserfs]
[18799.098248]  do_balance+0x2ed/0x880 [reiserfs]
[18799.098613]  ? fix_nodes+0xa8f/0x21f0 [reiserfs]
[18799.098990]  reiserfs_paste_into_item+0x5ab/0x820 [reiserfs]
[18799.099385]  reiserfs_get_block+0xa3c/0x1c10 [reiserfs]
[18799.099778]  __block_write_begin_int+0x185/0x940
[18799.100143]  ? __pfx_reiserfs_get_block+0x10/0x10 [reiserfs]
[18799.100536]  __block_write_begin+0x15/0x30
[18799.100917]  reiserfs_write_begin+0x14e/0x360 [reiserfs]
[18799.101319]  generic_perform_write+0x119/0x3b0
[18799.101687]  __generic_file_write_iter+0xf8/0x150
[18799.102062]  generic_file_write_iter+0x86/0x150
[18799.102435]  vfs_write+0x29b/0x6e0
[18799.102816]  ksys_write+0x81/0x190
[18799.103193]  __x64_sys_write+0x1d/0x30
[18799.103572]  x64_sys_call+0x2e55/0x40b0
[18799.103958]  do_syscall_64+0xc9/0x270
[18799.104350]  ? arch_exit_to_user_mode_prepare.isra.0+0x2a/0xf0
[18799.104732]  ? syscall_exit_to_user_mode+0x84/0x3b0
[18799.105122]  ? do_syscall_64+0xdd/0x270
[18799.105478]  ? aa_file_perm+0x1eb/0x760
[18799.105836]  ? common_file_perm+0x7e/0x210
[18799.106178]  ? arch_exit_to_user_mode_prepare.isra.0+0x2a/0xf0
[18799.106522]  ? apparmor_file_permission+0x20/0x30
[18799.106855]  ? security_file_permission+0xdd/0x280
[18799.107179]  ? vfs_fallocate+0xa4/0x590
[18799.107479]  ? ksys_fallocate+0x4e/0xb0
[18799.107780]  ? arch_exit_to_user_mode_prepare.isra.0+0x2a/0xf0
[18799.108080]  ? syscall_exit_to_user_mode+0x84/0x3b0
[18799.108377]  ? do_syscall_64+0xdd/0x270
[18799.108669]  ? ksys_lseek+0x8f/0x110
[18799.108963]  ? arch_exit_to_user_mode_prepare.isra.0+0x2a/0xf0
[18799.109255]  ? syscall_exit_to_user_mode+0x84/0x3b0
[18799.109541]  ? do_syscall_64+0xdd/0x270
[18799.109827]  ? clear_bhb_loop+0x45/0xa0
[18799.110108]  ? clear_bhb_loop+0x45/0xa0
[18799.110390]  ? clear_bhb_loop+0x45/0xa0
[18799.110652]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[18799.110924] RIP: 0033:0x7f411390fd90
[18799.111224] Code: 10 0e 00 64 c7 00 16 00 00 00 b8 ff ff ff ff c3 66 2e =
0f
1f 84 00 00 00 00 00 80 3d d9 92 0e 00 00 74 17 b8 01 00 00 00 0f 05 <48> 3=
d 00
f0 ff ff 77 58 c3 0f 1f 80 00 00 00 00 48 83 ec 28 48 89
[18799.111797] RSP: 002b:00007ffe4f0181b8 EFLAGS: 00000202 ORIG_RAX:
0000000000000001
[18799.112095] RAX: ffffffffffffffda RBX: 0000000000000001 RCX:
00007f411390fd90
[18799.112396] RDX: 0000000000000001 RSI: 00007ffe4f0181c0 RDI:
0000000000000004
[18799.112699] RBP: 0000000000000004 R08: 0000000000000000 R09:
0000000000000000
[18799.113005] R10: 0000000000000001 R11: 0000000000000202 R12:
00007ffe4f0181c0
[18799.113305] R13: 0000000000000000 R14: 00000000fffffffe R15:
0000000000000000
[18799.113608]  </TASK>
[18799.113907] Modules linked in: reiserfs overlay nilfs2 minix jfs
nls_ucs2_utils nls_utf8 hfsplus hfs f2fs crc32_generic exfat quota_v2
quota_tree ext4 jbd2 xxhash_generic bfs snd_seq_dummy bcachefs lz4hc_compre=
ss
lz4_compress cuse vhost_net tap nvram uinput ppp_generic slhc uhid
vfio_iommu_type1 vfio tun vhost_vsock vhost vhost_iotlb hci_vhci bluetooth
rfkill crc16 snd_seq snd_seq_device loop binfmt_misc nls_ascii nls_cp437 vf=
at
fat ext2 mbcache intel_rapl_msr intel_rapl_common intel_pmc_core intel_vsec
pmt_telemetry pmt_class kvm_intel kvm rapl snd_hda_codec_generic snd_hda_in=
tel
snd_intel_dspcfg snd_intel_sdw_acpi ppdev snd_hda_codec snd_intel8x0
snd_hda_core snd_ac97_codec snd_hwdep ac97_bus snd_pcm iTCO_wdt pcspkr
virtio_gpu intel_pmc_bxt iTCO_vendor_support pktcdvd snd_timer watchdog
virtio_dma_buf vmw_vsock_virtio_transport drm_shmem_helper snd parport_pc
virtio_balloon soundcore drm_kms_helper virtio_console parport joydev evdev
button serio_raw sg drm fuse efi_pstore nfnetlink vsock_loopback
[18799.114006]  vmw_vsock_virtio_transport_common vmw_vsock_vmci_transport
vsock vmw_vmci efivarfs qemu_fw_cfg virtio_rng ip_tables x_tables autofs4 x=
fs
btrfs blake2b_generic xor raid6_pq libcrc32c crc32c_generic dm_crypt dm_mod
hid_generic usbhid uas hid usb_storage crct10dif_pclmul crc32_pclmul sr_mod
ahci crc32c_intel sd_mod cdrom libahci polyval_clmulni xhci_pci virtio_net
polyval_generic libata ghash_clmulni_intel xhci_hcd net_failover virtio_scsi
virtio_blk failover sha512_ssse3 scsi_mod sha256_ssse3 psmouse usbcore
virtio_pci i2c_i801 sha1_ssse3 lpc_ich scsi_common i2c_smbus
virtio_pci_legacy_dev virtio_pci_modern_dev virtio usb_common virtio_ring
floppy aesni_intel gf128mul crypto_simd cryptd
[18799.118487] ---[ end trace 0000000000000000 ]---
[18800.082779] clocksource: Long readout interval, skipping watchdog check:
cs_nsec: 1092933508 wd_nsec: 1092933747
[18800.084807] RIP: 0010:__reiserfs_panic.cold+0x35/0x9d [reiserfs]
[18800.085543] Code: 74 68 48 c7 c2 9f 00 0e c3 49 c7 c0 60 21 0a c3 4c 89 =
e9
4c 89 e6 48 c7 c7 e2 00 0e c3 e8 bb 79 19 d5 48 83 05 7b d3 01 00 01 <0f> 0=
b 48
83 05 49 d3 01 00 01 4d 85 e4 74 45 48 c7 c1 9f 00 0e c3
[18800.086431] RSP: 0018:ffffbcf04478f430 EFLAGS: 00010202
[18800.086866] RAX: 0000000000000087 RBX: 0000000000000000 RCX:
0000000000000000
[18800.087292] RDX: 0000000000000000 RSI: ffff9d7939ca18c0 RDI:
ffff9d7939ca18c0
[18800.087711] RBP: ffffbcf04478f498 R08: 0000000000000000 R09:
ffffbcf04478f238
[18800.088140] R10: ffffffff99786bb8 R11: 3a63696e61702053 R12:
ffffffffc30df27a
[18800.088661] R13: ffffffffc30d01f0 R14: ffff9d77c14b0000 R15:
0000000000000070
[18800.089166] FS:  00007f4110926000(0000) GS:ffff9d7939c80000(0000)
knlGS:0000000000000000
[18800.089605] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[18800.090085] CR2: 00007f4110925be8 CR3: 0000000226664001 CR4:
0000000000372ef0
[18800.090524] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[18800.090973] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=

