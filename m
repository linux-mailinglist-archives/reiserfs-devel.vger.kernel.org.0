Return-Path: <reiserfs-devel+bounces-159-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BAC990ACC
	for <lists+reiserfs-devel@lfdr.de>; Fri,  4 Oct 2024 20:16:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5073AB2211D
	for <lists+reiserfs-devel@lfdr.de>; Fri,  4 Oct 2024 18:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1331DAC84;
	Fri,  4 Oct 2024 18:15:28 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5948A47F46
	for <reiserfs-devel@vger.kernel.org>; Fri,  4 Oct 2024 18:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728065728; cv=none; b=R1YmW1R6cXuDcSYnaXowdeSXfZx3+k5XIPqCgDXfWIuWcF7xPZpWsN4dvNd8snX4NuFnsedaH2zC6zyP+j8eYWsH/HIzq7aF6+iXbflPPAHvr7+ymZItacET7sYtXyORoozOuxhysX/73pZsnpoYalPmG2jYpxGxVEuI3MwRwi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728065728; c=relaxed/simple;
	bh=wp8MCjiBztcYECWLqcHRcpUql7j3ump8MJwa+aQof8k=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=KYe+dWjkWDODv2ZJKvx9N5KUoyzCMgtDpMgAoulIqyu2nSu/68/sAZVXXOM/1q8p7gCSFQm9WiFj0mcEswcDOQPaiUw2/xahq2P2chdCbWVeovAlP8MCElUVX6LbwmxXYiKV8cX3GHLE6+7Z4sLBE3g61c3hY7hhn36FNIhCZaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3a363981933so30335165ab.1
        for <reiserfs-devel@vger.kernel.org>; Fri, 04 Oct 2024 11:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728065725; x=1728670525;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hcwvENOT7tdgB2Dm7r1OMRZwZc615C1hLiTAo0QWF3o=;
        b=MaU6M43iXoZxpaMXo06pYX3PQVEOmwUGRgPf5ia8cO3mR9XDc27wbvkRBDNIsNNYk5
         YbrhNb95axwHdVGS1x+Az2CCNRW2oKzJZQQ9EUQNFND14ET6OqbEQbeR/nfYVhBf0E+7
         /BB/dU2QhvztNsjA923CrPCfRoMd/QwO6s1Olv8wLVNAvFSyWQJC8iV+WT4vQEd6vwO6
         SQtmoCSPpfDoBKscfE3q4XgX8rSIZHqvzI32uGJB/EHMzH9ULgMekQU19bnbAlj09GeD
         J7mQsej76ZedWld8K5sJUf31Ft23CC3iKe9jm3jky/X6iLrAE9I9OjYBG9NN1w+kSkUi
         IOMA==
X-Forwarded-Encrypted: i=1; AJvYcCVd+Vx7wOYnkwgHjM7FhDVHXEk9o60XcjHU8MCbne2mdjUOmi5nqlRVQ82EXEcrfAWNnvaaa7kruHWo121F6g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8QmYY9LlN7ePAU9/fSkv27jjvbKo5vJLrL/M2PucQIe7zmE4I
	mJtqUbnKhApit2CHdBenyRqxV+IrUr6jcP8jdnL+JrcM4y0XTbGVUde9YyKb8usQ9x0ii2SdqHP
	coGV+AU9FDxkQbgBBF6k3jGu3on6MVe4pgqt8KeTarpnIrn0ly3+HDo0=
X-Google-Smtp-Source: AGHT+IGdxRLduaFjuGvbhdwJaelqS8w4H4iwyeBcWMC0+x6LLCpVreVWUf48r9TCybr6LZWyRUaOf0M2coO70UyLUVtmYX9dWHre
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c541:0:b0:3a0:9cd5:931c with SMTP id
 e9e14a558f8ab-3a375bb32acmr42564785ab.20.1728065725597; Fri, 04 Oct 2024
 11:15:25 -0700 (PDT)
Date: Fri, 04 Oct 2024 11:15:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <670030bd.050a0220.49194.0497.GAE@google.com>
Subject: [syzbot] [reiserfs?] KASAN: use-after-free Read in
 reiserfs_fill_super (3)
From: syzbot <syzbot+d796ad2656d5b38910ee@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    0c559323bbaa Merge tag 'rust-fixes-6.12' of https://github..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=15a3b3d0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f8af0b3195caed62
dashboard link: https://syzkaller.appspot.com/bug?extid=d796ad2656d5b38910ee
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=146e8d80580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=176a9307980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ef2a27f38ef9/disk-0c559323.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/193f0d960e0d/vmlinux-0c559323.xz
kernel image: https://storage.googleapis.com/syzbot-assets/55ce7e360ec8/bzImage-0c559323.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/3b51b3b52494/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d796ad2656d5b38910ee@syzkaller.appspotmail.com

