Return-Path: <reiserfs-devel+bounces-145-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FC8947B7E
	for <lists+reiserfs-devel@lfdr.de>; Mon,  5 Aug 2024 15:04:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B42F281368
	for <lists+reiserfs-devel@lfdr.de>; Mon,  5 Aug 2024 13:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5EBE15574D;
	Mon,  5 Aug 2024 13:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="j/xALSw8";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="IhU7sGKh";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="j/xALSw8";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="IhU7sGKh"
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C85B1E480;
	Mon,  5 Aug 2024 13:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722863059; cv=none; b=XwyT+bbuOnN3InyPAvWezbzszqIoekAZ2jIrw5aJlwc+rb078n+5yMu4gmgrO7Gc8LS1iqNpRtkDR9uZjE/FdQqozena8coP57bbpd/RjNaKgim6OuhUGUGWNHPZ3wwWLYQw/h4p9tp5V2QfXWCCEFnqnFwy6k1Eics1G3Yl4Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722863059; c=relaxed/simple;
	bh=XYQQ6LJlwFBWw949qXr7JW6cXteSwDtp9kEE51OZzuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NRn9/vAlYiCMixP0kAVQiXVSjQC+SGbTi5255q6sRTkeOKjpnCV9sJVHIwyweYKlf/DsO4P8FOvtN9VKZch0EBV/PCzVZk9VzZBwijimGgxGzN9poGHSDh+nKr6UqLN4ea2uRCH3Nkoxg2hj28B0JruLYVeZAQ2tUlCpdCufGIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=j/xALSw8; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=IhU7sGKh; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=j/xALSw8; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=IhU7sGKh; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 728C51F841;
	Mon,  5 Aug 2024 13:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1722863055; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sy3xp0xbaC8sxYhlRHiFLinRg2QoXYVKIFuU4sh80MU=;
	b=j/xALSw8NrsI3flxvag2GHEx/0VvON9hs37fM7A/fHbKwHvMYMV4x7hCRTiHLTd9fJ9zC5
	2H1fVkQSa6dVhp+a2U1U3yVcdPiMUp6vgPf5gKcyXIx7pCdyEz6vjbivingN3ADyQSWN35
	X5MguleYbl2mVIbparjBq7ZtyPLaaIc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1722863055;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sy3xp0xbaC8sxYhlRHiFLinRg2QoXYVKIFuU4sh80MU=;
	b=IhU7sGKhnOhuHp5ghK2mnoHKqMsDEgdo6UPoBSuNxYq6vuzq9Ky0Zdy/XygrHeIuw1XOV9
	jsbm7757XVDtgPAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1722863055; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sy3xp0xbaC8sxYhlRHiFLinRg2QoXYVKIFuU4sh80MU=;
	b=j/xALSw8NrsI3flxvag2GHEx/0VvON9hs37fM7A/fHbKwHvMYMV4x7hCRTiHLTd9fJ9zC5
	2H1fVkQSa6dVhp+a2U1U3yVcdPiMUp6vgPf5gKcyXIx7pCdyEz6vjbivingN3ADyQSWN35
	X5MguleYbl2mVIbparjBq7ZtyPLaaIc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1722863055;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sy3xp0xbaC8sxYhlRHiFLinRg2QoXYVKIFuU4sh80MU=;
	b=IhU7sGKhnOhuHp5ghK2mnoHKqMsDEgdo6UPoBSuNxYq6vuzq9Ky0Zdy/XygrHeIuw1XOV9
	jsbm7757XVDtgPAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 647DC13ACF;
	Mon,  5 Aug 2024 13:04:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tLmCGM/NsGYIMgAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 05 Aug 2024 13:04:15 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 1642DA0897; Mon,  5 Aug 2024 15:04:15 +0200 (CEST)
Date: Mon, 5 Aug 2024 15:04:15 +0200
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
Message-ID: <20240805130415.ws3t7sgvcg7cj5ev@quack3>
References: <39591663-9151-42f9-9906-4684acaa685c@gmail.com>
 <20240715172826.wbmlg52ckdxze7sg@quack3>
 <9aec9df8-ca82-4b2f-b227-5e318c66b97e@gmail.com>
 <20240717154434.jba66jupaf566tes@quack3>
 <83c22d71-8706-4779-8d20-6b18a75c95a5@gmail.com>
 <20240718093943.qtyc2bdt4oerjuek@quack3>
 <25a65d69-5f04-433b-a5a3-5fd8dbe787aa@gmail.com>
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25a65d69-5f04-433b-a5a3-5fd8dbe787aa@gmail.com>
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-0.998];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.80
X-Spam-Flag: NO
X-Spam-Level: 

