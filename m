Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CAA4344944
	for <lists+reiserfs-devel@lfdr.de>; Mon, 22 Mar 2021 16:32:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbhCVPb5 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 22 Mar 2021 11:31:57 -0400
Received: from mx2.suse.de ([195.135.220.15]:54266 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230194AbhCVPbn (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 22 Mar 2021 11:31:43 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id A4CFEAB8A;
        Mon, 22 Mar 2021 15:31:42 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
        id 289801F2B98; Mon, 22 Mar 2021 16:31:42 +0100 (CET)
Date:   Mon, 22 Mar 2021 16:31:42 +0100
From:   Jan Kara <jack@suse.cz>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Jan Kara <jack@suse.cz>, reiserfs-devel@vger.kernel.org,
        jeffm@suse.com
Subject: Re: [PATCH (resend)] reiserfs: update reiserfs_xattrs_initialized()
 condition
Message-ID: <20210322153142.GF31783@quack2.suse.cz>
References: <000000000000f5be7f05afcf862a@google.com>
 <20210221050957.3601-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <700fcc0a-0da7-6d70-620e-af0ed956cd85@i-love.sakura.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <700fcc0a-0da7-6d70-620e-af0ed956cd85@i-love.sakura.ne.jp>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Fri 05-03-21 15:31:26, Tetsuo Handa wrote:
> syzbot is reporting NULL pointer dereference at reiserfs_security_init()
> [1], for commit ab17c4f02156c4f7 ("reiserfs: fixup xattr_root caching") is
> assuming that REISERFS_SB(s)->xattr_root != NULL in
> reiserfs_xattr_jcreate_nblocks() despite that commit made
> REISERFS_SB(sb)->priv_root != NULL && REISERFS_SB(s)->xattr_root == NULL
> case possible.
> 
> I guess that commit 6cb4aff0a77cc0e6 ("reiserfs: fix oops while creating
> privroot with selinux enabled") wanted to check xattr_root != NULL before
> reiserfs_xattr_jcreate_nblocks(), for the changelog is talking about the
> xattr root.
> 
>  The issue is that while creating the privroot during mount
>  reiserfs_security_init calls reiserfs_xattr_jcreate_nblocks which
>  dereferences the xattr root.  The xattr root doesn't exist, so we get an
>  oops.
> 
> Therefore, update reiserfs_xattrs_initialized() to check both the privroot
> and the xattr root.
> 
> [1] https://syzkaller.appspot.com/bug?id=8abaedbdeb32c861dc5340544284167dd0e46cde
> 
> Reported-and-tested-by: syzbot <syzbot+690cb1e51970435f9775@syzkaller.appspotmail.com>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Fixes: 6cb4aff0a77cc0e6 ("reiserfs: fix oops while creating privroot with selinux enabled")

Thanks for the patch Tetsuo! I'd prefer if Jeff had a look since he has
written this code back then. But let me provide my view: I agree that for a
corrupted filesystem it can happen that xattr_root remains NULL although
priv_root is set. So your change makes sense. But then
reiserfs_xattrs_initialized() seems to be used really minimally? Only once
in fs/reiserfs/xattr_security.c and e.g. reiserfs_xattr_set() is prone to
the same problem? Do I miss something?

								Honza

> diff --git a/fs/reiserfs/xattr.h b/fs/reiserfs/xattr.h
> index c764352447ba..81bec2c80b25 100644
> --- a/fs/reiserfs/xattr.h
> +++ b/fs/reiserfs/xattr.h
> @@ -43,7 +43,7 @@ void reiserfs_security_free(struct reiserfs_security_handle *sec);
>  
>  static inline int reiserfs_xattrs_initialized(struct super_block *sb)
>  {
> -	return REISERFS_SB(sb)->priv_root != NULL;
> +	return REISERFS_SB(sb)->priv_root && REISERFS_SB(sb)->xattr_root;
>  }
>  
>  #define xattr_size(size) ((size) + sizeof(struct reiserfs_xattr_header))
> -- 
> 2.18.4
> 
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
