Return-Path: <reiserfs-devel+bounces-132-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2E390B758
	for <lists+reiserfs-devel@lfdr.de>; Mon, 17 Jun 2024 19:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44CB01C237EF
	for <lists+reiserfs-devel@lfdr.de>; Mon, 17 Jun 2024 17:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B889B1684A6;
	Mon, 17 Jun 2024 17:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUaWmh9k"
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803761684B0;
	Mon, 17 Jun 2024 17:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718643834; cv=none; b=u2mKrjVwMRjJYxbNxETlwhgXvudppN0pEeZQiN6RGBeZcKoZYA1WLjeOqivwpqde6YuU3Y3F+qqwJrLbRpPHPQ5WtdHaRZuDr+CH0OPTGE5JsQpqp3fCN9nF7Dofsj7r70Sh+r95JzCSNcvH4QyFip8D4Vbk+jPTVISVjAQNLy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718643834; c=relaxed/simple;
	bh=nWCoxFAkUcAUSTOIFrutFsM1A/2/JGx5F6lia4DefN8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=O7mwukIApCv9WYzEc6bqGIDclAr9D9pbKU18+zOmKizl9YFdTEq93BsJWwDyVdD68/LeiQJWR4h2HGnxLoRYlZJrDEJBlUcwLcXlGrQSRtJ/BAep4YOwzZUIovL6/4ph3SUzIkjnzYRHd9wkLDzpZZCVQaEleEkHuYXInRlGbxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NUaWmh9k; arc=none smtp.client-ip=209.85.219.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f67.google.com with SMTP id 6a1803df08f44-6b2c95b6c5aso7585606d6.2;
        Mon, 17 Jun 2024 10:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718643831; x=1719248631; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjLuYfbn6k79bvBC3SKVEIUM/yCKOwV6pdDDprfKbgw=;
        b=NUaWmh9kq+MQZFwTN4CQUcdXVnLDH/XWwFwn+sxYv1IGarwNlDM2YjYiL2qKdrM5ST
         qyDhK7SnXWlpkjTJYEu36VJ5tzkTd/dijgWtUomryE9xbmE8kYtEj48VxEEB+yEJL2sN
         RL9hVQfvlTWkhVR7dg15PMtj7CiKdpeO1vr3ssQyLP3VC9ReIPh2nurgwwDI7y0w1hYx
         NHpWW9tA43DpMsj4OoIk0LZ4L+lht4kCCENLeTWOJqiJgojzoRNtKYVZgx1GpPrtGvYw
         p9/g2Xxm/cmcIzfA4jlmk7X8J8RHcuIonCwtb34IzTvon2OaQPkiyisvM8B5XroKJYfQ
         2Qrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718643831; x=1719248631;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjLuYfbn6k79bvBC3SKVEIUM/yCKOwV6pdDDprfKbgw=;
        b=aJB1buPCOr4lFMOXoR0BPpiPmNcE33oX+MqDLGkxTB098uTotRHThxPXKH+ZtEJhSv
         X8q4iIfrmODtTEYGQlqKLSuGcWNQ1ZLxuCXIp1y40tFzfLlRvpMhyXKrgbz+FhNrPy4X
         oZKKwpjafqLhNqdeZx/s2kPEsQx0GCISUsBfxzPA8qLJ0XbHWT+CWgks3bt23REU8aK9
         tftcXqJatP4ZoVbLTcJlzx3HB0ADGetrlXfC3H+qXY7PyBbmm8ghzH4WcR9Fiysbcnum
         0W+wOmISrFRwmGdEe/mR00LWrf0tA4ijBTdxheq9n+KH0oMo7BVrHBCuxm4ybrnXuXqh
         BEuA==
X-Forwarded-Encrypted: i=1; AJvYcCVATMMObN7c9lDwlF1s4zvH8CzpS7BoRIy1FU57XRbHTrZvZK3oOIiRLmp7GimuyH9ctT62JKyhG0XwusjpROAUKiJ0ScWpOG5xnWyW+mO44X3C7RfBw5zDCJBbE4RTqV9T2QStPmNFomfdHyU=
X-Gm-Message-State: AOJu0YzjnRRYanIoSDVXUTlImyi6ggeimv13ZOd5aOsz5cP7T+fGEm3I
	x8Z14BkR8xbqHWMuMsPQ0nYn3t1fhKKDKgB4ykVMXxCs+VJtTwkJZ08m4bNODW4CPg==
