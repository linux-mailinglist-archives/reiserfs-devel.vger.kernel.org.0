Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B640AEFC4B
	for <lists+reiserfs-devel@lfdr.de>; Tue,  5 Nov 2019 12:25:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730623AbfKELZV (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 5 Nov 2019 06:25:21 -0500
Received: from mx2.suse.de ([195.135.220.15]:34418 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726867AbfKELZU (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 5 Nov 2019 06:25:20 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 15471B3B8;
        Tue,  5 Nov 2019 11:25:19 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
        id 2EFDC1E4407; Tue,  5 Nov 2019 12:25:18 +0100 (CET)
Date:   Tue, 5 Nov 2019 12:25:18 +0100
From:   Jan Kara <jack@suse.cz>
To:     Nikitas Angelinas <nikitas.angelinas@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>, zhengbin@vostro.suse.de,
        zhengbin13@huawei.com, Jan Kara <jack@suse.cz>,
        Al Viro <viro@zeniv.linux.org.uk>,
        reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] reiserfs: replace open-coded atomic_dec_and_mutex_lock()
Message-ID: <20191105112518.GM22379@quack2.suse.cz>
References: <20191103094431.GA18576-nikitas.angelinas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191103094431.GA18576-nikitas.angelinas@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Sun 03-11-19 01:44:54, Nikitas Angelinas wrote:
> Replace the open-coded logic of atomic_dec_and_mutex_lock() in
> reiserfs_file_release().
> 
> Signed-off-by: Nikitas Angelinas <nikitas.angelinas@gmail.com>

Thanks! The patch looks good to me. I've added it to my tree.

								Honza

> ---
>  fs/reiserfs/file.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/reiserfs/file.c b/fs/reiserfs/file.c
> index 843aadc..84cf8bd 100644
> --- a/fs/reiserfs/file.c
> +++ b/fs/reiserfs/file.c
> @@ -38,16 +38,10 @@ static int reiserfs_file_release(struct inode *inode, struct file *filp)
>  
>  	BUG_ON(!S_ISREG(inode->i_mode));
>  
> -        if (atomic_add_unless(&REISERFS_I(inode)->openers, -1, 1))
> +	if (!atomic_dec_and_mutex_lock(&REISERFS_I(inode)->openers,
> +				       &REISERFS_I(inode)->tailpack))
>  		return 0;
>  
> -	mutex_lock(&REISERFS_I(inode)->tailpack);
> -
> -        if (!atomic_dec_and_test(&REISERFS_I(inode)->openers)) {
> -		mutex_unlock(&REISERFS_I(inode)->tailpack);
> -		return 0;
> -	}
> -
>  	/* fast out for when nothing needs to be done */
>  	if ((!(REISERFS_I(inode)->i_flags & i_pack_on_close_mask) ||
>  	     !tail_has_to_be_packed(inode)) &&
> -- 
> 2.10.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
