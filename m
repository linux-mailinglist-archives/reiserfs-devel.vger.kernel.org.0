Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4F706D118
	for <lists+reiserfs-devel@lfdr.de>; Thu, 18 Jul 2019 17:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbfGRP1d (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 18 Jul 2019 11:27:33 -0400
Received: from smtprelay0098.hostedemail.com ([216.40.44.98]:40735 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726040AbfGRP1c (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 18 Jul 2019 11:27:32 -0400
X-Greylist: delayed 403 seconds by postgrey-1.27 at vger.kernel.org; Thu, 18 Jul 2019 11:27:32 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave07.hostedemail.com (Postfix) with ESMTP id 40A621803F935
        for <reiserfs-devel@vger.kernel.org>; Thu, 18 Jul 2019 15:20:50 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id 7ACC7613C;
        Thu, 18 Jul 2019 15:20:48 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::,RULES_HIT:41:355:379:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1543:1593:1594:1711:1730:1747:1777:1792:2198:2199:2307:2393:2553:2559:2562:2693:2828:3138:3139:3140:3141:3142:3354:3622:3865:3866:3867:3870:3871:3874:4250:4321:4470:4605:5007:8660:10004:10400:10848:11026:11232:11658:11914:12043:12296:12297:12438:12555:12740:12760:12895:13095:13148:13149:13161:13229:13230:13439:14659:14721:21080:21324:21433:21451:21627:21740:30012:30025:30045:30054:30080:30090:30091,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.14.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:24,LUA_SUMMARY:none
X-HE-Tag: bead63_23f9ecf6bca52
X-Filterd-Recvd-Size: 3930
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf02.hostedemail.com (Postfix) with ESMTPA;
        Thu, 18 Jul 2019 15:20:47 +0000 (UTC)
Message-ID: <cedfd2fb31d943564e19c1652bc8983a18de45d4.camel@perches.com>
Subject: Re: [PATCH] reiserfs: fix code unwinding with clang
From:   Joe Perches <joe@perches.com>
To:     Arnd Bergmann <arnd@arndb.de>, Jan Kara <jack@suse.cz>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Date:   Thu, 18 Jul 2019 08:20:45 -0700
In-Reply-To: <20190718134928.2472465-1-arnd@arndb.de>
References: <20190718134928.2472465-1-arnd@arndb.de>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Thu, 2019-07-18 at 15:49 +0200, Arnd Bergmann wrote:
> Building reiserfs with clang leads to objtool warnings about a part of the
> unreachable code that may confuse the ORC unwinder:
> 
> fs/reiserfs/ibalance.o: warning: objtool: balance_internal()+0xe8f: stack state mismatch: cfa1=7+240 cfa2=7+248
> fs/reiserfs/ibalance.o: warning: objtool: internal_move_pointers_items()+0x36f: stack state mismatch: cfa1=7+152 cfa2=7+144
> fs/reiserfs/lbalance.o: warning: objtool: leaf_cut_from_buffer()+0x58b: stack state mismatch: cfa1=7+128 cfa2=7+112
> fs/reiserfs/lbalance.o: warning: objtool: leaf_copy_boundary_item()+0x7a9: stack state mismatch: cfa1=7+104 cfa2=7+96
> fs/reiserfs/lbalance.o: warning: objtool: leaf_copy_items_entirely()+0x3d2: stack state mismatch: cfa1=7+120 cfa2=7+128
> fs/reiserfs/do_balan.o: warning: objtool: replace_key()+0x158: stack state mismatch: cfa1=7+40 cfa2=7+56
> fs/reiserfs/do_balan.o: warning: objtool: balance_leaf()+0x2791: stack state mismatch: cfa1=7+176 cfa2=7+192
> 
> Reword this to use the regular BUG() call directly from the original code
> location, since objtool finds the generated object code more reasonable.
> 
> This will likely get fixed in a future clang release, but in the meantime
> the workaround helps us build cleanly with existing releases.

The original code read better.

This is kinda a gross solution that should probably be
commented on in the code rather than just the commit message.

> diff --git a/fs/reiserfs/prints.c b/fs/reiserfs/prints.c
[]
> @@ -387,7 +387,6 @@ void __reiserfs_panic(struct super_block *sb, const char *id,
>  	else
>  		printk(KERN_WARNING "REISERFS panic: %s%s%s: %s\n",
>  		      id ? id : "", id ? " " : "", function, error_buf);
> -	BUG();
>  }
>  
>  void __reiserfs_error(struct super_block *sb, const char *id,
> @@ -397,8 +396,10 @@ void __reiserfs_error(struct super_block *sb, const char *id,
>  
>  	BUG_ON(sb == NULL);
>  
> -	if (reiserfs_error_panic(sb))
> +	if (reiserfs_error_panic(sb)) {
>  		__reiserfs_panic(sb, id, function, error_buf);
> +		BUG();
> +	}
>  
>  	if (id && id[0])
>  		printk(KERN_CRIT "REISERFS error (device %s): %s %s: %s\n",
> diff --git a/fs/reiserfs/reiserfs.h b/fs/reiserfs/reiserfs.h
> index e5ca9ed79e54..f5bd17ee21f6 100644
> --- a/fs/reiserfs/reiserfs.h
> +++ b/fs/reiserfs/reiserfs.h
> @@ -3185,10 +3185,9 @@ void unfix_nodes(struct tree_balance *);
>  
>  /* prints.c */
>  void __reiserfs_panic(struct super_block *s, const char *id,
> -		      const char *function, const char *fmt, ...)
> -    __attribute__ ((noreturn));
> +		      const char *function, const char *fmt, ...);
>  #define reiserfs_panic(s, id, fmt, args...) \
> -	__reiserfs_panic(s, id, __func__, fmt, ##args)
> +	do { __reiserfs_panic(s, id, __func__, fmt, ##args); BUG(); } while (0)
>  void __reiserfs_error(struct super_block *s, const char *id,
>  		      const char *function, const char *fmt, ...);
>  #define reiserfs_error(s, id, fmt, args...) \

