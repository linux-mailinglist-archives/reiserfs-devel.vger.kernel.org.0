Return-Path: <reiserfs-devel+bounces-134-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E5A92D826
	for <lists+reiserfs-devel@lfdr.de>; Wed, 10 Jul 2024 20:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DD3D2820F5
	for <lists+reiserfs-devel@lfdr.de>; Wed, 10 Jul 2024 18:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A42C19346B;
	Wed, 10 Jul 2024 18:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YnkeCbUD"
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C0B3BBED;
	Wed, 10 Jul 2024 18:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720635463; cv=none; b=YBJ1BPM/fKA0KXM7FNhcmRPPVKXTw+L5lJ0E9EDSxbyRSQPYAl32xSros3yoSpMqkwiwYAdi8ThV/i0J2O3tJfqvSIxetDp4AVovxBGVe48QE8QOuegOc1SSR49NITr3Izus1TEYfFClzjoHAE+s0N3JzojBnDWeWtpP8UkKjo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720635463; c=relaxed/simple;
	bh=1ia2KPuUxDh2jD3vp7kjMSWpsIcpRqG+21WsGr3Ca/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eLHst+rqlrt+sdUWhyGw5pZWoqEe9r6bkPu2QLm6aUFQeRPATYd/5zKoxvYdK/A2g+HHJi2K3KX/9RVkeGqx5osduY+7tmqhZ72CDioRdGX6F7/L0NAyi1mWm7igaPC9oRM/vz4tnMLDbb/SQ9TfmKjVmUpbxi4IUiKMnfV9wNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YnkeCbUD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2CE7C32781;
	Wed, 10 Jul 2024 18:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720635463;
	bh=1ia2KPuUxDh2jD3vp7kjMSWpsIcpRqG+21WsGr3Ca/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YnkeCbUDuJQ081cwrCFX2lMZXXXIiGw2cfGLBcgIoDZW7vuJrqAQVlBlnFp3ek+HQ
	 zNpU12GqMjn4xc3/HFyp8uM8Uk2KbPMkgE7sl5Mh0wadpJ89uJ19vTBQXGE4pOjvwI
	 euonHlyz2uw5hT2RZCmNYAQsiYPhA07BH8uchJBKxzkdtDrm/4nLV6+NkqAtVH3LWx
	 rJv5RfHJKWRks9JG1FKdyMj1gB7VF0ao1z+T+czCiPEYgs+6Ew5wY04KNJ+E28lwXR
	 48v63LJweYzXbsOdmNRvYv2dwwX1OYsoKSUXbBcUshBTDfhBiX3Pnj4JwIcYHDEytT
	 LQ2LEw3yH0x7Q==
Date: Wed, 10 Jul 2024 11:17:42 -0700
From: Kees Cook <kees@kernel.org>
To: Mirsad Todorovac <mtodorovac69@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Al Viro <viro@zeniv.linux.org.uk>, Jeff Layton <jlayton@kernel.org>,
	reiserfs-devel@vger.kernel.org
Subject: Re: [PROBLEM linux-next] =?utf-8?Q?fs=2Fre?=
 =?utf-8?Q?iserfs=2Fdo=5Fbalan=2Ec=3A1147=3A13=3A_error=3A_variable_?=
 =?utf-8?B?4oCYbGVhZl9taQ==?= =?utf-8?B?4oCZ?= set but not used
 [-Werror=unused-but-set-variable]
Message-ID: <202407101116.2E9836EBAF@keescook>
References: <39591663-9151-42f9-9906-4684acaa685c@gmail.com>
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39591663-9151-42f9-9906-4684acaa685c@gmail.com>

