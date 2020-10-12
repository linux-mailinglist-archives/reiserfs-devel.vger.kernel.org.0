Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC4FA28AC6A
	for <lists+reiserfs-devel@lfdr.de>; Mon, 12 Oct 2020 05:21:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbgJLDVS (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sun, 11 Oct 2020 23:21:18 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:41798 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727064AbgJLDVS (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 11 Oct 2020 23:21:18 -0400
Received: by mail-io1-f69.google.com with SMTP id j21so9697207iog.8
        for <reiserfs-devel@vger.kernel.org>; Sun, 11 Oct 2020 20:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=+U6xw7/8ON4woYVIBq+0uaUno5+F1gZw1bRpeBwjUHw=;
        b=mwvrJnpXLJ3oozO4k0hDS7U5thY0uFNMnEsia5QVfMhRnhl3o2mKvzhSinSl6udZqJ
         v+eIfBQxXGwgDc700SXn06XjypiyFFAMO4cXo67ErUk9EzFXhgDIb+7egE0Lf9GeHIC3
         rstRs9G0hC2AIsMQvEVm/ztgnx9yVf128veXdU0BqdkDhHK0LPZTgNcbuNneItlnSDMs
         wzBONSsp4yYwryyZtDd6D+zW0pvkHtACPPPZ8oM+SawbYBzDIguaQYIl2slv4cMbHfop
         xrP3PMICOv77gkBcDvlByylPTl6X6zkKDs6TDmTZkFSgeKOX1Wmu9UXEl2RWiS/5UIJh
         C8fg==
X-Gm-Message-State: AOAM533lCvYncvT+KJGE32V3AMarxS8rPsOTHmZJmX+P0jJEaMuKpO/4
        yZCWMGTZudicHgdQi9XfF/0J8AR7ObLQp4t/oSZ5uxA6ydVk
X-Google-Smtp-Source: ABdhPJw2/KuZF58Z4FqjPjXGeLKEZHUu5rQcTLXqYiJenCGkWumNfn7bW0swkRZY9/zY1OLNdMgJ2LxtQot4GdmXz+tgTX1VjMtg
MIME-Version: 1.0
X-Received: by 2002:a02:ca03:: with SMTP id i3mr17788897jak.50.1602472876006;
 Sun, 11 Oct 2020 20:21:16 -0700 (PDT)
Date:   Sun, 11 Oct 2020 20:21:16 -0700
In-Reply-To: <000000000000eba11705afd3d759@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000895ec305b170ca9a@google.com>
Subject: Re: kernel BUG at fs/reiserfs/prints.c:LINE!
From:   syzbot <syzbot+1541a3226994c0781b29@syzkaller.appspotmail.com>
To:     akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
        reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
        zhengbin13@huawei.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

syzbot has found a reproducer for the following issue on:

HEAD commit:    3dd0130f Merge branch 'akpm' (patches from Andrew)
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1107d078500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c06bcf3cc963d91c
dashboard link: https://syzkaller.appspot.com/bug?extid=1541a3226994c0781b29
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=134aa19f900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=149f6fbf900000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1541a3226994c0781b29@syzkaller.appspotmail.com

REISERFS panic (device loop0): journal-2332 do_journal_end: Trying to log block 8211, which is a log block
------------[ cut here ]------------
kernel BUG at fs/reiserfs/prints.c:390!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 1 PID: 6887 Comm: syz-executor832 Not tainted 5.9.0-rc8-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:__reiserfs_panic.cold+0x37/0x8a fs/reiserfs/prints.c:390
Code: 9c 88 74 6d e8 cf 7c 7a ff 4c 89 e9 4c 89 f2 4c 89 e6 49 c7 c0 60 f2 4f 8d 48 c7 c7 20 b7 9c 88 e8 b2 85 63 ff e8 ae 7c 7a ff <0f> 0b e8 a7 7c 7a ff 4d 85 e4 49 c7 c6 60 b5 9c 88 75 0a 49 c7 c6
RSP: 0018:ffffc90000f07b00 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff88809dd2c000 RCX: 0000000000000000
RDX: ffff8880a6a7e080 RSI: ffffffff81fbc262 RDI: fffff520001e0f52
RBP: ffffc90000f07bd0 R08: 000000000000006a R09: ffff8880ae5318e7
R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff889d1d60
R13: ffffffff889d2560 R14: ffffffff889cb560 R15: 0000000000002016
FS:  0000000001815880(0000) GS:ffff8880ae500000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000181e8b8 CR3: 00000000a26de000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 do_journal_end+0x3d85/0x4950 fs/reiserfs/journal.c:4135
 reiserfs_sync_fs+0xf8/0x120 fs/reiserfs/super.c:78
 __sync_filesystem fs/sync.c:39 [inline]
 sync_filesystem fs/sync.c:64 [inline]
 sync_filesystem+0x105/0x260 fs/sync.c:48
 generic_shutdown_super+0x70/0x370 fs/super.c:448
 kill_block_super+0x97/0xf0 fs/super.c:1444
 deactivate_locked_super+0x94/0x160 fs/super.c:335
 deactivate_super+0xad/0xd0 fs/super.c:366
 cleanup_mnt+0x3a3/0x530 fs/namespace.c:1118
 task_work_run+0xdd/0x190 kernel/task_work.c:141
 tracehook_notify_resume include/linux/tracehook.h:188 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:165 [inline]
 exit_to_user_mode_prepare+0x1e1/0x200 kernel/entry/common.c:192
 syscall_exit_to_user_mode+0x7e/0x2e0 kernel/entry/common.c:267
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x448177
Code: 00 00 00 b8 08 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 8d a2 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 b8 a6 00 00 00 0f 05 <48> 3d 01 f0 ff ff 0f 83 6d a2 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007fff2be25a58 EFLAGS: 00000206 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 00007fff2be26bd0 RCX: 0000000000448177
RDX: 0000000000400cf7 RSI: 0000000000000002 RDI: 00007fff2be25b00
RBP: 00000000000211c2 R08: 0000000000000000 R09: 0000000000000009
R10: 0000000000000005 R11: 0000000000000206 R12: 00007fff2be26b70
R13: 0000000001816880 R14: 0000000000000000 R15: 0000000000000000
Modules linked in:
---[ end trace c00fc6b0fe3e7e74 ]---
RIP: 0010:__reiserfs_panic.cold+0x37/0x8a fs/reiserfs/prints.c:390
Code: 9c 88 74 6d e8 cf 7c 7a ff 4c 89 e9 4c 89 f2 4c 89 e6 49 c7 c0 60 f2 4f 8d 48 c7 c7 20 b7 9c 88 e8 b2 85 63 ff e8 ae 7c 7a ff <0f> 0b e8 a7 7c 7a ff 4d 85 e4 49 c7 c6 60 b5 9c 88 75 0a 49 c7 c6
RSP: 0018:ffffc90000f07b00 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff88809dd2c000 RCX: 0000000000000000
RDX: ffff8880a6a7e080 RSI: ffffffff81fbc262 RDI: fffff520001e0f52
RBP: ffffc90000f07bd0 R08: 000000000000006a R09: ffff8880ae5318e7
R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff889d1d60
R13: ffffffff889d2560 R14: ffffffff889cb560 R15: 0000000000002016
FS:  0000000001815880(0000) GS:ffff8880ae500000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000181e8b8 CR3: 00000000a26de000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400

