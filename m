Return-Path: <reiserfs-devel+bounces-140-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C072E933FDE
	for <lists+reiserfs-devel@lfdr.de>; Wed, 17 Jul 2024 17:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4493D1F2221D
	for <lists+reiserfs-devel@lfdr.de>; Wed, 17 Jul 2024 15:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F45B181BB5;
	Wed, 17 Jul 2024 15:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="2gz48Fv6";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="yHobnwdt";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="dLG6Mv1M";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="mZV4Vh8R"
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD4B17F385;
	Wed, 17 Jul 2024 15:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721231080; cv=none; b=gVy8kkm+k7TK7yintL2edL1ZttJvmpxwlR0/d2Dt5+HPoPi06YQUdp0E1rnAP1nvSteP/RXGdZBMvRs+7AWdvGLTpaEiudo0xMV0NNLZRfots+v8BsRGA27GcDQ3Ex9XomRQp/KKDpH+NpFQzq0xwwKTY9ZJ7Z31kosFWLfGOy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721231080; c=relaxed/simple;
	bh=uaEj7iTr2UmUrYASQGx6ADA0/zrmRFYqjz3ZynR1oXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdzrhMEHmaenPfbBwNZVR88MmjkKX+Z+M0kFvrn2VsJCNwCUxwFDact2Dkp+vzQkDs1wGrjsitGcJck7O5rYpwXIHh5bzzhgSWch+Ta2jITYWatEtL6PmrTJ/FxqZjt3EIN2hIrUKPq6UneDIsSNZ47GZobY4muznrkdPw5mbc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=2gz48Fv6; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=yHobnwdt; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=dLG6Mv1M; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=mZV4Vh8R; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B645321BDB;
	Wed, 17 Jul 2024 15:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1721231077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oZ16iqaXvxlzRu55kee9Kw2H7AaJIjqGp2L3FBXi+X4=;
	b=2gz48Fv67UMOLUS6fdc7dT4M1/9rheQgHaq6EdKlyNJHCQhBIFzhNZDw5E9zmPUdsF8MjM
	2oRd9IKFahSs5fEbkzlxgt04pJ8fMaVEi/CUBjnAIyXaTrTisFGpGDxnKc6jUr3xNUiaWj
	vvpvmzKmWNuGYAbWd0+3uZM3rf87x7I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1721231077;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oZ16iqaXvxlzRu55kee9Kw2H7AaJIjqGp2L3FBXi+X4=;
	b=yHobnwdt4fFQFv0CyrRFXOgXiAVSir1GBJOzzrK1iCAh6Q4ZsW0MeFmYI3PGqjMCdtpnc/
	Hp4GEWhyr7Yk8dDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=dLG6Mv1M;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=mZV4Vh8R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1721231076; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oZ16iqaXvxlzRu55kee9Kw2H7AaJIjqGp2L3FBXi+X4=;
	b=dLG6Mv1MMcM6rpLbL5OY0oGvF1vTtXOG6h58b1jFIpOX97fEZ/xcbntddqLQmOvU9SIZub
	V5VtokjMmKFkLGb083Cad6cWUVTlyPrf9spixI3Nno0D7S83hfU06HcE9W7+WWRg56xnL9
	CBATAOqlHEaid6Yq0a5+AylCEnvp9L8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1721231076;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oZ16iqaXvxlzRu55kee9Kw2H7AaJIjqGp2L3FBXi+X4=;
	b=mZV4Vh8RrzZSaovrrbXb/9c2lZQBUj81oLzKGkkTNvLasFAla+3tRxtESFnTdfazAoUQyG
	2BpHo3r4RbgsirAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7A211136E5;
	Wed, 17 Jul 2024 15:44:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pkHIHeTml2bwHwAAD6G6ig
	(envelope-from <jack@suse.cz>); Wed, 17 Jul 2024 15:44:36 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 6623EA0987; Wed, 17 Jul 2024 17:44:34 +0200 (CEST)
