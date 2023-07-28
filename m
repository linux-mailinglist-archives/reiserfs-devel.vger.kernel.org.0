Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 424967678FE
	for <lists+reiserfs-devel@lfdr.de>; Sat, 29 Jul 2023 01:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235146AbjG1XbF (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 28 Jul 2023 19:31:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231807AbjG1XbE (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 28 Jul 2023 19:31:04 -0400
Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F21883AB7
        for <reiserfs-devel@vger.kernel.org>; Fri, 28 Jul 2023 16:31:02 -0700 (PDT)
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-3a5ab2d2b3bso4975797b6e.0
        for <reiserfs-devel@vger.kernel.org>; Fri, 28 Jul 2023 16:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690587062; x=1691191862;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9XK5R4vj6jmlyUaEy1WvV9F1ok9mBsn5rQtLTiJ9nzc=;
        b=eR/DID1C7YsPGsOQ7stpF6w52fdQHsyltzqBw8Lpp3fVwcBE4e22v1PIp4/yTsJsmT
         YSoxUgW75KfIo5KDvG9bx0NDBsAzk9tQ4viTkNKuLWJ8VVEe2D5wuvIrL4yCzvUqhGse
         aadd2KzQsmZH77U/ul8MCPwvUv+FB8DkAZwYUF4cE843lqb7xXdf/K159GfB2EmMMaDn
         jXOjFhepu7vzAMOPUgCLu9eEqH2koi38AK1JKBJ9qfaK7YamWYSKgOCOzMgqNoj5DtyX
         cK2AnfYP0kewslnxRkTVKsObAVj1XXd9+Nzhyx4kPIDHfh+3ZA/NhUNS786mJ9Cj/tQr
         +X+A==
X-Gm-Message-State: ABy/qLZ6acREy0qmLzQu80hsIsfQPmnFmhcqYbPGLmWiFTWX49o3ymQC
        HT/L2QGn2O3pbXX4bAZaFt2GTz7hXTOkcmsSkOa3A5M1C//d
X-Google-Smtp-Source: APBJJlHKxP78PF7u5hDtH4SDpf5HHDu6MWTEs30FNciSsMcqGWN5YbKWL39rSB1Ag51R95tIb2DbTYNELYkSgd+HfJ54azyBLGKD
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1511:b0:3a3:8466:ee55 with SMTP id
 u17-20020a056808151100b003a38466ee55mr7166601oiw.8.1690587062239; Fri, 28 Jul
 2023 16:31:02 -0700 (PDT)
Date:   Fri, 28 Jul 2023 16:31:02 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004e88ee0601947922@google.com>
Subject: [syzbot] [reiserfs?] kernel BUG in reiserfs_rename
From:   syzbot <syzbot+d843d85655e23f0f643b@syzkaller.appspotmail.com>
To:     linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    e40939bbfc68 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=16c6c14ea80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c4a2640e4213bc2f
dashboard link: https://syzkaller.appspot.com/bug?extid=d843d85655e23f0f643b
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13c0600ca80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=122e48a1a80000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/9d87aa312c0e/disk-e40939bb.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/22a11d32a8b2/vmlinux-e40939bb.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0978b5788b52/Image-e40939bb.gz.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/b8490ef2d44b/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d843d85655e23f0f643b@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at fs/reiserfs/prints.c:390!
Internal error: Oops - BUG: 00000000f2000800 [#1] PREEMPT SMP
Modules linked in:
CPU: 1 PID: 6505 Comm: syz-executor261 Not tainted 6.4.0-rc7-syzkaller-ge40939bbfc68 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/03/2023
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : __reiserfs_panic+0x150/0x154 fs/reiserfs/prints.c:384
lr : __reiserfs_panic+0x150/0x154 fs/reiserfs/prints.c:384
sp : ffff800099bf7140
x29: ffff800099bf7200 x28: ffff800099bf74c0
 x27: ffff800099bf77d0
x26: ffff0000e03be518 x25: ffff0000e03be4f0 x24: ffff800099bf71c0
x23: ffff800099bf7180 x22: ffff80008a6b48e0 x21: ffff0000cb16e000
x20: ffff80008a6b48c0 x19: ffff80008d5ddc15 x18: 1fffe00036846fc6
x17: ffff80008deed000 x16: ffff80008a4483a0 x15: 0000000000000002
x14: 1ffff00011bde0ac x13: dfff800000000000 x12: 0000000000000001
x11: 0000000000000000
 x10: 0000000000000000 x9 : 2ea19fe2f27a9800
x8 : 2ea19fe2f27a9800 x7 : ffff80008028cc04
 x6 : 0000000000000000
x5 : 0000000000000001 x4 : 0000000000000001
 x3 : ffff800082a98004
x2 : 0000000000000001 x1 : 0000000100000000 x0 : 000000000000005a

Call trace:
 __reiserfs_panic+0x150/0x154 fs/reiserfs/prints.c:384
 reiserfs_rename+0x19d8/0x1c88 fs/reiserfs/namei.c:1425
 vfs_rename+0x908/0xcd4 fs/namei.c:4849
 do_renameat2+0x9f4/0x10b0 fs/namei.c:5002
 __do_sys_renameat fs/namei.c:5042 [inline]
 __se_sys_renameat fs/namei.c:5039 [inline]
 __arm64_sys_renameat+0xc8/0xe4 fs/namei.c:5039
 __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
 invoke_syscall+0x98/0x2c0 arch/arm64/kernel/syscall.c:52
 el0_svc_common+0x138/0x244 arch/arm64/kernel/syscall.c:142
 do_el0_svc+0x64/0x198 arch/arm64/kernel/syscall.c:191
 el0_svc+0x4c/0x160 arch/arm64/kernel/entry-common.c:647
 el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:665
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:591
Code: 9008b365 910000a5 aa1303e4 95c56f57 (d4210000) 
---[ end trace 0000000000000000 ]---


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to change bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
