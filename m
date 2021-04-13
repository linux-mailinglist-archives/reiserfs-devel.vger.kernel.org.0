Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B51D735D78E
	for <lists+reiserfs-devel@lfdr.de>; Tue, 13 Apr 2021 07:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbhDMFzm (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 13 Apr 2021 01:55:42 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:36681 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbhDMFzl (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 13 Apr 2021 01:55:41 -0400
Received: by mail-io1-f69.google.com with SMTP id l8so10373864ioc.3
        for <reiserfs-devel@vger.kernel.org>; Mon, 12 Apr 2021 22:55:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=R0V41VPjtdq4CbqALc6UHI6VSrUD8eghdzvP0gT6H28=;
        b=fTedF+qQqfQiUsaCgG1OFp0oEVj50FzWFQCuCaRc8Lf9m+RpDzGpTY2Gbz9vZXxRGR
         A/m+Mdwm6C/p+atavtmzRKYU4J1brrtuHisSeG8Y99qpqpT6r7PbGCH4988SD3YYHevb
         Juy6Pr8nOJS5M/MgaNSYLYwum+warxCmRqdP07jy2v3EtzdSgMRSWaF49T63sX812OCw
         O5pZrUnETJJnGUY8PAuvg7MjLqkEhOQbTgSE3+Ya93EjUKDD1Qn68HpAbES5tR8Eqx6A
         VtsX2yumChcxLufNTK0JUlna7ldH8e9YVKR0f1DSs0is/WW3bqyUYoZNuRefsTIkFO3R
         gIhQ==
X-Gm-Message-State: AOAM531P59ia2DjwQI59ic0Cg7Ut9U6wDkxPlet/DBBKAXGhf6pxUdtK
        QkR4+reTzFW9JXEc393lhXSSJxHMjqji23sIqrBe/CylIcxL
X-Google-Smtp-Source: ABdhPJzcHrd6jOSGXBpsav3/JUDEHsX85zLITr3IM6crVNQ5YQV29SoJSVQ/9aXz/JDnlrFKEwfp/T65ik+24Olg51QjbjKb3Vnh
MIME-Version: 1.0
X-Received: by 2002:a02:ba1a:: with SMTP id z26mr28701650jan.43.1618293322415;
 Mon, 12 Apr 2021 22:55:22 -0700 (PDT)
Date:   Mon, 12 Apr 2021 22:55:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a005ac05bfd4463d@google.com>
Subject: [syzbot] KASAN: slab-out-of-bounds Read in reiserfs_xattr_get
From:   syzbot <syzbot+72ba979b6681c3369db4@syzkaller.appspotmail.com>
To:     christian.brauner@ubuntu.com, jack@suse.cz,
        jamorris@linux.microsoft.com, linux-kernel@vger.kernel.org,
        reiserfs-devel@vger.kernel.org, serge@hallyn.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    3a229812 Merge tag 'arm-fixes-5.11-2' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16b4d196d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f91155ccddaf919c
dashboard link: https://syzkaller.appspot.com/bug?extid=72ba979b6681c3369db4
compiler:       Debian clang version 11.0.1-2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+72ba979b6681c3369db4@syzkaller.appspotmail.com

loop3: detected capacity change from 0 to 65534
==================================================================
BUG: KASAN: slab-out-of-bounds in reiserfs_xattr_get+0xe0/0x590 fs/reiserfs/xattr.c:681
Read of size 8 at addr ffff888028983198 by task syz-executor.3/4211

CPU: 1 PID: 4211 Comm: syz-executor.3 Not tainted 5.12.0-rc6-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x176/0x24e lib/dump_stack.c:120
 print_address_description+0x5f/0x3a0 mm/kasan/report.c:232
 __kasan_report mm/kasan/report.c:399 [inline]
 kasan_report+0x15c/0x200 mm/kasan/report.c:416
 reiserfs_xattr_get+0xe0/0x590 fs/reiserfs/xattr.c:681
 reiserfs_get_acl+0x63/0x670 fs/reiserfs/xattr_acl.c:211
 get_acl+0x152/0x2e0 fs/posix_acl.c:141
 check_acl fs/namei.c:294 [inline]
 acl_permission_check fs/namei.c:339 [inline]
 generic_permission+0x2ed/0x5b0 fs/namei.c:392
 do_inode_permission fs/namei.c:446 [inline]
 inode_permission+0x28e/0x500 fs/namei.c:513
 may_open+0x228/0x3e0 fs/namei.c:2985
 do_open fs/namei.c:3365 [inline]
 path_openat+0x2697/0x3860 fs/namei.c:3500
 do_filp_open+0x1a3/0x3b0 fs/namei.c:3527
 do_sys_openat2+0xba/0x380 fs/open.c:1187
 do_sys_open fs/open.c:1203 [inline]
 __do_sys_openat fs/open.c:1219 [inline]
 __se_sys_openat fs/open.c:1214 [inline]
 __x64_sys_openat+0x1c8/0x1f0 fs/open.c:1214
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x419544
Code: 84 00 00 00 00 00 44 89 54 24 0c e8 96 f9 ff ff 44 8b 54 24 0c 44 89 e2 48 89 ee 41 89 c0 bf 9c ff ff ff b8 01 01 00 00 0f 05 <48> 3d 00 f0 ff ff 77 34 44 89 c7 89 44 24 0c e8 c8 f9 ff ff 8b 44
RSP: 002b:00007fa357a03f30 EFLAGS: 00000293 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 0000000020000200 RCX: 0000000000419544
RDX: 0000000000010000 RSI: 0000000020000100 RDI: 00000000ffffff9c
RBP: 0000000020000100 R08: 0000000000000000 R09: 0000000020000000
R10: 0000000000000000 R11: 0000000000000293 R12: 0000000000010000
R13: 0000000020000100 R14: 00007fa357a04000 R15: 0000000020065600

Allocated by task 4210:
 kasan_save_stack mm/kasan/common.c:38 [inline]
 kasan_set_track mm/kasan/common.c:46 [inline]
 set_alloc_info mm/kasan/common.c:427 [inline]
 ____kasan_kmalloc+0xc2/0xf0 mm/kasan/common.c:506
 kasan_kmalloc include/linux/kasan.h:233 [inline]
 kmem_cache_alloc_trace+0x21b/0x350 mm/slub.c:2934
 kmalloc include/linux/slab.h:554 [inline]
 kzalloc include/linux/slab.h:684 [inline]
 smk_fetch security/smack/smack_lsm.c:288 [inline]
 smack_d_instantiate+0x65c/0xcc0 security/smack/smack_lsm.c:3411
 security_d_instantiate+0xa5/0x100 security/security.c:1987
 d_instantiate_new+0x61/0x110 fs/dcache.c:2025
 ext4_add_nondir+0x22b/0x290 fs/ext4/namei.c:2590
 ext4_symlink+0x8ce/0xe90 fs/ext4/namei.c:3417
 vfs_symlink+0x3a0/0x540 fs/namei.c:4178
 do_symlinkat+0x1c9/0x440 fs/namei.c:4208
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Freed by task 4210:
 kasan_save_stack mm/kasan/common.c:38 [inline]
 kasan_set_track+0x3d/0x70 mm/kasan/common.c:46
 kasan_set_free_info+0x1f/0x40 mm/kasan/generic.c:357
 ____kasan_slab_free+0x100/0x140 mm/kasan/common.c:360
 kasan_slab_free include/linux/kasan.h:199 [inline]
 slab_free_hook mm/slub.c:1562 [inline]
 slab_free_freelist_hook+0x171/0x270 mm/slub.c:1600
 slab_free mm/slub.c:3161 [inline]
 kfree+0xcf/0x2d0 mm/slub.c:4213
 smk_fetch security/smack/smack_lsm.c:300 [inline]
 smack_d_instantiate+0x6db/0xcc0 security/smack/smack_lsm.c:3411
 security_d_instantiate+0xa5/0x100 security/security.c:1987
 d_instantiate_new+0x61/0x110 fs/dcache.c:2025
 ext4_add_nondir+0x22b/0x290 fs/ext4/namei.c:2590
 ext4_symlink+0x8ce/0xe90 fs/ext4/namei.c:3417
 vfs_symlink+0x3a0/0x540 fs/namei.c:4178
 do_symlinkat+0x1c9/0x440 fs/namei.c:4208
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Last potentially related work creation:
 kasan_save_stack+0x27/0x50 mm/kasan/common.c:38
 kasan_record_aux_stack+0xee/0x120 mm/kasan/generic.c:345
 __call_rcu kernel/rcu/tree.c:3039 [inline]
 call_rcu+0x130/0x8e0 kernel/rcu/tree.c:3114
 fib6_info_release include/net/ip6_fib.h:337 [inline]
 nsim_rt6_release drivers/net/netdevsim/fib.c:507 [inline]
 nsim_fib6_event_fini+0x100/0x1f0 drivers/net/netdevsim/fib.c:833
 nsim_fib_event drivers/net/netdevsim/fib.c:885 [inline]
 nsim_fib_event_work+0x3e0a/0x5480 drivers/net/netdevsim/fib.c:1368
 process_one_work+0x789/0xfd0 kernel/workqueue.c:2275
 process_scheduled_works kernel/workqueue.c:2337 [inline]
 worker_thread+0xe28/0x1300 kernel/workqueue.c:2423
 kthread+0x39a/0x3c0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294

The buggy address belongs to the object at ffff888028983000
 which belongs to the cache kmalloc-256 of size 256
The buggy address is located 152 bytes to the right of
 256-byte region [ffff888028983000, ffff888028983100)
The buggy address belongs to the page:
page:ffffea0000a26080 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x28982
head:ffffea0000a26080 order:1 compound_mapcount:0
flags: 0xfff00000010200(slab|head)
raw: 00fff00000010200 ffffea00007fd400 0000000300000003 ffff888010841b40
raw: 0000000000000000 0000000080100010 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff888028983080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888028983100: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff888028983180: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                            ^
 ffff888028983200: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888028983280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
