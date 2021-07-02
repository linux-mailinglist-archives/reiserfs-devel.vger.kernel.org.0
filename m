Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A49023B9B31
	for <lists+reiserfs-devel@lfdr.de>; Fri,  2 Jul 2021 05:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbhGBEBm (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 2 Jul 2021 00:01:42 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:6035 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbhGBEBl (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 2 Jul 2021 00:01:41 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GGLmB6ShpzXnQB;
        Fri,  2 Jul 2021 11:53:46 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 2 Jul 2021 11:59:08 +0800
Received: from huawei.com (10.175.127.227) by dggema762-chm.china.huawei.com
 (10.1.198.204) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 2 Jul
 2021 11:59:08 +0800
From:   Yu Kuai <yukuai3@huawei.com>
To:     <mszeredi@redhat.com>, <jack@suse.cz>, <yukuai3@huawei.com>
CC:     <reiserfs-devel@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <yi.zhang@huawei.com>
Subject: [PATCH] reiserfs: add check for root_inode in reiserfs_fill_super
Date:   Fri, 2 Jul 2021 12:07:43 +0800
Message-ID: <20210702040743.1918552-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Our syzcaller report a NULL pointer dereference:

BUG: kernel NULL pointer dereference, address: 0000000000000000
PGD 116e95067 P4D 116e95067 PUD 1080b5067 PMD 0
Oops: 0010 [#1] SMP KASAN
CPU: 7 PID: 592 Comm: a.out Not tainted 5.13.0-next-20210629-dirty #67
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS ?-20190727_073836-buildvm-p4
RIP: 0010:0x0
Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
RSP: 0018:ffff888114e779b8 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 1ffff110229cef39 RCX: ffffffffaa67e1aa
RDX: 0000000000000000 RSI: ffff88810a58ee00 RDI: ffff8881233180b0
RBP: ffffffffac38e9c0 R08: ffffffffaa67e17e R09: 0000000000000001
R10: ffffffffb91c5557 R11: fffffbfff7238aaa R12: ffff88810a58ee00
R13: ffff888114e77aa0 R14: 0000000000000000 R15: ffff8881233180b0
FS:  00007f946163c480(0000) GS:ffff88839f1c0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffd6 CR3: 00000001099c1000 CR4: 00000000000006e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 __lookup_slow+0x116/0x2d0
 ? page_put_link+0x120/0x120
 ? __d_lookup+0xfc/0x320
 ? d_lookup+0x49/0x90
 lookup_one_len+0x13c/0x170
 ? __lookup_slow+0x2d0/0x2d0
 ? reiserfs_schedule_old_flush+0x31/0x130
 reiserfs_lookup_privroot+0x64/0x150
 reiserfs_fill_super+0x158c/0x1b90
 ? finish_unfinished+0xb10/0xb10
 ? bprintf+0xe0/0xe0
 ? __mutex_lock_slowpath+0x30/0x30
 ? __kasan_check_write+0x20/0x30
 ? up_write+0x51/0xb0
 ? set_blocksize+0x9f/0x1f0
 mount_bdev+0x27c/0x2d0
 ? finish_unfinished+0xb10/0xb10
 ? reiserfs_kill_sb+0x120/0x120
 get_super_block+0x19/0x30
 legacy_get_tree+0x76/0xf0
 vfs_get_tree+0x49/0x160
 ? capable+0x1d/0x30
 path_mount+0xacc/0x1380
 ? putname+0x97/0xd0
 ? finish_automount+0x450/0x450
 ? kmem_cache_free+0xf8/0x5a0
 ? putname+0x97/0xd0
 do_mount+0xe2/0x110
 ? path_mount+0x1380/0x1380
 ? copy_mount_options+0x69/0x140
 __x64_sys_mount+0xf0/0x190
 do_syscall_64+0x35/0x80
 entry_SYSCALL_64_after_hwframe+0x44/0xae

This is because 'root_inode' is initialized with wrong mode, and
it's i_op is set to 'reiserfs_special_inode_operations'. Thus add
check for 'root_inode' to fix the problem.

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 fs/reiserfs/super.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 3ffafc73acf0..bcf5123ed43b 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -2082,6 +2082,14 @@ static int reiserfs_fill_super(struct super_block *s, void *data, int silent)
 		unlock_new_inode(root_inode);
 	}
 
+	if (!S_ISDIR(root_inode->i_mode) || !root_inode->i_blocks ||
+	    !root_inode->i_size) {
+		SWARN(silent, s, "", "corrupt root inode, run fsck");
+		iput(root_inode);
+		errval = -EUCLEAN;
+		goto error;
+	}
+
 	s->s_root = d_make_root(root_inode);
 	if (!s->s_root)
 		goto error;
-- 
2.31.1

