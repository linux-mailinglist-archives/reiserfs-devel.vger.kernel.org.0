Return-Path: <reiserfs-devel+bounces-131-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B9E90A093
	for <lists+reiserfs-devel@lfdr.de>; Mon, 17 Jun 2024 00:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1DB71F21A98
	for <lists+reiserfs-devel@lfdr.de>; Sun, 16 Jun 2024 22:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740A76D1BB;
	Sun, 16 Jun 2024 22:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YDckpimz"
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E833A8F0;
	Sun, 16 Jun 2024 22:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718578111; cv=none; b=sXyvGGIKbC0NEzzIT7311Ju8QDDTeg2pysGsx5COHsAFam8zlqxhap+nC+9udv9kra1g2M91EUG6YAPZF2gZ41tG4phr+7TM9PBY/yMCdnR7ET3p7ZQZg0z+JigYrgEGkFZy5uxH/BuUt/nPdM+n5iR4r5IUddmRUuk3+pNfpxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718578111; c=relaxed/simple;
	bh=aoTQevZL5HCudcWMH5Vn0evXHoR8c+cVnCNB2hv/Edw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MvOcj3+vc12r29qwn4tOBaPWyqwHh8IMlH+Y9Litu6Mxiv/owGqJZV4eLtcGcSpcpp1jSplyrDHNF8inieHCKclrskP54q4ZxDX6FSxHyjOKSFl7vto6biYY28LA2AK5tNxmgAN7RFnszLu1N+JtSXltUfwpJz03QZmLHu5HaLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=YDckpimz; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hszCP4cSREG/AzJnddpH1x0SNrcfYCFt7BI7k05gpvo=; b=YDckpimzlhqJ45pU+BZqHYvf1L
	kOSRktykok0JCG1X+1vN/hhKeacJL5nTgxRJBfUi5xWrlVUSPN9P9jUjMCY1MJ+sUR5X0F+/iKdcr
	073HR/E1HYknWp65tNIktZ0J0exBVYDB1Q02Ug2r70aLI0/jb0mY2tDJI3+vZd/xPxU4thozi7pBh
	SvIBm0/z82SbZG6IStuIgxWyMmUBI3HA9PpOpnfvnzzu7NsAdmteDW27H+rJ2Lc13mSJNFizwrGK2
	jlwcY8/gc2oQ/FFcS+LOZPe1yEuFCb/u4UK45mxk1iqiUHKgbSeooCHELsD+MmNP0JChLj2idQheY
	Goaj+qxA==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIyfg-00000001X6p-0XT3;
	Sun, 16 Jun 2024 22:48:24 +0000
Date: Sun, 16 Jun 2024 23:48:24 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Shuangpeng Bai <shuangpengbai@gmail.com>
Cc: brauner@kernel.org, jack@suse.cz, edward.shishkin@gmail.com,
	yukuai3@huawei.com, linux-kernel@vger.kernel.org,
	reiserfs-devel@vger.kernel.org
Subject: Re: Follow-Up on Reported Kernel Bug KASAN: slab-use-after-free in
 __discard_prealloc in v6.9
Message-ID: <Zm9ruE5GJ1y2w9Bj@casper.infradead.org>
References: <05D238C7-3E4B-4751-B2F4-A56F7F7EF30F@gmail.com>
 <3523AB97-D775-402F-BF43-1D221DC400AB@gmail.com>
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3523AB97-D775-402F-BF43-1D221DC400AB@gmail.com>

On Sun, Jun 16, 2024 at 02:33:38PM -0400, Shuangpeng Bai wrote:
> Dear Kernel Maintainers,
> 
> I hope this message finds you well.
> 
> I am writing to follow up on the recent bug report KASAN: slab-use-after-free in __discard_prealloc. I was wondering if there have been any updates or progress on this issue. Additionally, please let me know if there is any assistance I can provide.

It's reiserfs.  I'm not going to spend any time on it.  Other people
may be motivated to work on it, but it's deprecated and scheduled for
removal.