On Fri 02-08-24 18:31:46, Mirsad Todorovac wrote:
> On 7/18/24 11:39, Jan Kara wrote:
> > On Thu 18-07-24 00:14:24, Mirsad Todorovac wrote:
> >>
> >>
> >> On 7/17/24 17:44, Jan Kara wrote:
> >>> On Tue 16-07-24 19:17:05, Mirsad Todorovac wrote:
> >>>> On 7/15/24 19:28, Jan Kara wrote:
> >>>>> Hello Mirsad!
> >>>>>
> >>>>> On Wed 10-07-24 20:09:27, Mirsad Todorovac wrote:
> >>>>>> On the linux-next vanilla next-20240709 tree, I have attempted the seed KCONFIG_SEED=0xEE7AB52F
> >>>>>> which was known from before to trigger various errors in compile and build process.
> >>>>>>
> >>>>>> Though this might seem as contributing to channel noise, Linux refuses to build this config,
> >>>>>> treating warnings as errors, using this build line:
> >>>>>>
> >>>>>> $ time nice make W=1 -k -j 36 |& tee ../err-next-20230709-01a.log; date
> >>>>>>
> >>>>>> As I know that the Chief Penguin doesn't like warnings, but I am also aware that there are plenty
> >>>>>> left, there seems to be more tedious work ahead to make the compilers happy.
> >>>>>>
> >>>>>> The compiler output is:
> >>>>>>
> >>>>>> ---------------------------------------------------------------------------------------------------------
> >>>>>> fs/reiserfs/do_balan.c: In function ‘balance_leaf_new_nodes_paste_whole’:
> >>>>>> fs/reiserfs/do_balan.c:1147:13: error: variable ‘leaf_mi’ set but not used [-Werror=unused-but-set-variable]
> >>>>>>  1147 |         int leaf_mi;
> >>>>>>       |             ^~~~~~~
> >>>>>
> >>>>> Frankly, I wouldn't bother with reiserfs. The warning is there for ages,
> >>>>> the code is going to get removed in two releases, so I guess we can live
> >>>>> with these warnings for a few more months...
> >>>>
> >>>> In essence I agree with you, but for sentimental reasons I would like to
> >>>> keep it because it is my first journaling Linux system on Knoppix 🙂
> >>>
> >>> As much as I understand your sentiment (I have a bit of history with that
> >>> fs as well) the maintenance cost isn't really worth it and most fs folks
> >>> will celebrate when it's removed. We have already announced the removal
> >>> year and half ago and I'm fully for executing that plan at the end of this
> >>> year.
> >>>
> >>>> Patch is also simple and a no-brainer, as proposed by Mr. Cook:
> >>>>
> >>>> -------------------------------><------------------------------------------
> >>>> diff --git a/fs/reiserfs/do_balan.c b/fs/reiserfs/do_balan.c
> >>>> index 5129efc6f2e6..fbe73f267853 100644
> >>>> --- a/fs/reiserfs/do_balan.c
> >>>> +++ b/fs/reiserfs/do_balan.c
> >>>> @@ -1144,7 +1144,9 @@ static void balance_leaf_new_nodes_paste_whole(struct tree_balance *tb,
> >>>>  {
> >>>>  	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
> >>>>  	int n = B_NR_ITEMS(tbS0);
> >>>> +#ifdef CONFIG_REISERFS_CHECK
> >>>>  	int leaf_mi;
> >>>> +#endif
> >>>
> >>> Well, I would not like this even for actively maintained code ;) If you
> >>> want to silence these warnings in this dead code, then I could live with
> >>> something like:
> >>>
> >>> #if defined( CONFIG_REISERFS_CHECK )
> >>> #define RFALSE(cond, format, args...) __RASSERT(!(cond), ....)
> >>> #else
> >>> - #define RFALSE( cond, format, args... ) do {;} while( 0 )
> >>> + #define RFALSE( cond, format, args... ) do { (void)cond; } while( 0 )
> >>> #endif
> >>
> >> Yes, one line change is much smarter than 107 line patch of mine :-)
> >>
> >> Verified, and this line solved all the warnings:
> >>
> >>   CC      fs/reiserfs/bitmap.o
> >>   CC      fs/reiserfs/do_balan.o
> >>   CC      fs/reiserfs/namei.o
> >>   CC      fs/reiserfs/inode.o
> >>   CC      fs/reiserfs/file.o
> >>   CC      fs/reiserfs/dir.o
> >>   CC      fs/reiserfs/fix_node.o
> >>   CC      fs/reiserfs/super.o
> >>   CC      fs/reiserfs/prints.o
> >>   CC      fs/reiserfs/objectid.o
> >>   CC      fs/reiserfs/lbalance.o
> >>   CC      fs/reiserfs/ibalance.o
> >>   CC      fs/reiserfs/stree.o
> >>   CC      fs/reiserfs/hashes.o
> >>   CC      fs/reiserfs/tail_conversion.o
> >>   CC      fs/reiserfs/journal.o
> >>   CC      fs/reiserfs/resize.o
> >>   CC      fs/reiserfs/item_ops.o
> >>   CC      fs/reiserfs/ioctl.o
> >>   CC      fs/reiserfs/xattr.o
> >>   CC      fs/reiserfs/lock.o
> >>   CC      fs/reiserfs/procfs.o
> >>   AR      fs/reiserfs/built-in.a
> >>
> >> Just FWIW, back then in year 2000/2001 a journaling file system on my
> >> Knoppix box was a quantum leap - it would simply replay the journal if
> >> there was a power loss before shutdown. No several minutes of fsck.
> > 
> > Well, there was also ext3 at that time already :-) That's where I became
> > familiar with the idea of journalling. Reiserfs was interesting to me
> > because of completely different approach to on-disk format (b-tree with
> > formatted items), packing of small files / file tails (interesting in 2000,
> > not so much 20 years later) and reasonable scalability for large
> > directories.
> > 
> >> I think your idea is great and if you wish a patch could be submitted
> >> after the merge window.
> > 
> > I'll leave it up to you. If the warnings annoy you, send the patch along
> > the lines I've proposed (BTW (void)cond should better be (void)(cond) for
> > macro safety) and I'll push it to Linus.
> > 
> > 								Honza
> 
> Hi, Jan,
> 
> After a short break, I just tried a full build with this hack against the vanilla
> linux-next tree:
> 
> #define RFALSE( cond, format, args... ) do { (void)(cond); } while( 0 )
> 
> and it breaks at least here:
> 
> In file included from fs/reiserfs/do_balan.c:15:
> fs/reiserfs/do_balan.c: In function ‘balance_leaf_when_delete_del’:
> fs/reiserfs/do_balan.c:86:28: error: ‘ih’ undeclared (first use in this function)
>    86 |         RFALSE(ih_item_len(ih) + IH_SIZE != -tb->insert_size[0],
>       |                            ^~
> fs/reiserfs/reiserfs.h:919:54: note: in definition of macro ‘RFALSE’
>   919 | #define RFALSE( cond, format, args... ) do { (void) (cond); } while( 0 )
>       |                                                      ^~~~
> ./include/linux/byteorder/generic.h:91:21: note: in expansion of macro ‘__le16_to_cpu’
>    91 | #define le16_to_cpu __le16_to_cpu
>       |                     ^~~~~~~~~~~~~
> fs/reiserfs/do_balan.c:86:16: note: in expansion of macro ‘ih_item_len’
>    86 |         RFALSE(ih_item_len(ih) + IH_SIZE != -tb->insert_size[0],
>       |                ^~~~~~~~~~~
> fs/reiserfs/do_balan.c:86:28: note: each undeclared identifier is reported only once for each function it appears in
>    86 |         RFALSE(ih_item_len(ih) + IH_SIZE != -tb->insert_size[0],
>       |                            ^~
> fs/reiserfs/reiserfs.h:919:54: note: in definition of macro ‘RFALSE’
>   919 | #define RFALSE( cond, format, args... ) do { (void) (cond); } while( 0 )
>       |                                                      ^~~~
> ./include/linux/byteorder/generic.h:91:21: note: in expansion of macro ‘__le16_to_cpu’
>    91 | #define le16_to_cpu __le16_to_cpu
>       |                     ^~~~~~~~~~~~~
> fs/reiserfs/do_balan.c:86:16: note: in expansion of macro ‘ih_item_len’
>    86 |         RFALSE(ih_item_len(ih) + IH_SIZE != -tb->insert_size[0],
>       |                ^~~~~~~~~~~
> fs/reiserfs/do_balan.c: In function ‘do_balance_starts’:
> fs/reiserfs/do_balan.c:1800:16: error: implicit declaration of function ‘check_before_balancing’ [-Werror=implicit-function-declaration]
>  1800 |         RFALSE(check_before_balancing(tb), "PAP-12340: locked buffers in TB");
>       |                ^~~~~~~~~~~~~~~~~~~~~~
> fs/reiserfs/reiserfs.h:919:54: note: in definition of macro ‘RFALSE’
>   919 | #define RFALSE( cond, format, args... ) do { (void) (cond); } while( 0 )
>       |                                                      ^~~~
> cc1: some warnings being treated as errors
> make[7]: *** [scripts/Makefile.build:244: fs/reiserfs/do_balan.o] Error 1
>   CC [M]  fs/reiserfs/stree.o
> In file included from fs/reiserfs/stree.c:15:
> fs/reiserfs/stree.c: In function ‘reiserfs_delete_item’:
> fs/reiserfs/stree.c:1283:24: error: ‘mode’ undeclared (first use in this function)
>  1283 |                 RFALSE(mode != M_DELETE, "PAP-5320: mode must be M_DELETE");
>       |                        ^~~~
> fs/reiserfs/reiserfs.h:919:54: note: in definition of macro ‘RFALSE’
>   919 | #define RFALSE( cond, format, args... ) do { (void) (cond); } while( 0 )
>       |                                                      ^~~~
> fs/reiserfs/stree.c:1283:24: note: each undeclared identifier is reported only once for each function it appears in
>  1283 |                 RFALSE(mode != M_DELETE, "PAP-5320: mode must be M_DELETE");
>       |                        ^~~~
> fs/reiserfs/reiserfs.h:919:54: note: in definition of macro ‘RFALSE’
>   919 | #define RFALSE( cond, format, args... ) do { (void) (cond); } while( 0 )
>       |                                                      ^~~~
> 
> Last time it compiled, but now it expects variables in (void)(cond) expressions to be defined.
> 
> I have try to fix those warnings, submitting the patch for review:

Yeah, this looks ok to me.

								Honza

> 
> -------------------><---------------------------------------
> diff --git a/fs/reiserfs/do_balan.c b/fs/reiserfs/do_balan.c
> index 5129efc6f2e6..c8fa3d71ef63 100644
> --- a/fs/reiserfs/do_balan.c
> +++ b/fs/reiserfs/do_balan.c
> @@ -81,11 +81,11 @@ static void balance_leaf_when_delete_del(struct tree_balance *tb)
>         struct buffer_info bi;
>  #ifdef CONFIG_REISERFS_CHECK
>         struct item_head *ih = item_head(tbS0, item_pos);
> -#endif
>  
>         RFALSE(ih_item_len(ih) + IH_SIZE != -tb->insert_size[0],
>                "vs-12013: mode Delete, insert size %d, ih to be deleted %h",
>                -tb->insert_size[0], ih);
> +#endif
>  
>         buffer_info_init_tbS0(tb, &bi);
>         leaf_delete_items(&bi, 0, item_pos, 1, -1);
> @@ -1797,8 +1797,8 @@ static inline void do_balance_starts(struct tree_balance *tb)
>         print_tb(flag, PATH_LAST_POSITION(tb->tb_path),
>                  tb->tb_path->pos_in_item, tb, "check");
>         */
> -       RFALSE(check_before_balancing(tb), "PAP-12340: locked buffers in TB");
>  #ifdef CONFIG_REISERFS_CHECK
> +       RFALSE(check_before_balancing(tb), "PAP-12340: locked buffers in TB");
>         REISERFS_SB(tb->tb_sb)->cur_tb = tb;
>  #endif
>  }
> diff --git a/fs/reiserfs/reiserfs.h b/fs/reiserfs/reiserfs.h
> index f0e1f29f20ee..027e64853710 100644
> --- a/fs/reiserfs/reiserfs.h
> +++ b/fs/reiserfs/reiserfs.h
> @@ -916,7 +916,7 @@ do {                                                                        \
>  #if defined( CONFIG_REISERFS_CHECK )
>  #define RFALSE(cond, format, args...) __RASSERT(!(cond), "!(" #cond ")", format, ##args)
>  #else
> -#define RFALSE( cond, format, args... ) do {;} while( 0 )
> +#define RFALSE( cond, format, args... ) do { (void) (cond); } while( 0 )
>  #endif
>  
>  #define CONSTF __attribute_const__
> diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
> index 5faf702f8d15..eed1a461169e 100644
> --- a/fs/reiserfs/stree.c
> +++ b/fs/reiserfs/stree.c
> @@ -1280,7 +1280,9 @@ int reiserfs_delete_item(struct reiserfs_transaction_handle *th,
>                                               &del_size,
>                                               max_reiserfs_offset(inode));
>  
> +#ifdef CONFIG_REISERFS_CHECK
>                 RFALSE(mode != M_DELETE, "PAP-5320: mode must be M_DELETE");
> +#endif
>  
>                 copy_item_head(&s_ih, tp_item_head(path));
>                 s_del_balance.insert_size[0] = del_size;
> --
> 
> Thanks.
> 
> Best regards,
> Mirsad Todorovac
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