X-Google-Smtp-Source: AGHT+IHlH3BVu7t7TZXsmL/9HHH0fn8wbDO2wo9z9tSNSEdV5Y/SUj/4SpNrxh1Xbtq7KRntKWnM2Q==
X-Received: by 2002:a05:6214:952:b0:6b0:8392:e20 with SMTP id 6a1803df08f44-6b2afd6b011mr100151746d6.9.1718643831126;
        Mon, 17 Jun 2024 10:03:51 -0700 (PDT)
Received: from smtpclient.apple ([2601:98a:4102:7e80:15e6:8547:d94d:61ed])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2b1035bb0sm47997436d6.142.2024.06.17.10.03.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2024 10:03:50 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.300.61.1.2\))
Subject: Re: Follow-Up on Reported Kernel Bug KASAN: slab-use-after-free in
 __discard_prealloc in v6.9
From: Shuangpeng Bai <shuangpengbai@gmail.com>
In-Reply-To: <Zm9ruE5GJ1y2w9Bj@casper.infradead.org>
Date: Mon, 17 Jun 2024 13:03:39 -0400
Cc: brauner@kernel.org,
 edward.shishkin@gmail.com,
 yukuai3@huawei.com,
 linux-kernel@vger.kernel.org,
 reiserfs-devel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B5F5321B-D022-4EE0-A815-B71FA8115C4C@gmail.com>
References: <05D238C7-3E4B-4751-B2F4-A56F7F7EF30F@gmail.com>
 <3523AB97-D775-402F-BF43-1D221DC400AB@gmail.com>
 <Zm9ruE5GJ1y2w9Bj@casper.infradead.org>
To: Matthew Wilcox <willy@infradead.org>,
 jack@suse.cz
X-Mailer: Apple Mail (2.3774.300.61.1.2)



> On Jun 16, 2024, at 18:48, Matthew Wilcox <willy@infradead.org> wrote:
>=20
> On Sun, Jun 16, 2024 at 02:33:38PM -0400, Shuangpeng Bai wrote:
>> Dear Kernel Maintainers,
>>=20
>> I hope this message finds you well.
>>=20
>> I am writing to follow up on the recent bug report KASAN: =
slab-use-after-free in __discard_prealloc. I was wondering if there have =
been any updates or progress on this issue. Additionally, please let me =
know if there is any assistance I can provide.
>=20
> It's reiserfs.  I'm not going to spend any time on it.  Other people
> may be motivated to work on it, but it's deprecated and scheduled for
> removal.

It seems reiserfs will be removed at the end of this year so we will =
stop testing this subsystem.=20

Thank you for your contributions to kernel!

>=20
>> Thank you for your time and attention to this matter.
>>=20
>> Best regards,
>> Shuangpeng
>>=20
>>=20
>>> On May 21, 2024, at 23:19, Shuangpeng Bai <shuangpengbai@gmail.com> =
wrote:
>>>=20
>>> Hi Kernel Maintainers,
>>>=20
>>> Our tool found a kernel bug KASAN: slab-use-after-free in =
__discard_prealloc. Please see the details below.
>>>=20
>>> Kernel commit: v6.9 (Commits on May 12, 2024)
>>> Kernel config: attachment
>>> C/Syz reproducer: attachment
>>>=20
>>> Please let me know for anything I can help.
>>>=20
>>> Best,
>>> Shuangpeng
>>>=20
>>>=20
>>>=20
>>> [ 194.668209][ T8083] BUG: KASAN: slab-use-after-free in =
__discard_prealloc (fs/reiserfs/bitmap.c:505)=20
>>> [  194.669126][ T9920] REISERFS (device loop1): Created =
.reiserfs_priv - reserved for xattr storage.
>>> [  194.669524][ T8083] Read of size 4 at addr ffff888159b1d63c by =
task a.out/8083
>>> [  194.671126][ T8083]
>>> [  194.671351][ T8083] CPU: 0 PID: 8083 Comm: a.out Not tainted =
6.9.0 #8
>>> [  194.671950][ T8083] Hardware name: QEMU Standard PC (i440FX + =
PIIX, 1996), BIOS 1.15.0-1 04/01/2014
>>> [  194.672773][ T8083] Call Trace:
>>> [  194.673475][ T8083]  <TASK>
>>> [ 194.674042][ T8083] dump_stack_lvl (lib/dump_stack.c:117)=20
>>> [ 194.674927][ T8083] print_report (mm/kasan/report.c:378 =
mm/kasan/report.c:488)=20
>>> [ 194.675770][ T8083] ? __phys_addr (arch/x86/mm/physaddr.c:32 =
(discriminator 4))=20
>>> [ 194.676638][ T8083] ? __discard_prealloc =
(fs/reiserfs/bitmap.c:505)=20
>>> [ 194.677662][ T8083] kasan_report (mm/kasan/report.c:603)=20
>>> [ 194.678475][ T8083] ? __discard_prealloc =
(fs/reiserfs/bitmap.c:505)=20
>>> [ 194.679462][ T8083] __discard_prealloc (fs/reiserfs/bitmap.c:505)=20=

