Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF6453CF54E
	for <lists+reiserfs-devel@lfdr.de>; Tue, 20 Jul 2021 09:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbhGTGvN (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 20 Jul 2021 02:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbhGTGvM (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 20 Jul 2021 02:51:12 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9840AC061574;
        Tue, 20 Jul 2021 00:31:30 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id i16so4171507pgi.9;
        Tue, 20 Jul 2021 00:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gUHafvxPwffprBDYSwA9wJOKwLPsSD3F5l3zpE9j23w=;
        b=TLIfURQuaAwET7qHx0eINAHcT6VgTFPGuK1mPbLHdOkC6Ub8DYvVNHLxW8LYhsoyEI
         JK9+c/b6pbiHiphOWE58UgnCm5isMU3X2OtkTIvHpl12n0I+UQLkIb3L7GOKEfqfG2Wg
         5zW+tcfWcNBmzaQUSSLvJfuxNaADOaux4+oWc/h49SMk1HSynpe6pYTICvcr20oRwCBl
         hx/Pq79rvGmWyK7ePuppPX/0nbECiiXYgipeDYdy5PKj/Bw5xMMcx19DWncN6UlpoJ0n
         rU4C7Eue5gN9anBxKIIZs1aPaB7cd6DqcUKRO2uiNAagaTyzbnVI/ro9rmr7Ctjux/4i
         97VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gUHafvxPwffprBDYSwA9wJOKwLPsSD3F5l3zpE9j23w=;
        b=bI85eO1o2/vcKGzXS0KU1HqMeg0ykg0uaVv13ZkKp3x9p9b08+LR0fii/pHzJltSNI
         dtRa0N3Dm8gDHi0n8mZFPdSUDIfxo5Ze/CNYAvBCVyYtxMB96MP332M8CupXhNZjy1Yj
         DmXxh2aoz6vhp110zKvg3Sv3LsFG5OB9B73DEYw8jddIv6sXyYlvhuWB/SpssldjWbln
         gDdwz6VBbVNFrEwqoHxiXhpWboNy+C+gGiA0AU/sLKvUl4HgVPTBKlZlcO6Ch0gQi8r4
         ZyoigoXuY+BgSGf/L2RLNmLf1Dk2MCcNCKKwm7FLKPduXAEvQwq3Ko2ddaG2NOto6qAh
         FLTA==
X-Gm-Message-State: AOAM532lM6KH3Mn7g5wgmNFK/HPpOTjvqk7XfbO5uSLEwqXcdATHI+xK
        LnZ0hGvqKkErBRB7IUuHqX0=
X-Google-Smtp-Source: ABdhPJy0E3PpBYiE60jtHr3AaOU7l+Jv6W2YX4OPx5IYjmOMFsermYCNNkl5mOSOZgOpdYOFvV7DrA==
X-Received: by 2002:a65:67d6:: with SMTP id b22mr29409530pgs.271.1626766289867;
        Tue, 20 Jul 2021 00:31:29 -0700 (PDT)
Received: from fedora ([2405:201:6008:6ce2:9fb0:9db:90a4:39e2])
        by smtp.gmail.com with ESMTPSA id y9sm20036732pfn.182.2021.07.20.00.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 00:31:29 -0700 (PDT)
Date:   Tue, 20 Jul 2021 13:01:25 +0530
From:   Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
To:     rkovhaev@gmail.com, jack@suse.cz
Cc:     reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot+c31a48e6702ccb3d64c9@syzkaller.appspotmail.com
Subject: Re: [PATCH] reiserfs: check directry items on read from disk
Message-ID: <YPZ7zUVAedCkx3IQ@fedora>
References: <20210709152929.766363-1-chouhan.shreyansh630@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709152929.766363-1-chouhan.shreyansh630@gmail.com>
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hi,

Just a ping for reviews/merge since there has been no activity on this patch.

Thank you,
Shreyansh Chouhan

On Fri, Jul 09, 2021 at 08:59:29PM +0530, Shreyansh Chouhan wrote:
> 
> While verifying the leaf item that we read from the disk, reiserfs
> doesn't check the directory items, this could cause a crash when we
> read a directory item from the disk that has an invalid deh_location.
> 
> This patch adds a check to the directory items read from the disk that
> does a bounds check on deh_location for the directory entries. Any
> directory entry header with a directory entry offset greater than the
> item length is considered invalid.
> 
> Reported-by: syzbot+c31a48e6702ccb3d64c9@syzkaller.appspotmail.com
> Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
> ---
>  fs/reiserfs/stree.c | 31 ++++++++++++++++++++++++++-----
>  1 file changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
> index 476a7ff49482..ef42729216d1 100644
> --- a/fs/reiserfs/stree.c
> +++ b/fs/reiserfs/stree.c
> @@ -387,6 +387,24 @@ void pathrelse(struct treepath *search_path)
>  	search_path->path_length = ILLEGAL_PATH_ELEMENT_OFFSET;
>  }
>  
> +static int has_valid_deh_location(struct buffer_head *bh, struct item_head *ih)
> +{
> +	struct reiserfs_de_head *deh;
> +	int i;
> +
> +	deh = B_I_DEH(bh, ih);
> +	for (i = 0; i < ih_entry_count(ih); i++) {
> +		if (deh_location(&deh[i]) > ih_item_len(ih)) {
> +			reiserfs_warning(NULL, "reiserfs-5094",
> +					 "directory entry location seems wrong %h",
> +					 &deh[i]);
> +			return 0;
> +		}
> +	}
> +
> +	return 1;
> +}
> +
>  static int is_leaf(char *buf, int blocksize, struct buffer_head *bh)
>  {
>  	struct block_head *blkh;
> @@ -454,11 +472,14 @@ static int is_leaf(char *buf, int blocksize, struct buffer_head *bh)
>  					 "(second one): %h", ih);
>  			return 0;
>  		}
> -		if (is_direntry_le_ih(ih) && (ih_item_len(ih) < (ih_entry_count(ih) * IH_SIZE))) {
> -			reiserfs_warning(NULL, "reiserfs-5093",
> -					 "item entry count seems wrong %h",
> -					 ih);
> -			return 0;
> +		if (is_direntry_le_ih(ih)) {
> +			if (ih_item_len(ih) < (ih_entry_count(ih) * IH_SIZE)) {
> +				reiserfs_warning(NULL, "reiserfs-5093",
> +						 "item entry count seems wrong %h",
> +						 ih);
> +				return 0;
> +			}
> +			return has_valid_deh_location(bh, ih);
>  		}
>  		prev_location = ih_location(ih);
>  	}
> -- 
> 2.31.1
> 
