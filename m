Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72C762D37B
	for <lists+reiserfs-devel@lfdr.de>; Wed, 29 May 2019 03:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbfE2BqN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 28 May 2019 21:46:13 -0400
Received: from mail.wl.linuxfoundation.org ([198.145.29.98]:50764 "EHLO
        mail.wl.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725805AbfE2BqM (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 28 May 2019 21:46:12 -0400
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
        by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 79A0A28721
        for <reiserfs-devel@vger.kernel.org>; Wed, 29 May 2019 01:46:11 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
        id 69A3028783; Wed, 29 May 2019 01:46:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
        pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS autolearn=ham version=3.3.1
From:   bugzilla-daemon@bugzilla.kernel.org
To:     reiserfs-devel@vger.kernel.org
Subject: [Bug 203749] New: Reiserfs: kernel BUG at fs/reiserfs/prints.c:390!
Date:   Wed, 29 May 2019 01:46:10 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: File System
X-Bugzilla-Component: ReiserFS
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: midwinter1993@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: reiserfs-devel@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-203749-695@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=203749

            Bug ID: 203749
           Summary: Reiserfs: kernel BUG at fs/reiserfs/prints.c:390!
           Product: File System
           Version: 2.5
    Kernel Version: 5.1.3
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: ReiserFS
          Assignee: reiserfs-devel@vger.kernel.org
          Reporter: midwinter1993@gmail.com
        Regression: No

Created attachment 282999
  --> https://bugzilla.kernel.org/attachment.cgi?id=282999&action=edit
Crafted image

When mounting the crafted image (in the attached file), a kernel bug occurred.
Tested under kernel-5.1.3.

Reproduce

1. download image.tar.gz
2. uncompress it:
  > tar -xzvf image.tar.gz

3. mount it:
  > mkdir dd
  > mount bingo.img dd

4. check result:
  > dmesg

--- Core dump ---
```
[   47.197126] REISERFS (device loop0): found reiserfs format "3.6" with
standard journal
[   47.198331] REISERFS warning (device loop0):  reiserfs_fill_super:
CONFIG_REISERFS_CHECK is set ON
[   47.199625] REISERFS warning (device loop0):  reiserfs_fill_super: - it is
slow mode for debugging.
[   47.200903] REISERFS (device loop0): using ordered data mode
[   47.201507] reiserfs: using flush barriers
[   47.202886] REISERFS (device loop0): journal params: device loop0, size
8192, journal first block 18, max trans len 1024, max batch 900, max commit age
30, max trans age 30
[   47.205342] REISERFS (device loop0): checking transaction log (loop0)
[   47.257453] REISERFS (device loop0): Using r5 hash to sort names
[   47.258473] CPU: 1 PID: 2025 Comm: mount Not tainted 5.1.3 #4
[   47.259286] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   47.260646] Call Trace:
[   47.261030]  dump_stack+0x79/0xae
[   47.261517]  __reiserfs_panic+0x64/0x80
[   47.262074]  direntry_create_vi+0x4a0/0x4a0
[   47.262700]  create_virtual_node+0x2b3/0xc20
[   47.263307]  fix_nodes+0x1a35/0x36c0
[   47.263841]  reiserfs_insert_item+0x290/0x580
[   47.264472]  reiserfs_new_inode+0x69a/0xe20
[   47.265069]  ? selinux_determine_inode_label+0xb1/0x140
[   47.265825]  reiserfs_mkdir+0x216/0x3c0
[   47.266387]  reiserfs_xattr_init+0x1e6/0x350
[   47.266996]  reiserfs_fill_super+0xfd6/0x1580
[   47.267626]  mount_bdev+0x217/0x260
[   47.268111]  ? finish_unfinished+0x820/0x820
[   47.268719]  legacy_get_tree+0x2b/0x90
[   47.269256]  vfs_get_tree+0x2e/0x140
[   47.269776]  do_mount+0xc3d/0x1610
[   47.270264]  ? copy_mount_options+0x1b5/0x2c0
[   47.270883]  ksys_mount+0xd7/0x150
[   47.271372]  __x64_sys_mount+0x22/0x30
[   47.271908]  do_syscall_64+0x75/0x1d0
[   47.272449]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   47.273176] RIP: 0033:0x7f7e3c5e148a
[   47.273688] Code: 48 8b 0d 11 fa 2a 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e
0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d de f9 2a 00 f7 d8 64 89 01 48
[   47.275644] RSP: 002b:00007ffd256e66a8 EFLAGS: 00000202 ORIG_RAX:
00000000000000a5
[   47.276707] RAX: ffffffffffffffda RBX: 0000557c9a4a8500 RCX:
00007f7e3c5e148a
[   47.277705] RDX: 0000557c9a4aaba0 RSI: 0000557c9a4aa3a0 RDI:
0000557c9a4aedf0
[   47.278712] RBP: 0000000000000000 R08: 0000000000000000 R09:
0000000000000020
[   47.279711] R10: 00000000c0ed0000 R11: 0000000000000202 R12:
0000557c9a4aedf0
[   47.280727] R13: 0000557c9a4aaba0 R14: 0000000000000000 R15:
00000000ffffffff
[   47.281810] REISERFS panic: vs-8025 direntry_create_vi: (mode==i,
insert_size==68), invalid length of directory item
[   47.283310] ------------[ cut here ]------------
[   47.283965] kernel BUG at fs/reiserfs/prints.c:390!
[   47.284678] invalid opcode: 0000 [#1] SMP PTI
[   47.285300] CPU: 1 PID: 2025 Comm: mount Not tainted 5.1.3 #4
[   47.286113] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   47.287445] RIP: 0010:__reiserfs_panic.cold+0x37/0x8a
[   47.288164] Code: 85 ed 74 6d e8 8c 0a df ff 4c 89 f1 4c 89 e2 4c 89 ee 49
c7 c0 e0 45 7d ba 48 c7 c7 c1 49 c8 b9 e8 53 f1 d6 ff e8 6b 0a df ff <0f> 0b e8
64 0a df ff 49 c7 c4 5e 50 d3 b9 4d 85 ed 75 0a 49 c7 c4
[   47.290758] RSP: 0018:ffffb4230041b4e0 EFLAGS: 00010293
[   47.291500] RAX: ffff96a7f1400c40 RBX: 0000000000000000 RCX:
ffffffffb8588175
[   47.292497] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
0000000000000001
[   47.293499] RBP: ffffb4230041b550 R08: ffff96a7f1400c40 R09:
0000000000000068
[   47.294267] R10: ffffffffba1e1050 R11: ffffb4230041afc0 R12:
ffffffffb9d3505e
[   47.295260] R13: ffffffffb9c8abd6 R14: ffffffffb9a2cd60 R15:
0000000000000060
[   47.296275] FS:  00007f7e3cf26e40(0000) GS:ffff96a7fdb00000(0000)
knlGS:0000000000000000
[   47.297458] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   47.298359] CR2: 0000557c11ec0878 CR3: 0000000070e3a000 CR4:
00000000000006e0
[   47.299357] Call Trace:
[   47.299719]  direntry_create_vi+0x4a0/0x4a0
[   47.300316]  create_virtual_node+0x2b3/0xc20
[   47.300923]  fix_nodes+0x1a35/0x36c0
[   47.301435]  reiserfs_insert_item+0x290/0x580
[   47.302062]  reiserfs_new_inode+0x69a/0xe20
[   47.302659]  ? selinux_determine_inode_label+0xb1/0x140
[   47.303397]  reiserfs_mkdir+0x216/0x3c0
[   47.303944]  reiserfs_xattr_init+0x1e6/0x350
[   47.304549]  reiserfs_fill_super+0xfd6/0x1580
[   47.305168]  mount_bdev+0x217/0x260
[   47.305667]  ? finish_unfinished+0x820/0x820
[   47.306281]  legacy_get_tree+0x2b/0x90
[   47.306818]  vfs_get_tree+0x2e/0x140
[   47.307180]  do_mount+0xc3d/0x1610
[   47.307512]  ? copy_mount_options+0x1b5/0x2c0
[   47.307929]  ksys_mount+0xd7/0x150
[   47.308259]  __x64_sys_mount+0x22/0x30
[   47.308626]  do_syscall_64+0x75/0x1d0
[   47.308987]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   47.309479] RIP: 0033:0x7f7e3c5e148a
[   47.309996] Code: 48 8b 0d 11 fa 2a 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e
0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d de f9 2a 00 f7 d8 64 89 01 48
[   47.312597] RSP: 002b:00007ffd256e66a8 EFLAGS: 00000202 ORIG_RAX:
00000000000000a5
[   47.313661] RAX: ffffffffffffffda RBX: 0000557c9a4a8500 RCX:
00007f7e3c5e148a
[   47.314667] RDX: 0000557c9a4aaba0 RSI: 0000557c9a4aa3a0 RDI:
0000557c9a4aedf0
[   47.315670] RBP: 0000000000000000 R08: 0000000000000000 R09:
0000000000000020
[   47.316676] R10: 00000000c0ed0000 R11: 0000000000000202 R12:
0000557c9a4aedf0
[   47.317685] R13: 0000557c9a4aaba0 R14: 0000000000000000 R15:
00000000ffffffff
[   47.318439] Modules linked in:
[   47.318768] Dumping ftrace buffer:
[   47.319127]    (ftrace buffer empty)
[   47.319548] ---[ end trace 9addae312bf755ec ]---
[   47.320052] RIP: 0010:__reiserfs_panic.cold+0x37/0x8a
[   47.320579] Code: 85 ed 74 6d e8 8c 0a df ff 4c 89 f1 4c 89 e2 4c 89 ee 49
c7 c0 e0 45 7d ba 48 c7 c7 c1 49 c8 b9 e8 53 f1 d6 ff e8 6b 0a df ff <0f> 0b e8
64 0a df ff 49 c7 c4 5e 50 d3 b9 4d 85 ed 75 0a 49 c7 c4
[   47.322733] RSP: 0018:ffffb4230041b4e0 EFLAGS: 00010293
[   47.323451] RAX: ffff96a7f1400c40 RBX: 0000000000000000 RCX:
ffffffffb8588175
[   47.324295] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
0000000000000001
[   47.324968] RBP: ffffb4230041b550 R08: ffff96a7f1400c40 R09:
0000000000000068
[   47.325649] R10: ffffffffba1e1050 R11: ffffb4230041afc0 R12:
ffffffffb9d3505e
[   47.326650] R13: ffffffffb9c8abd6 R14: ffffffffb9a2cd60 R15:
0000000000000060
[   47.327629] FS:  00007f7e3cf26e40(0000) GS:ffff96a7fdb00000(0000)
knlGS:0000000000000000
[   47.328737] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   47.329535] CR2: 0000557c11ec0878 CR3: 0000000070e3a000 CR4:
00000000000006e0
[   47.330515] Kernel panic - not syncing: Fatal exception
[   47.331466] Dumping ftrace buffer:
[   47.331929]    (ftrace buffer empty)
[   47.332413] Kernel Offset: 0x37200000 from 0xffffffff81000000 (relocation
range: 0xffffffff80000000-0xffffffffbfffffff)
```

-- 
You are receiving this mail because:
You are the assignee for the bug.