>>> [ 194.680432][ T8083] ? __pfx_mutex_lock =
(kernel/locking/mutex.c:282)=20
>>> [ 194.681530][ T8083] ? mutex_lock =
(./arch/x86/include/asm/atomic64_64.h:109 =
./include/linux/atomic/atomic-arch-fallback.h:4296 =
./include/linux/atomic/atomic-long.h:1482 =
./include/linux/atomic/atomic-instrumented.h:4458 =
kernel/locking/mutex.c:171 kernel/locking/mutex.c:285)=20
>>> [ 194.682461][ T8083] ? __pfx_mutex_lock =
(kernel/locking/mutex.c:282)=20
>>> [ 194.683525][ T8083] reiserfs_discard_all_prealloc =
(./include/linux/list.h:373 fs/reiserfs/bitmap.c:551)=20
>>> [ 194.684860][ T8083] do_journal_end (fs/reiserfs/journal.c:4071)=20
>>> [ 194.685990][ T8083] ? reiserfs_write_lock_nested =
(fs/reiserfs/lock.c:79)=20
>>> [ 194.687258][ T8083] ? do_journal_begin_r =
(fs/reiserfs/journal.c:3030)=20
>>> [ 194.688388][ T8083] ? down_read_trylock =
(./arch/x86/include/asm/preempt.h:103 kernel/locking/rwsem.c:1293 =
kernel/locking/rwsem.c:1565)=20
>>> [ 194.689512][ T8083] ? __pfx_down_read_trylock =
(kernel/locking/rwsem.c:1564)=20
>>> [ 194.690730][ T8083] ? __pfx_do_journal_end =
(fs/reiserfs/journal.c:3985)=20
>>> [ 194.691867][ T8083] ? __pfx_wake_up_bit =
(kernel/sched/wait_bit.c:148)=20
>>> [ 194.692943][ T8083] ? dquot_disable (fs/quota/dquot.c:2241)=20
>>> [ 194.694043][ T8083] ? journal_mark_dirty =
(fs/reiserfs/journal.c:3384)=20
>>> [ 194.695187][ T8083] journal_release (fs/reiserfs/journal.c:1939 =
fs/reiserfs/journal.c:1970)=20
>>> [ 194.696249][ T8083] ? __pfx_journal_release =
(fs/reiserfs/journal.c:1969)=20
>>> [ 194.697302][ T8083] reiserfs_put_super (fs/reiserfs/super.c:618)=20=

>>> [ 194.698273][ T8083] ? __pfx_reiserfs_put_super =
(fs/reiserfs/super.c:590)=20
>>> [ 194.699338][ T8083] ? __pfx_evict_inodes (fs/inode.c:715)=20
>>> [ 194.700303][ T8083] ? shrink_dcache_for_umount =
(./include/linux/list_bl.h:60 fs/dcache.c:1558)=20
>>> [ 194.701507][ T8083] ? __pfx_reiserfs_put_super =
(fs/reiserfs/super.c:590)=20
>>> [ 194.702633][ T8083] generic_shutdown_super (fs/super.c:647)=20
>>> [ 194.703776][ T8083] kill_block_super (fs/super.c:1676)=20
>>> [ 194.704890][ T8083] deactivate_locked_super (fs/super.c:433 =
fs/super.c:474)=20
>>> [ 194.706120][ T8083] deactivate_super (fs/super.c:507)=20
>>> [ 194.707137][ T8083] cleanup_mnt (fs/namespace.c:144 =
fs/namespace.c:1268)=20
>>> [ 194.708143][ T8083] task_work_run (kernel/task_work.c:181 =
(discriminator 1))=20
>>> [ 194.709182][ T8083] ? __pfx_task_work_run (kernel/task_work.c:148)=20=

>>> [ 194.710362][ T8083] ? __x64_sys_umount (fs/namespace.c:1922)=20
>>> [ 194.711486][ T8083] ? __pfx___x64_sys_umount (fs/namespace.c:1922)=20=

