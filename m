Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C26D63A5A2
	for <lists+reiserfs-devel@lfdr.de>; Mon, 28 Nov 2022 11:04:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbiK1KEl (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 28 Nov 2022 05:04:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbiK1KEl (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 28 Nov 2022 05:04:41 -0500
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F4611A04E
        for <reiserfs-devel@vger.kernel.org>; Mon, 28 Nov 2022 02:04:39 -0800 (PST)
Received: by mail-io1-f72.google.com with SMTP id x5-20020a6bda05000000b006db3112c1deso5498968iob.0
        for <reiserfs-devel@vger.kernel.org>; Mon, 28 Nov 2022 02:04:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6UgmHFQDmImkGxY8IishK8EwlOf+CsgUzJLxJ67BNtU=;
        b=LfOyIyhKbwy0IIJJdF1hOWT2KVon/HWKwAXvNbbPBOORxHpnKP4eUuoBbnQcx0Yq2Y
         rKHYWKovI9aBt9KGaXh26MYYgyphkKZlfDQz/bGgosn4KJ4KVeSBh8crWGwUHKtLvz7E
         YBr75xMzaOXfVxQV+KdXrwQUDevqhBL3lpw9OwTHwZuBcPEPrc/zd5Aiu3fY4Yr3E48S
         ++2wc5yqwytMM1eZ4fCyRg8pLV6UAgWdr6gk3rrpmuC1FxTIrmYKScKqb/6EUocGzDOp
         p1YgRCURm78PilDrVBspZvnR1M+sW8T1VMQZHdAaMloIwXHznhWORJZfbj7+j43dKi5h
         ssNg==
X-Gm-Message-State: ANoB5pneD8k2+9UEGGfOL2iNeuf27AixyDTuJ9sx2LzRPetwOJM0QIWf
        Fvp4+oxtGmmkOGQjmI8MYrUpD6ExOKaJrrQEeAKIMIcbjg07
X-Google-Smtp-Source: AA0mqf61xDzYFhATYtWebQr8zqL0FJBfe9+oyL9WUeIdtujSqLfKmzpvZUzRsLrfGsQLrglzVyhZPwFw+EitfOF1TO8FTLZ7RKo5
MIME-Version: 1.0
X-Received: by 2002:a05:6638:535:b0:375:b7f:daec with SMTP id
 j21-20020a056638053500b003750b7fdaecmr4896460jar.154.1669629878460; Mon, 28
 Nov 2022 02:04:38 -0800 (PST)
Date:   Mon, 28 Nov 2022 02:04:38 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000cfe6f305ee84ff1f@google.com>
Subject: [syzbot] possible deadlock in reiserfs_dirty_inode
From:   syzbot <syzbot+c319bb5b1014113a92cf@syzkaller.appspotmail.com>
To:     linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    faf68e3523c2 Merge tag 'kbuild-fixes-v6.1-4' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11078bc5880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=436ee340148d5197
dashboard link: https://syzkaller.appspot.com/bug?extid=c319bb5b1014113a92cf
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4aefb045a8ae/disk-faf68e35.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c799b03718cc/vmlinux-faf68e35.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3f6af9278460/bzImage-faf68e35.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c319bb5b1014113a92cf@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.1.0-rc6-syzkaller-00315-gfaf68e3523c2 #0 Not tainted
------------------------------------------------------
syz-executor.3/21593 is trying to acquire lock:
ffff888027069718 (&mm->mmap_lock#2){++++}-{3:3}, at: __might_fault+0xa9/0x180 mm/memory.c:5645

but task is already holding lock:
ffff8880a24f2090 (&sbi->lock){+.+.}-{3:3}, at: reiserfs_write_lock+0x79/0x100 fs/reiserfs/lock.c:27

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&sbi->lock){+.+.}-{3:3}:
       __mutex_lock_common kernel/locking/mutex.c:603 [inline]
       __mutex_lock+0x12f/0x1360 kernel/locking/mutex.c:747
       reiserfs_write_lock+0x79/0x100 fs/reiserfs/lock.c:27
       reiserfs_dirty_inode+0xd2/0x260 fs/reiserfs/super.c:704
       __mark_inode_dirty+0x247/0x11e0 fs/fs-writeback.c:2408
       generic_update_time fs/inode.c:1859 [inline]
       inode_update_time fs/inode.c:1872 [inline]
       touch_atime+0x641/0x700 fs/inode.c:1944
       file_accessed include/linux/fs.h:2521 [inline]
       generic_file_mmap+0x119/0x150 mm/filemap.c:3454
       call_mmap include/linux/fs.h:2196 [inline]
       mmap_region+0x6c3/0x1dd0 mm/mmap.c:2625
       do_mmap+0x831/0xf60 mm/mmap.c:1412
       vm_mmap_pgoff+0x1af/0x280 mm/util.c:520
       ksys_mmap_pgoff+0x41f/0x5a0 mm/mmap.c:1458
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #0 (&mm->mmap_lock#2){++++}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3097 [inline]
       check_prevs_add kernel/locking/lockdep.c:3216 [inline]
       validate_chain kernel/locking/lockdep.c:3831 [inline]
       __lock_acquire+0x2a43/0x56d0 kernel/locking/lockdep.c:5055
       lock_acquire kernel/locking/lockdep.c:5668 [inline]
       lock_acquire+0x1e3/0x630 kernel/locking/lockdep.c:5633
       __might_fault mm/memory.c:5646 [inline]
       __might_fault+0x10c/0x180 mm/memory.c:5639
       reiserfs_ioctl+0x1d2/0x330 fs/reiserfs/ioctl.c:96
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:870 [inline]
       __se_sys_ioctl fs/ioctl.c:856 [inline]
       __x64_sys_ioctl+0x197/0x210 fs/ioctl.c:856
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&sbi->lock);
                               lock(&mm->mmap_lock#2);
                               lock(&sbi->lock);
  lock(&mm->mmap_lock#2);

 *** DEADLOCK ***

1 lock held by syz-executor.3/21593:
 #0: ffff8880a24f2090 (&sbi->lock){+.+.}-{3:3}, at: reiserfs_write_lock+0x79/0x100 fs/reiserfs/lock.c:27

stack backtrace:
CPU: 0 PID: 21593 Comm: syz-executor.3 Not tainted 6.1.0-rc6-syzkaller-00315-gfaf68e3523c2 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd1/0x138 lib/dump_stack.c:106
 check_noncircular+0x25f/0x2e0 kernel/locking/lockdep.c:2177
 check_prev_add kernel/locking/lockdep.c:3097 [inline]
 check_prevs_add kernel/locking/lockdep.c:3216 [inline]
 validate_chain kernel/locking/lockdep.c:3831 [inline]
 __lock_acquire+0x2a43/0x56d0 kernel/locking/lockdep.c:5055
 lock_acquire kernel/locking/lockdep.c:5668 [inline]
 lock_acquire+0x1e3/0x630 kernel/locking/lockdep.c:5633
 __might_fault mm/memory.c:5646 [inline]
 __might_fault+0x10c/0x180 mm/memory.c:5639
 reiserfs_ioctl+0x1d2/0x330 fs/reiserfs/ioctl.c:96
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl fs/ioctl.c:856 [inline]
 __x64_sys_ioctl+0x197/0x210 fs/ioctl.c:856
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f5a0608c0d9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 19 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f5a06d55168 EFLAGS: 00000246
 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f5a061ac050 RCX: 00007f5a0608c0d9
RDX: 00000000200001c0 RSI: 0000000080087601 RDI: 0000000000000007
RBP: 00007f5a060e7ae9 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffdba33ed3f R14: 00007f5a06d55300 R15: 0000000000022000
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
