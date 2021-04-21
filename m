Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB135366E3C
	for <lists+reiserfs-devel@lfdr.de>; Wed, 21 Apr 2021 16:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235658AbhDUObr (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 21 Apr 2021 10:31:47 -0400
Received: from mx2.suse.de ([195.135.220.15]:40260 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235533AbhDUObr (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 21 Apr 2021 10:31:47 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 79DF4AF65;
        Wed, 21 Apr 2021 14:31:13 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
        id 3DEDF1F2B69; Wed, 21 Apr 2021 16:31:13 +0200 (CEST)
Date:   Wed, 21 Apr 2021 16:31:13 +0200
From:   Jan Kara <jack@suse.cz>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     jack@suse.cz, rdunlap@infradead.org, reiserfs-devel@vger.kernel.org
Subject: Re: [PATCH] fs/reiserfs/journal.c: delete useless variables
Message-ID: <20210421143113.GX8706@quack2.suse.cz>
References: <1618278196-17749-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1618278196-17749-1-git-send-email-tiantao6@hisilicon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Tue 13-04-21 09:43:16, Tian Tao wrote:
> The value of 'cn' is not used, so just delete it.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Thanks. I've added the patch to my tree.

								Honza

> ---
>  fs/reiserfs/journal.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
> index e98f993..9edc8e2 100644
> --- a/fs/reiserfs/journal.c
> +++ b/fs/reiserfs/journal.c
> @@ -461,7 +461,6 @@ int reiserfs_in_journal(struct super_block *sb,
>  			b_blocknr_t * next_zero_bit)
>  {
>  	struct reiserfs_journal *journal = SB_JOURNAL(sb);
> -	struct reiserfs_journal_cnode *cn;
>  	struct reiserfs_list_bitmap *jb;
>  	int i;
>  	unsigned long bl;
> @@ -497,13 +496,12 @@ int reiserfs_in_journal(struct super_block *sb,
>  	bl = bmap_nr * (sb->s_blocksize << 3) + bit_nr;
>  	/* is it in any old transactions? */
>  	if (search_all
> -	    && (cn =
> -		get_journal_hash_dev(sb, journal->j_list_hash_table, bl))) {
> +	    && (get_journal_hash_dev(sb, journal->j_list_hash_table, bl))) {
>  		return 1;
>  	}
>  
>  	/* is it in the current transaction.  This should never happen */
> -	if ((cn = get_journal_hash_dev(sb, journal->j_hash_table, bl))) {
> +	if ((get_journal_hash_dev(sb, journal->j_hash_table, bl))) {
>  		BUG();
>  		return 1;
>  	}
> -- 
> 2.7.4
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