>>> [ 194.712665][ T8083] syscall_exit_to_user_mode =
(./include/linux/resume_user_mode.h:50 kernel/entry/common.c:114 =
./include/linux/entry-common.h:328 kernel/entry/common.c:207 =
kernel/entry/common.c:218)=20
>>> [ 194.713939][ T8083] do_syscall_64 (arch/x86/entry/common.c:102)=20
>>> [ 194.715010][ T8083] entry_SYSCALL_64_after_hwframe =
(arch/x86/entry/entry_64.S:130)=20
>>> [  194.716446][ T8083] RIP: 0033:0x7f41ac14d16b
>>> [ 194.717471][ T8083] Code: cd 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 =
66 90 f3 0f 1e fa 31 f6 e9 05 00 00 00 0f 1f 44 00 00 f3 0f 1e fa b8 a6 =
00 00 00 0f 05 <48> 3d 01 f0 ff ff 78
>>> All code
>>> =3D=3D=3D=3D=3D=3D=3D=3D
>>>  0: cd 0c                 int    $0xc
>>>  2: 00 f7                 add    %dh,%bh
>>>  4: d8 64 89 01           fsubs  0x1(%rcx,%rcx,4)
>>>  8: 48 83 c8 ff           or     $0xffffffffffffffff,%rax
>>>  c: c3                    ret   =20
>>>  d: 66 90                 xchg   %ax,%ax
>>>  f: f3 0f 1e fa           endbr64=20
>>> 13: 31 f6                 xor    %esi,%esi
>>> 15: e9 05 00 00 00        jmp    0x1f
>>> 1a: 0f 1f 44 00 00        nopl   0x0(%rax,%rax,1)
>>> 1f: f3 0f 1e fa           endbr64=20
>>> 23: b8 a6 00 00 00        mov    $0xa6,%eax
>>> 28: 0f 05                 syscall=20
>>> 2a:* 48 3d 01 f0 ff ff     cmp    $0xfffffffffffff001,%rax <-- =
trapping instruction
>>> 30: 78                    .byte 0x78
>>>=20
>>> Code starting with the faulting instruction
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>  0: 48 3d 01 f0 ff ff     cmp    $0xfffffffffffff001,%rax
>>>  6: 78                    .byte 0x78
>>> [  194.721957][ T8083] RSP: 002b:00007ffc1c01ee98 EFLAGS: 00000202 =
ORIG_RAX: 00000000000000a6
>>> [  194.723594][ T8083] RAX: 0000000000000000 RBX: 00005571e220fe30 =
RCX: 00007f41ac14d16b
>>> [  194.725053][ T8083] RDX: 0000000000000009 RSI: 0000000000000009 =
RDI: 00007ffc1c01ef70
>>> [  194.726613][ T8083] RBP: 00007ffc1c01ff80 R08: 00000000ffffffff =
R09: 00007ffc1c01ed30
>>> [  194.728147][ T8083] R10: 00005571e22100ee R11: 0000000000000202 =
R12: 00005571e220c720
>>> [  194.729713][ T8083] R13: 00007ffc1c020100 R14: 0000000000000000 =
R15: 0000000000000000
>>> [  194.731261][ T8083]  </TASK>
>>> [  194.731856][ T8083]
>>> [  194.732313][ T8083] Allocated by task 9876:
>>> [ 194.733176][ T8083] kasan_save_stack (mm/kasan/common.c:48)=20
>>> [ 194.734236][ T8083] kasan_save_track =
(./arch/x86/include/asm/current.h:49 mm/kasan/common.c:60 =
mm/kasan/common.c:69)=20
>>> [ 194.735295][ T8083] __kasan_slab_alloc (mm/kasan/common.c:341)=20
>>> [ 194.736401][ T8083] kmem_cache_alloc_lru (mm/slub.c:3805 =
mm/slub.c:3851 mm/slub.c:3870)=20
>>> [ 194.737539][ T8083] reiserfs_alloc_inode (fs/reiserfs/super.c:643)=20=

>>> [ 194.738710][ T8083] alloc_inode (fs/inode.c:261)=20
>>> [ 194.739657][ T8083] new_inode (fs/inode.c:1009 fs/inode.c:1033)=20
>>> [ 194.740574][ T8083] reiserfs_create (fs/reiserfs/namei.c:634)=20
>>> [ 194.741656][ T8083] path_openat (fs/namei.c:3499 fs/namei.c:3566 =
fs/namei.c:3796)=20
>>> [ 194.742716][ T8083] do_filp_open (fs/namei.c:3827)=20
>>> [ 194.743724][ T8083] do_sys_openat2 (fs/open.c:1407)=20
>>> [ 194.744693][ T8083] __x64_sys_openat (fs/open.c:1432)=20
>>> [ 194.745767][ T8083] do_syscall_64 (arch/x86/entry/common.c:52 =
arch/x86/entry/common.c:83)=20
>>> [ 194.746687][ T8083] entry_SYSCALL_64_after_hwframe =
(arch/x86/entry/entry_64.S:130)=20
>>> [  194.747925][ T8083]
>>> [  194.748522][ T8083] Freed by task 0:
>>> [ 194.749336][ T8083] kasan_save_stack (mm/kasan/common.c:48)=20
>>> [ 194.750377][ T8083] kasan_save_track =
(./arch/x86/include/asm/current.h:49 mm/kasan/common.c:60 =
mm/kasan/common.c:69)=20
>>> [ 194.751394][ T8083] kasan_save_free_info (mm/kasan/generic.c:582)=20=

