Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15AB737B942
	for <lists+reiserfs-devel@lfdr.de>; Wed, 12 May 2021 11:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbhELJb4 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 12 May 2021 05:31:56 -0400
Received: from mail-il1-f199.google.com ([209.85.166.199]:37587 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbhELJbc (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 12 May 2021 05:31:32 -0400
Received: by mail-il1-f199.google.com with SMTP id r13-20020a92cd8d0000b02901a627ef20a2so19112120ilb.4
        for <reiserfs-devel@vger.kernel.org>; Wed, 12 May 2021 02:30:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=CQZrCF3ZeFkx6F3MRveE5R61GDMNjmVF2vsJzLxk/Hs=;
        b=P7uCpHZzNmsqGhS2fiiMzv3yHgPUGcxbTBWG0b1pcdgayMa8x2J+EMpfaKhvCiRKju
         W05LJdUW9fNAMuezdwloQs6oVx4q+ayI1qSjzFVl3uPZ0qIwq581Jogjfktnkq0Tka40
         UnTIOZcxdZ0C74/u1uF1N9BZW+nY+khqpJvj2A84Z79cCQi9E0oBUyFXSod+MLjrulYJ
         FRv869IxeT+ACAWYLPCqrCq1fOMaWHide9WALkSQ0pLEZzJp+zzR1F/ENF5GIm6z6/eP
         355yAlL4YdDD+kU1JYla8dOOE7Omxo8REmsODN+3gFHBUiI0CaS8FVNoWUDpfUGSi9JG
         BiRQ==
X-Gm-Message-State: AOAM533KgfNcglR8O7hhJeRkc0aYMDPUn2fK+CPH6HsPkHeBL9BvBzNg
        WEF1t24bMyVzkJtE2ORMLj6uh+zkfSZDr8C1NoVJnrlnQT39
X-Google-Smtp-Source: ABdhPJyQ4b9DOFhkhoOLIyzR7zetWKDQocDR+hcG4cELrgPaB8myIjDQ5W441Y2Ia1Z5/Topvxf8G8eg3Ccg05IlALuQezS50Shv
MIME-Version: 1.0
X-Received: by 2002:a5d:8a10:: with SMTP id w16mr22813007iod.26.1620811824709;
 Wed, 12 May 2021 02:30:24 -0700 (PDT)
Date:   Wed, 12 May 2021 02:30:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000f439105c21ea9ea@google.com>
Subject: [syzbot] divide error in do_journal_end (2)
From:   syzbot <syzbot+0ba9909df31c6a36974d@syzkaller.appspotmail.com>
To:     jack@suse.cz, linux-kernel@vger.kernel.org, rdunlap@infradead.org,
        reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
        tiantao6@hisilicon.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    88b06399 Merge tag 'for-5.13-rc1-part2-tag' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13516d93d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=807beec6b4d66bf1
dashboard link: https://syzkaller.appspot.com/bug?extid=0ba9909df31c6a36974d
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=123b4d63d00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16813c65d00000

Bisection is inconclusive: the issue happens on the oldest tested release.

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11e35795d00000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=13e35795d00000
console output: https://syzkaller.appspot.com/x/log.txt?x=15e35795d00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0ba9909df31c6a36974d@syzkaller.appspotmail.com

REISERFS (device loop0): journal params: device loop0, size 8192, journal first block 10, max trans len 1024, max batch 900, max commit age 30, max trans age 30
REISERFS (device loop0): checking transaction log (loop0)
REISERFS (device loop0): Using r5 hash to sort names
REISERFS (device loop0): Created .reiserfs_priv - reserved for xattr storage.
divide error: 0000 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 8393 Comm: syz-executor119 Not tainted 5.13.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:do_journal_end+0x24aa/0x4950 fs/reiserfs/journal.c:4188
Code: c1 45 84 ca 0f 85 67 18 00 00 83 e2 07 40 38 d6 41 0f 9e c1 40 84 f6 0f 95 c2 41 84 d1 0f 85 4e 18 00 00 41 8b 7c 24 14 31 d2 <48> f7 f7 49 8d 7d 18 48 8d 34 0a 48 89 f8 48 c1 e8 03 80 3c 18 00
RSP: 0018:ffffc9000187faa0 EFLAGS: 00010246
RAX: 0000000000000005 RBX: dffffc0000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc900016c1048 R08: 0000000000001000 R09: 0000000000000001
R10: 0000000000000001 R11: 0000000000000000 R12: ffff8880349b1000
R13: ffff8880285b9000 R14: ffff88801248d4c0 R15: ffff888019b28000
FS:  0000000000000000(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055cf21e91b70 CR3: 0000000013782000 CR4: 0000000000350ef0
Call Trace:
 reiserfs_sync_fs+0xf8/0x120 fs/reiserfs/super.c:78
 __sync_filesystem fs/sync.c:39 [inline]
 sync_filesystem fs/sync.c:67 [inline]
 sync_filesystem+0x1b5/0x260 fs/sync.c:48
 generic_shutdown_super+0x70/0x370 fs/super.c:448
 kill_block_super+0x97/0xf0 fs/super.c:1395
 deactivate_locked_super+0x94/0x160 fs/super.c:335
 deactivate_super+0xad/0xd0 fs/super.c:366
 cleanup_mnt+0x3a2/0x540 fs/namespace.c:1136
 task_work_run+0xdd/0x1a0 kernel/task_work.c:164
 exit_task_work include/linux/task_work.h:32 [inline]
 do_exit+0xbfc/0x2a60 kernel/exit.c:826
 do_group_exit+0x125/0x310 kernel/exit.c:923
 __do_sys_exit_group kernel/exit.c:934 [inline]
 __se_sys_exit_group kernel/exit.c:932 [inline]
 __x64_sys_exit_group+0x3a/0x50 kernel/exit.c:932
 do_syscall_64+0x3a/0xb0 arch/x86/entry/common.c:47
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x4438c9
Code: Unable to access opcode bytes at RIP 0x44389f.
RSP: 002b:00007ffe1e8a33f8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00000000004b52f0 RCX: 00000000004438c9
RDX: 000000000000003c RSI: 00000000000000e7 RDI: 0000000000000001
RBP: 0000000000000001 R08: ffffffffffffffc4 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000004b52f0
R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000001
Modules linked in:
---[ end trace 918df66ba4209fe1 ]---
RIP: 0010:do_journal_end+0x24aa/0x4950 fs/reiserfs/journal.c:4188
Code: c1 45 84 ca 0f 85 67 18 00 00 83 e2 07 40 38 d6 41 0f 9e c1 40 84 f6 0f 95 c2 41 84 d1 0f 85 4e 18 00 00 41 8b 7c 24 14 31 d2 <48> f7 f7 49 8d 7d 18 48 8d 34 0a 48 89 f8 48 c1 e8 03 80 3c 18 00
RSP: 0018:ffffc9000187faa0 EFLAGS: 00010246
RAX: 0000000000000005 RBX: dffffc0000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc900016c1048 R08: 0000000000001000 R09: 0000000000000001
R10: 0000000000000001 R11: 0000000000000000 R12: ffff8880349b1000
R13: ffff8880285b9000 R14: ffff88801248d4c0 R15: ffff888019b28000
FS:  0000000000000000(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055cf21e91b70 CR3: 00000000133f2000 CR4: 0000000000350ef0


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
