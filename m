Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D720174F1C
	for <lists+reiserfs-devel@lfdr.de>; Sun,  1 Mar 2020 20:13:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgCATNS (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sun, 1 Mar 2020 14:13:18 -0500
Received: from mail-il1-f200.google.com ([209.85.166.200]:38691 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726465AbgCATNR (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 1 Mar 2020 14:13:17 -0500
Received: by mail-il1-f200.google.com with SMTP id i67so9151642ilf.5
        for <reiserfs-devel@vger.kernel.org>; Sun, 01 Mar 2020 11:13:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=jjlTu0sM1FCv2/JYXo8vf5D7M9vwMhnurnNYuMi1Y40=;
        b=l/43ldFtbcNzDwIDkxAhUY6k2b3olnRSTkDyuhCuD2vPWiQ2RQU6LqI8B8O9mfbCdW
         c5RDSCvPhf1T3XeLZ5MstlDfVTU9y4hOKVGro5eWDnt/eR8lPGFo1zlwCsMGocDFxtQb
         ZgH59b8/5AYzmjgdWmpR6ARqIABB6KUTr/IKgdwwhWnDDfZyapOokXJaHJydpOQkuoUP
         O/husdHl0emcbNpJLdMk6vrBWFnM2vKMYC3VFwY8NVhD0DTJNdQa8OC2UG6PiQMRftTe
         VeXTL9HCuPbueVFJqmrISmGZpcOJ0ni8/kprVH8c/m/JEe2VPztaCnVGRrbZ9o/JXTEa
         d8oQ==
X-Gm-Message-State: APjAAAXIByryw/wNO36h45pTwaaHo4fRDvJk2/aAzRmAYrD6sOFC4Kh3
        Dsvw7MzsOZQrz3SBH8nTdb9It+ISu4UWk/10N0J86lZKaEVu
X-Google-Smtp-Source: APXvYqyFjTc73AWOvtUb7cRh7w+U2e7isTS1N0zF91fwpsZL0rGSYF5dTB/f+iWZMEVL4u6pCjKFXZejrSfDmG2IVnP9ZKt8AN5c
MIME-Version: 1.0
X-Received: by 2002:a6b:8b10:: with SMTP id n16mr7999724iod.227.1583089995662;
 Sun, 01 Mar 2020 11:13:15 -0800 (PST)
Date:   Sun, 01 Mar 2020 11:13:15 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d6ce19059fcfdcd4@google.com>
Subject: memory leak in reiserfs_parse_options
From:   syzbot <syzbot+c9e294bbe0333a6b7640@syzkaller.appspotmail.com>
To:     darrick.wong@oracle.com, deepa.kernel@gmail.com, jack@suse.cz,
        jeffm@suse.com, jlayton@kernel.org, linux-kernel@vger.kernel.org,
        reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
        viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    63623fd4 Merge tag 'for-linus' of git://git.kernel.org/pub..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=164d5d29e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6951e37c8d613538
dashboard link: https://syzkaller.appspot.com/bug?extid=c9e294bbe0333a6b7640
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1308bbede00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15cd8e45e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+c9e294bbe0333a6b7640@syzkaller.appspotmail.com

executing program
BUG: memory leak
unreferenced object 0xffff88811df75f40 (size 32):
  comm "syz-executor611", pid 7103, jiffies 4294943290 (age 13.730s)
  hex dump (first 32 bytes):
    73 79 7a 00 00 00 00 00 00 00 00 00 00 00 00 00  syz.............
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<00000000adefbfe2>] kmemleak_alloc_recursive include/linux/kmemleak.h:43 [inline]
    [<00000000adefbfe2>] slab_post_alloc_hook mm/slab.h:586 [inline]
    [<00000000adefbfe2>] slab_alloc mm/slab.c:3320 [inline]
    [<00000000adefbfe2>] __do_kmalloc mm/slab.c:3654 [inline]
    [<00000000adefbfe2>] __kmalloc_track_caller+0x165/0x300 mm/slab.c:3671
    [<000000006e7fd3b2>] kstrdup+0x3a/0x70 mm/util.c:60
    [<00000000f4f9470a>] reiserfs_parse_options+0x94c/0xe80 fs/reiserfs/super.c:1277
    [<0000000080f3e2df>] reiserfs_fill_super+0x1a1/0x10e0 fs/reiserfs/super.c:1941
    [<00000000f75361a0>] mount_bdev+0x1ce/0x210 fs/super.c:1417
    [<00000000b8c200cc>] get_super_block+0x35/0x40 fs/reiserfs/super.c:2606
    [<00000000f4439f43>] legacy_get_tree+0x27/0x80 fs/fs_context.c:622
    [<000000008eb8d222>] vfs_get_tree+0x2d/0xe0 fs/super.c:1547
    [<00000000367f5f92>] do_new_mount fs/namespace.c:2822 [inline]
    [<00000000367f5f92>] do_mount+0x97c/0xc80 fs/namespace.c:3107
    [<0000000000ddb42a>] __do_sys_mount fs/namespace.c:3316 [inline]
    [<0000000000ddb42a>] __se_sys_mount fs/namespace.c:3293 [inline]
    [<0000000000ddb42a>] __x64_sys_mount+0xc0/0x140 fs/namespace.c:3293
    [<00000000a60abc01>] do_syscall_64+0x73/0x220 arch/x86/entry/common.c:294
    [<000000001bd2aaac>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff88811df755c0 (size 32):
  comm "syz-executor611", pid 7103, jiffies 4294943290 (age 13.730s)
  hex dump (first 32 bytes):
    73 79 7a 00 00 00 00 00 00 00 00 00 00 00 00 00  syz.............
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<00000000adefbfe2>] kmemleak_alloc_recursive include/linux/kmemleak.h:43 [inline]
    [<00000000adefbfe2>] slab_post_alloc_hook mm/slab.h:586 [inline]
    [<00000000adefbfe2>] slab_alloc mm/slab.c:3320 [inline]
    [<00000000adefbfe2>] __do_kmalloc mm/slab.c:3654 [inline]
    [<00000000adefbfe2>] __kmalloc_track_caller+0x165/0x300 mm/slab.c:3671
    [<000000006e7fd3b2>] kstrdup+0x3a/0x70 mm/util.c:60
    [<00000000f4f9470a>] reiserfs_parse_options+0x94c/0xe80 fs/reiserfs/super.c:1277
    [<0000000080f3e2df>] reiserfs_fill_super+0x1a1/0x10e0 fs/reiserfs/super.c:1941
    [<00000000f75361a0>] mount_bdev+0x1ce/0x210 fs/super.c:1417
    [<00000000b8c200cc>] get_super_block+0x35/0x40 fs/reiserfs/super.c:2606
    [<00000000f4439f43>] legacy_get_tree+0x27/0x80 fs/fs_context.c:622
    [<000000008eb8d222>] vfs_get_tree+0x2d/0xe0 fs/super.c:1547
    [<00000000367f5f92>] do_new_mount fs/namespace.c:2822 [inline]
    [<00000000367f5f92>] do_mount+0x97c/0xc80 fs/namespace.c:3107
    [<0000000000ddb42a>] __do_sys_mount fs/namespace.c:3316 [inline]
    [<0000000000ddb42a>] __se_sys_mount fs/namespace.c:3293 [inline]
    [<0000000000ddb42a>] __x64_sys_mount+0xc0/0x140 fs/namespace.c:3293
    [<00000000a60abc01>] do_syscall_64+0x73/0x220 arch/x86/entry/common.c:294
    [<000000001bd2aaac>] entry_SYSCALL_64_after_hwframe+0x44/0xa9



---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
