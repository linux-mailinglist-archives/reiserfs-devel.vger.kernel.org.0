Return-Path: <reiserfs-devel+bounces-14-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C35B81ADDD
	for <lists+reiserfs-devel@lfdr.de>; Thu, 21 Dec 2023 05:05:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB018B23DA9
	for <lists+reiserfs-devel@lfdr.de>; Thu, 21 Dec 2023 04:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A926FDC;
	Thu, 21 Dec 2023 04:05:26 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507B18BFA
	for <reiserfs-devel@vger.kernel.org>; Thu, 21 Dec 2023 04:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-35fa6908f7bso4021495ab.3
        for <reiserfs-devel@vger.kernel.org>; Wed, 20 Dec 2023 20:05:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703131524; x=1703736324;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b6odrgqIPtxskNECFDLZDX5OgPTr0zG4ZqCcWsM+lJo=;
        b=WG/kT6efFcCgUVgrI6Vs3rnFiLTzTDEjwUg5Z0yR4W461canwmpRmHqxFFdFfNo5/f
         /g8Pn3Vn5VYv3ooqZgKCKo4ial0pxXU65F51PSC94IgfeMIoVG6KMpR4769i8JOJvEyB
         WuEFGSHepHIAryBHElJdTQm08Em7VVLXtO6UBBb14sjrHFWWGGIHe5gHN+qBE1RowErB
         acMX9OjTt8dx0lxZlug1IgVUzsHxNK6hfX6VWkOBp1n8GQ+P7XprdyfEk0z81MMhLvKT
         kLUyNoJWdpj8vu3/x/TpfU4SeL+xsLz8OmnIfvFZ7yd3jVl5wtE3ktPs8ZCxtuRYRUkb
         WNbA==
X-Gm-Message-State: AOJu0Yxce9w4akmcBn+gdAi5NQzN/JsTJMOihtUfVFYMlwrtBMDDp4dn
	zEa5ijclvu8yiyRzAjiPtanSYHjRR0mbOwmVT1udS4ksamR5
X-Google-Smtp-Source: AGHT+IGLKnfCkyhtmomFqyIV/7PpGXY2YfMZuriAD8TtbE4fGEYA5W5KBSSUkC7x0A2Z1BwhyviWpLuY0DwXENi86ga8QC9QzoTm
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2189:b0:35f:cb88:883e with SMTP id
 j9-20020a056e02218900b0035fcb88883emr283571ila.6.1703131524600; Wed, 20 Dec
 2023 20:05:24 -0800 (PST)
Date: Wed, 20 Dec 2023 20:05:24 -0800
In-Reply-To: <000000000000e32f3c0609cb98d0@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000879f66060cfd35e6@google.com>
Subject: Re: [syzbot] [reiserfs?] possible deadlock in chmod_common (2)
From: syzbot <syzbot+83693dbba860b4f2e549@syzkaller.appspotmail.com>
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    aafe7ad77b91 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=14d1c51ae80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=23ce86eb3d78ef4d
dashboard link: https://syzkaller.appspot.com/bug?extid=83693dbba860b4f2e549
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=130f0f4ee80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=156c8a16e80000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/23845238c49b/disk-aafe7ad7.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1144b0f74104/vmlinux-aafe7ad7.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6db20df213a2/Image-aafe7ad7.gz.xz
mounted in repro #1: https://storage.googleapis.com/syzbot-assets/b4531f8aec43/mount_0.gz
mounted in repro #2: https://storage.googleapis.com/syzbot-assets/4d32fbadd3da/mount_3.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+83693dbba860b4f2e549@syzkaller.appspotmail.com