> Thank you for your time and attention to this matter.
> 
> Best regards,
> Shuangpeng
> 
> 
> > On May 21, 2024, at 23:19, Shuangpeng Bai <shuangpengbai@gmail.com> wrote:
> > 
> > Hi Kernel Maintainers,
> > 
> > Our tool found a kernel bug KASAN: slab-use-after-free in __discard_prealloc. Please see the details below.
> > 
> > Kernel commit: v6.9 (Commits on May 12, 2024)
> > Kernel config: attachment
> > C/Syz reproducer: attachment
> > 
> > Please let me know for anything I can help.
> > 
> > Best,
> > Shuangpeng
> > 
> > 
> > 
> > [ 194.668209][ T8083] BUG: KASAN: slab-use-after-free in __discard_prealloc (fs/reiserfs/bitmap.c:505) 
> > [  194.669126][ T9920] REISERFS (device loop1): Created .reiserfs_priv - reserved for xattr storage.
> > [  194.669524][ T8083] Read of size 4 at addr ffff888159b1d63c by task a.out/8083
> > [  194.671126][ T8083]
> > [  194.671351][ T8083] CPU: 0 PID: 8083 Comm: a.out Not tainted 6.9.0 #8
> > [  194.671950][ T8083] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
> > [  194.672773][ T8083] Call Trace:
> > [  194.673475][ T8083]  <TASK>
> > [ 194.674042][ T8083] dump_stack_lvl (lib/dump_stack.c:117) 
> > [ 194.674927][ T8083] print_report (mm/kasan/report.c:378 mm/kasan/report.c:488) 
> > [ 194.675770][ T8083] ? __phys_addr (arch/x86/mm/physaddr.c:32 (discriminator 4)) 
> > [ 194.676638][ T8083] ? __discard_prealloc (fs/reiserfs/bitmap.c:505) 
> > [ 194.677662][ T8083] kasan_report (mm/kasan/report.c:603) 
> > [ 194.678475][ T8083] ? __discard_prealloc (fs/reiserfs/bitmap.c:505) 
> > [ 194.679462][ T8083] __discard_prealloc (fs/reiserfs/bitmap.c:505) 
> > [ 194.680432][ T8083] ? __pfx_mutex_lock (kernel/locking/mutex.c:282) 
> > [ 194.681530][ T8083] ? mutex_lock (./arch/x86/include/asm/atomic64_64.h:109 ./include/linux/atomic/atomic-arch-fallback.h:4296 ./include/linux/atomic/atomic-long.h:1482 ./include/linux/atomic/atomic-instrumented.h:4458 kernel/locking/mutex.c:171 kernel/locking/mutex.c:285) 
> > [ 194.682461][ T8083] ? __pfx_mutex_lock (kernel/locking/mutex.c:282) 
> > [ 194.683525][ T8083] reiserfs_discard_all_prealloc (./include/linux/list.h:373 fs/reiserfs/bitmap.c:551) 
> > [ 194.684860][ T8083] do_journal_end (fs/reiserfs/journal.c:4071) 
> > [ 194.685990][ T8083] ? reiserfs_write_lock_nested (fs/reiserfs/lock.c:79) 
> > [ 194.687258][ T8083] ? do_journal_begin_r (fs/reiserfs/journal.c:3030) 
> > [ 194.688388][ T8083] ? down_read_trylock (./arch/x86/include/asm/preempt.h:103 kernel/locking/rwsem.c:1293 kernel/locking/rwsem.c:1565) 
> > [ 194.689512][ T8083] ? __pfx_down_read_trylock (kernel/locking/rwsem.c:1564) 
> > [ 194.690730][ T8083] ? __pfx_do_journal_end (fs/reiserfs/journal.c:3985) 
> > [ 194.691867][ T8083] ? __pfx_wake_up_bit (kernel/sched/wait_bit.c:148) 
> > [ 194.692943][ T8083] ? dquot_disable (fs/quota/dquot.c:2241) 
> > [ 194.694043][ T8083] ? journal_mark_dirty (fs/reiserfs/journal.c:3384) 
> > [ 194.695187][ T8083] journal_release (fs/reiserfs/journal.c:1939 fs/reiserfs/journal.c:1970) 
> > [ 194.696249][ T8083] ? __pfx_journal_release (fs/reiserfs/journal.c:1969) 
> > [ 194.697302][ T8083] reiserfs_put_super (fs/reiserfs/super.c:618) 
> > [ 194.698273][ T8083] ? __pfx_reiserfs_put_super (fs/reiserfs/super.c:590) 
> > [ 194.699338][ T8083] ? __pfx_evict_inodes (fs/inode.c:715) 
> > [ 194.700303][ T8083] ? shrink_dcache_for_umount (./include/linux/list_bl.h:60 fs/dcache.c:1558) 
> > [ 194.701507][ T8083] ? __pfx_reiserfs_put_super (fs/reiserfs/super.c:590) 
> > [ 194.702633][ T8083] generic_shutdown_super (fs/super.c:647) 
> > [ 194.703776][ T8083] kill_block_super (fs/super.c:1676) 
> > [ 194.704890][ T8083] deactivate_locked_super (fs/super.c:433 fs/super.c:474) 
> > [ 194.706120][ T8083] deactivate_super (fs/super.c:507) 
> > [ 194.707137][ T8083] cleanup_mnt (fs/namespace.c:144 fs/namespace.c:1268) 
> > [ 194.708143][ T8083] task_work_run (kernel/task_work.c:181 (discriminator 1)) 
> > [ 194.709182][ T8083] ? __pfx_task_work_run (kernel/task_work.c:148) 
> > [ 194.710362][ T8083] ? __x64_sys_umount (fs/namespace.c:1922) 
> > [ 194.711486][ T8083] ? __pfx___x64_sys_umount (fs/namespace.c:1922) 
> > [ 194.712665][ T8083] syscall_exit_to_user_mode (./include/linux/resume_user_mode.h:50 kernel/entry/common.c:114 ./include/linux/entry-common.h:328 kernel/entry/common.c:207 kernel/entry/common.c:218) 
> > [ 194.713939][ T8083] do_syscall_64 (arch/x86/entry/common.c:102) 
> > [ 194.715010][ T8083] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
> > [  194.716446][ T8083] RIP: 0033:0x7f41ac14d16b
> > [ 194.717471][ T8083] Code: cd 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 90 f3 0f 1e fa 31 f6 e9 05 00 00 00 0f 1f 44 00 00 f3 0f 1e fa b8 a6 00 00 00 0f 05 <48> 3d 01 f0 ff ff 78
> > All code
> > ========
> >   0: cd 0c                 int    $0xc
> >   2: 00 f7                 add    %dh,%bh
> >   4: d8 64 89 01           fsubs  0x1(%rcx,%rcx,4)
> >   8: 48 83 c8 ff           or     $0xffffffffffffffff,%rax
> >   c: c3                    ret    
> >   d: 66 90                 xchg   %ax,%ax
> >   f: f3 0f 1e fa           endbr64 
> >  13: 31 f6                 xor    %esi,%esi
> >  15: e9 05 00 00 00        jmp    0x1f
> >  1a: 0f 1f 44 00 00        nopl   0x0(%rax,%rax,1)
> >  1f: f3 0f 1e fa           endbr64 
> >  23: b8 a6 00 00 00        mov    $0xa6,%eax
> >  28: 0f 05                 syscall 
> >  2a:* 48 3d 01 f0 ff ff     cmp    $0xfffffffffffff001,%rax <-- trapping instruction
> >  30: 78                    .byte 0x78
> > 
> > Code starting with the faulting instruction
> > ===========================================
> >   0: 48 3d 01 f0 ff ff     cmp    $0xfffffffffffff001,%rax
> >   6: 78                    .byte 0x78
> > [  194.721957][ T8083] RSP: 002b:00007ffc1c01ee98 EFLAGS: 00000202 ORIG_RAX: 00000000000000a6
> > [  194.723594][ T8083] RAX: 0000000000000000 RBX: 00005571e220fe30 RCX: 00007f41ac14d16b
> > [  194.725053][ T8083] RDX: 0000000000000009 RSI: 0000000000000009 RDI: 00007ffc1c01ef70
> > [  194.726613][ T8083] RBP: 00007ffc1c01ff80 R08: 00000000ffffffff R09: 00007ffc1c01ed30
> > [  194.728147][ T8083] R10: 00005571e22100ee R11: 0000000000000202 R12: 00005571e220c720
> > [  194.729713][ T8083] R13: 00007ffc1c020100 R14: 0000000000000000 R15: 0000000000000000
> > [  194.731261][ T8083]  </TASK>
> > [  194.731856][ T8083]
> > [  194.732313][ T8083] Allocated by task 9876:
> > [ 194.733176][ T8083] kasan_save_stack (mm/kasan/common.c:48) 
> > [ 194.734236][ T8083] kasan_save_track (./arch/x86/include/asm/current.h:49 mm/kasan/common.c:60 mm/kasan/common.c:69) 
> > [ 194.735295][ T8083] __kasan_slab_alloc (mm/kasan/common.c:341) 
> > [ 194.736401][ T8083] kmem_cache_alloc_lru (mm/slub.c:3805 mm/slub.c:3851 mm/slub.c:3870) 
> > [ 194.737539][ T8083] reiserfs_alloc_inode (fs/reiserfs/super.c:643) 
> > [ 194.738710][ T8083] alloc_inode (fs/inode.c:261) 
> > [ 194.739657][ T8083] new_inode (fs/inode.c:1009 fs/inode.c:1033) 
> > [ 194.740574][ T8083] reiserfs_create (fs/reiserfs/namei.c:634) 
> > [ 194.741656][ T8083] path_openat (fs/namei.c:3499 fs/namei.c:3566 fs/namei.c:3796) 
> > [ 194.742716][ T8083] do_filp_open (fs/namei.c:3827) 
> > [ 194.743724][ T8083] do_sys_openat2 (fs/open.c:1407) 
> > [ 194.744693][ T8083] __x64_sys_openat (fs/open.c:1432) 
> > [ 194.745767][ T8083] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83) 
> > [ 194.746687][ T8083] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
> > [  194.747925][ T8083]
> > [  194.748522][ T8083] Freed by task 0:
> > [ 194.749336][ T8083] kasan_save_stack (mm/kasan/common.c:48) 
> > [ 194.750377][ T8083] kasan_save_track (./arch/x86/include/asm/current.h:49 mm/kasan/common.c:60 mm/kasan/common.c:69) 
> > [ 194.751394][ T8083] kasan_save_free_info (mm/kasan/generic.c:582) 
> > [ 194.752535][ T8083] __kasan_slab_free (mm/kasan/common.c:274) 
> > [ 194.753686][ T8083] kmem_cache_free (mm/slub.c:4286 mm/slub.c:4350) 
> > [ 194.754683][ T8083] i_callback (fs/inode.c:253) 
> > [ 194.755732][ T8083] rcu_core (./arch/x86/include/asm/preempt.h:26 kernel/rcu/tree.c:2203 kernel/rcu/tree.c:2471) 
> > [ 194.756660][ T8083] handle_softirqs (./arch/x86/include/asm/jump_label.h:27 ./include/linux/jump_label.h:207 ./include/trace/events/irq.h:142 kernel/softirq.c:555) 
> > [ 194.757702][ T8083] irq_exit_rcu (kernel/softirq.c:589 kernel/softirq.c:428 kernel/softirq.c:637 kernel/softirq.c:649) 
> > [ 194.758656][ T8083] sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1043 arch/x86/kernel/apic/apic.c:1043) 
> > [ 194.760169][ T8083] asm_sysvec_apic_timer_interrupt (./arch/x86/include/asm/idtentry.h:702) 
> > [  194.761723][ T8083]
> > [  194.762293][ T8083] Last potentially related work creation:
> > [ 194.763678][ T8083] kasan_save_stack (mm/kasan/common.c:48) 
> > [ 194.764850][ T8083] __kasan_record_aux_stack (mm/kasan/generic.c:541) 
> > [ 194.766173][ T8083] __call_rcu_common.constprop.0 (./arch/x86/include/asm/irqflags.h:26 ./arch/x86/include/asm/irqflags.h:67 ./arch/x86/include/asm/irqflags.h:103 kernel/rcu/tree.c:2735) 
> > [ 194.767683][ T8083] destroy_inode (fs/inode.c:317) 
> > [ 194.768869][ T8083] iput.part.0 (fs/inode.c:1741 fs/inode.c:1767) 
> > [ 194.770085][ T8083] iput (fs/inode.c:1769) 
> > [ 194.771070][ T8083] dentry_unlink_inode (fs/dcache.c:401) 
> > [ 194.772602][ T8083] __dentry_kill (fs/dcache.c:606) 
> > [ 194.773978][ T8083] dput (fs/dcache.c:846 fs/dcache.c:833) 
> > [ 194.775098][ T8083] path_put (fs/namei.c:562) 
> > [ 194.776263][ T8083] do_sys_truncate.part.0 (fs/open.c:135) 
> > [ 194.778042][ T8083] __x64_sys_truncate (fs/open.c:128 fs/open.c:146 fs/open.c:144 fs/open.c:144) 
> > [ 194.779444][ T8083] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83) 
> > [ 194.780764][ T8083] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
> > [  194.782457][ T8083]
> > [  194.783131][ T8083] The buggy address belongs to the object at ffff888159b1d620
> > [  194.783131][ T8083]  which belongs to the cache reiser_inode_cache of size 816
> > [  194.787449][ T8083] The buggy address is located 28 bytes inside of
> > [  194.787449][ T8083]  freed 816-byte region [ffff888159b1d620, ffff888159b1d950)
> > [  194.791445][ T8083]
> > [  194.792122][ T8083] The buggy address belongs to the physical page:
> > [  194.793790][ T8083] page: refcount:1 mapcount:0 mapping:0000000000000000 index:0xffff888159b1c3b0 pfn:0x159b1c
> > [  194.795987][ T8083] head: order:2 entire_mapcount:0 nr_pages_mapped:0 pincount:0
> > [  194.797483][ T8083] flags: 0x57ff00000000840(slab|head|node=1|zone=2|lastcpupid=0x7ff)
> > [  194.801436][ T8083] page_type: 0xffffffff()
> > [  194.802430][ T8083] raw: 057ff00000000840 ffff888145e9f8c0 ffffea0001c2a600 0000000000000004
> > [  194.804299][ T8083] raw: ffff888159b1c3b0 0000000080110010 00000001ffffffff 0000000000000000
> > [  194.806266][ T8083] head: 057ff00000000840 ffff888145e9f8c0 ffffea0001c2a600 0000000000000004
> > [  194.808198][ T8083] head: ffff888159b1c3b0 0000000080110010 00000001ffffffff 0000000000000000
> > [  194.810058][ T8083] head: 057ff00000000002 ffffea000566c701 dead000000000122 00000000ffffffff
> > [  194.811978][ T8083] head: 0000000400000000 0000000000000000 00000000ffffffff 0000000000000000
> > [  194.813914][ T8083] page dumped because: kasan: bad access detected
> > [  194.815313][ T8083] page_owner tracks the page as allocated
> > [  194.816509][ T8083] page last allocated via order 2, migratetype Reclaimable, gfp_mask 0xd20d0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC|__GFP0
> > [ 194.821336][ T8083] post_alloc_hook (./include/linux/page_owner.h:32 mm/page_alloc.c:1534) 
> > [ 194.822457][ T8083] get_page_from_freelist (mm/page_alloc.c:1543 mm/page_alloc.c:3317) 
> > [ 194.823688][ T8083] __alloc_pages (mm/page_alloc.c:4576) 
> > [ 194.824723][ T8083] allocate_slab (mm/slub.c:2181 mm/slub.c:2343) 
> > [ 194.825743][ T8083] ___slab_alloc (mm/slub.c:3531) 
> > [ 194.826760][ T8083] __slab_alloc.constprop.0 (mm/slub.c:3615) 
> > [ 194.827911][ T8083] kmem_cache_alloc_lru (mm/slub.c:3668 mm/slub.c:3841 mm/slub.c:3870) 
> > [ 194.829067][ T8083] reiserfs_alloc_inode (fs/reiserfs/super.c:643) 
> > [ 194.830189][ T8083] alloc_inode (fs/inode.c:261) 
> > [ 194.831173][ T8083] iget5_locked (fs/inode.c:1237 fs/inode.c:1228) 
> > [ 194.832182][ T8083] reiserfs_fill_super (fs/reiserfs/super.c:2054) 
> > [ 194.833323][ T8083] mount_bdev (fs/super.c:1659) 
> > [ 194.834269][ T8083] legacy_get_tree (fs/fs_context.c:664) 
> > [ 194.835264][ T8083] vfs_get_tree (fs/super.c:1780) 
> > [ 194.836191][ T8083] path_mount (fs/namespace.c:3353 fs/namespace.c:3679) 
> > [ 194.837120][ T8083] __x64_sys_mount (fs/namespace.c:3693 fs/namespace.c:3898 fs/namespace.c:3875 fs/namespace.c:3875) 
> > [  194.838189][ T8083] page_owner free stack trace missing
> > [  194.839319][ T8083]
> > [  194.839838][ T8083] Memory state around the buggy address:
> > [  194.841035][ T8083]  ffff888159b1d500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> > [  194.842751][ T8083]  ffff888159b1d580: fb fb fb fb fc fc fc fc fc fc fc fc fc fc fc fc
> > [  194.844459][ T8083] >ffff888159b1d600: fc fc fc fc fa fb fb fb fb fb fb fb fb fb fb fb
> > [  194.846244][ T8083]                                         ^
> > [  194.847615][ T8083]  ffff888159b1d680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> > [  194.849333][ T8083]  ffff888159b1d700: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> > [  194.850693][ T8083] ==================================================================
> > [  194.863761][ T8083] Kernel panic - not syncing: KASAN: panic_on_warn set ...
> > [  194.865484][ T8083] CPU: 0 PID: 8083 Comm: a.out Not tainted 6.9.0 #8
> > [  194.867008][ T8083] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
> > [  194.868970][ T8083] Call Trace:
> > [  194.869630][ T8083]  <TASK>
> > [ 194.870254][ T8083] dump_stack_lvl (lib/dump_stack.c:118 (discriminator 4)) 
> > [ 194.871333][ T8083] panic (kernel/panic.c:348) 
> > [ 194.872907][ T8083] ? __pfx_panic (kernel/panic.c:282) 
> > [ 194.873915][ T8083] ? preempt_schedule_thunk (arch/x86/entry/thunk_64.S:12) 
> > [ 194.875119][ T8083] ? preempt_schedule_common (./arch/x86/include/asm/preempt.h:84 kernel/sched/core.c:6927) 
> > [ 194.876293][ T8083] ? check_panic_on_warn (kernel/panic.c:240) 
> > [ 194.877435][ T8083] ? __discard_prealloc (fs/reiserfs/bitmap.c:505) 
> > [ 194.878672][ T8083] check_panic_on_warn (kernel/panic.c:241) 
> > [ 194.879809][ T8083] end_report (mm/kasan/report.c:226) 
> > [ 194.880719][ T8083] kasan_report (./arch/x86/include/asm/smap.h:56 mm/kasan/report.c:606) 
> > [ 194.881700][ T8083] ? __discard_prealloc (fs/reiserfs/bitmap.c:505) 
> > [ 194.882817][ T8083] __discard_prealloc (fs/reiserfs/bitmap.c:505) 
> > [ 194.883890][ T8083] ? __pfx_mutex_lock (kernel/locking/mutex.c:282) 
> > [ 194.884990][ T8083] ? mutex_lock (./arch/x86/include/asm/atomic64_64.h:109 ./include/linux/atomic/atomic-arch-fallback.h:4296 ./include/linux/atomic/atomic-long.h:1482 ./include/linux/atomic/atomic-instrumented.h:4458 kernel/locking/mutex.c:171 kernel/locking/mutex.c:285) 
> > [ 194.885973][ T8083] ? __pfx_mutex_lock (kernel/locking/mutex.c:282) 
> > [ 194.887042][ T8083] reiserfs_discard_all_prealloc (./include/linux/list.h:373 fs/reiserfs/bitmap.c:551) 
> > [ 194.888315][ T8083] do_journal_end (fs/reiserfs/journal.c:4071) 
> > [ 194.889386][ T8083] ? reiserfs_write_lock_nested (fs/reiserfs/lock.c:79) 
> > [ 194.890629][ T8083] ? do_journal_begin_r (fs/reiserfs/journal.c:3030) 
> > [ 194.892411][ T8083] ? down_read_trylock (./arch/x86/include/asm/preempt.h:103 kernel/locking/rwsem.c:1293 kernel/locking/rwsem.c:1565) 
> > [ 194.896737][ T8083] ? __pfx_down_read_trylock (kernel/locking/rwsem.c:1564) 
> > [ 194.899681][ T8083] ? __pfx_do_journal_end (fs/reiserfs/journal.c:3985) 
> > [ 194.900992][ T8083] ? __pfx_wake_up_bit (kernel/sched/wait_bit.c:148) 
> > [ 194.902147][ T8083] ? dquot_disable (fs/quota/dquot.c:2241) 
> > [ 194.903276][ T8083] ? journal_mark_dirty (fs/reiserfs/journal.c:3384) 
> > [ 194.904466][ T8083] journal_release (fs/reiserfs/journal.c:1939 fs/reiserfs/journal.c:1970) 
> > [ 194.905596][ T8083] ? __pfx_journal_release (fs/reiserfs/journal.c:1969) 
> > [ 194.906839][ T8083] reiserfs_put_super (fs/reiserfs/super.c:618) 
> > [ 194.908016][ T8083] ? __pfx_reiserfs_put_super (fs/reiserfs/super.c:590) 
> > [ 194.909296][ T8083] ? __pfx_evict_inodes (fs/inode.c:715) 
> > [ 194.910506][ T8083] ? shrink_dcache_for_umount (./include/linux/list_bl.h:60 fs/dcache.c:1558) 
> > [ 194.911809][ T8083] ? __pfx_reiserfs_put_super (fs/reiserfs/super.c:590) 
> > [ 194.913079][ T8083] generic_shutdown_super (fs/super.c:647) 
> > [ 194.914265][ T8083] kill_block_super (fs/super.c:1676) 
> > [ 194.915356][ T8083] deactivate_locked_super (fs/super.c:433 fs/super.c:474) 
> > [ 194.916558][ T8083] deactivate_super (fs/super.c:507) 
> > [ 194.917643][ T8083] cleanup_mnt (fs/namespace.c:144 fs/namespace.c:1268) 
> > [ 194.918633][ T8083] task_work_run (kernel/task_work.c:181 (discriminator 1)) 
> > [ 194.919696][ T8083] ? __pfx_task_work_run (kernel/task_work.c:148) 
> > [ 194.921028][ T8083] ? __x64_sys_umount (fs/namespace.c:1922) 
> > [ 194.922198][ T8083] ? __pfx___x64_sys_umount (fs/namespace.c:1922) 
> > [ 194.923455][ T8083] syscall_exit_to_user_mode (./include/linux/resume_user_mode.h:50 kernel/entry/common.c:114 ./include/linux/entry-common.h:328 kernel/entry/common.c:207 kernel/entry/common.c:218) 
> > [ 194.924701][ T8083] do_syscall_64 (arch/x86/entry/common.c:102) 
> > [ 194.925719][ T8083] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
> > [  194.927021][ T8083] RIP: 0033:0x7f41ac14d16b
> > [ 194.928007][ T8083] Code: cd 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 90 f3 0f 1e fa 31 f6 e9 05 00 00 00 0f 1f 44 00 00 f3 0f 1e fa b8 a6 00 00 00 0f 05 <48> 3d 01 f0 ff ff 78
> > All code
> > ========
> >   0: cd 0c                 int    $0xc
> >   2: 00 f7                 add    %dh,%bh
> >   4: d8 64 89 01           fsubs  0x1(%rcx,%rcx,4)
> >   8: 48 83 c8 ff           or     $0xffffffffffffffff,%rax
> >   c: c3                    ret    
> >   d: 66 90                 xchg   %ax,%ax
> >   f: f3 0f 1e fa           endbr64 
> >  13: 31 f6                 xor    %esi,%esi
> >  15: e9 05 00 00 00        jmp    0x1f
> >  1a: 0f 1f 44 00 00        nopl   0x0(%rax,%rax,1)
> >  1f: f3 0f 1e fa           endbr64 
> >  23: b8 a6 00 00 00        mov    $0xa6,%eax
> >  28: 0f 05                 syscall 
> >  2a:* 48 3d 01 f0 ff ff     cmp    $0xfffffffffffff001,%rax <-- trapping instruction
> >  30: 78                    .byte 0x78
> > 
> > Code starting with the faulting instruction
> > ===========================================
> >   0: 48 3d 01 f0 ff ff     cmp    $0xfffffffffffff001,%rax
> >   6: 78                    .byte 0x78
> > [  194.932455][ T8083] RSP: 002b:00007ffc1c01ee98 EFLAGS: 00000202 ORIG_RAX: 00000000000000a6
> > [  194.934448][ T8083] RAX: 0000000000000000 RBX: 00005571e220fe30 RCX: 00007f41ac14d16b
> > [  194.936283][ T8083] RDX: 0000000000000009 RSI: 0000000000000009 RDI: 00007ffc1c01ef70
> > [  194.938032][ T8083] RBP: 00007ffc1c01ff80 R08: 00000000ffffffff R09: 00007ffc1c01ed30
> > [  194.939839][ T8083] R10: 00005571e22100ee R11: 0000000000000202 R12: 00005571e220c720
> > [  194.941774][ T8083] R13: 00007ffc1c020100 R14: 0000000000000000 R15: 0000000000000000
> > [  194.943577][ T8083]  </TASK>
> > [  194.944402][ T8083] Kernel Offset: disabled
> > [  194.945399][ T8083] Rebooting in 86400 seconds..
> > 



> > 
> > 
> 


