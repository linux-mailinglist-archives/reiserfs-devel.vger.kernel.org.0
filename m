Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 412A92C58E1
	for <lists+reiserfs-devel@lfdr.de>; Thu, 26 Nov 2020 16:58:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391353AbgKZP55 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 26 Nov 2020 10:57:57 -0500
Received: from mx2.suse.de ([195.135.220.15]:50036 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391338AbgKZP55 (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 26 Nov 2020 10:57:57 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id A545CACD5;
        Thu, 26 Nov 2020 15:57:55 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
        id E4EED1E10D0; Thu, 26 Nov 2020 16:57:54 +0100 (CET)
Date:   Thu, 26 Nov 2020 16:57:54 +0100
From:   Jan Kara <jack@suse.cz>
To:     Rustam Kovhaev <rkovhaev@gmail.com>
Cc:     alex.shi@linux.alibaba.com, jack@suse.cz,
        akpm@linux-foundation.org, yeyunfeng@huawei.com,
        reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH] reiserfs: add check for an invalid ih_entry_count
Message-ID: <20201126155754.GK422@quack2.suse.cz>
References: <20201101140958.3650143-1-rkovhaev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201101140958.3650143-1-rkovhaev@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Sun 01-11-20 06:09:58, Rustam Kovhaev wrote:
> when directory item has an invalid value set for ih_entry_count it might
> trigger use-after-free or out-of-bounds read in bin_search_in_dir_item()
> 
> ih_entry_count * IH_SIZE for directory item should not be larger than
> ih_item_len
> 
> Reported-and-tested-by: syzbot+83b6f7cf9922cae5c4d7@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=83b6f7cf9922cae5c4d7
> Signed-off-by: Rustam Kovhaev <rkovhaev@gmail.com>

Thanks! I've added the patch to my tree and will push it to Linus.

								Honza

> ---
>  fs/reiserfs/stree.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
> index 8bf88d690729..476a7ff49482 100644
> --- a/fs/reiserfs/stree.c
> +++ b/fs/reiserfs/stree.c
> @@ -454,6 +454,12 @@ static int is_leaf(char *buf, int blocksize, struct buffer_head *bh)
>  					 "(second one): %h", ih);
>  			return 0;
>  		}
> +		if (is_direntry_le_ih(ih) && (ih_item_len(ih) < (ih_entry_count(ih) * IH_SIZE))) {
> +			reiserfs_warning(NULL, "reiserfs-5093",
> +					 "item entry count seems wrong %h",
> +					 ih);
> +			return 0;
> +		}
>  		prev_location = ih_location(ih);
>  	}
>  
> -- 
> 2.28.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
