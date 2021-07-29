Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6073B3D9CFE
	for <lists+reiserfs-devel@lfdr.de>; Thu, 29 Jul 2021 07:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbhG2FGh (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 29 Jul 2021 01:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229957AbhG2FGh (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 29 Jul 2021 01:06:37 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DACCDC061757;
        Wed, 28 Jul 2021 22:06:33 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id mt6so8590583pjb.1;
        Wed, 28 Jul 2021 22:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SU46m+8d2JSWOc/OL9cif0k6zm2d3dyALvVtXOamJdo=;
        b=RFqTl3BUb7b13b1eZXiA7UggIrJAmXHAlxKkWQWvd65ZOH/1vAz+wwD6RZv+GX+w9b
         y3Iu2nT1re7re+2DeRjmMgZegfxB+TgI7NuaTpTEqe7ihdZHA+B3GIoMduyERq8g0EDW
         e3/bMOCrxW/FJRkEILZVJGqawxhanhNg10Qud18hf9znAgq3elKqYuVYOQlr+RIDbcGX
         0rjCD8mDKhWpODHLnqXZ32HU4oNDrcLNgYhf9pF3ShQlLAmEiAXbhbO5gdIvAYXBI4Gi
         tVV3bBtWqcU3IwgyDFwLVIwHZB6XbVbyYzW8RyOd9HEZA0uKkQWQ7VZBrEHMOtrsfs7v
         kvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SU46m+8d2JSWOc/OL9cif0k6zm2d3dyALvVtXOamJdo=;
        b=Jf3ozkIXTX+y6O90itNSPLopuf/Bk2wZRZmMac64qTUjokUlHpgLghvRE3a4/5iKb+
         Yv0jwWogaRErFdFdPyl8boJarBYzixwJ7nBeYMbcdHPymBA6HJdE/bIB67o+t0uljVrR
         SyucRbtnybr3bSx9Z6H//IImjftPoOumBvxONRwpDDrlJ4pWFLkEKWhkIxVwx0Y37g+T
         JLipKUfrENVdJ99hNAhPeVStKt3rmsh9bV6u/Lxsmy0hRDRiOL7kE4kytGh7D97YA9OP
         IobYihAjNqWhyYT+pEsNTSr1FFrDiFbPrKkafmDKJYWVY16Pu4pf80IYWgpRYRAoU1gL
         WQiw==
X-Gm-Message-State: AOAM530HlaXn1jC7POOYLxsJciwN6krN0CvoUsFuYBB5SsLI5haVcU1+
        gas5MuMMrrPC4F6qwfkgLI4=
X-Google-Smtp-Source: ABdhPJxbPL1M+mbiDA7IcLU1TvZMDNfqJDcErsKYqDvDTvhFgqBk+tp82WeASngOWCC0oYfD6O65rw==
X-Received: by 2002:aa7:9e9e:0:b029:32a:fa43:1c with SMTP id p30-20020aa79e9e0000b029032afa43001cmr3268288pfq.24.1627535193228;
        Wed, 28 Jul 2021 22:06:33 -0700 (PDT)
Received: from fedora ([49.36.215.73])
        by smtp.gmail.com with ESMTPSA id s5sm1754430pfk.114.2021.07.28.22.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 22:06:32 -0700 (PDT)
Date:   Thu, 29 Jul 2021 10:36:27 +0530
From:   Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
To:     Jan Kara <jack@suse.cz>
Cc:     rkovhaev@gmail.com, reiserfs-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        syzbot+c31a48e6702ccb3d64c9@syzkaller.appspotmail.com
Subject: Re: [PATCH] reiserfs: check directry items on read from disk
Message-ID: <YQI3U9qDbL4PMmMJ@fedora>
References: <20210709152929.766363-1-chouhan.shreyansh630@gmail.com>
 <YPZ7zUVAedCkx3IQ@fedora>
 <20210726082050.GA20621@quack2.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210726082050.GA20621@quack2.suse.cz>
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Mon, Jul 26, 2021 at 10:20:50AM +0200, Jan Kara wrote:
> Hello!
> 
> On Tue 20-07-21 13:01:25, Shreyansh Chouhan wrote:
> > Just a ping for reviews/merge since there has been no activity on this patch.
> 
> The patch is already in my tree and included in linux-next. I wanted to
> send it to Linus before going on vacation but somehow that slipped through.
> I'll send it to Linus this week with other fixes I have accumulated. I'm
> sorry for the delay.
> 

No worries, also thanks a lot for the merge!

Regards,
Shreyansh Chouhan
> 								Honza
> 
> > On Fri, Jul 09, 2021 at 08:59:29PM +0530, Shreyansh Chouhan wrote:
> > > 
> > > While verifying the leaf item that we read from the disk, reiserfs
> > > doesn't check the directory items, this could cause a crash when we
> > > read a directory item from the disk that has an invalid deh_location.
> > > 
> > > This patch adds a check to the directory items read from the disk that
> > > does a bounds check on deh_location for the directory entries. Any
> > > directory entry header with a directory entry offset greater than the
> > > item length is considered invalid.
> > > 
> > > Reported-by: syzbot+c31a48e6702ccb3d64c9@syzkaller.appspotmail.com
> > > Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
> > > ---
> > >  fs/reiserfs/stree.c | 31 ++++++++++++++++++++++++++-----
> > >  1 file changed, 26 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
> > > index 476a7ff49482..ef42729216d1 100644
> > > --- a/fs/reiserfs/stree.c
> > > +++ b/fs/reiserfs/stree.c
> > > @@ -387,6 +387,24 @@ void pathrelse(struct treepath *search_path)
> > >  	search_path->path_length = ILLEGAL_PATH_ELEMENT_OFFSET;
> > >  }
> > >  
> > > +static int has_valid_deh_location(struct buffer_head *bh, struct item_head *ih)
> > > +{
> > > +	struct reiserfs_de_head *deh;
> > > +	int i;
> > > +
> > > +	deh = B_I_DEH(bh, ih);
> > > +	for (i = 0; i < ih_entry_count(ih); i++) {
> > > +		if (deh_location(&deh[i]) > ih_item_len(ih)) {
> > > +			reiserfs_warning(NULL, "reiserfs-5094",
> > > +					 "directory entry location seems wrong %h",
> > > +					 &deh[i]);
> > > +			return 0;
> > > +		}
> > > +	}
> > > +
> > > +	return 1;
> > > +}
> > > +
> > >  static int is_leaf(char *buf, int blocksize, struct buffer_head *bh)
> > >  {
> > >  	struct block_head *blkh;
> > > @@ -454,11 +472,14 @@ static int is_leaf(char *buf, int blocksize, struct buffer_head *bh)
> > >  					 "(second one): %h", ih);
> > >  			return 0;
> > >  		}
> > > -		if (is_direntry_le_ih(ih) && (ih_item_len(ih) < (ih_entry_count(ih) * IH_SIZE))) {
> > > -			reiserfs_warning(NULL, "reiserfs-5093",
> > > -					 "item entry count seems wrong %h",
> > > -					 ih);
> > > -			return 0;
> > > +		if (is_direntry_le_ih(ih)) {
> > > +			if (ih_item_len(ih) < (ih_entry_count(ih) * IH_SIZE)) {
> > > +				reiserfs_warning(NULL, "reiserfs-5093",
> > > +						 "item entry count seems wrong %h",
> > > +						 ih);
> > > +				return 0;
> > > +			}
> > > +			return has_valid_deh_location(bh, ih);
> > >  		}
> > >  		prev_location = ih_location(ih);
> > >  	}
> > > -- 
> > > 2.31.1
> > > 
> -- 
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
