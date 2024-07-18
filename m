Return-Path: <reiserfs-devel+bounces-142-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26706934B0E
	for <lists+reiserfs-devel@lfdr.de>; Thu, 18 Jul 2024 11:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5BD0286AD5
	for <lists+reiserfs-devel@lfdr.de>; Thu, 18 Jul 2024 09:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF37824AC;
	Thu, 18 Jul 2024 09:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="AkHK1NOR";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="EIb+Fhx2";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="AkHK1NOR";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="EIb+Fhx2"
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B275C8004E;
	Thu, 18 Jul 2024 09:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721295587; cv=none; b=IPcWvI5mLDSYUTNREBSVXPy1Fz8E6TI5ikhWrIRc6leJ2DK/fAWyFK6C4wekCEeBZfs3oDarSx6Fej/moKVFNgJaqBv+HV7nTjk4fLPcScsVD2lLZNOjlpSf7Xaco28DMnnuXI9uyOj/LGbC8jbcZmYYVdqjFqFXJHx5sRX7iRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721295587; c=relaxed/simple;
	bh=BN+xHDsdBShWOGEGVNk0aejhTWLWhNd0ebSunq23qeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lX5NNvsDJ0ZwyJvRwvJWoGo+2d3P5AggwWw7FWsqk0ojJyWbkKV+7w+eULDYgzxzz7OtyTQNX9SBYkOgLXTJkYgr8u7EI1Nh8GmEaDenFcbLAheU7/v8Y0Mu4/n2h2zDR0TcQKMWFTKoOZ/b24IcUMwQttakReno2Tx5cBe8VzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=AkHK1NOR; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=EIb+Fhx2; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=AkHK1NOR; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=EIb+Fhx2; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E3D431FBB6;
	Thu, 18 Jul 2024 09:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1721295583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ImFX28himPWpm6Eap3EC5SOz2gaRA1Ez/bsFu7eV/bE=;
	b=AkHK1NORfneQAFHPhbnUgJpisawDbqnjpMKKc742jh/NeENSxkabnEhv75mo4vy/kWrlJP
	jYlWEunofS2K46yJMARXoW5Rp7wnUUThH6AV8qGQDP+74XT4/tADohq7vYDiyz9AA/Gx6R
	ANu25PPe/XCjXDH1UBFoUq8qHwKcAKU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1721295583;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ImFX28himPWpm6Eap3EC5SOz2gaRA1Ez/bsFu7eV/bE=;
	b=EIb+Fhx2FuqU5eP+gLb58X2+2R5DAVbpJ8JLjeC4REAFNTlxHzawdjbvAhz5tvJVMglWQ4
	ZGpIaaBj69GmtVBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1721295583; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ImFX28himPWpm6Eap3EC5SOz2gaRA1Ez/bsFu7eV/bE=;
	b=AkHK1NORfneQAFHPhbnUgJpisawDbqnjpMKKc742jh/NeENSxkabnEhv75mo4vy/kWrlJP
	jYlWEunofS2K46yJMARXoW5Rp7wnUUThH6AV8qGQDP+74XT4/tADohq7vYDiyz9AA/Gx6R
	ANu25PPe/XCjXDH1UBFoUq8qHwKcAKU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1721295583;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ImFX28himPWpm6Eap3EC5SOz2gaRA1Ez/bsFu7eV/bE=;
	b=EIb+Fhx2FuqU5eP+gLb58X2+2R5DAVbpJ8JLjeC4REAFNTlxHzawdjbvAhz5tvJVMglWQ4
	ZGpIaaBj69GmtVBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D60241379D;
	Thu, 18 Jul 2024 09:39:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id g2c4NN/imGZfOwAAD6G6ig
	(envelope-from <jack@suse.cz>); Thu, 18 Jul 2024 09:39:43 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 7C0F6A0987; Thu, 18 Jul 2024 11:39:43 +0200 (CEST)
Date: Thu, 18 Jul 2024 11:39:43 +0200
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
Message-ID: <20240718093943.qtyc2bdt4oerjuek@quack3>
References: <39591663-9151-42f9-9906-4684acaa685c@gmail.com>
 <20240715172826.wbmlg52ckdxze7sg@quack3>
 <9aec9df8-ca82-4b2f-b227-5e318c66b97e@gmail.com>
 <20240717154434.jba66jupaf566tes@quack3>
 <83c22d71-8706-4779-8d20-6b18a75c95a5@gmail.com>
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83c22d71-8706-4779-8d20-6b18a75c95a5@gmail.com>
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.80
X-Spam-Level: 

