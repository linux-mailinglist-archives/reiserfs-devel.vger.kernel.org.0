Return-Path: <reiserfs-devel+bounces-138-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8C793193E
	for <lists+reiserfs-devel@lfdr.de>; Mon, 15 Jul 2024 19:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99DBB1F22744
	for <lists+reiserfs-devel@lfdr.de>; Mon, 15 Jul 2024 17:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83BC945016;
	Mon, 15 Jul 2024 17:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="wApx5kF9";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="2PrUPEFk";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="wApx5kF9";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="2PrUPEFk"
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443A61F608;
	Mon, 15 Jul 2024 17:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721064515; cv=none; b=SJjRWR4dad6tW3gZBKIkDOH3P7pEQzhyPIaUkrjhy+MsagzyLEvxLKyHAaP4OJUS7bR6R4lHMKfqWp1C1QebnjcXNldqzHVtFJ6CrldYNozldz03CtFliMbkRJFufJBK1B+7B3IfbSZF5DNVmtCQQ1qrIcfXSRWahqKMyELco38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721064515; c=relaxed/simple;
	bh=en56rL31hNrBz6sueLWaYdSu+EOnZCtZ4gVHtOV8ozk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=olJKfbqypDLwdT1xu3VIx+17MPQL3ZxoiWVC8nkHdE5qS5uf3w94Gkg05e7vKsXPsQOAZA4c4Cg7BUNu6PYXb4pM0LFRth8UO1FLeuhvl1SjBLhluQijRwzcKmlrjQAfQx8IqqSrVDr9j/J7sWZ7iPSnd5/R0AW8dtzqbR6bzKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=wApx5kF9; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=2PrUPEFk; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=wApx5kF9; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=2PrUPEFk; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id ED1761F834;
	Mon, 15 Jul 2024 17:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1721064507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uIgLWK/+ZweC1RPWOJUKrtuGtw4FuFYwUr9MpJlADus=;
	b=wApx5kF9KFajFTZklo5MjBA45SaVS7s6o3fDnrqE+1cbS5lbUFCyh/GGDWLeZp4SEIeLqo
	WweiZUkVhE2o23sdczErBk5tdRrxK0yBlBCnf2lcTY6m2/3pfrJEQVpAWvQm3HxBE1GBIl
	hDcjqblcFdInajITFIfWwT2wBFyqads=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1721064507;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uIgLWK/+ZweC1RPWOJUKrtuGtw4FuFYwUr9MpJlADus=;
	b=2PrUPEFkSMan/ZIAvdQRvWmWwkhUXb4stjLuQ7TBDyI1kQrZW9FaWmc95fVlYzgL0Hv16A
	8x2Ll/jXu9g5wQAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=wApx5kF9;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=2PrUPEFk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1721064507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uIgLWK/+ZweC1RPWOJUKrtuGtw4FuFYwUr9MpJlADus=;
	b=wApx5kF9KFajFTZklo5MjBA45SaVS7s6o3fDnrqE+1cbS5lbUFCyh/GGDWLeZp4SEIeLqo
	WweiZUkVhE2o23sdczErBk5tdRrxK0yBlBCnf2lcTY6m2/3pfrJEQVpAWvQm3HxBE1GBIl
	hDcjqblcFdInajITFIfWwT2wBFyqads=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1721064507;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uIgLWK/+ZweC1RPWOJUKrtuGtw4FuFYwUr9MpJlADus=;
	b=2PrUPEFkSMan/ZIAvdQRvWmWwkhUXb4stjLuQ7TBDyI1kQrZW9FaWmc95fVlYzgL0Hv16A
	8x2Ll/jXu9g5wQAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E13EF134AB;
	Mon, 15 Jul 2024 17:28:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Zo/2NjpclWYQJAAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 15 Jul 2024 17:28:26 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 85E11A0987; Mon, 15 Jul 2024 19:28:26 +0200 (CEST)
Date: Mon, 15 Jul 2024 19:28:26 +0200
From: Jan Kara <jack@suse.cz>
To: Mirsad Todorovac <mtodorovac69@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <kees@kernel.org>, Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Al Viro <viro@zeniv.linux.org.uk>, Jeff Layton <jlayton@kernel.org>,
	reiserfs-devel@vger.kernel.org
Subject: Re: [PROBLEM linux-next] =?utf-8?Q?fs=2Freiserfs=2Fdo=5Fbalan=2Ec?=
 =?utf-8?B?OjExNDc6MTM6IGVycm9yOiB2YXJpYWJsZSDigJhsZWFmX21p?=
 =?utf-8?B?4oCZ?= set but not used [-Werror=unused-but-set-variable]
Message-ID: <20240715172826.wbmlg52ckdxze7sg@quack3>
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
X-Rspamd-Queue-Id: ED1761F834
X-Spam-Flag: NO
X-Spam-Score: -0.01
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.01 / 50.00];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_THREE(0.00)[3];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.cz:dkim];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Level: 
X-Spamd-Bar: /

Hello Mirsad!

On Wed 10-07-24 20:09:27, Mirsad Todorovac wrote:
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

Frankly, I wouldn't bother with reiserfs. The warning is there for ages,
the code is going to get removed in two releases, so I guess we can live
with these warnings for a few more months...

								Honza


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
> 
> Hope this helps.
> 
> Best regards,
> Mirsad Todorovac
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