REISERFS (device loop3): Using tea hash to sort names
REISERFS (device loop3): Created .reiserfs_priv - reserved for xattr storage.
======================================================
WARNING: possible circular locking dependency detected
6.7.0-rc6-syzkaller-gaafe7ad77b91 #0 Not tainted
------------------------------------------------------
syz-executor240/6153 is trying to acquire lock:
ffff0000dc6a3e80 (&type->i_mutex_dir_key#6){+.+.}-{3:3}, at: inode_lock include/linux/fs.h:802 [inline]
ffff0000dc6a3e80 (&type->i_mutex_dir_key#6){+.+.}-{3:3}, at: chmod_common+0x17c/0x418 fs/open.c:637

but task is already holding lock:
ffff0000d5dda418 (sb_writers#8){.+.+}-{0:0}, at: mnt_want_write+0x44/0x9c fs/namespace.c:404

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (sb_writers#8){.+.+}-{0:0}:
       percpu_down_read include/linux/percpu-rwsem.h:51 [inline]
       __sb_start_write include/linux/fs.h:1635 [inline]
       sb_start_write+0x60/0x2ec include/linux/fs.h:1710
       mnt_want_write_file+0x64/0x1e8 fs/namespace.c:448
       reiserfs_ioctl+0x188/0x42c fs/reiserfs/ioctl.c:103
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:871 [inline]
       __se_sys_ioctl fs/ioctl.c:857 [inline]
       __arm64_sys_ioctl+0x14c/0x1c8 fs/ioctl.c:857
       __invoke_syscall arch/arm64/kernel/syscall.c:37 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:51
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:136
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:155
       el0_svc+0x54/0x158 arch/arm64/kernel/entry-common.c:678
       el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:696
       el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:595

-> #1
 (&sbi->lock){+.+.}-{3:3}:
       __mutex_lock_common+0x190/0x21a0 kernel/locking/mutex.c:603
       __mutex_lock kernel/locking/mutex.c:747 [inline]
       mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:799
       reiserfs_write_lock+0x7c/0xe8 fs/reiserfs/lock.c:27
       reiserfs_lookup+0x128/0x45c fs/reiserfs/namei.c:364
       __lookup_slow+0x250/0x374 fs/namei.c:1694
       lookup_one_len+0x178/0x28c fs/namei.c:2746
       reiserfs_lookup_privroot+0x8c/0x184 fs/reiserfs/xattr.c:977
       reiserfs_fill_super+0x15b4/0x2028 fs/reiserfs/super.c:2192
       mount_bdev+0x1e8/0x2b4 fs/super.c:1650
       get_super_block+0x44/0x58 fs/reiserfs/super.c:2601
       legacy_get_tree+0xd4/0x16c fs/fs_context.c:662
       vfs_get_tree+0x90/0x288 fs/super.c:1771
       do_new_mount+0x25c/0x8c8 fs/namespace.c:3337
       path_mount+0x590/0xe04 fs/namespace.c:3664
       do_mount fs/namespace.c:3677 [inline]
       __do_sys_mount fs/namespace.c:3886 [inline]
       __se_sys_mount fs/namespace.c:3863 [inline]
       __arm64_sys_mount+0x45c/0x594 fs/namespace.c:3863
       __invoke_syscall arch/arm64/kernel/syscall.c:37 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:51
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:136
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:155
       el0_svc+0x54/0x158 arch/arm64/kernel/entry-common.c:678
       el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:696
       el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:595

-> #0 (&type->i_mutex_dir_key#6){+.+.}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3134 [inline]
       check_prevs_add kernel/locking/lockdep.c:3253 [inline]
       validate_chain kernel/locking/lockdep.c:3869 [inline]
       __lock_acquire+0x3384/0x763c kernel/locking/lockdep.c:5137
       lock_acquire+0x23c/0x71c kernel/locking/lockdep.c:5754
       down_write+0x50/0xc0 kernel/locking/rwsem.c:1579
       inode_lock include/linux/fs.h:802 [inline]
       chmod_common+0x17c/0x418 fs/open.c:637
       vfs_fchmod fs/open.c:659 [inline]
       __do_sys_fchmod fs/open.c:668 [inline]
       __se_sys_fchmod fs/open.c:662 [inline]
       __arm64_sys_fchmod+0xe0/0x150 fs/open.c:662
       __invoke_syscall arch/arm64/kernel/syscall.c:37 [inline]
       invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:51
       el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:136
       do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:155
       el0_svc+0x54/0x158 arch/arm64/kernel/entry-common.c:678
       el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:696
       el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:595

other info that might help us debug this:

Chain exists of:
  &type->i_mutex_dir_key#6 --> &sbi->lock --> sb_writers#8

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  rlock(sb_writers#8);
                               lock(&sbi->lock);
                               lock(sb_writers#8);
  lock(&type->i_mutex_dir_key#6);

 *** DEADLOCK ***

1 lock held by syz-executor240/6153:
 #0: ffff0000d5dda418 (sb_writers#8){.+.+}-{0:0}, at: mnt_want_write+0x44/0x9c fs/namespace.c:404

stack backtrace:
CPU: 0 PID: 6153 Comm: syz-executor240 Not tainted 6.7.0-rc6-syzkaller-gaafe7ad77b91 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/10/2023
Call trace:
 dump_backtrace+0x1b8/0x1e4 arch/arm64/kernel/stacktrace.c:291
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:298
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd0/0x124 lib/dump_stack.c:106
 dump_stack+0x1c/0x28 lib/dump_stack.c:113
 print_circular_bug+0x150/0x1b8 kernel/locking/lockdep.c:2060
 check_noncircular+0x310/0x404 kernel/locking/lockdep.c:2187
 check_prev_add kernel/locking/lockdep.c:3134 [inline]
 check_prevs_add kernel/locking/lockdep.c:3253 [inline]
 validate_chain kernel/locking/lockdep.c:3869 [inline]
 __lock_acquire+0x3384/0x763c kernel/locking/lockdep.c:5137
 lock_acquire+0x23c/0x71c kernel/locking/lockdep.c:5754
 down_write+0x50/0xc0 kernel/locking/rwsem.c:1579
 inode_lock include/linux/fs.h:802 [inline]
 chmod_common+0x17c/0x418 fs/open.c:637
 vfs_fchmod fs/open.c:659 [inline]
 __do_sys_fchmod fs/open.c:668 [inline]
 __se_sys_fchmod fs/open.c:662 [inline]
 __arm64_sys_fchmod+0xe0/0x150 fs/open.c:662
 __invoke_syscall arch/arm64/kernel/syscall.c:37 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:51
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:136
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:155
 el0_svc+0x54/0x158 arch/arm64/kernel/entry-common.c:678
 el0t_64_sync_handler+0x84/0xfc arch/arm64/kernel/entry-common.c:696
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:595


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

