Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B94F3BBA78
	for <lists+reiserfs-devel@lfdr.de>; Mon,  5 Jul 2021 11:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230367AbhGEJuo (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 5 Jul 2021 05:50:44 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:36710 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230394AbhGEJuo (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 5 Jul 2021 05:50:44 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id C8BC622A3F;
        Mon,  5 Jul 2021 09:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1625478486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qGgLZnEvXrLV0T+OPkKzJMwcywXyO255rN+92gzhPnI=;
        b=btn4c6SNND80csj9BDKpSqmXigLiQGWWFLD2CaKWRYHlQ/KGRb5RTY8dnlfA7y0/xn7IRe
        ac2MsOATika7Xy3VyYwC36KIWpIvyh0qxAVkZ0k4iM/s61bQbgkrACmTllax9VHYxrxgQd
        uTvBJbxVmBS4vQeO5s8YElHP1hi3ddQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1625478486;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qGgLZnEvXrLV0T+OPkKzJMwcywXyO255rN+92gzhPnI=;
        b=A4w86k+MDKzPxIf2iocx1TVTRX26own7Tx23uNgy057LchunZ6JETmiZllaoFGEBMPRGze
        p3wM2/mDw+7Yj2Ag==
Received: from quack2.suse.cz (unknown [10.163.43.118])
        by relay2.suse.de (Postfix) with ESMTP id B8C6DA3B8D;
        Mon,  5 Jul 2021 09:48:06 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
        id 5C3E31E1139; Mon,  5 Jul 2021 11:48:06 +0200 (CEST)
Date:   Mon, 5 Jul 2021 11:48:06 +0200
From:   Jan Kara <jack@suse.cz>
To:     Yu Kuai <yukuai3@huawei.com>
Cc:     mszeredi@redhat.com, jack@suse.cz, reiserfs-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, yi.zhang@huawei.com
Subject: Re: [PATCH] reiserfs: add check for root_inode in reiserfs_fill_super
Message-ID: <20210705094806.GA15373@quack2.suse.cz>
References: <20210702040743.1918552-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210702040743.1918552-1-yukuai3@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Fri 02-07-21 12:07:43, Yu Kuai wrote:
> Our syzcaller report a NULL pointer dereference:
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000000
> PGD 116e95067 P4D 116e95067 PUD 1080b5067 PMD 0
> Oops: 0010 [#1] SMP KASAN
> CPU: 7 PID: 592 Comm: a.out Not tainted 5.13.0-next-20210629-dirty #67
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS ?-20190727_073836-buildvm-p4
> RIP: 0010:0x0
> Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
> RSP: 0018:ffff888114e779b8 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: 1ffff110229cef39 RCX: ffffffffaa67e1aa
> RDX: 0000000000000000 RSI: ffff88810a58ee00 RDI: ffff8881233180b0
> RBP: ffffffffac38e9c0 R08: ffffffffaa67e17e R09: 0000000000000001
> R10: ffffffffb91c5557 R11: fffffbfff7238aaa R12: ffff88810a58ee00
> R13: ffff888114e77aa0 R14: 0000000000000000 R15: ffff8881233180b0
> FS:  00007f946163c480(0000) GS:ffff88839f1c0000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: ffffffffffffffd6 CR3: 00000001099c1000 CR4: 00000000000006e0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  __lookup_slow+0x116/0x2d0
>  ? page_put_link+0x120/0x120
>  ? __d_lookup+0xfc/0x320
>  ? d_lookup+0x49/0x90
>  lookup_one_len+0x13c/0x170
>  ? __lookup_slow+0x2d0/0x2d0
>  ? reiserfs_schedule_old_flush+0x31/0x130
>  reiserfs_lookup_privroot+0x64/0x150
>  reiserfs_fill_super+0x158c/0x1b90
>  ? finish_unfinished+0xb10/0xb10
>  ? bprintf+0xe0/0xe0
>  ? __mutex_lock_slowpath+0x30/0x30
>  ? __kasan_check_write+0x20/0x30
>  ? up_write+0x51/0xb0
>  ? set_blocksize+0x9f/0x1f0
>  mount_bdev+0x27c/0x2d0
>  ? finish_unfinished+0xb10/0xb10
>  ? reiserfs_kill_sb+0x120/0x120
>  get_super_block+0x19/0x30
>  legacy_get_tree+0x76/0xf0
>  vfs_get_tree+0x49/0x160
>  ? capable+0x1d/0x30
>  path_mount+0xacc/0x1380
>  ? putname+0x97/0xd0
>  ? finish_automount+0x450/0x450
>  ? kmem_cache_free+0xf8/0x5a0
>  ? putname+0x97/0xd0
>  do_mount+0xe2/0x110
>  ? path_mount+0x1380/0x1380
>  ? copy_mount_options+0x69/0x140
>  __x64_sys_mount+0xf0/0x190
>  do_syscall_64+0x35/0x80
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
> This is because 'root_inode' is initialized with wrong mode, and
> it's i_op is set to 'reiserfs_special_inode_operations'. Thus add
> check for 'root_inode' to fix the problem.
> 
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>

Thanks! I've added the patch to my tree.

								Honza

> ---
>  fs/reiserfs/super.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
> index 3ffafc73acf0..bcf5123ed43b 100644
> --- a/fs/reiserfs/super.c
> +++ b/fs/reiserfs/super.c
> @@ -2082,6 +2082,14 @@ static int reiserfs_fill_super(struct super_block *s, void *data, int silent)
>  		unlock_new_inode(root_inode);
>  	}
>  
> +	if (!S_ISDIR(root_inode->i_mode) || !root_inode->i_blocks ||
> +	    !root_inode->i_size) {
> +		SWARN(silent, s, "", "corrupt root inode, run fsck");
> +		iput(root_inode);
> +		errval = -EUCLEAN;
> +		goto error;
> +	}
> +
>  	s->s_root = d_make_root(root_inode);
>  	if (!s->s_root)
>  		goto error;
> -- 
> 2.31.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
