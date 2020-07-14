Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 495F121F224
	for <lists+reiserfs-devel@lfdr.de>; Tue, 14 Jul 2020 15:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728075AbgGNNLH (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 14 Jul 2020 09:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbgGNNLH (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 14 Jul 2020 09:11:07 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6512DC061755;
        Tue, 14 Jul 2020 06:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=rt0R45n245S6OzOOzV5XkJqNAJz0aHNoAHA0u2wcjZc=; b=WA3KTL0TATn8suIqR6Jthtag2T
        E5wP0QuQNZ/hrhi3/e7AvuL+AGXlHv7Mup3K1VKRLW1iZg9eswfKYRjClAFEynkb6UMWUBSjhcV9N
        AFSYxFks4hKKGFQ0Fx3X6JAr7epce0hMZrfvGvo5sZvyDkrrFcN/W0hnsF/FhCPdJ4J6JkUnkyzxT
        cWLNqu9h6i5Zgy1gYhysaghKiFvV/wQMEA1F2FBuGpGUlUAH0QeNJIWE/QhtRxzDY4U4CFQc3sDZT
        jFJx3zA/IaBlpR1zFJzFKmrDzQ+PGJzmMZ7gD7vTYglV15S+7gflqMmwXC4aoj8wqtdltwOIMqIpk
        lVUFG/aw==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jvKhn-0003xf-Uh; Tue, 14 Jul 2020 13:10:44 +0000
Date:   Tue, 14 Jul 2020 14:10:43 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     trix@redhat.com
Cc:     jack@suse.cz, william.kucharski@oracle.com, jeffm@suse.com,
        joseph.qi@linux.alibaba.com, liao.pingfang@zte.com.cn,
        reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] reiserfs : fix improper free in reiserfs_get_block
Message-ID: <20200714131043.GB12769@casper.infradead.org>
References: <20200714130509.11791-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714130509.11791-1-trix@redhat.com>
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Tue, Jul 14, 2020 at 06:05:09AM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> clang static analysis flags this error
> 
> inode.c:1083:5: warning: Argument to kfree() is the address of the
>   local variable 'unf_single', which is not memory allocated by
>   malloc() [unix.Malloc]
>                                 kfree(un);
>                                 ^~~~~~~~~
> Assignment of 'un'
> 
> 	/*
> 	 * We use this in case we need to allocate
> 	 * only one block which is a fastpath
> 	 */
> 	unp_t unf_single = 0;
> 
> 	...
> 
> 	if (blocks_needed == 1) {
> 		un = &unf_single;
> 	} else {
> 		un = kcalloc(min(blocks_needed, max_to_insert),
> 			     UNFM_P_SIZE, GFP_NOFS);
> 		if (!un) {
> 			un = &unf_single;
> 			blocks_needed = 1;
> 			max_to_insert = 0;
> 		}
> 	}
> 
> The logic to free 'un'
> 
> 	if (blocks_needed != 1)
> 		kfree(un);
> 
> Because the kcalloc failure falls back to using unf_single,
> the if-check for the free is wrong.

I think you mean "Because clang's static analysis is limited, it
warns incorrectly about this".  There's no path to get to the
kfree with blocks_needed != 1 and un being equal to &unf_single.

> So improve the check.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  fs/reiserfs/inode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
> index 1509775da040..4d62148e43e6 100644
> --- a/fs/reiserfs/inode.c
> +++ b/fs/reiserfs/inode.c
> @@ -1079,7 +1079,7 @@ int reiserfs_get_block(struct inode *inode, sector_t block,
>  						     UNFM_P_SIZE *
>  						     blocks_needed);
>  
> -			if (blocks_needed != 1)
> +			if (un != &unf_single)
>  				kfree(un);

I don't actually object to this patch, but your analysis of clang's
analysis is wrong.
