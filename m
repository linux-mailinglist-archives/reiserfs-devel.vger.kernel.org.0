Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF0ED3097E0
	for <lists+reiserfs-devel@lfdr.de>; Sat, 30 Jan 2021 20:17:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232200AbhA3TQo (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sat, 30 Jan 2021 14:16:44 -0500
Received: from smtprelay0073.hostedemail.com ([216.40.44.73]:52424 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231923AbhA3TQl (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sat, 30 Jan 2021 14:16:41 -0500
X-Greylist: delayed 674 seconds by postgrey-1.27 at vger.kernel.org; Sat, 30 Jan 2021 14:16:40 EST
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave02.hostedemail.com (Postfix) with ESMTP id 5116E18010611
        for <reiserfs-devel@vger.kernel.org>; Sat, 30 Jan 2021 19:05:26 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id BD92F180A7FF9;
        Sat, 30 Jan 2021 19:04:44 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:69:355:379:599:800:960:966:973:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1543:1593:1594:1605:1711:1730:1747:1777:1792:2196:2198:2199:2200:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3622:3868:3870:4321:4385:4605:5007:7652:10004:10400:10848:11026:11232:11473:11658:11914:12043:12291:12296:12297:12438:12555:12683:12740:12895:13439:13894:14110:14181:14659:14721:21080:21627:30054:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: guide60_180fe2f275b3
X-Filterd-Recvd-Size: 3853
Received: from [192.168.1.159] (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf19.hostedemail.com (Postfix) with ESMTPA;
        Sat, 30 Jan 2021 19:04:43 +0000 (UTC)
Message-ID: <4e90351d3b78154d451a39c1a8577b583b8467a7.camel@perches.com>
Subject: Re: [PATCH 24/29] reiserfs: Avoid comma separated statements
From:   Joe Perches <joe@perches.com>
To:     Jiri Kosina <trivial@kernel.org>, linux-kernel@vger.kernel.org
Cc:     reiserfs-devel@vger.kernel.org
Date:   Sat, 30 Jan 2021 11:04:43 -0800
In-Reply-To: <29b5ea94496d64e7a73af216b01f26d9ff7ac1fe.1598331149.git.joe@perches.com>
References: <cover.1598331148.git.joe@perches.com>
         <29b5ea94496d64e7a73af216b01f26d9ff7ac1fe.1598331149.git.joe@perches.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Mon, 2020-08-24 at 21:56 -0700, Joe Perches wrote:
> Use semicolons and braces.

ping?

> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  fs/reiserfs/fix_node.c | 36 ++++++++++++++++++++++++------------
>  1 file changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/reiserfs/fix_node.c b/fs/reiserfs/fix_node.c
> index fefe87e1c099..aea63e67a42b 100644
> --- a/fs/reiserfs/fix_node.c
> +++ b/fs/reiserfs/fix_node.c
> @@ -235,8 +235,10 @@ static void check_left(struct tree_balance *tb, int h, int cur_free)
>  	d_size = 0, ih_size = IH_SIZE;
>  
> 
>  	/* first item may be merge with last item in left neighbor */
> -	if (vi->vi_type & VI_TYPE_LEFT_MERGEABLE)
> -		d_size = -((int)IH_SIZE), ih_size = 0;
> +	if (vi->vi_type & VI_TYPE_LEFT_MERGEABLE) {
> +		d_size = -((int)IH_SIZE);
> +		ih_size = 0;
> +	}
>  
> 
>  	tb->lnum[0] = 0;
>  	for (i = 0; i < vn->vn_nr_item;
> @@ -321,8 +323,10 @@ static void check_right(struct tree_balance *tb, int h, int cur_free)
>  	d_size = 0, ih_size = IH_SIZE;
>  
> 
>  	/* last item may be merge with first item in right neighbor */
> -	if (vi->vi_type & VI_TYPE_RIGHT_MERGEABLE)
> -		d_size = -(int)IH_SIZE, ih_size = 0;
> +	if (vi->vi_type & VI_TYPE_RIGHT_MERGEABLE) {
> +		d_size = -(int)IH_SIZE;
> +		ih_size = 0;
> +	}
>  
> 
>  	tb->rnum[0] = 0;
>  	for (i = vn->vn_nr_item - 1; i >= 0;
> @@ -1534,8 +1538,10 @@ static int ip_check_balance(struct tree_balance *tb, int h)
>  			nver1 = get_num_ver(vn->vn_mode, tb, h,
>  					    0, -1, 0, -1,
>  					    snum012 + NOTHING_SHIFT_FLOW, FLOW);
> -			if (nver > nver1)
> -				nset = NOTHING_SHIFT_FLOW, nver = nver1;
> +			if (nver > nver1) {
> +				nset = NOTHING_SHIFT_FLOW;
> +				nver = nver1;
> +			}
>  		}
>  
> 
>  		/*
> @@ -1559,8 +1565,10 @@ static int ip_check_balance(struct tree_balance *tb, int h)
>  					     ((tb->lbytes != -1) ? 1 : 0),
>  					     tb->lbytes, 0, -1,
>  					     snum012 + LEFT_SHIFT_FLOW, FLOW);
> -			if (lnver > lnver1)
> -				lset = LEFT_SHIFT_FLOW, lnver = lnver1;
> +			if (lnver > lnver1) {
> +				lset = LEFT_SHIFT_FLOW;
> +				lnver = lnver1;
> +			}
>  		}
>  
> 
>  		/*
> @@ -1590,8 +1598,10 @@ static int ip_check_balance(struct tree_balance *tb, int h)
>  					     tb->rbytes,
>  					     snum012 + RIGHT_SHIFT_FLOW, FLOW);
>  
> 
> -			if (rnver > rnver1)
> -				rset = RIGHT_SHIFT_FLOW, rnver = rnver1;
> +			if (rnver > rnver1) {
> +				rset = RIGHT_SHIFT_FLOW;
> +				rnver = rnver1;
> +			}
>  		}
>  
> 
>  		/*
> @@ -1622,8 +1632,10 @@ static int ip_check_balance(struct tree_balance *tb, int h)
>  					       ((tb->rbytes != -1) ? 1 : 0)),
>  					      tb->rbytes,
>  					      snum012 + LR_SHIFT_FLOW, FLOW);
> -			if (lrnver > lrnver1)
> -				lrset = LR_SHIFT_FLOW, lrnver = lrnver1;
> +			if (lrnver > lrnver1) {
> +				lrset = LR_SHIFT_FLOW;
> +				lrnver = lrnver1;
> +			}
>  		}
>  
> 
>  		/*


