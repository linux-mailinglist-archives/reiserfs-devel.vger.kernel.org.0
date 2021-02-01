Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7349430A40F
	for <lists+reiserfs-devel@lfdr.de>; Mon,  1 Feb 2021 10:11:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232779AbhBAJKN (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 1 Feb 2021 04:10:13 -0500
Received: from mail-il1-f199.google.com ([209.85.166.199]:40013 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232709AbhBAJKD (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 1 Feb 2021 04:10:03 -0500
Received: by mail-il1-f199.google.com with SMTP id v16so13135391iln.7
        for <reiserfs-devel@vger.kernel.org>; Mon, 01 Feb 2021 01:09:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=q4IlG87Xp0Gf+k6vuti/anAmeUPeiK24bGUhunTjwo8=;
        b=CNPPFbfIQv5Mib7pQSZnIcQwwtv6MXj35hAZ5yEJDeWX4iQ9PQH6CaG9RGHYDRp5jg
         3Qxu/q96Ns9D765gJcvu57v9XKJrWLX/xaCgxLeyH/QRDfGo2qHLeZHVQFqVQb32RYXt
         xSJOsNrxD03ybTb2SoBl4Oo7o02P/Rm70pqWjBeR9WbhAJaHv1OaLJ2n+uWR4ZgTvOLf
         VKXwN46A+34SYhJ9EpMMmjTx04s786WsI7FQw8bdJiQcWy3z4qcwpr9+hxE1JFf3UsmY
         Fgq/zfuHjbUR7BFbv3ir+6YXwqqtSyky5wthCvOfK4QBxfIEB04paoENbKYp6THcayaa
         FRjQ==
X-Gm-Message-State: AOAM531D8VFT7AWPaFtLEBejkW3KwG4eYPZS99lwSPFaKPfpeWrMbpgT
        W8YHAncUai7uIk7KktbeEa76G3nYf+6D1X169qU1ihrDr89E
X-Google-Smtp-Source: ABdhPJwkcTZYNwM4CgI2yjoOtxiin+FQ2NeVzAivI//iIfrdzOPN4/M+7rq63VDl5I3CLFj+mXiT4nA5ZTHhXkhtEoWdmhyGo66m
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a68:: with SMTP id w8mr12031002ilv.147.1612170439634;
 Mon, 01 Feb 2021 01:07:19 -0800 (PST)
Date:   Mon, 01 Feb 2021 01:07:19 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005f397905ba42aea8@google.com>
Subject: KMSAN: uninit-value in reiserfs_new_inode
From:   syzbot <syzbot+2a318f14e5e6bb69b96b@syzkaller.appspotmail.com>
To:     akpm@linux-foundation.org, ebiggers@google.com, glider@google.com,
        jack@suse.cz, joseph.qi@linux.alibaba.com,
        liao.pingfang@zte.com.cn, linux-kernel@vger.kernel.org,
        reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
        william.kucharski@oracle.com, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    73d62e81 kmsan: random: prevent boot-time reports in _mix_..
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=12a62e6f500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=31d3b433c9628854
dashboard link: https://syzkaller.appspot.com/bug?extid=2a318f14e5e6bb69b96b
compiler:       clang version 11.0.1
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2a318f14e5e6bb69b96b@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in reiserfs_new_inode+0x207c/0x3c30 fs/reiserfs/inode.c:2058
CPU: 0 PID: 8539 Comm: syz-executor.0 Not tainted 5.10.0-rc4-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x21c/0x280 lib/dump_stack.c:118
 kmsan_report+0xfb/0x1e0 mm/kmsan/kmsan_report.c:118
 __msan_warning+0x5f/0xa0 mm/kmsan/kmsan_instr.c:197
 reiserfs_new_inode+0x207c/0x3c30 fs/reiserfs/inode.c:2058
 reiserfs_create+0x89b/0xf00 fs/reiserfs/namei.c:667
 xattr_create fs/reiserfs/xattr.c:69 [inline]
 xattr_lookup+0x495/0x6a0 fs/reiserfs/xattr.c:412
 reiserfs_xattr_set_handle+0x1eb/0x2ab0 fs/reiserfs/xattr.c:540
 reiserfs_xattr_set+0x84d/0x9f0 fs/reiserfs/xattr.c:640
 trusted_set+0x1ea/0x260 fs/reiserfs/xattr_trusted.c:30
 __vfs_setxattr+0x90e/0x960 fs/xattr.c:177
 __vfs_setxattr_noperm+0x376/0xc70 fs/xattr.c:208
 __vfs_setxattr_locked+0x5ed/0x690 fs/xattr.c:266
 vfs_setxattr+0x1e4/0x4d0 fs/xattr.c:283
 setxattr+0x446/0x900 fs/xattr.c:548
 path_setxattr+0x2cd/0x4e0 fs/xattr.c:567
 __do_sys_setxattr fs/xattr.c:582 [inline]
 __se_sys_setxattr+0xee/0x110 fs/xattr.c:578
 __ia32_sys_setxattr+0x62/0x80 fs/xattr.c:578
 do_syscall_32_irqs_on arch/x86/entry/common.c:80 [inline]
 __do_fast_syscall_32+0x102/0x160 arch/x86/entry/common.c:139
 do_fast_syscall_32+0x6a/0xc0 arch/x86/entry/common.c:162
 do_SYSENTER_32+0x73/0x90 arch/x86/entry/common.c:205
 entry_SYSENTER_compat_after_hwframe+0x4d/0x5c
RIP: 0023:0xf7fa5549
Code: b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 eb 0d 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 002b:00000000f555d0cc EFLAGS: 00000296 ORIG_RAX: 00000000000000e2
RAX: ffffffffffffffda RBX: 00000000200001c0 RCX: 0000000020000280
RDX: 00000000200002c0 RSI: 0000000000000001 RDI: 0000000000000003
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000

Uninit was created at:
 kmsan_save_stack_with_flags+0x3c/0x90 mm/kmsan/kmsan.c:121
 kmsan_alloc_page+0xd3/0x1f0 mm/kmsan/kmsan_shadow.c:274
 __alloc_pages_nodemask+0x827/0xf90 mm/page_alloc.c:4989
 alloc_pages_current+0x7b6/0xb60 mm/mempolicy.c:2271
 alloc_pages include/linux/gfp.h:547 [inline]
 alloc_slab_page mm/slub.c:1630 [inline]
 allocate_slab+0x346/0x11a0 mm/slub.c:1773
 new_slab mm/slub.c:1834 [inline]
 new_slab_objects mm/slub.c:2593 [inline]
 ___slab_alloc+0xd42/0x1930 mm/slub.c:2756
 __slab_alloc mm/slub.c:2796 [inline]
 slab_alloc_node mm/slub.c:2871 [inline]
 slab_alloc mm/slub.c:2915 [inline]
 kmem_cache_alloc+0xb71/0x1040 mm/slub.c:2920
 reiserfs_alloc_inode+0x5a/0x170 fs/reiserfs/super.c:642
 alloc_inode fs/inode.c:234 [inline]
 iget5_locked+0x1d7/0x990 fs/inode.c:1150
 reiserfs_fill_super+0x29a5/0x6010 fs/reiserfs/super.c:2063
 mount_bdev+0x618/0x900 fs/super.c:1419
 get_super_block+0xc9/0xe0 fs/reiserfs/super.c:2606
 legacy_get_tree+0x163/0x2e0 fs/fs_context.c:592
 vfs_get_tree+0xd8/0x5e0 fs/super.c:1549
 do_new_mount fs/namespace.c:2875 [inline]
 path_mount+0x3df0/0x5e50 fs/namespace.c:3205
 do_mount fs/namespace.c:3218 [inline]
 __do_sys_mount fs/namespace.c:3426 [inline]
 __se_sys_mount+0x921/0xa10 fs/namespace.c:3403
 __ia32_sys_mount+0x62/0x80 fs/namespace.c:3403
 do_syscall_32_irqs_on arch/x86/entry/common.c:80 [inline]
 __do_fast_syscall_32+0x102/0x160 arch/x86/entry/common.c:139
 do_fast_syscall_32+0x6a/0xc0 arch/x86/entry/common.c:162
 do_SYSENTER_32+0x73/0x90 arch/x86/entry/common.c:205
 entry_SYSENTER_compat_after_hwframe+0x4d/0x5c
=====================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
