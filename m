Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5A889E50
	for <lists+reiserfs-devel@lfdr.de>; Mon, 12 Aug 2019 14:29:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728688AbfHLM3H (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 12 Aug 2019 08:29:07 -0400
Received: from mail-ot1-f70.google.com ([209.85.210.70]:41511 "EHLO
        mail-ot1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728242AbfHLM3G (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 12 Aug 2019 08:29:06 -0400
Received: by mail-ot1-f70.google.com with SMTP id a8so83928308oti.8
        for <reiserfs-devel@vger.kernel.org>; Mon, 12 Aug 2019 05:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=ql3ubiCn+pRPQjf/FUAg40+bKD1lNxcYuGAqg1CITsI=;
        b=ax5yZJ/6Fh3rhCQt2JDiE28MEA3Z5vBCgUynTzZE2P8QmOI4FodRAd+TyC8fAopxLN
         oxH8yq3yVeXbXc8+LPZrx+pK5Ei6+mp42ARHHBV+pk7Si4sL1zYje5uq4Wm2Z1dbu+mb
         FA3KL9tY+ZXYhhN4mJDYUrMwUCdfB5u6pkOhkwe27br6vzmfoRqLArzoyMBk092ZcNrw
         zh3ym6KMa2HOGHzVjQopFfIUXVMa8TdIP9zwO4B7pGrG6GXM/Kp5XCSX9lIcKzi1Lods
         THCVrsg0oINMBlC4pudWd/njviKnSPcuyLJ3DMcg3+Grk6Z2daeNctXa9tGGAqrMDkHf
         Yt2w==
X-Gm-Message-State: APjAAAWuQ1qbAuZ3JTwwBaOCrAD7QazGCp/uQfK7nWIB4MhrkML8JY4+
        n+WK8e8+IEarYgRmQavUwcdqDoFJcmQUVz+bmz/UZFS7a6wG
X-Google-Smtp-Source: APXvYqy3VB4XuS92/UQRve6Iudx01CRovEwo2GaP1oNhenec68xllXuFwZX8d1MOn15CcS5U2t37FjvkAIoXGO7Htgpw9zkQCuDE
MIME-Version: 1.0
X-Received: by 2002:a5d:940b:: with SMTP id v11mr35149980ion.69.1565612946065;
 Mon, 12 Aug 2019 05:29:06 -0700 (PDT)
Date:   Mon, 12 Aug 2019 05:29:06 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000819227058feaabe9@google.com>
Subject: divide error in read_super_block
From:   syzbot <syzbot+faba5b2419543cc95f0d@syzkaller.appspotmail.com>
To:     linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    d45331b0 Linux 5.3-rc4
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17f9879a600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3d7eaed8496da4da
dashboard link: https://syzkaller.appspot.com/bug?extid=faba5b2419543cc95f0d
compiler:       clang version 9.0.0 (/home/glider/llvm/clang  
80fee25776c2fb61e74c1ecb1a523375c2500b69)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+faba5b2419543cc95f0d@syzkaller.appspotmail.com

divide error: 0000 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 21464 Comm: syz-executor.0 Not tainted 5.3.0-rc4 #73
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
RIP: 0010:read_super_block+0x57/0x7f0 fs/reiserfs/super.c:1611
Code: 89 d8 48 c1 e8 03 48 89 45 c0 42 80 3c 30 00 74 08 48 89 df e8 0a 29  
c5 ff 48 89 5d c8 49 8b 5f 18 4c 89 65 b8 4c 89 e0 31 d2 <48> f7 f3 49 89  
c6 4d 8d a7 28 01 00 00 4d 89 e5 49 c1 ed 03 48 b8
RSP: 0018:ffff88808e2dfa80 EFLAGS: 00010246
RAX: 0000000000002000 RBX: 0000000000000000 RCX: 0000000000040000
RDX: 0000000000000000 RSI: 0000000000003ab0 RDI: 0000000000003ab1
RBP: ffff88808e2dfad0 R08: ffffffff81e7119b R09: ffffed1011c5bf50
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000002000
R13: dffffc0000000000 R14: dffffc0000000000 R15: ffff88807a5a0a80
FS:  00007f55a9f77700(0000) GS:ffff8880aea00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000758080 CR3: 00000000a4e4a000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000600
Call Trace:
  reiserfs_fill_super+0x7b0/0x30d0 fs/reiserfs/super.c:1966
  mount_bdev+0x27c/0x390 fs/super.c:1283
  get_super_block+0x34/0x40 fs/reiserfs/super.c:2599
  legacy_get_tree+0xf9/0x1a0 fs/fs_context.c:661
  vfs_get_tree+0x8f/0x380 fs/super.c:1413
  do_new_mount fs/namespace.c:2791 [inline]
  do_mount+0x169d/0x2490 fs/namespace.c:3111
  ksys_mount+0xcc/0x100 fs/namespace.c:3320
  __do_sys_mount fs/namespace.c:3334 [inline]
  __se_sys_mount fs/namespace.c:3331 [inline]
  __x64_sys_mount+0xbf/0xd0 fs/namespace.c:3331
  do_syscall_64+0xfe/0x140 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x459829
Code: fd b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 cb b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f55a9f76c78 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0000000000000005 RCX: 0000000000459829
RDX: 0000000020000080 RSI: 0000000020000100 RDI: 0000000020000040
RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f55a9f776d4
R13: 00000000004c5e57 R14: 00000000004da858 R15: 00000000ffffffff
Modules linked in:
---[ end trace b618cfac8e6036db ]---
RIP: 0010:read_super_block+0x57/0x7f0 fs/reiserfs/super.c:1611
Code: 89 d8 48 c1 e8 03 48 89 45 c0 42 80 3c 30 00 74 08 48 89 df e8 0a 29  
c5 ff 48 89 5d c8 49 8b 5f 18 4c 89 65 b8 4c 89 e0 31 d2 <48> f7 f3 49 89  
c6 4d 8d a7 28 01 00 00 4d 89 e5 49 c1 ed 03 48 b8
RSP: 0018:ffff88808e2dfa80 EFLAGS: 00010246
RAX: 0000000000002000 RBX: 0000000000000000 RCX: 0000000000040000
RDX: 0000000000000000 RSI: 0000000000003ab0 RDI: 0000000000003ab1
RBP: ffff88808e2dfad0 R08: ffffffff81e7119b R09: ffffed1011c5bf50
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000002000
R13: dffffc0000000000 R14: dffffc0000000000 R15: ffff88807a5a0a80
FS:  00007f55a9f77700(0000) GS:ffff8880aea00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffcdcc16f3c CR3: 00000000a4e4a000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000600


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
