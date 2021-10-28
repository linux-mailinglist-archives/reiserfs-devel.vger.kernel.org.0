Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 961A043DB83
	for <lists+reiserfs-devel@lfdr.de>; Thu, 28 Oct 2021 08:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbhJ1Gwv (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 28 Oct 2021 02:52:51 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:38564 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbhJ1Gwr (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 28 Oct 2021 02:52:47 -0400
Received: by mail-io1-f72.google.com with SMTP id g4-20020a05660226c400b005e14d3f1e6bso2562435ioo.5
        for <reiserfs-devel@vger.kernel.org>; Wed, 27 Oct 2021 23:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=9IOQueOs0l5y9Mce/jggTMg0HEDlO9ktlzNzjIB20JI=;
        b=Aja+bhhFIbZT2QBiXFcojly4bK+fC7oJlULSpkJaqbWs1hWQ7j1LNhPKUS0Q0R0y42
         Xf4zVmefAEGeKTZm/B1Qhocurz/c6gQZwsAIHLKD8nGD1XEXHw14YXhsaV0ODTZpEshX
         XecXT3sDdGJxDpD5AtLimKLmlbiRiyZNDBdFj6h3U3K9ifqzrotUvgwyA+g/i4YUyImy
         sj3bJx0q61oK1OWE8NwGz/d+HA/5jNGPttYuWaVtiigDobYNdoQFTxnlzgdhlykjREZa
         BkkviepRAv2ydVNps/EbqO9WMLAwJ/lPxMYCisSa+kjohNOPK2Rg6qEOpJEwPAVzYQXq
         g9TQ==
X-Gm-Message-State: AOAM532/6olO4r+gsF6Eytj3yX9jQ+qlZBv9euOZAU3HXXg5rvJEB1i3
        qGZQ432yB5UwoBEeebK1M5N7X8vOGfS1DbP7hZG9xzh1WXcf
X-Google-Smtp-Source: ABdhPJwCNWh2hmEW5DYKLzmLxMCaXZow++Zg6Brh9p1Td9PbcUhTecynEi2MVHD0IKCPquN3Rz/fecN8fSoXXNO6/zsOHncBrbo/
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:18cf:: with SMTP id s15mr1987527ilu.198.1635403820543;
 Wed, 27 Oct 2021 23:50:20 -0700 (PDT)
Date:   Wed, 27 Oct 2021 23:50:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c9b4c805cf641f0c@google.com>
Subject: [syzbot] KASAN: null-ptr-deref Read in do_journal_end
From:   syzbot <syzbot+f0a07c0d7dae72a221d5@syzkaller.appspotmail.com>
To:     jack@suse.cz, linux-kernel@vger.kernel.org, paskripkin@gmail.com,
        reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
        tiantao6@hisilicon.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    9c0c4d24ac00 Merge tag 'block-5.15-2021-10-22' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=130d1b0cb00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=be398dd7862f4b36
dashboard link: https://syzkaller.appspot.com/bug?extid=f0a07c0d7dae72a221d5
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f0a07c0d7dae72a221d5@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: null-ptr-deref in instrument_atomic_read include/linux/instrumented.h:71 [inline]
BUG: KASAN: null-ptr-deref in test_bit include/asm-generic/bitops/instrumented-non-atomic.h:134 [inline]
BUG: KASAN: null-ptr-deref in set_buffer_uptodate include/linux/buffer_head.h:120 [inline]
BUG: KASAN: null-ptr-deref in do_journal_end+0x12da/0x4950 fs/reiserfs/journal.c:4077
Read of size 8 at addr 0000000000000000 by task syz-executor.0/3707

CPU: 1 PID: 3707 Comm: syz-executor.0 Not tainted 5.15.0-rc6-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
Call Trace:
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 __kasan_report mm/kasan/report.c:446 [inline]
 kasan_report.cold+0x66/0xdf mm/kasan/report.c:459
 check_region_inline mm/kasan/generic.c:183 [inline]
 kasan_check_range+0x13d/0x180 mm/kasan/generic.c:189
 instrument_atomic_read include/linux/instrumented.h:71 [inline]
 test_bit include/asm-generic/bitops/instrumented-non-atomic.h:134 [inline]
 set_buffer_uptodate include/linux/buffer_head.h:120 [inline]
 do_journal_end+0x12da/0x4950 fs/reiserfs/journal.c:4077
 reiserfs_sync_fs+0xf8/0x120 fs/reiserfs/super.c:78
 __sync_filesystem fs/sync.c:39 [inline]
 sync_filesystem fs/sync.c:64 [inline]
 sync_filesystem+0x105/0x260 fs/sync.c:48
 generic_shutdown_super+0x70/0x370 fs/super.c:448
 kill_block_super+0x97/0xf0 fs/super.c:1395
 deactivate_locked_super+0x94/0x160 fs/super.c:335
 deactivate_super+0xad/0xd0 fs/super.c:366
 cleanup_mnt+0x3a2/0x540 fs/namespace.c:1137
 task_work_run+0xdd/0x1a0 kernel/task_work.c:164
 tracehook_notify_resume include/linux/tracehook.h:189 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:175 [inline]
 exit_to_user_mode_prepare+0x27e/0x290 kernel/entry/common.c:207
 __syscall_exit_to_user_mode_work kernel/entry/common.c:289 [inline]
 syscall_exit_to_user_mode+0x19/0x60 kernel/entry/common.c:300
 do_syscall_64+0x42/0xb0 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f0ba0b36ea7
Code: ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 66 0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff63b1eb68 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00007f0ba0b36ea7
RDX: 00007fff63b1ec3b RSI: 0000000000000002 RDI: 00007fff63b1ec30
RBP: 00007fff63b1ec30 R08: 00000000ffffffff R09: 00007fff63b1ea00
R10: 0000555556184893 R11: 0000000000000246 R12: 00007f0ba0b8f035
R13: 00007fff63b1fcf0 R14: 0000555556184810 R15: 00007fff63b1fd30
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
