Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 074B138299B
	for <lists+reiserfs-devel@lfdr.de>; Mon, 17 May 2021 12:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbhEQKQt (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 17 May 2021 06:16:49 -0400
Received: from mx2.suse.de ([195.135.220.15]:49932 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229474AbhEQKQl (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 17 May 2021 06:16:41 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id F113EAE4D;
        Mon, 17 May 2021 10:15:23 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
        id 8DBDE1F2CA4; Mon, 17 May 2021 12:15:23 +0200 (CEST)
Date:   Mon, 17 May 2021 12:15:23 +0200
From:   Jan Kara <jack@suse.cz>
To:     Pavel Skripkin <paskripkin@gmail.com>
Cc:     jack@suse.cz, tiantao6@hisilicon.com, rdunlap@infradead.org,
        reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot+0ba9909df31c6a36974d@syzkaller.appspotmail.com
Subject: Re: [PATCH] reiserfs: add check for invalid 1st journal block
Message-ID: <20210517101523.GB31755@quack2.suse.cz>
References: <20210514212335.9709-1-paskripkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210514212335.9709-1-paskripkin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Sat 15-05-21 00:23:35, Pavel Skripkin wrote:
> syzbot reported divide error in reiserfs.
> The problem was in incorrect journal 1st block.
> 
> Syzbot's reproducer manualy generated wrong superblock
> with incorrect 1st block. In journal_init() wasn't
> any checks about this particular case.
> 
> For example, if 1st journal block is before superblock
> 1st block, it can cause zeroing important superblock members
> in do_journal_end().
> 
> Reported-and-tested-by: syzbot+0ba9909df31c6a36974d@syzkaller.appspotmail.com
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>

Thanks for the patch. One comment below:

> diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
> index 9edc8e2b154e..d58f24a08385 100644
> --- a/fs/reiserfs/journal.c
> +++ b/fs/reiserfs/journal.c
> @@ -2758,6 +2758,19 @@ int journal_init(struct super_block *sb, const char *j_dev_name,
>  		goto free_and_return;
>  	}
>  
> +	/*
> +	 * Sanity check to see is journal first block correct.
> +	 * If journal first block is invalid it can cause
> +	 * zeroing important superblock members.
> +	 */
> +	if (SB_ONDISK_JOURNAL_1st_BLOCK(sb) < SB_JOURNAL_1st_RESERVED_BLOCK(sb)) {

I guess this check is valid only if !SB_ONDISK_JOURNAL_DEVICE(sb), isn't
it? Otherwise you are comparing block numbers from two different devices...

									Honza

> +		reiserfs_warning(sb, "journal-1393",
> +			"journal 1st super block is invalid: 1st reserved block %d, but actual 1st block is %d",
> +			SB_JOURNAL_1st_RESERVED_BLOCK(sb),
> +			SB_ONDISK_JOURNAL_1st_BLOCK(sb));
> +		goto free_and_return;
> +	}
> +
>  	if (journal_init_dev(sb, journal, j_dev_name) != 0) {
>  		reiserfs_warning(sb, "sh-462",
>  				 "unable to initialize journal device");
> -- 
> 2.31.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
