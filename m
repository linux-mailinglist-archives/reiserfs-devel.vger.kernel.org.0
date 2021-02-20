Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2E1320419
	for <lists+reiserfs-devel@lfdr.de>; Sat, 20 Feb 2021 07:06:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbhBTGGC (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sat, 20 Feb 2021 01:06:02 -0500
Received: from mail-io1-f70.google.com ([209.85.166.70]:52057 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbhBTGGB (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sat, 20 Feb 2021 01:06:01 -0500
Received: by mail-io1-f70.google.com with SMTP id j2so5416279iow.18
        for <reiserfs-devel@vger.kernel.org>; Fri, 19 Feb 2021 22:05:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=xR2lYrl2rO31/7brBFYZKgpp4LvejpyF05dbAyouGuc=;
        b=cLhjBN3PIiHo1GvjUHRyfA+zol0lJ9HaEn9d5ihE8iIn8Le/zrnSgFEW7mMtnc1GWZ
         j0Wdo6OqY39vaQPZ9IoFkSk11eqin4a9Pnx9Rb47iL7SNFBxRrDpwSdWogTZlSYNX8Ve
         0WJy9O7zMwQcGE0v3vB9KLbJsqo8daXCe5P8ICGpn1nXk8dpwTUe3V8VaU4tLTAH3tGW
         ZB5eBTuKNHyLnU4pHEKXmvJuzC4DBJCQ5pjwF7WMS4rOFJ2tDEG2SrwdaSMx2chu1jz0
         N2k+OQdESH7ujJDtcXF3Pv2QVw/9rGnemq/FYJAERZ8SQRvuY+dV86wCFthV2BU8ZrpY
         AsUQ==
X-Gm-Message-State: AOAM531Iq3I14VxI+Y5ppJoZGLCwwTQJbcKQZ8Vg69WB8je+E8xscYXV
        mhjlXJNmvVh6fq+73l+9PaMZ35jSl7zp5wQz6CmcojzH7rel
X-Google-Smtp-Source: ABdhPJy8Q4OwZuXZgBB7AZPMCrtvxNicI+ZGkGM8KdL0dONVA621Xr735lZGB2YntR+/Ej5+1GSOmM/dvkIkxYnpG9wsdrjSM38g
MIME-Version: 1.0
X-Received: by 2002:a05:6602:200e:: with SMTP id y14mr1465878iod.94.1613801120415;
 Fri, 19 Feb 2021 22:05:20 -0800 (PST)
Date:   Fri, 19 Feb 2021 22:05:20 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000085468e05bbbe5a7a@google.com>
Subject: KASAN: out-of-bounds Read in leaf_paste_entries
From:   syzbot <syzbot+c31a48e6702ccb3d64c9@syzkaller.appspotmail.com>
To:     linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    f40ddce8 Linux 5.11
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16c21204d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=51ab7ccaffffc30c
dashboard link: https://syzkaller.appspot.com/bug?extid=c31a48e6702ccb3d64c9
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10ede514d00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13f9f338d00000

Bisection is inconclusive: the issue happens on the oldest tested release.

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=141b8882d00000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=161b8882d00000
console output: https://syzkaller.appspot.com/x/log.txt?x=121b8882d00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c31a48e6702ccb3d64c9@syzkaller.appspotmail.com

REISERFS (device loop0): journal params: device loop0, size 15748, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
REISERFS (device loop0): checking transaction log (loop0)
REISERFS (device loop0): Using tea hash to sort names
==================================================================
BUG: KASAN: out-of-bounds in memmove include/linux/string.h:462 [inline]
BUG: KASAN: out-of-bounds in leaf_paste_entries+0x449/0x910 fs/reiserfs/lbalance.c:1377
Read of size 18446744073709551584 at addr ffff888040a03fa4 by task syz-executor585/8424

CPU: 1 PID: 8424 Comm: syz-executor585 Not tainted 5.11.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x107/0x163 lib/dump_stack.c:120
 print_address_description.constprop.0.cold+0x5b/0x2c6 mm/kasan/report.c:230
 __kasan_report mm/kasan/report.c:396 [inline]
 kasan_report.cold+0x79/0xd5 mm/kasan/report.c:413
 check_memory_region_inline mm/kasan/generic.c:179 [inline]
 check_memory_region+0x13d/0x180 mm/kasan/generic.c:185
 memmove+0x20/0x60 mm/kasan/shadow.c:53
 memmove include/linux/string.h:462 [inline]
 leaf_paste_entries+0x449/0x910 fs/reiserfs/lbalance.c:1377
 balance_leaf_finish_node_paste_dirent fs/reiserfs/do_balan.c:1295 [inline]
 balance_leaf_finish_node_paste fs/reiserfs/do_balan.c:1321 [inline]
 balance_leaf_finish_node fs/reiserfs/do_balan.c:1364 [inline]
 balance_leaf+0x951e/0xd8b0 fs/reiserfs/do_balan.c:1452
 do_balance+0x315/0x810 fs/reiserfs/do_balan.c:1888
 reiserfs_paste_into_item+0x762/0x8e0 fs/reiserfs/stree.c:2138
 reiserfs_add_entry+0x8cb/0xcf0 fs/reiserfs/namei.c:566
 reiserfs_mkdir+0x66e/0x980 fs/reiserfs/namei.c:858
 create_privroot fs/reiserfs/xattr.c:889 [inline]
 reiserfs_xattr_init+0x4de/0xb60 fs/reiserfs/xattr.c:1011
 reiserfs_fill_super+0x215d/0x2e00 fs/reiserfs/super.c:2177
 mount_bdev+0x34d/0x410 fs/super.c:1366
 legacy_get_tree+0x105/0x220 fs/fs_context.c:592
 vfs_get_tree+0x89/0x2f0 fs/super.c:1496
 do_new_mount fs/namespace.c:2881 [inline]
 path_mount+0x13ad/0x20c0 fs/namespace.c:3211
 do_mount fs/namespace.c:3224 [inline]
 __do_sys_mount fs/namespace.c:3432 [inline]
 __se_sys_mount fs/namespace.c:3409 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3409
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x445b8a
Code: 48 c7 c2 c0 ff ff ff f7 d8 64 89 02 b8 ff ff ff ff eb d2 e8 a8 00 00 00 0f 1f 84 00 00 00 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff8c7af438 EFLAGS: 00000286 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007fff8c7af490 RCX: 0000000000445b8a
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007fff8c7af450
RBP: 00007fff8c7af450 R08: 00007fff8c7af490 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000286 R12: 00000000200002a8
R13: 0000000000000003 R14: 0000000000000004 R15: 0000000000000007

The buggy address belongs to the page:
page:000000008f17f20f refcount:3 mapcount:0 mapping:000000009acfcc32 index:0x3d97 pfn:0x40a03
aops:def_blk_aops ino:700000
flags: 0xfff00000002022(referenced|active|private)
raw: 00fff00000002022 dead000000000100 dead000000000122 ffff88801795cb50
raw: 0000000000003d97 ffff888038f7c4c8 00000003ffffffff ffff8881407ac000
page dumped because: kasan: bad access detected
pages's memcg:ffff8881407ac000

Memory state around the buggy address:
 ffff888040a03e80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff888040a03f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff888040a03f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
                               ^
 ffff888040a04000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff888040a04080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
