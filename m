Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61C0E6F6E2
	for <lists+reiserfs-devel@lfdr.de>; Mon, 22 Jul 2019 03:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbfGVBM3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sun, 21 Jul 2019 21:12:29 -0400
Received: from mail.wl.linuxfoundation.org ([198.145.29.98]:38768 "EHLO
        mail.wl.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725904AbfGVBM3 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 21 Jul 2019 21:12:29 -0400
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
        by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 1A3B3284AA
        for <reiserfs-devel@vger.kernel.org>; Mon, 22 Jul 2019 01:12:28 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
        id 0E0A8284ED; Mon, 22 Jul 2019 01:12:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
        pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS autolearn=unavailable version=3.3.1
From:   bugzilla-daemon@bugzilla.kernel.org
To:     reiserfs-devel@vger.kernel.org
Subject: [Bug 204263] New: kernel BUG at fs/reiserfs/prints.c:390!
Date:   Mon, 22 Jul 2019 01:12:26 +0000
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
Message-ID: <bug-204263-695@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=204263

            Bug ID: 204263
           Summary: kernel BUG at fs/reiserfs/prints.c:390!
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

The following script triggers a bug in reiserfs.

```
#!/bin/bash

DISK=bingo.img
MOUNT_DIR=/root/mnt

dd if=/dev/zero of=$DISK bs=1M count=114
mkfs.reiserfs -s 855 -o 124 -t 227 -b 4096 -h rupasov -f -q $DISK


mkdir -pv $MOUNT_DIR

mount $DISK $MOUNT_DIR -o
"acl,notail,user_xattr,block-allocator=no_unhashed_relocation"

mkdir -pv $MOUNT_DIR/a

for (( i = 0; i < 4096; i++ )); do
    name=`head /dev/urandom | tr -dc A-Za-z0-9 | head -c 10`
    mkdir $MOUNT_DIR/a/$name
done

umount $MOUNT_DIR

```

--- Core dump ---
[   32.064214] REISERFS (device loop0): found reiserfs format "3.6" with
non-standard journal
[   32.065341] REISERFS warning (device loop0):  reiserfs_fill_super:
CONFIG_REISERFS_CHECK is set ON
[   32.066443] REISERFS warning (device loop0):  reiserfs_fill_super: - it is
slow mode for debugging.
[   32.067430] REISERFS (device loop0): using ordered data mode
[   32.068045] reiserfs: using flush barriers
[   32.070329] REISERFS (device loop0): journal params: device loop0, size 854,
journal first block 124, max trans len 256, max batch 225, max commit age 30,
max trans age 30
[   32.072025] REISERFS (device loop0): checking transaction log (loop0)
[   32.270723] REISERFS (device loop0): Using rupasov hash to sort names
[   32.271888] REISERFS (device loop0): Created .reiserfs_priv - reserved for
xattr storage.
mkdir: created directory '/root/mnt/a'
[   37.516763] CPU: 1 PID: 22 Comm: kworker/1:1 Not tainted 5.1.3 #10
[   37.517880] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   37.519040] Workqueue: events_long flush_old_commits
[   37.519613] Call Trace:
[   37.519958]  dump_stack+0x8a/0xce
[   37.520413]  __reiserfs_panic+0xb5/0xd0
[   37.520924]  ? reiserfs_debug+0xc0/0xc0
[   37.521420]  ? mutex_lock+0x89/0xd0
[   37.521879]  ? __mutex_lock_slowpath+0x10/0x10
[   37.522409]  ? mutex_lock+0x89/0xd0
[   37.522849]  ? __mutex_lock_slowpath+0x10/0x10
[   37.523431]  ? memset+0x20/0x40
[   37.523824]  do_journal_end+0x1ffa/0x2050
[   37.524301]  reiserfs_sync_fs+0xf8/0x120
[   37.524771]  ? get_super_block+0x40/0x40
[   37.525218]  ? finish_task_switch+0x145/0x370
[   37.525706]  ? _raw_spin_lock+0x75/0xd0
[   37.526163]  ? _raw_spin_lock_irq+0xd0/0xd0
[   37.526653]  ? _raw_spin_lock_irq+0x76/0xd0
[   37.527121]  flush_old_commits+0x9d/0x140
[   37.527572]  process_one_work+0x503/0x970
[   37.528047]  worker_thread+0x7d/0x820
[   37.528485]  kthread+0x1ad/0x210
[   37.528839]  ? process_one_work+0x970/0x970
[   37.529329]  ? kthread_park+0x130/0x130
[   37.529783]  ret_from_fork+0x35/0x40
[   37.530189] REISERFS panic (device loop0): journal-2332 do_journal_end:
Trying to log block 18, which is a log block
[   37.531469] ------------[ cut here ]------------
[   37.532005] kernel BUG at fs/reiserfs/prints.c:390!
[   37.532608] invalid opcode: 0000 [#1] SMP KASAN PTI
[   37.533161] CPU: 1 PID: 22 Comm: kworker/1:1 Not tainted 5.1.3 #10
[   37.533863] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   37.534887] Workqueue: events_long flush_old_commits
[   37.535454] RIP: 0010:__reiserfs_panic.cold+0x37/0x8a
[   37.536031] Code: 85 e4 74 6d e8 29 06 d2 ff 4c 89 e9 4c 89 f2 4c 89 e6 49
c7 c0 a0 0e 43 ab 48 c7 c7 80 4f ce a9 e8 b6 b7 c6 ff e8 08 06 d2 ff <0f> 0b e8
01 06 d2 ff 49 c7 c6 20 4d ce a9 4d 85 e4 75 0a 49 c7 c6
[   37.538150] RSP: 0018:ffff88811a477b10 EFLAGS: 00010293
[   37.538747] RAX: ffff88811a461980 RBX: ffff88810772bb80 RCX:
ffffffffa80f1fa8
[   37.539530] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
ffffed102348ef54
[   37.540313] RBP: ffff88811a477be0 R08: 0000000000000068 R09:
ffffed10236a4c63
[   37.541138] R10: ffffed10236a4c62 R11: ffff88811b526317 R12:
ffffffffa9cf1520
[   37.541946] R13: ffffffffa9cf1ce0 R14: ffffffffa9ce4d20 R15:
ffff88810772bb80
[   37.542738] FS:  0000000000000000(0000) GS:ffff88811b500000(0000)
knlGS:0000000000000000
[   37.543664] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   37.544271] CR2: 00007fa2df7095e0 CR3: 00000000b5a12000 CR4:
00000000000006e0
[   37.545089] Call Trace:
[   37.545383]  ? reiserfs_debug+0xc0/0xc0
[   37.545820]  ? mutex_lock+0x89/0xd0
[   37.546215]  ? __mutex_lock_slowpath+0x10/0x10
[   37.546731]  ? mutex_lock+0x89/0xd0
[   37.547151]  ? __mutex_lock_slowpath+0x10/0x10
[   37.547700]  ? memset+0x20/0x40
[   37.548112]  do_journal_end+0x1ffa/0x2050
[   37.548673]  reiserfs_sync_fs+0xf8/0x120
[   37.549187]  ? get_super_block+0x40/0x40
[   37.549650]  ? finish_task_switch+0x145/0x370
[   37.550158]  ? _raw_spin_lock+0x75/0xd0
[   37.550605]  ? _raw_spin_lock_irq+0xd0/0xd0
[   37.551134]  ? _raw_spin_lock_irq+0x76/0xd0
[   37.551634]  flush_old_commits+0x9d/0x140
[   37.552115]  process_one_work+0x503/0x970
[   37.552605]  worker_thread+0x7d/0x820
[   37.553022]  kthread+0x1ad/0x210
[   37.553436]  ? process_one_work+0x970/0x970
[   37.553940]  ? kthread_park+0x130/0x130
[   37.554384]  ret_from_fork+0x35/0x40
[   37.554810] Modules linked in:
[   37.555197] Dumping ftrace buffer:
[   37.555779]    (ftrace buffer empty)
[   37.556255] ---[ end trace 6bac30a8d1f9cc90 ]---

-- 
You are receiving this mail because:
You are the assignee for the bug.
