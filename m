Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCF50271EF4
	for <lists+reiserfs-devel@lfdr.de>; Mon, 21 Sep 2020 11:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbgIUJcW (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 21 Sep 2020 05:32:22 -0400
Received: from mail-io1-f78.google.com ([209.85.166.78]:42646 "EHLO
        mail-io1-f78.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbgIUJcW (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 21 Sep 2020 05:32:22 -0400
Received: by mail-io1-f78.google.com with SMTP id w3so9461059iou.9
        for <reiserfs-devel@vger.kernel.org>; Mon, 21 Sep 2020 02:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=7LScLTXNzm2gkUhCR7T2xXINYdd7EBa4X2Zs75O1O7o=;
        b=oKg26tnGR7ato/U/I9Gxw5up9nSiPq4R7/xgvXtPZTHmOM5gLoC7ZPOTlL0zJ9OwoR
         ZtV/u4HfMYjVClqD1lSUw6lYU/bSpFlzuxYuszysswP8+u+GQlaCfl1iPCc/jMUm3l9C
         uHnvg9rjGStJDKsIacK02YKam1anrFosvUyweqXvgY6mIuyzDBsY7YN78fKR+wTWbbyB
         UV999UPI/zOqLpWHpTeLp8JoRvGC3PQy0ElDRp76WXm9wPMNms++9w8wvuo2UBZIBu+B
         foU/CHSQ+UFwFzyYblWlrjNjJGTuz5bpzxD1X0gwEmLlSC8yCoNGPekIlKVYjYcpGXUl
         mnYA==
X-Gm-Message-State: AOAM5329dg8IC3Lw0ic8Ef5pKjcpx9fpO4EToPOlK5F8mGqY9oM+Yhoi
        oppgMOK2J/1bnsCsc3ghP3d/zG2S7xfyO98ubJYCGaZ22UYt
X-Google-Smtp-Source: ABdhPJzLHqim6HCKec20SLNkfFBDZgy0YtLJkycvuB4vVEMZo5k481NdjX5SfjL26vqnFNfjmUP4IXddrACBLHReH7HPnLLftTBs
MIME-Version: 1.0
X-Received: by 2002:a92:1a03:: with SMTP id a3mr40404624ila.105.1600680740894;
 Mon, 21 Sep 2020 02:32:20 -0700 (PDT)
Date:   Mon, 21 Sep 2020 02:32:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f5be7f05afcf862a@google.com>
Subject: general protection fault in reiserfs_security_init
From:   syzbot <syzbot+690cb1e51970435f9775@syzkaller.appspotmail.com>
To:     linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    325d0eab Merge branch 'akpm' (patches from Andrew)
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1671c0e3900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b12e84189082991c
dashboard link: https://syzkaller.appspot.com/bug?extid=690cb1e51970435f9775
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15705a3d900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=117b3281900000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+690cb1e51970435f9775@syzkaller.appspotmail.com

REISERFS (device loop0): journal params: device loop0, size 15748, journal first block 18, max trans len 256, max batch 225, max commit age 30, max trans age 30
REISERFS (device loop0): checking transaction log (loop0)
REISERFS (device loop0): Using tea hash to sort names
REISERFS (device loop0): using 3.5.x disk format
general protection fault, probably for non-canonical address 0xdffffc000000000d: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000068-0x000000000000006f]
CPU: 0 PID: 6874 Comm: syz-executor834 Not tainted 5.9.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:d_really_is_negative include/linux/dcache.h:472 [inline]
RIP: 0010:reiserfs_xattr_jcreate_nblocks fs/reiserfs/xattr.h:78 [inline]
RIP: 0010:reiserfs_security_init+0x285/0x4d0 fs/reiserfs/xattr_security.c:70
Code: 48 c1 ea 03 80 3c 02 00 0f 85 2b 02 00 00 4d 8b ad a0 05 00 00 48 b8 00 00 00 00 00 fc ff df 49 8d 7d 68 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 23 02 00 00 49 83 7d 68 00 0f 84 62 01 00 00 48
RSP: 0018:ffffc90005827980 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: 0000000000000036 RCX: 000000000000006c
RDX: 000000000000000d RSI: ffffffff82009dd3 RDI: 0000000000000068
RBP: ffff88807d8441d0 R08: ffffc90005827a10 R09: ffffc90005827a18
R10: 0000000000000000 R11: 0000000000000000 R12: 00000000000005fa
R13: 0000000000000000 R14: ffff888094e60000 R15: 0000000000000000
FS:  0000000001036880(0000) GS:ffff8880ae400000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f5a6fb90ab4 CR3: 000000009a1ab000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 reiserfs_mkdir+0x2c9/0x980 fs/reiserfs/namei.c:821
 create_privroot fs/reiserfs/xattr.c:882 [inline]
 reiserfs_xattr_init+0x4de/0xb52 fs/reiserfs/xattr.c:1004
 reiserfs_fill_super+0x215d/0x2df3 fs/reiserfs/super.c:2177
 mount_bdev+0x32e/0x3f0 fs/super.c:1417
 legacy_get_tree+0x105/0x220 fs/fs_context.c:592
 vfs_get_tree+0x89/0x2f0 fs/super.c:1547
 do_new_mount fs/namespace.c:2875 [inline]
 path_mount+0x1387/0x20a0 fs/namespace.c:3192
 do_mount fs/namespace.c:3205 [inline]
 __do_sys_mount fs/namespace.c:3413 [inline]
 __se_sys_mount fs/namespace.c:3390 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3390
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x447d9a
Code: b8 08 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 7d a3 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 0f 83 5a a3 fb ff c3 66 0f 1f 84 00 00 00 00 00
RSP: 002b:00007fffe558f5c8 EFLAGS: 00000297 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007fffe558f620 RCX: 0000000000447d9a
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007fffe558f5e0
RBP: 00007fffe558f5e0 R08: 00007fffe558f620 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000297 R12: 0000000000000006
R13: 0000000000000004 R14: 0000000000000003 R15: 0000000000000003
Modules linked in:
---[ end trace e6a0a9f4ee2cea86 ]---
RIP: 0010:d_really_is_negative include/linux/dcache.h:472 [inline]
RIP: 0010:reiserfs_xattr_jcreate_nblocks fs/reiserfs/xattr.h:78 [inline]
RIP: 0010:reiserfs_security_init+0x285/0x4d0 fs/reiserfs/xattr_security.c:70
Code: 48 c1 ea 03 80 3c 02 00 0f 85 2b 02 00 00 4d 8b ad a0 05 00 00 48 b8 00 00 00 00 00 fc ff df 49 8d 7d 68 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 23 02 00 00 49 83 7d 68 00 0f 84 62 01 00 00 48
RSP: 0018:ffffc90005827980 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: 0000000000000036 RCX: 000000000000006c
RDX: 000000000000000d RSI: ffffffff82009dd3 RDI: 0000000000000068
RBP: ffff88807d8441d0 R08: ffffc90005827a10 R09: ffffc90005827a18
R10: 0000000000000000 R11: 0000000000000000 R12: 00000000000005fa
R13: 0000000000000000 R14: ffff888094e60000 R15: 0000000000000000
FS:  0000000001036880(0000) GS:ffff8880ae400000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ff7d575b000 CR3: 000000009a1ab000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
