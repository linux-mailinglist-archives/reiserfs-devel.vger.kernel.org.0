Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94E6E271FBB
	for <lists+reiserfs-devel@lfdr.de>; Mon, 21 Sep 2020 12:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbgIUKKS (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 21 Sep 2020 06:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726347AbgIUKKS (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 21 Sep 2020 06:10:18 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5994EC0613CF
        for <reiserfs-devel@vger.kernel.org>; Mon, 21 Sep 2020 03:10:18 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id a17so12076537wrn.6
        for <reiserfs-devel@vger.kernel.org>; Mon, 21 Sep 2020 03:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OznM7Zj90HA/meLwT6xmjh0/MDazBDua2xOxd2EKGjo=;
        b=vTyr7riRcE4Q+14HV6OlpcQ9zIhSsTMK2CdculoW85cBJBcvuQuazBuX0wbPRk5dNl
         EbrXFTKVZhjK0x2ofqf9oZQmBkw8HJU/Le+h+ptrKNq9IZ3lJ6IazCFUVaQPKgGnFN5T
         xvj6u0ab7S7ytSvZ8GIr8mal7/Q19klax2H9pwHyUdDP4GFJpUaMap5iMuC+OOuOn6sq
         02BBzkVPIKhFuQwVwRqwCnE3tMhusB3ftp0Y2w4G1gh/nlAsvn7p+fYG+S9xYTUBqmpy
         uNGysy5gu9sT7W3Giw31j+eWTJ0gquPQ2jmi7fvcX1smkkaQT1L5oQH2in2rxynUYQ16
         pe4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OznM7Zj90HA/meLwT6xmjh0/MDazBDua2xOxd2EKGjo=;
        b=Zir3r12qs+YPzeGj1P1DX3GUMM2TgYK9dUwQXC2YSWg7HlX1yKP0gTGmQkSpN1815U
         07O3dseFS/s6pYiI8273gqvnB/r7Fxrbi5bIOPemeIsifrQ8MDmFLD5eFLnUP6LykvJ3
         umahIWlUvGRX4X/0qVDUwGNsTYPreKCedL62x3pRJo+JMiNkxv2smXcu5R2Vvv8B6vif
         ULYpY0UHIJHIIgVLGn3VJuDPlHFpLyev/AJNcCaHITy9jX6VVGKtLsS2r1pcC79nOQx4
         kHQzbHfv9g2lIRHixr7IHBs9scznmrVbubKJPrfnFtZ3GGkaHrDN++ILb2LLXoRRxW7d
         iDCg==
X-Gm-Message-State: AOAM530Od8xSG/rtvzQv+r8E0gcStf6unOKnVm5e/ezfS/ukiFYAJMir
        mKcDS94MHZrg8QTI0fI55AUE8jhKiSkbPyxRouJzo4sjKYBUiA==
X-Google-Smtp-Source: ABdhPJzUrIJANLo8judLuW+VN+2BAHRIzmARBNaK83S4Ex8J42Bc2MydsNkOqCWF40In3VxFA/iPONssAHeQ++q1Q8M=
X-Received: by 2002:adf:e312:: with SMTP id b18mr30175280wrj.372.1600683016740;
 Mon, 21 Sep 2020 03:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000056737105afcff247@google.com>
In-Reply-To: <00000000000056737105afcff247@google.com>
From:   Alexander Potapenko <glider@google.com>
Date:   Mon, 21 Sep 2020 12:10:05 +0200
Message-ID: <CAG_fn=VnujTeKg9r+b8VoTGCs4OdwR0eHj0+HHtn5UzePy3EmA@mail.gmail.com>
Subject: Re: KMSAN: uninit-value in search_by_key
To:     syzbot <syzbot+d94d02749498bb7bab4b@syzkaller.appspotmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        alex.shi@linux.alibaba.com, jack@suse.cz,
        LKML <linux-kernel@vger.kernel.org>,
        reiserfs-devel@vger.kernel.org,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        yeyunfeng@huawei.com, zhengbin13@huawei.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Mon, Sep 21, 2020 at 12:02 PM syzbot
<syzbot+d94d02749498bb7bab4b@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    c5a13b33 kmsan: clang-format core
> git tree:       https://github.com/google/kmsan.git master
> console output: https://syzkaller.appspot.com/x/log.txt?x=173525ab900000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=20f149ad694ba4be
> dashboard link: https://syzkaller.appspot.com/bug?extid=d94d02749498bb7bab4b
> compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
> userspace arch: i386
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+d94d02749498bb7bab4b@syzkaller.appspotmail.com
>
> =====================================================
> BUG: KMSAN: uninit-value in comp_keys fs/reiserfs/stree.c:83 [inline]
> BUG: KMSAN: uninit-value in bin_search fs/reiserfs/stree.c:173 [inline]
> BUG: KMSAN: uninit-value in search_by_key+0x2c57/0x60e0 fs/reiserfs/stree.c:743
> CPU: 1 PID: 28395 Comm: syz-executor.4 Not tainted 5.9.0-rc4-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0x21c/0x280 lib/dump_stack.c:118
>  kmsan_report+0xf7/0x1e0 mm/kmsan/kmsan_report.c:122
>  __msan_warning+0x58/0xa0 mm/kmsan/kmsan_instr.c:219
>  comp_keys fs/reiserfs/stree.c:83 [inline]
>  bin_search fs/reiserfs/stree.c:173 [inline]
>  search_by_key+0x2c57/0x60e0 fs/reiserfs/stree.c:743
>  reiserfs_read_locked_inode+0x1fc/0x3260 fs/reiserfs/inode.c:1561
>  reiserfs_fill_super+0x2c00/0x6170 fs/reiserfs/super.c:2081
>  mount_bdev+0x622/0x910 fs/super.c:1417
>  get_super_block+0xc9/0xe0 fs/reiserfs/super.c:2606
>  legacy_get_tree+0x163/0x2e0 fs/fs_context.c:592
>  vfs_get_tree+0xd8/0x5d0 fs/super.c:1547
>  do_new_mount fs/namespace.c:2875 [inline]
>  path_mount+0x3d1a/0x5d40 fs/namespace.c:3192
>  do_mount+0x1c6/0x220 fs/namespace.c:3205
>  __do_compat_sys_mount fs/compat.c:122 [inline]
>  __se_compat_sys_mount+0x7b5/0xaa0 fs/compat.c:89
>  __ia32_compat_sys_mount+0x62/0x80 fs/compat.c:89
>  do_syscall_32_irqs_on arch/x86/entry/common.c:80 [inline]
>  __do_fast_syscall_32+0x129/0x180 arch/x86/entry/common.c:139
>  do_fast_syscall_32+0x6a/0xc0 arch/x86/entry/common.c:162
>  do_SYSENTER_32+0x73/0x90 arch/x86/entry/common.c:205
>  entry_SYSENTER_compat_after_hwframe+0x4d/0x5c
> RIP: 0023:0xf7fea549
> Code: b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 eb 0d 90 90 90 90 90 90 90 90 90 90 90 90
> RSP: 002b:00000000f55e3f20 EFLAGS: 00000292 ORIG_RAX: 0000000000000015
> RAX: ffffffffffffffda RBX: 00000000f55e3f7c RCX: 0000000020000100
> RDX: 0000000020000000 RSI: 0000000000000000 RDI: 00000000f55e3fbc
> RBP: 00000000f55e3f7c R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
>
> Local variable ----key@reiserfs_read_locked_inode created at:
>  reiserfs_read_locked_inode+0xb4/0x3260 fs/reiserfs/inode.c:1544
>  reiserfs_read_locked_inode+0xb4/0x3260 fs/reiserfs/inode.c:1544
> =====================================================
>

Looks like reiserfs_read_locked_inode() fails to initialize cpu_key->key_length.
Could someone please take a look?
