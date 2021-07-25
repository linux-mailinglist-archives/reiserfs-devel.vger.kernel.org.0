Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ADC93D4DC6
	for <lists+reiserfs-devel@lfdr.de>; Sun, 25 Jul 2021 15:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbhGYNEN (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sun, 25 Jul 2021 09:04:13 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:44014 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230421AbhGYNDz (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 25 Jul 2021 09:03:55 -0400
Received: by mail-io1-f70.google.com with SMTP id d7-20020a6b6e070000b02904c0978ed194so6242629ioh.10
        for <reiserfs-devel@vger.kernel.org>; Sun, 25 Jul 2021 06:44:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=Q00zMG/B+P4UDhxf5JLFXCbBMZfD1+99Vsyyxd9LbqY=;
        b=SOiQ3MjcYpS8adkf64momtRSfx5Po5Cv+gkqeNpxfhrmMtgY+Ms7OhHlLqShJifRt/
         d3Q+ZrevW1oE5gbCmTarWc8HUXR/+rEmGeWDv5uXyu8/evNRPHbGNWL+ad/Di0gD/UBQ
         Yr7SBkkMLuM/DMyl5YM30+BgJGWyTsAJOoE+hZDceoDu9eGINgq3uFfVglcfNSafUOZf
         BqK+3DzXYXn6jETOG7w/bkVbw6Msqs1oLX16ud2l42hKMRLI8L0D9XK8QLJBFfqsVa3g
         awQHc/82nW22eLfS4TrJXes9mPkPYEenvHNBI9IMu8TPmz6buvcMwkSnYsyOO0aRJ5n/
         1C3A==
X-Gm-Message-State: AOAM533ttgvNxrmPrgSYUXqWkCd7JSGsxnubVn77hC3gJW4VMaDDOfLa
        T4BqS0jtQXUpiCXaalHtL3nQsdZHSF9v0Fk8+QEIfA2KSBJp
X-Google-Smtp-Source: ABdhPJxQTdXp6A4ouWPh+jVVXPUo817lxsKECEmKTDDmrEPhXmaoTgUlKhBq0a9WXjsv6QS+vvcWBbco/Uzjg6FXzo8NFaGzAHpj
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:cf:: with SMTP id r15mr9737438ilq.58.1627220664890;
 Sun, 25 Jul 2021 06:44:24 -0700 (PDT)
Date:   Sun, 25 Jul 2021 06:44:24 -0700
In-Reply-To: <000000000000ebd6da05b00bcea6@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b3bdbc05c7f2d56f@google.com>
Subject: Re: [syzbot] WARNING in reiserfs_put_super
From:   syzbot <syzbot+fcdd69a8426baab36109@syzkaller.appspotmail.com>
To:     ground_handling@unex-aviation.co.id, jack@suse.cz, jeffm@suse.com,
        linux-kernel@vger.kernel.org, mszeredi@redhat.com,
        reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
        yukuai3@huawei.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

syzbot has found a reproducer for the following issue on:

HEAD commit:    90d856e71443 Add linux-next specific files for 20210723
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=140c92b6300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=298516715f6ad5cd
dashboard link: https://syzkaller.appspot.com/bug?extid=fcdd69a8426baab36109
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.1
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=146b2066300000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fcdd69a8426baab36109@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 8499 at kernel/workqueue.c:4413 destroy_workqueue.cold+0x5/0x71 kernel/workqueue.c:4413
Modules linked in:
CPU: 1 PID: 8499 Comm: syz-executor.5 Not tainted 5.14.0-rc2-next-20210723-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:destroy_workqueue.cold+0x5/0x71 kernel/workqueue.c:4413
Code: c5 3d 7a f8 b9 e8 03 00 00 31 d2 48 c7 c7 e0 ff 8a 89 f7 f1 89 c6 e8 fc 87 00 00 c6 44 24 2f 01 e9 e7 56 62 f8 e8 6f c4 8b f8 <0f> 0b 48 c7 c6 e0 04 8b 89 48 c7 c7 20 00 8b 89 49 8d 96 60 01 00
RSP: 0018:ffffc90001b3fcd0 EFLAGS: 00010093
RAX: 0000000000000000 RBX: 0000000000000002 RCX: 0000000000000000
RDX: ffff88801bedd580 RSI: ffffffff88e9fd31 RDI: 0000000000000003
RBP: 000000000000000f R08: 0000000000000001 R09: 0000000000000003
R10: ffffffff814c5ab3 R11: 0000000000000000 R12: dffffc0000000000
R13: ffffe8ffffd91a00 R14: ffff88802a9d2400 R15: 0000000000000000
FS:  000000000290e400(0000) GS:ffff8880b9d00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffef18ce720 CR3: 00000000370a3000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 reiserfs_put_super+0x234/0x5c0 fs/reiserfs/super.c:631
 generic_shutdown_super+0x14c/0x370 fs/super.c:465
 kill_block_super+0x97/0xf0 fs/super.c:1395
 deactivate_locked_super+0x94/0x160 fs/super.c:335
 deactivate_super+0xad/0xd0 fs/super.c:366
 cleanup_mnt+0x3a2/0x540 fs/namespace.c:1136
 task_work_run+0xdd/0x1a0 kernel/task_work.c:164
 tracehook_notify_resume include/linux/tracehook.h:189 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:175 [inline]
 exit_to_user_mode_prepare+0x27e/0x290 kernel/entry/common.c:209
 __syscall_exit_to_user_mode_work kernel/entry/common.c:291 [inline]
 syscall_exit_to_user_mode+0x19/0x60 kernel/entry/common.c:302
 do_syscall_64+0x42/0xb0 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x467a47
Code: ff d0 48 89 c7 b8 3c 00 00 00 0f 05 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 66 0f 1f 44 00 00 b8 a6 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffca786e4d8 EFLAGS: 00000246
 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000467a47
RDX: 00007ffca786e5a9 RSI: 0000000000000002 RDI: 00007ffca786e5a0
RBP: 00007ffca786e5a0 R08: 00000000ffffffff R09: 00007ffca786e370
R10: 000000000290f8e3 R11: 0000000000000246 R12: 00000000004bee90
R13: 00007ffca786f670 R14: 000000000290f810 R15: 00007ffca786f6b0

