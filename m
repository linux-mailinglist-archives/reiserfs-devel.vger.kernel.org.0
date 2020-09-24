Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 129CF276D62
	for <lists+reiserfs-devel@lfdr.de>; Thu, 24 Sep 2020 11:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgIXJ1m (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 24 Sep 2020 05:27:42 -0400
Received: from mail-il1-f207.google.com ([209.85.166.207]:47546 "EHLO
        mail-il1-f207.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727728AbgIXJ11 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 24 Sep 2020 05:27:27 -0400
Received: by mail-il1-f207.google.com with SMTP id p10so2065440ilp.14
        for <reiserfs-devel@vger.kernel.org>; Thu, 24 Sep 2020 02:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=OaKfqdE7CLZushADhNNBSnZh3AuMO8V3gSaW07XV6g8=;
        b=S4e2eVrGpZlwUo54/UrByFZWWBPzncDAAnf8zPY1d83Wu96opwcWmMrzx0FI9jkAA6
         CSjCDASXXyvNefnyq42gDmN45W8jYTFDNRPpSSs901xY3SO6Muyk1QVlFOEBtXjWSJJ+
         rhX3/38hOpX/z9YH7PPA2FoRMepbMtYHfZCLps9nxeXDuu6M8b6d8ia8SxpThtHCWWg0
         uyCdimaY+5JlZmhNEXAB7Z7k1/m54KEW15MED2ruxBMCrkaVbrhWtWyXCh5PMt71R8L+
         OyhpHdMl+pbEauwvVzMgECXqQz4UWtYMJ29dPGlf9uuLSi1vjRXzlyR+NVSp39QmTrT/
         xh7g==
X-Gm-Message-State: AOAM531zTYkulWxkv81cIC3ypaqiTI4gEG6ie6grgx64LOBgnLiEMhTY
        ape/PkKmsuBByu0Fzz7NXls3QSiEeby7iZlZwkBnLBD6xL45
X-Google-Smtp-Source: ABdhPJx5Nb7P3J812ECVfEozTzbOuutEBwKKaino3Jf2oTOQ+Ktj694gRIJpEOOgKhQWGJm7jzil1V9rdpQEchHsN1W3c4nCmUQ4
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:e0a:: with SMTP id a10mr3418632ilk.113.1600939646242;
 Thu, 24 Sep 2020 02:27:26 -0700 (PDT)
Date:   Thu, 24 Sep 2020 02:27:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ebd6da05b00bcea6@google.com>
Subject: WARNING in reiserfs_put_super
From:   syzbot <syzbot+fcdd69a8426baab36109@syzkaller.appspotmail.com>
To:     jack@suse.cz, jeffm@suse.com, linux-kernel@vger.kernel.org,
        reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    98477740 Merge branch 'rcu/urgent' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=154f348d900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5f4c828c9e3cef97
dashboard link: https://syzkaller.appspot.com/bug?extid=fcdd69a8426baab36109
compiler:       gcc (GCC) 10.1.0-syz 20200507

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fcdd69a8426baab36109@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 6884 at kernel/workqueue.c:4393 destroy_workqueue.cold+0x5/0x76 kernel/workqueue.c:4393
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 6884 Comm: syz-executor.3 Not tainted 5.9.0-rc6-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x198/0x1fd lib/dump_stack.c:118
 panic+0x382/0x7fb kernel/panic.c:231
 __warn.cold+0x20/0x4b kernel/panic.c:600
 report_bug+0x1bd/0x210 lib/bug.c:198
 handle_bug+0x38/0x90 arch/x86/kernel/traps.c:234
 exc_invalid_op+0x14/0x40 arch/x86/kernel/traps.c:254
 asm_exc_invalid_op+0x12/0x20 arch/x86/include/asm/idtentry.h:536
RIP: 0010:destroy_workqueue.cold+0x5/0x76 kernel/workqueue.c:4393
Code: 00 0b 8b 88 f7 f1 89 c6 e8 1d f3 10 00 c6 44 24 37 01 e9 af ae ff ff 48 c7 c7 80 e1 e0 89 e8 88 b9 68 00 eb c2 e8 01 ea 27 00 <0f> 0b 48 c7 c6 00 10 8b 88 48 c7 c7 40 0b 8b 88 49 8d 96 60 01 00
RSP: 0018:ffffc90005687cd0 EFLAGS: 00010093
RAX: 0000000000000000 RBX: 0000000000000002 RCX: ffffffff814e0963
RDX: ffff888059c70380 RSI: ffffffff814e543f RDI: 0000000000000005
RBP: 000000000000000f R08: 0000000000000001 R09: 0000000000000003
R10: 0000000000000001 R11: 0000000000000000 R12: dffffc0000000000
R13: ffffe8ffffcdc000 R14: ffff8880a6506000 R15: 0000000000000000
 reiserfs_put_super+0x234/0x5c0 fs/reiserfs/super.c:631
 generic_shutdown_super+0x144/0x370 fs/super.c:464
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
RIP: 0033:0x460ba7
Code: 64 89 04 25 d0 02 00 00 58 5f ff d0 48 89 c7 e8 2f be ff ff 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 a6 00 00 00 0f 05 <48> 3d 01 f0 ff ff 0f 83 dd 87 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007ffc99c1e078 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000460ba7
RDX: 00000000004031b8 RSI: 0000000000000002 RDI: 00007ffc99c1e120
RBP: 00000000000006e1 R08: 0000000000000000 R09: 000000000000000b
R10: 0000000000000005 R11: 0000000000000246 R12: 00007ffc99c1f1b0
R13: 000000000215fa60 R14: 0000000000000000 R15: 00007ffc99c1f1b0

======================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
