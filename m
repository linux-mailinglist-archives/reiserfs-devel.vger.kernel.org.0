Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5910143CCA2
	for <lists+reiserfs-devel@lfdr.de>; Wed, 27 Oct 2021 16:45:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232490AbhJ0OsH (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 27 Oct 2021 10:48:07 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:58976 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbhJ0OsF (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 27 Oct 2021 10:48:05 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id DF69C1FD43;
        Wed, 27 Oct 2021 14:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1635345938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PAxvQ4J2xp0slx6QeJiS9IdJxoMa7jLPPdGR/h4z5Ss=;
        b=WVisAploP76FGRtxAYQHYCg1KfLQGjfyJBmZZxTdltJIUQ1TgMV7dFl5mj+Qe+lrz2fDwS
        EDRVSseNymFxVSvcfCiBJRCv+KMDZ67+CMmSaPYDIOoQIYm5BkmsqKTUb+ozzOPrB1bX99
        lGJHkUoLlsf/9AHHeYLU1snhL1oO0cY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1635345938;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PAxvQ4J2xp0slx6QeJiS9IdJxoMa7jLPPdGR/h4z5Ss=;
        b=tCgb9kgMG4zacd2VksoNMkCiFIENHrCqkDtExxTpLQy+ZRgkmpZ5vRoYSj+ptZ/UKeAswJ
        YwkldXDwHPcgIOAA==
Received: from quack2.suse.cz (unknown [10.100.224.230])
        by relay2.suse.de (Postfix) with ESMTP id CA11AA3B83;
        Wed, 27 Oct 2021 14:45:38 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
        id 839F91E1973; Wed, 27 Oct 2021 16:45:38 +0200 (CEST)
Date:   Wed, 27 Oct 2021 16:45:38 +0200
From:   Jan Kara <jack@suse.cz>
To:     Dongliang Mu <mudongliangabcd@gmail.com>
Cc:     Jan Kara <jack@suse.cz>, Miklos Szeredi <mszeredi@redhat.com>,
        Yu Kuai <yukuai3@huawei.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        David Howells <dhowells@redhat.com>,
        reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fs: reiserfs: remove useless new_opts in reiserfs_remount
Message-ID: <20211027144538.GA19815@quack2.suse.cz>
References: <20211027143445.4156459-1-mudongliangabcd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211027143445.4156459-1-mudongliangabcd@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Wed 27-10-21 22:34:41, Dongliang Mu wrote:
> Since the commit c3d98ea08291 ("VFS: Don't use save/replace_mount_options
> if not using generic_show_options") eliminates replace_mount_options
> in reiserfs_remount, but does not handle the allocated new_opts,
> it will cause memory leak in the reiserfs_remount.
> 
> Because new_opts is useless in reiserfs_mount, so we fix this bug by
> removing the useless new_opts in reiserfs_remount.
> 
> Fixes: c3d98ea08291 ("VFS: Don't use save/replace_mount_options if not using generic_show_options")
> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>

Thanks. I've added the patch to my tree.

								Honza

> ---
>  fs/reiserfs/super.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
> index 58481f8d63d5..f7b05c6b3dcf 100644
> --- a/fs/reiserfs/super.c
> +++ b/fs/reiserfs/super.c
> @@ -1437,7 +1437,6 @@ static int reiserfs_remount(struct super_block *s, int *mount_flags, char *arg)
>  	unsigned long safe_mask = 0;
>  	unsigned int commit_max_age = (unsigned int)-1;
>  	struct reiserfs_journal *journal = SB_JOURNAL(s);
> -	char *new_opts;
>  	int err;
>  	char *qf_names[REISERFS_MAXQUOTAS];
>  	unsigned int qfmt = 0;
> @@ -1445,10 +1444,6 @@ static int reiserfs_remount(struct super_block *s, int *mount_flags, char *arg)
>  	int i;
>  #endif
>  
> -	new_opts = kstrdup(arg, GFP_KERNEL);
> -	if (arg && !new_opts)
> -		return -ENOMEM;
> -
>  	sync_filesystem(s);
>  	reiserfs_write_lock(s);
>  
> @@ -1599,7 +1594,6 @@ static int reiserfs_remount(struct super_block *s, int *mount_flags, char *arg)
>  out_err_unlock:
>  	reiserfs_write_unlock(s);
>  out_err:
> -	kfree(new_opts);
>  	return err;
>  }
>  
> -- 
> 2.25.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