On Thu 18-07-24 00:14:24, Mirsad Todorovac wrote:
> 
> 
> On 7/17/24 17:44, Jan Kara wrote:
> > On Tue 16-07-24 19:17:05, Mirsad Todorovac wrote:
> >> On 7/15/24 19:28, Jan Kara wrote:
> >>> Hello Mirsad!
> >>>
> >>> On Wed 10-07-24 20:09:27, Mirsad Todorovac wrote:
> >>>> On the linux-next vanilla next-20240709 tree, I have attempted the seed KCONFIG_SEED=0xEE7AB52F
> >>>> which was known from before to trigger various errors in compile and build process.
> >>>>
> >>>> Though this might seem as contributing to channel noise, Linux refuses to build this config,
> >>>> treating warnings as errors, using this build line:
> >>>>
> >>>> $ time nice make W=1 -k -j 36 |& tee ../err-next-20230709-01a.log; date
> >>>>
> >>>> As I know that the Chief Penguin doesn't like warnings, but I am also aware that there are plenty
> >>>> left, there seems to be more tedious work ahead to make the compilers happy.
> >>>>
> >>>> The compiler output is:
> >>>>
> >>>> ---------------------------------------------------------------------------------------------------------
> >>>> fs/reiserfs/do_balan.c: In function ‘balance_leaf_new_nodes_paste_whole’:
> >>>> fs/reiserfs/do_balan.c:1147:13: error: variable ‘leaf_mi’ set but not used [-Werror=unused-but-set-variable]
> >>>>  1147 |         int leaf_mi;
> >>>>       |             ^~~~~~~
> >>>
> >>> Frankly, I wouldn't bother with reiserfs. The warning is there for ages,
> >>> the code is going to get removed in two releases, so I guess we can live
> >>> with these warnings for a few more months...
> >>
> >> In essence I agree with you, but for sentimental reasons I would like to
> >> keep it because it is my first journaling Linux system on Knoppix 🙂
> > 
> > As much as I understand your sentiment (I have a bit of history with that
> > fs as well) the maintenance cost isn't really worth it and most fs folks
> > will celebrate when it's removed. We have already announced the removal
> > year and half ago and I'm fully for executing that plan at the end of this
> > year.
> > 
> >> Patch is also simple and a no-brainer, as proposed by Mr. Cook:
> >>
> >> -------------------------------><------------------------------------------
> >> diff --git a/fs/reiserfs/do_balan.c b/fs/reiserfs/do_balan.c
> >> index 5129efc6f2e6..fbe73f267853 100644
> >> --- a/fs/reiserfs/do_balan.c
> >> +++ b/fs/reiserfs/do_balan.c
> >> @@ -1144,7 +1144,9 @@ static void balance_leaf_new_nodes_paste_whole(struct tree_balance *tb,
> >>  {
> >>  	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
> >>  	int n = B_NR_ITEMS(tbS0);
> >> +#ifdef CONFIG_REISERFS_CHECK
> >>  	int leaf_mi;
> >> +#endif
> > 
> > Well, I would not like this even for actively maintained code ;) If you
> > want to silence these warnings in this dead code, then I could live with
> > something like:
> > 
> > #if defined( CONFIG_REISERFS_CHECK )
> > #define RFALSE(cond, format, args...) __RASSERT(!(cond), ....)
> > #else
> > - #define RFALSE( cond, format, args... ) do {;} while( 0 )
> > + #define RFALSE( cond, format, args... ) do { (void)cond; } while( 0 )
> > #endif
> 
> Yes, one line change is much smarter than 107 line patch of mine :-)
> 
> Verified, and this line solved all the warnings:
> 
>   CC      fs/reiserfs/bitmap.o
>   CC      fs/reiserfs/do_balan.o
>   CC      fs/reiserfs/namei.o
>   CC      fs/reiserfs/inode.o
>   CC      fs/reiserfs/file.o
>   CC      fs/reiserfs/dir.o
>   CC      fs/reiserfs/fix_node.o
>   CC      fs/reiserfs/super.o
>   CC      fs/reiserfs/prints.o
>   CC      fs/reiserfs/objectid.o
>   CC      fs/reiserfs/lbalance.o
>   CC      fs/reiserfs/ibalance.o
>   CC      fs/reiserfs/stree.o
>   CC      fs/reiserfs/hashes.o
>   CC      fs/reiserfs/tail_conversion.o
>   CC      fs/reiserfs/journal.o
>   CC      fs/reiserfs/resize.o
>   CC      fs/reiserfs/item_ops.o
>   CC      fs/reiserfs/ioctl.o
>   CC      fs/reiserfs/xattr.o
>   CC      fs/reiserfs/lock.o
>   CC      fs/reiserfs/procfs.o
>   AR      fs/reiserfs/built-in.a
> 
> Just FWIW, back then in year 2000/2001 a journaling file system on my
> Knoppix box was a quantum leap - it would simply replay the journal if
> there was a power loss before shutdown. No several minutes of fsck.

Well, there was also ext3 at that time already :-) That's where I became
familiar with the idea of journalling. Reiserfs was interesting to me
because of completely different approach to on-disk format (b-tree with
formatted items), packing of small files / file tails (interesting in 2000,
not so much 20 years later) and reasonable scalability for large
directories.

> I think your idea is great and if you wish a patch could be submitted
> after the merge window.

I'll leave it up to you. If the warnings annoy you, send the patch along
the lines I've proposed (BTW (void)cond should better be (void)(cond) for
macro safety) and I'll push it to Linus.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