On Wed, Jul 10, 2024 at 08:09:27PM +0200, Mirsad Todorovac wrote:
> Dear all,
> 
> On the linux-next vanilla next-20240709 tree, I have attempted the seed KCONFIG_SEED=0xEE7AB52F
> which was known from before to trigger various errors in compile and build process.
> 
> Though this might seem as contributing to channel noise, Linux refuses to build this config,
> treating warnings as errors, using this build line:
> 
> $ time nice make W=1 -k -j 36 |& tee ../err-next-20230709-01a.log; date
> 
> As I know that the Chief Penguin doesn't like warnings, but I am also aware that there are plenty
> left, there seems to be more tedious work ahead to make the compilers happy.
> 
> The compiler output is:
> 
> ---------------------------------------------------------------------------------------------------------
> fs/reiserfs/do_balan.c: In function ‘balance_leaf_new_nodes_paste_whole’:
> fs/reiserfs/do_balan.c:1147:13: error: variable ‘leaf_mi’ set but not used [-Werror=unused-but-set-variable]
>  1147 |         int leaf_mi;
>       |             ^~~~~~~
>   CC      fs/reiserfs/lbalance.o
> fs/reiserfs/fix_node.c: In function ‘dc_check_balance_leaf’:
> fs/reiserfs/fix_node.c:1938:13: error: variable ‘maxsize’ set but not used [-Werror=unused-but-set-variable]
>  1938 |         int maxsize, ret;
>       |             ^~~~~~~
> fs/reiserfs/fix_node.c:1935:13: error: variable ‘levbytes’ set but not used [-Werror=unused-but-set-variable]
>  1935 |         int levbytes;
>       |             ^~~~~~~~
> fs/reiserfs/prints.c: In function ‘prepare_error_buf’:
> fs/reiserfs/prints.c:221:17: error: function ‘prepare_error_buf’ might be a candidate for ‘gnu_printf’ format attribute [-Werror=suggest-attribute=format]
>   221 |                 p += vscnprintf(p, end - p, fmt1, args);
>       |                 ^
> fs/reiserfs/prints.c:260:9: error: function ‘prepare_error_buf’ might be a candidate for ‘gnu_printf’ format attribute [-Werror=suggest-attribute=format]
>   260 |         p += vscnprintf(p, end - p, fmt1, args);
>       |         ^
> make[4]: Target 'arch/x86/kernel/' not remade because of errors.
> make[3]: *** [scripts/Makefile.build:485: arch/x86/kernel] Error 2
> make[3]: Target 'arch/x86/' not remade because of errors.
> make[2]: *** [scripts/Makefile.build:485: arch/x86] Error 2
> fs/reiserfs/lbalance.c: In function ‘leaf_copy_items’:
> fs/reiserfs/lbalance.c:524:29: error: variable ‘dest’ set but not used [-Werror=unused-but-set-variable]
>   524 |         struct buffer_head *dest;
>       |                             ^~~~
> cc1: all warnings being treated as errors
> make[4]: *** [scripts/Makefile.build:244: fs/reiserfs/do_balan.o] Error 1
> cc1: all warnings being treated as errors
> make[4]: *** [scripts/Makefile.build:244: fs/reiserfs/prints.o] Error 1
> cc1: all warnings being treated as errors
> make[4]: *** [scripts/Makefile.build:244: fs/reiserfs/fix_node.o] Error 1
> ---------------------------------------------------------------------------------------------------------
> 
> In fs/reiserfs/fix_node.c:1938:13, fs/reiserfs/fix_node.c:1935:13, and fs/reiserfs/lbalance.c:524:29,
> the problem seem to lie within the construct RFALSE(), like
> 
>  521 static int leaf_copy_items(struct buffer_info *dest_bi, struct buffer_head *src,
>  522                            int last_first, int cpy_num, int cpy_bytes)
>  523 {
>  524         struct buffer_head *dest;
>  525         int pos, i, src_nr_item, bytes;
>  526 
>  527         dest = dest_bi->bi_bh;
>  528         RFALSE(!dest || !src, "vs-10210: !dest || !src");
>  529         RFALSE(last_first != FIRST_TO_LAST && last_first != LAST_TO_FIRST,
>  530                "vs-10220:last_first != FIRST_TO_LAST && last_first != LAST_TO_FIRST");
>  531         RFALSE(B_NR_ITEMS(src) < cpy_num,
>  532                "vs-10230: No enough items: %d, req. %d", B_NR_ITEMS(src),
>  533                cpy_num);
>  534         RFALSE(cpy_num < 0, "vs-10240: cpy_num < 0 (%d)", cpy_num);

Can you prepare a patch to solve these? It should be possible to just
wrap the offending variables as done for RFALSE itself:

#ifdef CONFIG_REISERFS_CHECK
	struct buffer_head *dest;
#endif

etc...

-- 
Kees Cook

