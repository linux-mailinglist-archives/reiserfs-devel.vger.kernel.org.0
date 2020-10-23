Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67088297235
	for <lists+reiserfs-devel@lfdr.de>; Fri, 23 Oct 2020 17:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S465759AbgJWP0W (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 23 Oct 2020 11:26:22 -0400
Received: from mail-il1-f200.google.com ([209.85.166.200]:51354 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S465757AbgJWP0W (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 23 Oct 2020 11:26:22 -0400
Received: by mail-il1-f200.google.com with SMTP id e3so1495010ilq.18
        for <reiserfs-devel@vger.kernel.org>; Fri, 23 Oct 2020 08:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=2P8P5jvsF2otgmMApO2WQcy9L60H8t9eFc1xKbDFhRU=;
        b=RuA+XrEQ4VwMDwR8wCw8hjXBJkVqjVN0/5MJlIQppQGXvUZl4iXUYUYsNpdGq/Wg2u
         OKqF7D2/HyKYZZsCt26aiMBodXKXfbnCjboZ2cuz5tHUBunY/PMFtGuPExOP/sis4LG2
         OBQiYrOx/slDs/AXYsnfBYkF4FXAcEQb4+gQiGuoV9hOricWqESYDFl3w9hULcwWy0Xy
         7tXutMgdy1jhTaN5yBDDeEVwv063CBA3n1DdJuwXCmjeqrVzPsfIHljpVUv+C2vQ6hwl
         EhYvya6pXUBrenGy5K+GwNxDwB8cAGTt+7//GzlwXi9Wno8NFiAqFheYWl1fP2F9M9Dq
         PI1Q==
X-Gm-Message-State: AOAM530Src504CqSFassZ0UoPvpgfyJ7ZEPI53ugeVm1n1kEeZQUNyl+
        n60lOyLMYyoTP0k0ZcaMPj7sWDB/bNHr9ZSFei1UCNw+Y063
X-Google-Smtp-Source: ABdhPJyv4NL87W+dc7TB4wd/aPNsdbJ2dkgslxRpBgiV06ubl6tKS7Uc0ocYJKnSgN+zkq1FtyrCSDv19b5CF/xWiGnzxGm/DCY1
MIME-Version: 1.0
X-Received: by 2002:a92:d906:: with SMTP id s6mr2061607iln.225.1603466781872;
 Fri, 23 Oct 2020 08:26:21 -0700 (PDT)
Date:   Fri, 23 Oct 2020 08:26:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f158c305b2583300@google.com>
Subject: divide error in do_journal_end
From:   syzbot <syzbot+d0d781aeeb8e16f710f1@syzkaller.appspotmail.com>
To:     alex.shi@linux.alibaba.com, axboe@kernel.dk, jack@suse.cz,
        linux-kernel@vger.kernel.org, rdunlap@infradead.org,
        reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
        tytso@mit.edu
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    c4d6fe73 Merge tag 'xarray-5.9' of git://git.infradead.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10c4b837900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ae5161e82506407f
dashboard link: https://syzkaller.appspot.com/bug?extid=d0d781aeeb8e16f710f1
compiler:       gcc (GCC) 10.1.0-syz 20200507

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d0d781aeeb8e16f710f1@syzkaller.appspotmail.com

divide error: 0000 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 8486 Comm: syz-executor.0 Not tainted 5.9.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:do_journal_end+0x15d6/0x4950 fs/reiserfs/journal.c:4075
Code: c6 41 84 f0 0f 85 3b 2c 00 00 83 e2 07 38 d1 40 0f 9e c6 84 c9 0f 95 c2 40 84 d6 0f 85 24 2c 00 00 8b 4b 14 48 8d 7d 18 31 d2 <48> f7 f1 4a 8d 34 2a 48 89 fa 48 b8 00 00 00 00 00 fc ff df 48 c1
RSP: 0018:ffffc900013ffb28 EFLAGS: 00010246
RAX: 0000000000000009 RBX: ffff888048daf000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff8880235f3018
RBP: ffff8880235f3000 R08: 0000000000000001 R09: ffff888048dafffb
R10: ffffed10091b5fff R11: 0000000000000000 R12: 0000000000001000
R13: 0000000000000000 R14: ffffc900013ffd48 R15: ffffc90016d11000
FS:  000000000259f940(0000) GS:ffff8880b9e00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffcd5edb9f8 CR3: 000000002cd8f000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 do_journal_release fs/reiserfs/journal.c:1916 [inline]
 journal_release+0x14d/0x4e0 fs/reiserfs/journal.c:1970
 reiserfs_put_super+0xe0/0x5c0 fs/reiserfs/super.c:616
 generic_shutdown_super+0x144/0x370 fs/super.c:464
 kill_block_super+0x97/0xf0 fs/super.c:1446
 deactivate_locked_super+0x94/0x160 fs/super.c:335
 deactivate_super+0xad/0xd0 fs/super.c:366
 cleanup_mnt+0x3a3/0x530 fs/namespace.c:1118
 task_work_run+0xdd/0x190 kernel/task_work.c:141
 tracehook_notify_resume include/linux/tracehook.h:188 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:165 [inline]
 exit_to_user_mode_prepare+0x1ac/0x1d0 kernel/entry/common.c:192
 syscall_exit_to_user_mode+0x38/0x260 kernel/entry/common.c:267
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x460887
Code: 64 89 04 25 d0 02 00 00 58 5f ff d0 48 89 c7 e8 2f be ff ff 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 a6 00 00 00 0f 05 <48> 3d 01 f0 ff ff 0f 83 ad 89 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007ffcd5edb9f8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000460887
RDX: 0000000000403188 RSI: 0000000000000002 RDI: 00007ffcd5edbaa0
RBP: 0000000000000596 R08: 0000000000000000 R09: 000000000000000b
R10: 0000000000000005 R11: 0000000000000246 R12: 00007ffcd5edcb30
R13: 00000000025a0a60 R14: 0000000000000000 R15: 00007ffcd5edcb30
Modules linked in:
---[ end trace fb4ea409a588af8f ]---
RIP: 0010:do_journal_end+0x15d6/0x4950 fs/reiserfs/journal.c:4075
Code: c6 41 84 f0 0f 85 3b 2c 00 00 83 e2 07 38 d1 40 0f 9e c6 84 c9 0f 95 c2 40 84 d6 0f 85 24 2c 00 00 8b 4b 14 48 8d 7d 18 31 d2 <48> f7 f1 4a 8d 34 2a 48 89 fa 48 b8 00 00 00 00 00 fc ff df 48 c1
RSP: 0018:ffffc900013ffb28 EFLAGS: 00010246
RAX: 0000000000000009 RBX: ffff888048daf000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff8880235f3018
RBP: ffff8880235f3000 R08: 0000000000000001 R09: ffff888048dafffb
R10: ffffed10091b5fff R11: 0000000000000000 R12: 0000000000001000
R13: 0000000000000000 R14: ffffc900013ffd48 R15: ffffc90016d11000
FS:  000000000259f940(0000) GS:ffff8880b9e00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000562ae37a0da8 CR3: 000000002cd8f000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
