Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A07DB287688
	for <lists+reiserfs-devel@lfdr.de>; Thu,  8 Oct 2020 16:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730763AbgJHO7S (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 8 Oct 2020 10:59:18 -0400
Received: from mail-il1-f205.google.com ([209.85.166.205]:50763 "EHLO
        mail-il1-f205.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730655AbgJHO7S (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 8 Oct 2020 10:59:18 -0400
Received: by mail-il1-f205.google.com with SMTP id h16so3210058ilq.17
        for <reiserfs-devel@vger.kernel.org>; Thu, 08 Oct 2020 07:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=S0n5JCd9SrefY0K/bE0BUwuaxFr2/JQdj8K7MO2HBwo=;
        b=b8BkBF76v1y/hTxyNQ0ahHzAywUSimsqn2OsSGFLac2pFjQw4ZEhsyPz/oQGO9aEEw
         D8R16ssFxVd7/9GU3NxltqZ3HPrrkCo4HjVyYLqO+zSGklyACiTtEfr+/IfvC0Od6Psi
         N615jmerOdocqKnSVZVdUelLy5MX1fyAQ1nvjeM7omULj/HXsoYGIFXUEunbm9AQYCn3
         6C4upD4KGosf/mGwhnnlJbbQs6zThlhTPmsZUaOT6AgxlaG7kZHXwDCatz5xVuxch4h7
         UFXvZreyomNKB46Mcn5llxo4yRDGxJKwg3IFb/U3AjHmdpWYLRadtivAl9G7IbhqdUjk
         oTsQ==
X-Gm-Message-State: AOAM531wlKrAQVfCR6XcHdERzgoXs/UHlJoT+jmHQOaoDUKNOrBmoxs/
        j4nlSvvnAh8e/7bBJQPyukswZ/Iv0uHFRYNgh2bAO0hIo0oZ
X-Google-Smtp-Source: ABdhPJyVROS/QHB6L9ylt6hctnvKKyQoDrfrBHOKj4ZiItU2g1eo7hO2ekhikOcTpckvAmztmrQS9HMJ0WT671r2mz8+A4O3haIT
MIME-Version: 1.0
X-Received: by 2002:a02:c942:: with SMTP id u2mr7070148jao.114.1602169157524;
 Thu, 08 Oct 2020 07:59:17 -0700 (PDT)
Date:   Thu, 08 Oct 2020 07:59:17 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000081256605b12a1311@google.com>
Subject: KASAN: use-after-free Read in search_by_entry_key
From:   syzbot <syzbot+83b6f7cf9922cae5c4d7@syzkaller.appspotmail.com>
To:     akpm@linux-foundation.org, colin.king@canonical.com, jack@suse.cz,
        jeffm@suse.com, linux-kernel@vger.kernel.org,
        reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    c85fb28b Merge tag 'arm64-fixes' of git://git.kernel.org/p..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=136fa1fb900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=de7f697da23057c7
dashboard link: https://syzkaller.appspot.com/bug?extid=83b6f7cf9922cae5c4d7
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17ef5d4f900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11396677900000

Bisection is inconclusive: the issue happens on the oldest tested release.

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13e47620500000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=10147620500000
console output: https://syzkaller.appspot.com/x/log.txt?x=17e47620500000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+83b6f7cf9922cae5c4d7@syzkaller.appspotmail.com

REISERFS (device loop0): journal params: device loop0, size 15748, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
REISERFS (device loop0): checking transaction log (loop0)
REISERFS (device loop0): Using r5 hash to sort names
REISERFS (device loop0): using 3.5.x disk format
==================================================================
BUG: KASAN: use-after-free in bin_search_in_dir_item fs/reiserfs/namei.c:40 [inline]
BUG: KASAN: use-after-free in search_by_entry_key+0x450/0xad0 fs/reiserfs/namei.c:164
Read of size 4 at addr ffff88807cd0b7bd by task syz-executor710/6847

CPU: 1 PID: 6847 Comm: syz-executor710 Not tainted 5.9.0-rc8-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x1d6/0x29e lib/dump_stack.c:118
 print_address_description+0x66/0x620 mm/kasan/report.c:383
 __kasan_report mm/kasan/report.c:513 [inline]
 kasan_report+0x132/0x1d0 mm/kasan/report.c:530
 bin_search_in_dir_item fs/reiserfs/namei.c:40 [inline]
 search_by_entry_key+0x450/0xad0 fs/reiserfs/namei.c:164
 reiserfs_find_entry+0x246/0x1260 fs/reiserfs/namei.c:321
 reiserfs_lookup+0x156/0x3a0 fs/reiserfs/namei.c:367
 __lookup_slow+0x240/0x370 fs/namei.c:1544
 lookup_one_len+0x10e/0x200 fs/namei.c:2562
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
RIP: 0033:0x447d9a
Code: b8 08 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 7d a3 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 0f 83 5a a3 fb ff c3 66 0f 1f 84 00 00 00 00 00
RSP: 002b:00007ffc5d05d468 EFLAGS: 00000297 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffc5d05d4c0 RCX: 0000000000447d9a
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007ffc5d05d480
RBP: 00007ffc5d05d480 R08: 00007ffc5d05d4c0 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000297 R12: 0000000000000006
R13: 0000000000000004 R14: 0000000000000003 R15: 0000000000000003

The buggy address belongs to the page:
page:0000000023b676e0 refcount:0 mapcount:0 mapping:0000000000000000 index:0x1 pfn:0x7cd0b
flags: 0xfffe0000000000()
raw: 00fffe0000000000 ffffea0001f34308 ffffea0001f34288 0000000000000000
raw: 0000000000000001 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff88807cd0b680: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff88807cd0b700: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>ffff88807cd0b780: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
                                        ^
 ffff88807cd0b800: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff88807cd0b880: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
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