>>> [ 194.752535][ T8083] __kasan_slab_free (mm/kasan/common.c:274)=20
>>> [ 194.753686][ T8083] kmem_cache_free (mm/slub.c:4286 =
mm/slub.c:4350)=20
>>> [ 194.754683][ T8083] i_callback (fs/inode.c:253)=20
>>> [ 194.755732][ T8083] rcu_core (./arch/x86/include/asm/preempt.h:26 =
kernel/rcu/tree.c:2203 kernel/rcu/tree.c:2471)=20
>>> [ 194.756660][ T8083] handle_softirqs =
(./arch/x86/include/asm/jump_label.h:27 ./include/linux/jump_label.h:207 =
./include/trace/events/irq.h:142 kernel/softirq.c:555)=20
>>> [ 194.757702][ T8083] irq_exit_rcu (kernel/softirq.c:589 =
kernel/softirq.c:428 kernel/softirq.c:637 kernel/softirq.c:649)=20
>>> [ 194.758656][ T8083] sysvec_apic_timer_interrupt =
(arch/x86/kernel/apic/apic.c:1043 arch/x86/kernel/apic/apic.c:1043)=20
>>> [ 194.760169][ T8083] asm_sysvec_apic_timer_interrupt =
(./arch/x86/include/asm/idtentry.h:702)=20
>>> [  194.761723][ T8083]
>>> [  194.762293][ T8083] Last potentially related work creation:
>>> [ 194.763678][ T8083] kasan_save_stack (mm/kasan/common.c:48)=20
>>> [ 194.764850][ T8083] __kasan_record_aux_stack =
(mm/kasan/generic.c:541)=20
>>> [ 194.766173][ T8083] __call_rcu_common.constprop.0 =
(./arch/x86/include/asm/irqflags.h:26 =
./arch/x86/include/asm/irqflags.h:67 =
./arch/x86/include/asm/irqflags.h:103 kernel/rcu/tree.c:2735)=20
>>> [ 194.767683][ T8083] destroy_inode (fs/inode.c:317)=20
>>> [ 194.768869][ T8083] iput.part.0 (fs/inode.c:1741 fs/inode.c:1767)=20=

