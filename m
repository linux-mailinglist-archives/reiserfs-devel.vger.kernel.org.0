Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82C2E35D7C3
	for <lists+reiserfs-devel@lfdr.de>; Tue, 13 Apr 2021 08:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbhDMGLF (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 13 Apr 2021 02:11:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbhDMGLF (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 13 Apr 2021 02:11:05 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D578C061756
        for <reiserfs-devel@vger.kernel.org>; Mon, 12 Apr 2021 23:10:45 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id q189so6392188qka.8
        for <reiserfs-devel@vger.kernel.org>; Mon, 12 Apr 2021 23:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I0cGG8jDoqNOuKR4TM63qqO4LuKMHRnOTROs93nSVTE=;
        b=nsoyZcxT1lUUQ7NvM27e0qvNeFJUpldbOpuKotJUz++MivjjFivLN/dOUQnCtw8mnG
         q7kXkfzmB5WOCnbA02x87vHZU8E16FdcTc6jmZUCxwrQmkuwuPoccTSdG60SU7PdmQlf
         HreHCnTuq1AsMtR6ZW6LslhvWrbeqwqNYHDP3i0ITbZXaplOacOOgCm3Q9jWBzsL1pb0
         SO9k00sUmn01GOfirpf6BxrwIR+R1rZvXVc9KsEU7HQjDTdUrWHIE1V/oO9hSUK2TFg1
         10M6+RxwuuFDKeKPf6ykHOzw3+gn81dVBhsKhs2f1apYtn+3dKNz8gg6v+ocVuBwa8C2
         Ou+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I0cGG8jDoqNOuKR4TM63qqO4LuKMHRnOTROs93nSVTE=;
        b=QNpII5KNmZjayFrX5BKIU4wuHVRhy8ZA4GyzNzrOgsL0WqXv8kIWfo/2Km+eOK5q4e
         moeiLAK3k5Y2IMV/hg88UwWPWK7wovQMuvOpOqaG9cy3ZIat3G6alWD1XHCDof3DikqA
         thpPHMaAwjllvJW0Ty7JSeP6TvHhPfA3XXr3lnfiWS0lgsYdBd8dr+l2UDFQ7muQyiwD
         G77szGiCD+WmhtbNGn/56e6XitMAs6L1528APOqGs/kLDKz+u5tYp9AbJ+T2by8T8dIv
         dwLGEAHd9Xb70WfLIM+KhvlWbhnONoLZLLWFt7OemkCfzMaehL+ZdpCbSK1qGsGtmkaS
         gaCA==
X-Gm-Message-State: AOAM531l6GeHGl5SjdsOqyxwN53RNsPDYAqXTgd7wagqoK4KqbjQIhDb
        b1rbuLJAUMmEpXGqbGZH22PtHFEwWqnd5hSIZgv1lQ==
X-Google-Smtp-Source: ABdhPJz/RE4AaV6V5Tj5C1Y3ZWMFXNZAzRvmZTisjevk8iTh4XoZvnTTSBzOxGeksJ5gkCutJstQocFP86n4k/sCHnE=
X-Received: by 2002:a05:620a:a47:: with SMTP id j7mr8235211qka.350.1618294244248;
 Mon, 12 Apr 2021 23:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000a005ac05bfd4463d@google.com>
In-Reply-To: <000000000000a005ac05bfd4463d@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 13 Apr 2021 08:10:32 +0200
Message-ID: <CACT4Y+buGru4T5MQrYzoRK+0da7QPRO+RuWoFq+LGanfdWTg-Q@mail.gmail.com>
Subject: Re: [syzbot] KASAN: slab-out-of-bounds Read in reiserfs_xattr_get
To:     syzbot <syzbot+72ba979b6681c3369db4@syzkaller.appspotmail.com>
Cc:     Christian Brauner <christian.brauner@ubuntu.com>,
        Jan Kara <jack@suse.cz>, jamorris@linux.microsoft.com,
        LKML <linux-kernel@vger.kernel.org>,
        reiserfs-devel@vger.kernel.org,
        "Serge E. Hallyn" <serge@hallyn.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Tue, Apr 13, 2021 at 7:55 AM syzbot
<syzbot+72ba979b6681c3369db4@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    3a229812 Merge tag 'arm-fixes-5.11-2' of git://git.kernel...
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=16b4d196d00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=f91155ccddaf919c
> dashboard link: https://syzkaller.appspot.com/bug?extid=72ba979b6681c3369db4
> compiler:       Debian clang version 11.0.1-2
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+72ba979b6681c3369db4@syzkaller.appspotmail.com

Maybe related to:
https://lore.kernel.org/lkml/0000000000005f397905ba42aea8@google.com/
? there are some uninits involved in reiserfs attrs.

> loop3: detected capacity change from 0 to 65534
> ==================================================================
> BUG: KASAN: slab-out-of-bounds in reiserfs_xattr_get+0xe0/0x590 fs/reiserfs/xattr.c:681
> Read of size 8 at addr ffff888028983198 by task syz-executor.3/4211
>
> CPU: 1 PID: 4211 Comm: syz-executor.3 Not tainted 5.12.0-rc6-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>  __dump_stack lib/dump_stack.c:79 [inline]
>  dump_stack+0x176/0x24e lib/dump_stack.c:120
>  print_address_description+0x5f/0x3a0 mm/kasan/report.c:232
>  __kasan_report mm/kasan/report.c:399 [inline]
>  kasan_report+0x15c/0x200 mm/kasan/report.c:416
>  reiserfs_xattr_get+0xe0/0x590 fs/reiserfs/xattr.c:681
>  reiserfs_get_acl+0x63/0x670 fs/reiserfs/xattr_acl.c:211
>  get_acl+0x152/0x2e0 fs/posix_acl.c:141
>  check_acl fs/namei.c:294 [inline]
>  acl_permission_check fs/namei.c:339 [inline]
>  generic_permission+0x2ed/0x5b0 fs/namei.c:392
>  do_inode_permission fs/namei.c:446 [inline]
>  inode_permission+0x28e/0x500 fs/namei.c:513
>  may_open+0x228/0x3e0 fs/namei.c:2985
>  do_open fs/namei.c:3365 [inline]
>  path_openat+0x2697/0x3860 fs/namei.c:3500
>  do_filp_open+0x1a3/0x3b0 fs/namei.c:3527
>  do_sys_openat2+0xba/0x380 fs/open.c:1187
>  do_sys_open fs/open.c:1203 [inline]
>  __do_sys_openat fs/open.c:1219 [inline]
>  __se_sys_openat fs/open.c:1214 [inline]
>  __x64_sys_openat+0x1c8/0x1f0 fs/open.c:1214
>  do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
> RIP: 0033:0x419544
> Code: 84 00 00 00 00 00 44 89 54 24 0c e8 96 f9 ff ff 44 8b 54 24 0c 44 89 e2 48 89 ee 41 89 c0 bf 9c ff ff ff b8 01 01 00 00 0f 05 <48> 3d 00 f0 ff ff 77 34 44 89 c7 89 44 24 0c e8 c8 f9 ff ff 8b 44
> RSP: 002b:00007fa357a03f30 EFLAGS: 00000293 ORIG_RAX: 0000000000000101
> RAX: ffffffffffffffda RBX: 0000000020000200 RCX: 0000000000419544
> RDX: 0000000000010000 RSI: 0000000020000100 RDI: 00000000ffffff9c
> RBP: 0000000020000100 R08: 0000000000000000 R09: 0000000020000000
> R10: 0000000000000000 R11: 0000000000000293 R12: 0000000000010000
> R13: 0000000020000100 R14: 00007fa357a04000 R15: 0000000020065600
>
> Allocated by task 4210:
>  kasan_save_stack mm/kasan/common.c:38 [inline]
>  kasan_set_track mm/kasan/common.c:46 [inline]
>  set_alloc_info mm/kasan/common.c:427 [inline]
>  ____kasan_kmalloc+0xc2/0xf0 mm/kasan/common.c:506
>  kasan_kmalloc include/linux/kasan.h:233 [inline]
>  kmem_cache_alloc_trace+0x21b/0x350 mm/slub.c:2934
>  kmalloc include/linux/slab.h:554 [inline]
>  kzalloc include/linux/slab.h:684 [inline]
>  smk_fetch security/smack/smack_lsm.c:288 [inline]
>  smack_d_instantiate+0x65c/0xcc0 security/smack/smack_lsm.c:3411
>  security_d_instantiate+0xa5/0x100 security/security.c:1987
>  d_instantiate_new+0x61/0x110 fs/dcache.c:2025
>  ext4_add_nondir+0x22b/0x290 fs/ext4/namei.c:2590
>  ext4_symlink+0x8ce/0xe90 fs/ext4/namei.c:3417
>  vfs_symlink+0x3a0/0x540 fs/namei.c:4178
>  do_symlinkat+0x1c9/0x440 fs/namei.c:4208
>  do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
>
> Freed by task 4210:
>  kasan_save_stack mm/kasan/common.c:38 [inline]
>  kasan_set_track+0x3d/0x70 mm/kasan/common.c:46
>  kasan_set_free_info+0x1f/0x40 mm/kasan/generic.c:357
>  ____kasan_slab_free+0x100/0x140 mm/kasan/common.c:360
>  kasan_slab_free include/linux/kasan.h:199 [inline]
>  slab_free_hook mm/slub.c:1562 [inline]
>  slab_free_freelist_hook+0x171/0x270 mm/slub.c:1600
>  slab_free mm/slub.c:3161 [inline]
>  kfree+0xcf/0x2d0 mm/slub.c:4213
>  smk_fetch security/smack/smack_lsm.c:300 [inline]
>  smack_d_instantiate+0x6db/0xcc0 security/smack/smack_lsm.c:3411
>  security_d_instantiate+0xa5/0x100 security/security.c:1987
>  d_instantiate_new+0x61/0x110 fs/dcache.c:2025
>  ext4_add_nondir+0x22b/0x290 fs/ext4/namei.c:2590
>  ext4_symlink+0x8ce/0xe90 fs/ext4/namei.c:3417
>  vfs_symlink+0x3a0/0x540 fs/namei.c:4178
>  do_symlinkat+0x1c9/0x440 fs/namei.c:4208
>  do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
>
> Last potentially related work creation:
>  kasan_save_stack+0x27/0x50 mm/kasan/common.c:38
>  kasan_record_aux_stack+0xee/0x120 mm/kasan/generic.c:345
>  __call_rcu kernel/rcu/tree.c:3039 [inline]
>  call_rcu+0x130/0x8e0 kernel/rcu/tree.c:3114
>  fib6_info_release include/net/ip6_fib.h:337 [inline]
>  nsim_rt6_release drivers/net/netdevsim/fib.c:507 [inline]
>  nsim_fib6_event_fini+0x100/0x1f0 drivers/net/netdevsim/fib.c:833
>  nsim_fib_event drivers/net/netdevsim/fib.c:885 [inline]
>  nsim_fib_event_work+0x3e0a/0x5480 drivers/net/netdevsim/fib.c:1368
>  process_one_work+0x789/0xfd0 kernel/workqueue.c:2275
>  process_scheduled_works kernel/workqueue.c:2337 [inline]
>  worker_thread+0xe28/0x1300 kernel/workqueue.c:2423
>  kthread+0x39a/0x3c0 kernel/kthread.c:292
>  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
>
> The buggy address belongs to the object at ffff888028983000
>  which belongs to the cache kmalloc-256 of size 256
> The buggy address is located 152 bytes to the right of
>  256-byte region [ffff888028983000, ffff888028983100)
> The buggy address belongs to the page:
> page:ffffea0000a26080 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x28982
> head:ffffea0000a26080 order:1 compound_mapcount:0
> flags: 0xfff00000010200(slab|head)
> raw: 00fff00000010200 ffffea00007fd400 0000000300000003 ffff888010841b40
> raw: 0000000000000000 0000000080100010 00000001ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
>
> Memory state around the buggy address:
>  ffff888028983080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>  ffff888028983100: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> >ffff888028983180: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>                             ^
>  ffff888028983200: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>  ffff888028983280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ==================================================================
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/000000000000a005ac05bfd4463d%40google.com.