Date: Wed, 17 Jul 2024 17:44:34 +0200
From: Jan Kara <jack@suse.cz>
To: Mirsad Todorovac <mtodorovac69@gmail.com>
Cc: Jan Kara <jack@suse.cz>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <kees@kernel.org>, Christian Brauner <brauner@kernel.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Al Viro <viro@zeniv.linux.org.uk>, Jeff Layton <jlayton@kernel.org>,
	reiserfs-devel@vger.kernel.org
Subject: Re: [PROBLEM linux-next] =?utf-8?Q?fs=2Freiserfs=2Fdo=5Fbalan=2Ec?=
 =?utf-8?B?OjExNDc6MTM6IGVycm9yOiB2YXJpYWJsZSDigJhsZWFmX21p?=
 =?utf-8?B?4oCZ?= set but not used [-Werror=unused-but-set-variable]
Message-ID: <20240717154434.jba66jupaf566tes@quack3>
References: <39591663-9151-42f9-9906-4684acaa685c@gmail.com>
 <20240715172826.wbmlg52ckdxze7sg@quack3>
 <9aec9df8-ca82-4b2f-b227-5e318c66b97e@gmail.com>
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9aec9df8-ca82-4b2f-b227-5e318c66b97e@gmail.com>
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.01
X-Spam-Level: 
X-Rspamd-Queue-Id: B645321BDB

On Tue 16-07-24 19:17:05, Mirsad Todorovac wrote:
> On 7/15/24 19:28, Jan Kara wrote:
> > Hello Mirsad!
> > 
> > On Wed 10-07-24 20:09:27, Mirsad Todorovac wrote:
> >> On the linux-next vanilla next-20240709 tree, I have attempted the seed KCONFIG_SEED=0xEE7AB52F
> >> which was known from before to trigger various errors in compile and build process.
> >>
> >> Though this might seem as contributing to channel noise, Linux refuses to build this config,
> >> treating warnings as errors, using this build line:
> >>
> >> $ time nice make W=1 -k -j 36 |& tee ../err-next-20230709-01a.log; date
> >>
> >> As I know that the Chief Penguin doesn't like warnings, but I am also aware that there are plenty
> >> left, there seems to be more tedious work ahead to make the compilers happy.
> >>
> >> The compiler output is:
> >>
> >> ---------------------------------------------------------------------------------------------------------
> >> fs/reiserfs/do_balan.c: In function ‘balance_leaf_new_nodes_paste_whole’:
> >> fs/reiserfs/do_balan.c:1147:13: error: variable ‘leaf_mi’ set but not used [-Werror=unused-but-set-variable]
> >>  1147 |         int leaf_mi;
> >>       |             ^~~~~~~
> > 
> > Frankly, I wouldn't bother with reiserfs. The warning is there for ages,
> > the code is going to get removed in two releases, so I guess we can live
> > with these warnings for a few more months...
> 
> In essence I agree with you, but for sentimental reasons I would like to
> keep it because it is my first journaling Linux system on Knoppix 🙂

As much as I understand your sentiment (I have a bit of history with that
fs as well) the maintenance cost isn't really worth it and most fs folks
will celebrate when it's removed. We have already announced the removal
year and half ago and I'm fully for executing that plan at the end of this
year.

> Patch is also simple and a no-brainer, as proposed by Mr. Cook:
> 
> -------------------------------><------------------------------------------
> diff --git a/fs/reiserfs/do_balan.c b/fs/reiserfs/do_balan.c
> index 5129efc6f2e6..fbe73f267853 100644
> --- a/fs/reiserfs/do_balan.c
> +++ b/fs/reiserfs/do_balan.c
> @@ -1144,7 +1144,9 @@ static void balance_leaf_new_nodes_paste_whole(struct tree_balance *tb,
>  {
>  	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
>  	int n = B_NR_ITEMS(tbS0);
> +#ifdef CONFIG_REISERFS_CHECK
>  	int leaf_mi;
> +#endif

Well, I would not like this even for actively maintained code ;) If you
want to silence these warnings in this dead code, then I could live with
something like:

#if defined( CONFIG_REISERFS_CHECK )
#define RFALSE(cond, format, args...) __RASSERT(!(cond), ....)
#else
- #define RFALSE( cond, format, args... ) do {;} while( 0 )
+ #define RFALSE( cond, format, args... ) do { (void)cond; } while( 0 )
#endif

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

