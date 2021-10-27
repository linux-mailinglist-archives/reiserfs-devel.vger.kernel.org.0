Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F39DD43C6BF
	for <lists+reiserfs-devel@lfdr.de>; Wed, 27 Oct 2021 11:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234348AbhJ0JtL (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 27 Oct 2021 05:49:11 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:37220 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232462AbhJ0JtK (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 27 Oct 2021 05:49:10 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id D37751FD40;
        Wed, 27 Oct 2021 09:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1635328004; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=QOaGRGXD0H4nAMtowdLuFZCJQWrMmL8XSspoY0iadQM=;
        b=LFhokB2Xu2F6JuySRm6q8NUO7LbRF3OJcV/9yjlVF1DxhFYKRY6c6lRMTkEuYk+ZWLDIMA
        0qi5ZYQy0skUm6hnCTdDapfrEywuSPJtmMrGhat81hjUvcAIR3ElhzFD9zObOS3d+Cd6Ik
        yW53DinJMfHDoqUvGhunO4FDNcvBDf4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1635328004;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=QOaGRGXD0H4nAMtowdLuFZCJQWrMmL8XSspoY0iadQM=;
        b=ASqfEBZkKr5KcIsxKQ5Nog8xnwLc0n3Tfl2rxxJdU2fAbS4k8RE7up8qr+1OvgOJrkXIyV
        cpQ6JAlcqY8fYsAg==
Received: from quack2.suse.cz (unknown [10.100.224.230])
        by relay2.suse.de (Postfix) with ESMTP id 7E877A3B81;
        Wed, 27 Oct 2021 09:46:44 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
        id 5E06A1F2C66; Wed, 27 Oct 2021 11:46:44 +0200 (CEST)
Date:   Wed, 27 Oct 2021 11:46:44 +0200
From:   Jan Kara <jack@suse.cz>
To:     Dongliang Mu <mudongliangabcd@gmail.com>
Cc:     Yu Kuai <yukuai3@huawei.com>, Jan Kara <jack@suse.cz>,
        Miklos Szeredi <mszeredi@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        David Howells <dhowells@redhat.com>,
        reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fs: reiserfs: free new_opts in reiserfs_remount
Message-ID: <20211027094644.GA28650@quack2.suse.cz>
References: <20211027033947.3992059-1-mudongliangabcd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211027033947.3992059-1-mudongliangabcd@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Wed 27-10-21 11:39:25, Dongliang Mu wrote:
> Since the commit c3d98ea08291 ("VFS: Don't use save/replace_mount_options
> if not using generic_show_options") eliminates replace_mount_options
> in reiserfs, but did not handle the allocated new_opts,
> it will cause memory leak in the reiserfs_remount.
> 
> Fix this by freeing new_opts in the reiserfs_remount temporarily.
> 
> Fixes: c3d98ea08291 ("VFS: Don't use save/replace_mount_options if not using generic_show_options")
> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>

Thanks for the patch but I can see that new_opts is not actually used at
all in reiserfs_remount() so we should perhaps just remove them (including
kstrdup() et al).

								Honza

> ---
>  fs/reiserfs/super.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
> index 58481f8d63d5..b36865c8b66a 100644
> --- a/fs/reiserfs/super.c
> +++ b/fs/reiserfs/super.c
> @@ -1594,6 +1594,7 @@ static int reiserfs_remount(struct super_block *s, int *mount_flags, char *arg)
>  	}
>  
>  out_ok_unlocked:
> +	kfree(new_opts);
>  	return 0;
>  
>  out_err_unlock:
> -- 
> 2.25.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