>>> [ 194.770085][ T8083] iput (fs/inode.c:1769)=20
>>> [ 194.771070][ T8083] dentry_unlink_inode (fs/dcache.c:401)=20
>>> [ 194.772602][ T8083] __dentry_kill (fs/dcache.c:606)=20
>>> [ 194.773978][ T8083] dput (fs/dcache.c:846 fs/dcache.c:833)=20
>>> [ 194.775098][ T8083] path_put (fs/namei.c:562)=20
>>> [ 194.776263][ T8083] do_sys_truncate.part.0 (fs/open.c:135)=20
>>> [ 194.778042][ T8083] __x64_sys_truncate (fs/open.c:128 =
fs/open.c:146 fs/open.c:144 fs/open.c:144)=20
>>> [ 194.779444][ T8083] do_syscall_64 (arch/x86/entry/common.c:52 =
arch/x86/entry/common.c:83)=20
>>> [ 194.780764][ T8083] entry_SYSCALL_64_after_hwframe =
(arch/x86/entry/entry_64.S:130)=20
>>> [  194.782457][ T8083]
>>> [  194.783131][ T8083] The buggy address belongs to the object at =
ffff888159b1d620
>>> [  194.783131][ T8083]  which belongs to the cache =
reiser_inode_cache of size 816
>>> [  194.787449][ T8083] The buggy address is located 28 bytes inside =
of
>>> [  194.787449][ T8083]  freed 816-byte region [ffff888159b1d620, =
ffff888159b1d950)
>>> [  194.791445][ T8083]
>>> [  194.792122][ T8083] The buggy address belongs to the physical =
page:
>>> [  194.793790][ T8083] page: refcount:1 mapcount:0 =
mapping:0000000000000000 index:0xffff888159b1c3b0 pfn:0x159b1c
>>> [  194.795987][ T8083] head: order:2 entire_mapcount:0 =
nr_pages_mapped:0 pincount:0
>>> [  194.797483][ T8083] flags: =
0x57ff00000000840(slab|head|node=3D1|zone=3D2|lastcpupid=3D0x7ff)
>>> [  194.801436][ T8083] page_type: 0xffffffff()
>>> [  194.802430][ T8083] raw: 057ff00000000840 ffff888145e9f8c0 =
ffffea0001c2a600 0000000000000004
>>> [  194.804299][ T8083] raw: ffff888159b1c3b0 0000000080110010 =
00000001ffffffff 0000000000000000
>>> [  194.806266][ T8083] head: 057ff00000000840 ffff888145e9f8c0 =
ffffea0001c2a600 0000000000000004
>>> [  194.808198][ T8083] head: ffff888159b1c3b0 0000000080110010 =
00000001ffffffff 0000000000000000
>>> [  194.810058][ T8083] head: 057ff00000000002 ffffea000566c701 =
dead000000000122 00000000ffffffff
>>> [  194.811978][ T8083] head: 0000000400000000 0000000000000000 =
00000000ffffffff 0000000000000000
>>> [  194.813914][ T8083] page dumped because: kasan: bad access =
detected
>>> [  194.815313][ T8083] page_owner tracks the page as allocated
>>> [  194.816509][ T8083] page last allocated via order 2, migratetype =
Reclaimable, gfp_mask =
0xd20d0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOME=
MALLOC|__GFP0
>>> [ 194.821336][ T8083] post_alloc_hook =
(./include/linux/page_owner.h:32 mm/page_alloc.c:1534)=20
>>> [ 194.822457][ T8083] get_page_from_freelist (mm/page_alloc.c:1543 =
mm/page_alloc.c:3317)=20
>>> [ 194.823688][ T8083] __alloc_pages (mm/page_alloc.c:4576)=20
>>> [ 194.824723][ T8083] allocate_slab (mm/slub.c:2181 mm/slub.c:2343)=20=

>>> [ 194.825743][ T8083] ___slab_alloc (mm/slub.c:3531)=20
>>> [ 194.826760][ T8083] __slab_alloc.constprop.0 (mm/slub.c:3615)=20
>>> [ 194.827911][ T8083] kmem_cache_alloc_lru (mm/slub.c:3668 =
mm/slub.c:3841 mm/slub.c:3870)=20
>>> [ 194.829067][ T8083] reiserfs_alloc_inode (fs/reiserfs/super.c:643)=20=

>>> [ 194.830189][ T8083] alloc_inode (fs/inode.c:261)=20
>>> [ 194.831173][ T8083] iget5_locked (fs/inode.c:1237 fs/inode.c:1228)=20=

>>> [ 194.832182][ T8083] reiserfs_fill_super (fs/reiserfs/super.c:2054)=20=

