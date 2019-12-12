Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E41711C21E
	for <lists+reiserfs-devel@lfdr.de>; Thu, 12 Dec 2019 02:25:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727491AbfLLBZK (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 11 Dec 2019 20:25:10 -0500
Received: from mail-il1-f197.google.com ([209.85.166.197]:46987 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727409AbfLLBZJ (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 11 Dec 2019 20:25:09 -0500
Received: by mail-il1-f197.google.com with SMTP id s85so382913ild.13
        for <reiserfs-devel@vger.kernel.org>; Wed, 11 Dec 2019 17:25:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=wx+687xKmnQ7vBPOxCs43VQhwsuLoEQ9LmrYpeYG+3s=;
        b=SRLhSeNbiGHHcgyRLA76Px3Gh+jfO4v5YYVmw8c+Cxy85KLWFB0lBAKZn26Kns9YPt
         auZkkIdiRffKcU1NyrHMzqtM664PIDkN2YpSz/N53O8iII8hYwavUI5qSIKnAa6CPQMt
         glQs3lW78l7MgVK5lzRRUIJloP6e691v9udNKnFEVnZV5u/zJCUrZg1kDQsjQQe5dll1
         23S1hFKQezCQShsOjHzOz5ZXO3Fw6XzbYddokEPncJ1vZdSBFdnCcZqRVhAZyXWvphaM
         XWasIL6lW92P6ke+eo69QerF6Scir4krocHRB3ZyJjp17reH+zYJR14AFeWX9jJKx1ED
         rd9Q==
X-Gm-Message-State: APjAAAWp9uMyK7ag6FrOtPgGVf9Mbh2tUKY+3r/uigOZkyDI5Lmf1E/k
        4H15igOoBUsWqAromz2YAGXMtP6zhEBWrH049bOUjdTCzYQa
X-Google-Smtp-Source: APXvYqzBLnfETCadqrIfJE9g7OT1TFxiJndTWcNxhFw5GJ/NlpqpCbua9DRWxZ0FxBF5Qbv5ctBWNZqZWE7zm9wTqjS7tc8ttGcG
MIME-Version: 1.0
X-Received: by 2002:a92:2810:: with SMTP id l16mr5875511ilf.57.1576113908946;
 Wed, 11 Dec 2019 17:25:08 -0800 (PST)
Date:   Wed, 11 Dec 2019 17:25:08 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ab22f20599779d25@google.com>
Subject: memory leak in reiserfs_fill_super
From:   syzbot <syzbot+1c6756baf4b16b94d2a6@syzkaller.appspotmail.com>
To:     deepa.kernel@gmail.com, jack@suse.cz, jeffm@suse.com,
        jlayton@kernel.org, linux-kernel@vger.kernel.org,
        reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
        viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    6794862a Merge tag 'for-5.5-rc1-kconfig-tag' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1158c12ee00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bbf3a35184a3ed64
dashboard link: https://syzkaller.appspot.com/bug?extid=1c6756baf4b16b94d2a6
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=165a64fae00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12083661e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+1c6756baf4b16b94d2a6@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff88811ff310c0 (size 32):
   comm "syz-executor671", pid 7128, jiffies 4294943335 (age 13.580s)
   hex dump (first 32 bytes):
     2e 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
     01 00 00 00 01 00 00 00 18 00 00 00 00 00 00 00  ................
   backtrace:
     [<000000004089eb3d>] kmemleak_alloc_recursive  
include/linux/kmemleak.h:43 [inline]
     [<000000004089eb3d>] slab_post_alloc_hook mm/slab.h:586 [inline]
     [<000000004089eb3d>] slab_alloc mm/slab.c:3320 [inline]
     [<000000004089eb3d>] __do_kmalloc mm/slab.c:3654 [inline]
     [<000000004089eb3d>] __kmalloc_track_caller+0x165/0x300 mm/slab.c:3671
     [<000000008421832f>] kstrdup+0x3a/0x70 mm/util.c:60
     [<0000000043bf75e5>] reiserfs_fill_super+0x500/0x1120  
fs/reiserfs/super.c:1946
     [<000000009cbc0e69>] mount_bdev+0x1ce/0x210 fs/super.c:1415
     [<00000000934dd7f3>] get_super_block+0x35/0x40 fs/reiserfs/super.c:2604
     [<00000000cf77f9c8>] legacy_get_tree+0x27/0x80 fs/fs_context.c:647
     [<000000000d70f443>] vfs_get_tree+0x2d/0xe0 fs/super.c:1545
     [<00000000be5ed892>] do_new_mount fs/namespace.c:2822 [inline]
     [<00000000be5ed892>] do_mount+0x97c/0xc80 fs/namespace.c:3142
     [<00000000f546ac03>] ksys_mount+0xab/0x120 fs/namespace.c:3351
     [<000000005818601f>] __do_sys_mount fs/namespace.c:3365 [inline]
     [<000000005818601f>] __se_sys_mount fs/namespace.c:3362 [inline]
     [<000000005818601f>] __x64_sys_mount+0x26/0x30 fs/namespace.c:3362
     [<00000000a358ffb7>] do_syscall_64+0x73/0x220  
arch/x86/entry/common.c:294
     [<00000000cb1c9cc8>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff8881232e08e0 (size 32):
   comm "syz-executor671", pid 7135, jiffies 4294943878 (age 8.150s)
   hex dump (first 32 bytes):
     2e 00 63 75 72 69 74 79 2e 73 65 6c 69 6e 75 78  ..curity.selinux
     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
   backtrace:
     [<000000004089eb3d>] kmemleak_alloc_recursive  
include/linux/kmemleak.h:43 [inline]
     [<000000004089eb3d>] slab_post_alloc_hook mm/slab.h:586 [inline]
     [<000000004089eb3d>] slab_alloc mm/slab.c:3320 [inline]
     [<000000004089eb3d>] __do_kmalloc mm/slab.c:3654 [inline]
     [<000000004089eb3d>] __kmalloc_track_caller+0x165/0x300 mm/slab.c:3671
     [<000000008421832f>] kstrdup+0x3a/0x70 mm/util.c:60
     [<0000000043bf75e5>] reiserfs_fill_super+0x500/0x1120  
fs/reiserfs/super.c:1946
     [<000000009cbc0e69>] mount_bdev+0x1ce/0x210 fs/super.c:1415
     [<00000000934dd7f3>] get_super_block+0x35/0x40 fs/reiserfs/super.c:2604
     [<00000000cf77f9c8>] legacy_get_tree+0x27/0x80 fs/fs_context.c:647
     [<000000000d70f443>] vfs_get_tree+0x2d/0xe0 fs/super.c:1545
     [<00000000be5ed892>] do_new_mount fs/namespace.c:2822 [inline]
     [<00000000be5ed892>] do_mount+0x97c/0xc80 fs/namespace.c:3142
     [<00000000f546ac03>] ksys_mount+0xab/0x120 fs/namespace.c:3351
     [<000000005818601f>] __do_sys_mount fs/namespace.c:3365 [inline]
     [<000000005818601f>] __se_sys_mount fs/namespace.c:3362 [inline]
     [<000000005818601f>] __x64_sys_mount+0x26/0x30 fs/namespace.c:3362
     [<00000000a358ffb7>] do_syscall_64+0x73/0x220  
arch/x86/entry/common.c:294
     [<00000000cb1c9cc8>] entry_SYSCALL_64_after_hwframe+0x44/0xa9



---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
