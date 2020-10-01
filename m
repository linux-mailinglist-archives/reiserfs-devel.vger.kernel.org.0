Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7598E27FC75
	for <lists+reiserfs-devel@lfdr.de>; Thu,  1 Oct 2020 11:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731866AbgJAJ2n (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 1 Oct 2020 05:28:43 -0400
Received: from mx2.suse.de ([195.135.220.15]:33524 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726992AbgJAJ2n (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 1 Oct 2020 05:28:43 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 8FC8DAC35;
        Thu,  1 Oct 2020 09:28:41 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
        id 37EE91E12EF; Thu,  1 Oct 2020 11:28:41 +0200 (CEST)
Date:   Thu, 1 Oct 2020 11:28:41 +0200
From:   Jan Kara <jack@suse.cz>
To:     Anmol Karn <anmol.karan123@gmail.com>
Cc:     jack@suse.cz, jeffm@suse.com, linux-kernel@vger.kernel.org,
        reiserfs-devel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        syzkaller-bugs@googlegroups.com,
        syzbot+9b33c9b118d77ff59b6f@syzkaller.appspotmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH] fs: reiserfs: xattr: Fix null
 pointer derefernce in open_xa_root()
Message-ID: <20201001092841.GC17860@quack2.suse.cz>
References: <20201001090547.431840-1-anmol.karan123@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201001090547.431840-1-anmol.karan123@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Thu 01-10-20 14:35:47, Anmol Karn wrote:
> d_really_is_negative() checks for the dentry->d_inode whether it's NULL
> or not, but in open_xa_root(), when it checks 'privroot->d_inode', it
> doesn't check whether privroot is NULL or not, this leads to a null
> pointer dereference while calling it from open_xa_dir() while
> initializing xaroot.
> 
> - fs/reiserfs/xattr.c
> The bug seems to get triggered at this line:
> 	
> if (d_really_is_negative(privroot))
> 		return ERR_PTR(-EOPNOTSUPP);
> 
> Fix it by adding a NULL check for privroot. 
> 
> Reported-and-tested-by: syzbot+9b33c9b118d77ff59b6f@syzkaller.appspotmail.com 
> Link: https://syzkaller.appspot.com/bug?extid=9b33c9b118d77ff59b6f 
> Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>

Thanks for the patch! I've already fixed the problem myself (slightly
differently) but I'll comment about your patch below for educational
purposes :). See
https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git/commit/?h=for_next&id=c2bb80b8bdd04dfe32364b78b61b6a47f717af52

> diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
> index 28b241cd6987..a75480d0ee7e 100644
> --- a/fs/reiserfs/xattr.c
> +++ b/fs/reiserfs/xattr.c
> @@ -121,8 +121,9 @@ static struct dentry *open_xa_root(struct super_block *sb, int flags)
>  	struct dentry *privroot = REISERFS_SB(sb)->priv_root;
>  	struct dentry *xaroot;
>  
> -	if (d_really_is_negative(privroot))
> +	if (!privroot || d_really_is_negative(privroot)) {
>  		return ERR_PTR(-EOPNOTSUPP);

I don't think EOPNOTSUPP is correct return code for !privroot case. AFAICS
it would propagate out of reiserfs xattr code and would result in denying
access to lookup_one_len() so xattr dir could never be initialized for such
filesystem. So we need to return 0 (success, no xattrs present) in this
case and because this is just a special case when we are initializing xattr
dir and recurse back into xattr code, I've decided to perform this check
directly in reiserfs_xattr_get().

> +	}

There's no need for additional braces in this 'if'.
>  
>  	inode_lock_nested(d_inode(privroot), I_MUTEX_XATTR);

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