REISERFS warning:  read_super_block: reiserfs filesystem is deprecated and scheduled to be removed from the kernel in 2025
REISERFS (device loop0): found reiserfs format "3.5" with non-standard journal
REISERFS (device loop0): using ordered data mode
reiserfs: using flush barriers
REISERFS (device loop0): journal params: device ram0, size 127, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
REISERFS (device loop0): checking transaction log (ram0)
==================================================================
BUG: KASAN: use-after-free in init_inode fs/reiserfs/inode.c:1314 [inline]
BUG: KASAN: use-after-free in reiserfs_read_locked_inode+0x20db/0x29b0 fs/reiserfs/inode.c:1560
Read of size 4 at addr ffff88807208d000 by task syz-executor120/5219

CPU: 0 UID: 0 PID: 5219 Comm: syz-executor120 Not tainted 6.12.0-rc1-syzkaller-00125-g0c559323bbaa #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:377 [inline]
 print_report+0x169/0x550 mm/kasan/report.c:488
 kasan_report+0x143/0x180 mm/kasan/report.c:601
 init_inode fs/reiserfs/inode.c:1314 [inline]
 reiserfs_read_locked_inode+0x20db/0x29b0 fs/reiserfs/inode.c:1560
 reiserfs_fill_super+0x1361/0x2640 fs/reiserfs/super.c:2070
 mount_bdev+0x20a/0x2d0 fs/super.c:1679
 legacy_get_tree+0xee/0x190 fs/fs_context.c:662
 vfs_get_tree+0x90/0x2b0 fs/super.c:1800
 do_new_mount+0x2be/0xb40 fs/namespace.c:3507
 do_mount fs/namespace.c:3847 [inline]
 __do_sys_mount fs/namespace.c:4055 [inline]
 __se_sys_mount+0x2d6/0x3c0 fs/namespace.c:4032
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fd65dda6dba
Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 5e 04 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffdbf4a45d8 EFLAGS: 00000286 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffdbf4a45f0 RCX: 00007fd65dda6dba
RDX: 0000000020001100 RSI: 0000000020001140 RDI: 00007ffdbf4a45f0
RBP: 0000000000000004 R08: 00007ffdbf4a4630 R09: 00000000000010e2
R10: 0000000000000000 R11: 0000000000000286 R12: 0000000000000000
R13: 00007ffdbf4a4630 R14: 0000000000000003 R15: 0000000000400000
 </TASK>

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x7208d
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000000000 ffffea0001c82388 ffff8880b8644af0 0000000000000000
raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as freed
page last allocated via order 0, migratetype Movable, gfp_mask 0x8(__GFP_MOVABLE), pid 1, tgid 1 (swapper/0), ts 12457748996, free_ts 13583251976
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f3/0x230 mm/page_alloc.c:1537
 split_free_pages mm/page_alloc.c:6478 [inline]
 alloc_contig_range_noprof+0x821/0xe20 mm/page_alloc.c:6605
 __alloc_contig_pages mm/page_alloc.c:6634 [inline]
 alloc_contig_pages_noprof+0x4b3/0x5c0 mm/page_alloc.c:6714
 debug_vm_pgtable_alloc_huge_page+0xaf/0x100 mm/debug_vm_pgtable.c:1084
 init_args+0x83b/0xb20 mm/debug_vm_pgtable.c:1266
 debug_vm_pgtable+0xe0/0x550 mm/debug_vm_pgtable.c:1304
 do_one_initcall+0x248/0x880 init/main.c:1269
 do_initcall_level+0x157/0x210 init/main.c:1331
 do_initcalls+0x3f/0x80 init/main.c:1347
 kernel_init_freeable+0x435/0x5d0 init/main.c:1580
 kernel_init+0x1d/0x2b0 init/main.c:1469
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
page last free pid 1 tgid 1 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1108 [inline]
 free_unref_page+0xcd0/0xf00 mm/page_alloc.c:2638
 free_contig_range+0x152/0x550 mm/page_alloc.c:6748
 destroy_args+0x8a/0x840 mm/debug_vm_pgtable.c:1017
 debug_vm_pgtable+0x4be/0x550 mm/debug_vm_pgtable.c:1397
 do_one_initcall+0x248/0x880 init/main.c:1269
 do_initcall_level+0x157/0x210 init/main.c:1331
 do_initcalls+0x3f/0x80 init/main.c:1347
 kernel_init_freeable+0x435/0x5d0 init/main.c:1580
 kernel_init+0x1d/0x2b0 init/main.c:1469
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

Memory state around the buggy address:
 ffff88807208cf00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff88807208cf80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff88807208d000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
                   ^
 ffff88807208d080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff88807208d100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

