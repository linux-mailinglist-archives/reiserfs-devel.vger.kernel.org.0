Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DCA82D0D0F
	for <lists+reiserfs-devel@lfdr.de>; Mon,  7 Dec 2020 10:34:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725770AbgLGJdv (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 7 Dec 2020 04:33:51 -0500
Received: from mail-il1-f200.google.com ([209.85.166.200]:37938 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725550AbgLGJdv (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 7 Dec 2020 04:33:51 -0500
Received: by mail-il1-f200.google.com with SMTP id e10so12378596ils.5
        for <reiserfs-devel@vger.kernel.org>; Mon, 07 Dec 2020 01:33:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=3l3sVcECEGrhm4ggZC50QK+EeJ6t6bebCjKEcTpMtNE=;
        b=KREn/N8oACq/QQ+0+fiV3Hq2k/DCjGvlxfUMtfExexe8uE3GCuC8qsJarsqGfWb5CM
         EBvy1m6kGVx01f4K1THdIOSwLu5nGap3lwvIgahpjD6piqb9nxvc9FxpR0QSweLXFJQf
         m+2bg5JRi4fYEOGOKJ62LnkTm7r9Ai5o8QZfkSozEJxLVdw/eL7f2F95V3AlR/rsNUoC
         o17fxQgDm14MBcZX4DE6a694pdL4vA/uh46izwFh2Nl4cOcCS3KxGGqhKDo5Xlduz/q7
         LfzRGNAtHMoVxzVlYHoQkxYhZjGBTqxJ6GwGjeYtd+Ewg3LMtojZxBarjHISNTnaYMl7
         Bb6g==
X-Gm-Message-State: AOAM533yhLBa/Vi/eYLUvfNYPfM6VM39q/SfCFV21at7nHrV3R48f0qV
        uWJxkNA4M/lTo/fpPzfnmMUebLQ6w1En32DB9bg+P07PZYDM
X-Google-Smtp-Source: ABdhPJzXoTJU1PLEWLDt155glJ29aunV81xvDwYXANLLvY9ErJ2TGZCDTVoW0XJRdbNtQ4z+74vPGZhrfjrSEUuBDmZGba+YSnv4
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:13c4:: with SMTP id v4mr12991966ilj.118.1607333590668;
 Mon, 07 Dec 2020 01:33:10 -0800 (PST)
Date:   Mon, 07 Dec 2020 01:33:10 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b51b6b05b5dc833b@google.com>
Subject: KASAN: use-after-free Read in reiserfs_fill_super
From:   syzbot <syzbot+2b5c012223e37b7c2a88@syzkaller.appspotmail.com>
To:     ebiggers@google.com, jack@suse.cz, jhubbard@nvidia.com,
        junxiao.bi@oracle.com, liao.pingfang@zte.com.cn,
        linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com, william.kucharski@oracle.com,
        willy@infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    b3298500 Merge tag 'for-5.10/dm-fixes' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11e64345500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e49433cfed49b7d9
dashboard link: https://syzkaller.appspot.com/bug?extid=2b5c012223e37b7c2a88
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12ad719b500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11193117500000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2b5c012223e37b7c2a88@syzkaller.appspotmail.com

REISERFS (device loop0): journal params: device loop0, size 8192, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
REISERFS (device loop0): checking transaction log (loop0)
==================================================================
BUG: KASAN: use-after-free in init_inode fs/reiserfs/inode.c:1325 [inline]
BUG: KASAN: use-after-free in reiserfs_read_locked_inode+0x1f2d/0x2230 fs/reiserfs/inode.c:1574
Read of size 4 at addr ffff888035a26000 by task syz-executor059/8481

CPU: 0 PID: 8481 Comm: syz-executor059 Not tainted 5.10.0-rc6-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x107/0x163 lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xae/0x4c8 mm/kasan/report.c:385
 __kasan_report mm/kasan/report.c:545 [inline]
 kasan_report.cold+0x1f/0x37 mm/kasan/report.c:562
 init_inode fs/reiserfs/inode.c:1325 [inline]
 reiserfs_read_locked_inode+0x1f2d/0x2230 fs/reiserfs/inode.c:1574
 reiserfs_fill_super+0x18eb/0x2e00 fs/reiserfs/super.c:2081
 mount_bdev+0x32e/0x3f0 fs/super.c:1419
 legacy_get_tree+0x105/0x220 fs/fs_context.c:592
 vfs_get_tree+0x89/0x2f0 fs/super.c:1549
 do_new_mount fs/namespace.c:2875 [inline]
 path_mount+0x13ad/0x20c0 fs/namespace.c:3205
 do_mount fs/namespace.c:3218 [inline]
 __do_sys_mount fs/namespace.c:3426 [inline]
 __se_sys_mount fs/namespace.c:3403 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3403
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x447d7a
Code: b8 08 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 7d a3 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 0f 83 5a a3 fb ff c3 66 0f 1f 84 00 00 00 00 00
RSP: 002b:00007ffcf7e76348 EFLAGS: 00000297 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffcf7e763a0 RCX: 0000000000447d7a
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007ffcf7e76360
RBP: 00007ffcf7e76360 R08: 00007ffcf7e763a0 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000297 R12: 0000000000000006
R13: 0000000000000004 R14: 0000000000000003 R15: 0000000000000003

The buggy address belongs to the page:
page:0000000050546bce refcount:0 mapcount:0 mapping:0000000000000000 index:0x1 pfn:0x35a26
flags: 0xfff00000000000()
raw: 00fff00000000000 ffffea0000d689c8 ffff8880b9e39d48 0000000000000000
raw: 0000000000000001 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff888035a25f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff888035a25f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff888035a26000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
                   ^
 ffff888035a26080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff888035a26100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
