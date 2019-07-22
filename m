Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4822A6F705
	for <lists+reiserfs-devel@lfdr.de>; Mon, 22 Jul 2019 03:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbfGVBqp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sun, 21 Jul 2019 21:46:45 -0400
Received: from mail.wl.linuxfoundation.org ([198.145.29.98]:40198 "EHLO
        mail.wl.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726314AbfGVBqp (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 21 Jul 2019 21:46:45 -0400
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
        by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 0BA5F284E9
        for <reiserfs-devel@vger.kernel.org>; Mon, 22 Jul 2019 01:46:44 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
        id F403C284F5; Mon, 22 Jul 2019 01:46:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
        pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS autolearn=unavailable version=3.3.1
From:   bugzilla-daemon@bugzilla.kernel.org
To:     reiserfs-devel@vger.kernel.org
Subject: [Bug 204265] New: kernel BUG at fs/reiserfs/journal.c:3035!
Date:   Mon, 22 Jul 2019 01:46:42 +0000
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
 priority component assigned_to reporter cf_regression
Message-ID: <bug-204265-695@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=204265

            Bug ID: 204265
           Summary: kernel BUG at fs/reiserfs/journal.c:3035!
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

The following script and program manifest a bug in reiserfs.

--- script ---

```
#!/bin/bash

DISK=bingo.img
MOUNT_DIR=/root/mnt

dd if=/dev/zero of=$DISK bs=1M count=178
mkfs.reiserfs -s 789 -o 137 -t 92 -b 1024 -h rupasov -f -q $DISK


mkdir -pv $MOUNT_DIR

mount $DISK $MOUNT_DIR -o
"acl,conv,nolog,notail,user_xattr,block-allocator=no_unhashed_relocation"

gcc -static bingo.c
./a.out

umount $MOUNT_DIR

```

--- bingo.c ---

```
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <stddef.h>
#include <unistd.h>

#include <sys/mount.h>
#include <sys/stat.h>
#include <fcntl.h>

char buf[4096*20] = {'a'};

int main() {
    mkdir("/root/mnt/a", S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);
    mkdir("/root/mnt/a/b", S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);
    mkdir("/root/mnt/a/b/c", S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);
    rename("/root/mnt/a/b", "/root/mnt/e");
    mkdir("/root/mnt/e/c/f", S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);
    mkdir("/root/mnt/e/c/f/g", S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);
    creat("/root/mnt/e/c/f/g/h", S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);
    int fd = open("/root/mnt/e/c/f/g/h", O_RDWR);
    system("rm -rf /root/mnt/e/c/f/*");
    sync();
    write(fd, buf, 57344);
    return 0;
}
```

--- Core dump ---

[   20.181673] REISERFS (device loop0): found reiserfs format "3.6" with
non-standard journal
[   20.183048] REISERFS warning (device loop0):  reiserfs_fill_super:
CONFIG_REISERFS_CHECK is set ON
[   20.184419] REISERFS warning (device loop0):  reiserfs_fill_super: - it is
slow mode for debugging.
[   20.185765] REISERFS (device loop0): using ordered data mode
[   20.186607] reiserfs: using flush barriers
[   20.191082] REISERFS (device loop0): journal params: device loop0, size 788,
journal first block 137, max trans len 92, max batch 80, max commit age 30, max
trans age 30
[   20.193379] REISERFS (device loop0): checking transaction log (loop0)
[   20.459375] REISERFS (device loop0): Using rupasov hash to sort names
[   20.460480] REISERFS (device loop0): Created .reiserfs_priv - reserved for
xattr storage.
[   21.008113] ------------[ cut here ]------------
[   21.008796] kernel BUG at fs/reiserfs/journal.c:3035!
[   21.009565] invalid opcode: 0000 [#1] SMP KASAN PTI
[   21.010271] CPU: 1 PID: 2172 Comm: a.out Not tainted 5.1.3 #10
[   21.011086] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   21.012421] RIP: 0010:do_journal_begin_r+0x891/0x8c0
[   21.013115] Code: 00 44 89 ee e8 e0 c7 cf ff 41 83 fd 0a 0f 8e ed fa ff ff
e8 61 c6 cf ff 4c 89 ff e8 d9 36 ff ff e9 cb f8 ff ff e8 4f c6 cf ff <0f> 0b e8
48 c6 cf ff e8 93 6c c8 ff 4c 89 ef 48 89 c5 e8 78 02 e6
[   21.015667] RSP: 0018:ffff888107abf7a0 EFLAGS: 00010293
[   21.016389] RAX: ffff888117fc72c0 RBX: ffffc90000d9f000 RCX:
ffffffffa7715f61
[   21.017358] RDX: 0000000000000000 RSI: 000000000000005c RDI:
0000000000000006
[   21.018407] RBP: 000000000000005c R08: ffff888117fc72c0 R09:
ffff888107abfb20
[   21.019382] R10: ffffed1020f57f69 R11: ffff888107abfb4f R12:
ffff888107e0aa80
[   21.020660] R13: 0000000000000000 R14: 000000000000006d R15:
ffff888107e0aa80
[   21.021650] FS:  0000000000000000(0000) GS:ffff88811b500000(0000)
knlGS:0000000000000000
[   21.022783] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   21.023582] CR2: 00000000006de0b0 CR3: 0000000050812000 CR4:
00000000000006e0
[   21.024574] Call Trace:
[   21.024938]  ? do_journal_end+0x7bf/0x2050
[   21.025514]  ? do_journal_end+0x2050/0x2050
[   21.026111]  journal_begin+0xdb/0x220
[   21.026634]  reiserfs_do_truncate+0x4f3/0xac0
[   21.027247]  ? reiserfs_cut_from_item+0x13a0/0x13a0
[   21.027926]  ? do_journal_begin_r+0x7f8/0x8c0
[   21.028539]  ? mutex_lock+0x89/0xd0
[   21.029036]  ? __mutex_lock_slowpath+0x10/0x10
[   21.029655]  reiserfs_delete_object+0x5a/0x110
[   21.030284]  reiserfs_evict_inode+0x254/0x350
[   21.030898]  ? sd_attrs_to_i_attrs.part.0+0x140/0x140
[   21.031600]  ? _raw_spin_lock_irq+0xd0/0xd0
[   21.032187]  ? _raw_spin_lock_irq+0xd0/0xd0
[   21.032776]  ? sd_attrs_to_i_attrs.part.0+0x140/0x140
[   21.033474]  evict+0x19c/0x340
[   21.033909]  iput+0x334/0x4b0
[   21.034343]  dentry_unlink_inode+0x1ed/0x200
[   21.034945]  __dentry_kill+0x203/0x320
[   21.035477]  dentry_kill+0x9f/0x3a0
[   21.035974]  dput+0x26d/0x2e0
[   21.036398]  __fput+0x268/0x440
[   21.036859]  task_work_run+0x100/0x120
[   21.037392]  do_exit+0x600/0x1840
[   21.037864]  ? release_task+0x9a0/0x9a0
[   21.038413]  ? __sb_end_write+0x4b/0x70
[   21.038955]  ? vfs_write+0x262/0x340
[   21.039478]  ? handle_mm_fault+0xdb/0x250
[   21.040042]  do_group_exit+0x9b/0x190
[   21.040561]  __x64_sys_exit_group+0x28/0x30
[   21.041149]  do_syscall_64+0x8a/0x230
[   21.041671]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   21.042378] RIP: 0033:0x43eeb8
[   21.042814] Code: Bad RIP value.
[   21.043270] RSP: 002b:00007ffc67402868 EFLAGS: 00000246 ORIG_RAX:
00000000000000e7
[   21.044319] RAX: ffffffffffffffda RBX: 0000000000000000 RCX:
000000000043eeb8
[   21.045314] RDX: 0000000000000000 RSI: 000000000000003c RDI:
0000000000000000
[   21.046318] RBP: 00000000004be960 R08: 00000000000000e7 R09:
ffffffffffffffd0
[   21.047316] R10: 0000000000000008 R11: 0000000000000246 R12:
0000000000000001
[   21.048312] R13: 00000000006e0160 R14: 0000000000000000 R15:
0000000000000000
[   21.049352] Modules linked in:
[   21.049805] Dumping ftrace buffer:
[   21.050323]    (ftrace buffer empty)
[   21.050885] ---[ end trace 9b5656866987f04a ]---

-- 
You are receiving this mail because:
You are the assignee for the bug.