>>> [ 194.833323][ T8083] mount_bdev (fs/super.c:1659)=20
>>> [ 194.834269][ T8083] legacy_get_tree (fs/fs_context.c:664)=20
>>> [ 194.835264][ T8083] vfs_get_tree (fs/super.c:1780)=20
>>> [ 194.836191][ T8083] path_mount (fs/namespace.c:3353 =
fs/namespace.c:3679)=20
>>> [ 194.837120][ T8083] __x64_sys_mount (fs/namespace.c:3693 =
fs/namespace.c:3898 fs/namespace.c:3875 fs/namespace.c:3875)=20
>>> [  194.838189][ T8083] page_owner free stack trace missing
>>> [  194.839319][ T8083]
>>> [  194.839838][ T8083] Memory state around the buggy address:
>>> [  194.841035][ T8083]  ffff888159b1d500: fb fb fb fb fb fb fb fb fb =
fb fb fb fb fb fb fb
>>> [  194.842751][ T8083]  ffff888159b1d580: fb fb fb fb fc fc fc fc fc =
fc fc fc fc fc fc fc
>>> [  194.844459][ T8083] >ffff888159b1d600: fc fc fc fc fa fb fb fb fb =
fb fb fb fb fb fb fb
>>> [  194.846244][ T8083]                                         ^
>>> [  194.847615][ T8083]  ffff888159b1d680: fb fb fb fb fb fb fb fb fb =
fb fb fb fb fb fb fb
>>> [  194.849333][ T8083]  ffff888159b1d700: fb fb fb fb fb fb fb fb fb =
fb fb fb fb fb fb fb
>>> [  194.850693][ T8083] =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> [  194.863761][ T8083] Kernel panic - not syncing: KASAN: =
panic_on_warn set ...
>>> [  194.865484][ T8083] CPU: 0 PID: 8083 Comm: a.out Not tainted =
6.9.0 #8
>>> [  194.867008][ T8083] Hardware name: QEMU Standard PC (i440FX + =
PIIX, 1996), BIOS 1.15.0-1 04/01/2014
>>> [  194.868970][ T8083] Call Trace:
>>> [  194.869630][ T8083]  <TASK>
>>> [ 194.870254][ T8083] dump_stack_lvl (lib/dump_stack.c:118 =
(discriminator 4))=20
>>> [ 194.871333][ T8083] panic (kernel/panic.c:348)=20
>>> [ 194.872907][ T8083] ? __pfx_panic (kernel/panic.c:282)=20
>>> [ 194.873915][ T8083] ? preempt_schedule_thunk =
(arch/x86/entry/thunk_64.S:12)=20
>>> [ 194.875119][ T8083] ? preempt_schedule_common =
(./arch/x86/include/asm/preempt.h:84 kernel/sched/core.c:6927)=20
>>> [ 194.876293][ T8083] ? check_panic_on_warn (kernel/panic.c:240)=20
>>> [ 194.877435][ T8083] ? __discard_prealloc =
(fs/reiserfs/bitmap.c:505)=20
>>> [ 194.878672][ T8083] check_panic_on_warn (kernel/panic.c:241)=20
>>> [ 194.879809][ T8083] end_report (mm/kasan/report.c:226)=20
>>> [ 194.880719][ T8083] kasan_report (./arch/x86/include/asm/smap.h:56 =
mm/kasan/report.c:606)=20
>>> [ 194.881700][ T8083] ? __discard_prealloc =
(fs/reiserfs/bitmap.c:505)=20
>>> [ 194.882817][ T8083] __discard_prealloc (fs/reiserfs/bitmap.c:505)=20=

>>> [ 194.883890][ T8083] ? __pfx_mutex_lock =
(kernel/locking/mutex.c:282)=20
>>> [ 194.884990][ T8083] ? mutex_lock =
(./arch/x86/include/asm/atomic64_64.h:109 =
./include/linux/atomic/atomic-arch-fallback.h:4296 =
./include/linux/atomic/atomic-long.h:1482 =
./include/linux/atomic/atomic-instrumented.h:4458 =
kernel/locking/mutex.c:171 kernel/locking/mutex.c:285)=20
>>> [ 194.885973][ T8083] ? __pfx_mutex_lock =
(kernel/locking/mutex.c:282)=20
>>> [ 194.887042][ T8083] reiserfs_discard_all_prealloc =
(./include/linux/list.h:373 fs/reiserfs/bitmap.c:551)=20
>>> [ 194.888315][ T8083] do_journal_end (fs/reiserfs/journal.c:4071)=20
>>> [ 194.889386][ T8083] ? reiserfs_write_lock_nested =
(fs/reiserfs/lock.c:79)=20
>>> [ 194.890629][ T8083] ? do_journal_begin_r =
(fs/reiserfs/journal.c:3030)=20
>>> [ 194.892411][ T8083] ? down_read_trylock =
(./arch/x86/include/asm/preempt.h:103 kernel/locking/rwsem.c:1293 =
kernel/locking/rwsem.c:1565)=20
>>> [ 194.896737][ T8083] ? __pfx_down_read_trylock =
(kernel/locking/rwsem.c:1564)=20
>>> [ 194.899681][ T8083] ? __pfx_do_journal_end =
(fs/reiserfs/journal.c:3985)=20
>>> [ 194.900992][ T8083] ? __pfx_wake_up_bit =
(kernel/sched/wait_bit.c:148)=20
>>> [ 194.902147][ T8083] ? dquot_disable (fs/quota/dquot.c:2241)=20
>>> [ 194.903276][ T8083] ? journal_mark_dirty =
(fs/reiserfs/journal.c:3384)=20
>>> [ 194.904466][ T8083] journal_release (fs/reiserfs/journal.c:1939 =
fs/reiserfs/journal.c:1970)=20
>>> [ 194.905596][ T8083] ? __pfx_journal_release =
(fs/reiserfs/journal.c:1969)=20
>>> [ 194.906839][ T8083] reiserfs_put_super (fs/reiserfs/super.c:618)=20=

