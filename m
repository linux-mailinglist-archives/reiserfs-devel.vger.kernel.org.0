Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 986F227E8AE
	for <lists+reiserfs-devel@lfdr.de>; Wed, 30 Sep 2020 14:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbgI3MjY (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 30 Sep 2020 08:39:24 -0400
Received: from mail-il1-f206.google.com ([209.85.166.206]:51327 "EHLO
        mail-il1-f206.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgI3MjY (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 30 Sep 2020 08:39:24 -0400
Received: by mail-il1-f206.google.com with SMTP id e3so1291670ilq.18
        for <reiserfs-devel@vger.kernel.org>; Wed, 30 Sep 2020 05:39:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=m/IkIXwxxmognOaZ9nm/5h5TVD6wZG7CoX8tkPygbus=;
        b=nKE4/Fs6u75p7BGzTrSMRWJeQsyPKkLzH/Yyl4hsLGmhCcMsZuUIqcDy94YzhhC8+p
         k7E/LHX37Cj71q6hsqpswFWGHkG3MqhtzzHW13xGPs/Kmr3fyRHs/ZSn/RS0aTtVfWmq
         qVEvTpuTJZx6c01BKTQnjZfsXP+nFY8YcvdBRVitE+tS0cxhdLEJmb/d+U8tpYf6op25
         FhDxevCRnhCnz65y+6Cu32KtODryx9PJZ/ckKPu2rs/f9yzx6U4XZ3c5rb6WJUKsLkjW
         drufn+9UJFQjb/tQXXxi8TWUbiUF2MzQ5FFlLZ4kdEvRB80PJzKrzsDLyqgrdoB26ZSk
         4U3Q==
X-Gm-Message-State: AOAM530PqH1qHR5PZatqf94vB6kn50BWXTQKAAT9J3COC+PwVAaX9qKd
        3LYcs3RA02XVVyfutIXPpzUhm6c1sdcDHezI9i+yaKhff1AF
X-Google-Smtp-Source: ABdhPJzpdMQSj18BnUH9MzJOLrjYLGQOU2GO6L4n9woIjSnz9J5f7Vkd34tR8nRCgY28Ftq1hOQiKTvqI4m9YnU4iKYLYJJGlZ6t
MIME-Version: 1.0
X-Received: by 2002:a92:440b:: with SMTP id r11mr1897498ila.105.1601469563031;
 Wed, 30 Sep 2020 05:39:23 -0700 (PDT)
Date:   Wed, 30 Sep 2020 05:39:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006c550e05b08730e2@google.com>
Subject: general protection fault in open_xa_dir
From:   syzbot <syzbot+9b33c9b118d77ff59b6f@syzkaller.appspotmail.com>
To:     jack@suse.cz, jeffm@suse.com, linux-kernel@vger.kernel.org,
        reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    ccc1d052 Merge tag 'dmaengine-fix-5.9' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=143df175900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=adebb40048274f92
dashboard link: https://syzkaller.appspot.com/bug?extid=9b33c9b118d77ff59b6f
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=107b026b900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=107f17e3900000

Bisection is inconclusive: the issue happens on the oldest tested release.

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1392c575900000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1052c575900000
console output: https://syzkaller.appspot.com/x/log.txt?x=1792c575900000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9b33c9b118d77ff59b6f@syzkaller.appspotmail.com

REISERFS (device loop0): journal params: device loop0, size 8192, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
REISERFS (device loop0): checking transaction log (loop0)
REISERFS (device loop0): Using tea hash to sort names
general protection fault, probably for non-canonical address 0xdffffc000000000d: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000068-0x000000000000006f]
CPU: 1 PID: 6851 Comm: syz-executor705 Not tainted 5.9.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:d_really_is_negative include/linux/dcache.h:472 [inline]
RIP: 0010:open_xa_root fs/reiserfs/xattr.c:124 [inline]
RIP: 0010:open_xa_dir+0xad/0x5d0 fs/reiserfs/xattr.c:152
Code: c1 e8 03 42 80 3c 30 00 74 08 48 89 df e8 0b 77 b9 ff 4c 8b 2b 49 83 c5 68 4d 89 ee 49 c1 ee 03 48 b8 00 00 00 00 00 fc ff df <41> 80 3c 06 00 74 08 4c 89 ef e8 e4 76 b9 ff 49 8b 7d 00 48 85 ff
RSP: 0018:ffffc90000e97870 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: ffff8880a6e11598 RCX: ffff8880a74bc080
RDX: 0000000000000000 RSI: 0000000000000002 RDI: ffff8880852b37e0
RBP: ffffc90000e978e8 R08: ffffffff81fb5e96 R09: ffffffff81fbc746
R10: 0000000000000002 R11: ffff8880a74bc080 R12: 1ffff11014d9e4cd
R13: 0000000000000068 R14: 000000000000000d R15: ffff8880a6cf2668
FS:  00000000020a1880(0000) GS:ffff8880ae900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000043f290 CR3: 0000000096b7f000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 xattr_lookup+0x24/0x280 fs/reiserfs/xattr.c:395
 reiserfs_xattr_get+0x89/0x540 fs/reiserfs/xattr.c:677
 reiserfs_get_acl+0x63/0x690 fs/reiserfs/xattr_acl.c:209
 get_acl+0x152/0x2e0 fs/posix_acl.c:141
 check_acl fs/namei.c:277 [inline]
 acl_permission_check fs/namei.c:309 [inline]
 generic_permission+0x2ba/0x550 fs/namei.c:353
 do_inode_permission fs/namei.c:398 [inline]
 inode_permission+0x234/0x4a0 fs/namei.c:463
 lookup_one_len+0xa6/0x200 fs/namei.c:2557
 reiserfs_lookup_privroot+0x85/0x1e0 fs/reiserfs/xattr.c:972
 reiserfs_fill_super+0x2b51/0x3240 fs/reiserfs/super.c:2176
 mount_bdev+0x24f/0x360 fs/super.c:1417
 legacy_get_tree+0xea/0x180 fs/fs_context.c:592
 vfs_get_tree+0x88/0x270 fs/super.c:1547
 do_new_mount fs/namespace.c:2875 [inline]
 path_mount+0x179d/0x29e0 fs/namespace.c:3192
 do_mount fs/namespace.c:3205 [inline]
 __do_sys_mount fs/namespace.c:3413 [inline]
 __se_sys_mount+0x126/0x180 fs/namespace.c:3390
 do_syscall_64+0x31/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x447dba
Code: b8 08 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 7d a3 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 0f 83 5a a3 fb ff c3 66 0f 1f 84 00 00 00 00 00
RSP: 002b:00007ffdc5bb7dd8 EFLAGS: 00000297 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffdc5bb7e30 RCX: 0000000000447dba
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007ffdc5bb7df0
RBP: 00007ffdc5bb7df0 R08: 00007ffdc5bb7e30 R09: 0000000000000000
R10: 0000000000010000 R11: 0000000000000297 R12: 0000000000000007
R13: 0000000000000004 R14: 0000000000000003 R15: 0000000000000003
Modules linked in:
---[ end trace 5bf17987eca6218c ]---
RIP: 0010:d_really_is_negative include/linux/dcache.h:472 [inline]
RIP: 0010:open_xa_root fs/reiserfs/xattr.c:124 [inline]
RIP: 0010:open_xa_dir+0xad/0x5d0 fs/reiserfs/xattr.c:152
Code: c1 e8 03 42 80 3c 30 00 74 08 48 89 df e8 0b 77 b9 ff 4c 8b 2b 49 83 c5 68 4d 89 ee 49 c1 ee 03 48 b8 00 00 00 00 00 fc ff df <41> 80 3c 06 00 74 08 4c 89 ef e8 e4 76 b9 ff 49 8b 7d 00 48 85 ff
RSP: 0018:ffffc90000e97870 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: ffff8880a6e11598 RCX: ffff8880a74bc080
RDX: 0000000000000000 RSI: 0000000000000002 RDI: ffff8880852b37e0
RBP: ffffc90000e978e8 R08: ffffffff81fb5e96 R09: ffffffff81fbc746
R10: 0000000000000002 R11: ffff8880a74bc080 R12: 1ffff11014d9e4cd
R13: 0000000000000068 R14: 000000000000000d R15: ffff8880a6cf2668
FS:  00000000020a1880(0000) GS:ffff8880ae900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f8a9403b188 CR3: 0000000096b7f000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