>>> [ 194.908016][ T8083] ? __pfx_reiserfs_put_super =
(fs/reiserfs/super.c:590)=20
>>> [ 194.909296][ T8083] ? __pfx_evict_inodes (fs/inode.c:715)=20
>>> [ 194.910506][ T8083] ? shrink_dcache_for_umount =
(./include/linux/list_bl.h:60 fs/dcache.c:1558)=20
>>> [ 194.911809][ T8083] ? __pfx_reiserfs_put_super =
(fs/reiserfs/super.c:590)=20
>>> [ 194.913079][ T8083] generic_shutdown_super (fs/super.c:647)=20
>>> [ 194.914265][ T8083] kill_block_super (fs/super.c:1676)=20
>>> [ 194.915356][ T8083] deactivate_locked_super (fs/super.c:433 =
fs/super.c:474)=20
>>> [ 194.916558][ T8083] deactivate_super (fs/super.c:507)=20
>>> [ 194.917643][ T8083] cleanup_mnt (fs/namespace.c:144 =
fs/namespace.c:1268)=20
>>> [ 194.918633][ T8083] task_work_run (kernel/task_work.c:181 =
(discriminator 1))=20
>>> [ 194.919696][ T8083] ? __pfx_task_work_run (kernel/task_work.c:148)=20=

>>> [ 194.921028][ T8083] ? __x64_sys_umount (fs/namespace.c:1922)=20
>>> [ 194.922198][ T8083] ? __pfx___x64_sys_umount (fs/namespace.c:1922)=20=

>>> [ 194.923455][ T8083] syscall_exit_to_user_mode =
(./include/linux/resume_user_mode.h:50 kernel/entry/common.c:114 =
./include/linux/entry-common.h:328 kernel/entry/common.c:207 =
kernel/entry/common.c:218)=20
>>> [ 194.924701][ T8083] do_syscall_64 (arch/x86/entry/common.c:102)=20
>>> [ 194.925719][ T8083] entry_SYSCALL_64_after_hwframe =
(arch/x86/entry/entry_64.S:130)=20
>>> [  194.927021][ T8083] RIP: 0033:0x7f41ac14d16b
>>> [ 194.928007][ T8083] Code: cd 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 =
66 90 f3 0f 1e fa 31 f6 e9 05 00 00 00 0f 1f 44 00 00 f3 0f 1e fa b8 a6 =
00 00 00 0f 05 <48> 3d 01 f0 ff ff 78
>>> All code
>>> =3D=3D=3D=3D=3D=3D=3D=3D
>>>  0: cd 0c                 int    $0xc
>>>  2: 00 f7                 add    %dh,%bh
>>>  4: d8 64 89 01           fsubs  0x1(%rcx,%rcx,4)
>>>  8: 48 83 c8 ff           or     $0xffffffffffffffff,%rax
>>>  c: c3                    ret   =20
>>>  d: 66 90                 xchg   %ax,%ax
>>>  f: f3 0f 1e fa           endbr64=20
>>> 13: 31 f6                 xor    %esi,%esi
>>> 15: e9 05 00 00 00        jmp    0x1f
>>> 1a: 0f 1f 44 00 00        nopl   0x0(%rax,%rax,1)
>>> 1f: f3 0f 1e fa           endbr64=20
>>> 23: b8 a6 00 00 00        mov    $0xa6,%eax
>>> 28: 0f 05                 syscall=20
>>> 2a:* 48 3d 01 f0 ff ff     cmp    $0xfffffffffffff001,%rax <-- =
trapping instruction
>>> 30: 78                    .byte 0x78
>>>=20
>>> Code starting with the faulting instruction
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>  0: 48 3d 01 f0 ff ff     cmp    $0xfffffffffffff001,%rax
>>>  6: 78                    .byte 0x78
>>> [  194.932455][ T8083] RSP: 002b:00007ffc1c01ee98 EFLAGS: 00000202 =
ORIG_RAX: 00000000000000a6
>>> [  194.934448][ T8083] RAX: 0000000000000000 RBX: 00005571e220fe30 =
RCX: 00007f41ac14d16b
>>> [  194.936283][ T8083] RDX: 0000000000000009 RSI: 0000000000000009 =
RDI: 00007ffc1c01ef70
>>> [  194.938032][ T8083] RBP: 00007ffc1c01ff80 R08: 00000000ffffffff =
R09: 00007ffc1c01ed30
>>> [  194.939839][ T8083] R10: 00005571e22100ee R11: 0000000000000202 =
R12: 00005571e220c720
>>> [  194.941774][ T8083] R13: 00007ffc1c020100 R14: 0000000000000000 =
R15: 0000000000000000
>>> [  194.943577][ T8083]  </TASK>
>>> [  194.944402][ T8083] Kernel Offset: disabled
>>> [  194.945399][ T8083] Rebooting in 86400 seconds..
>>>=20
>=20
>=20
>=20
>>>=20
>>>=20
>>=20
>=20


