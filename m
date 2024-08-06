Return-Path: <reiserfs-devel+bounces-147-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 523E4948B44
	for <lists+reiserfs-devel@lfdr.de>; Tue,  6 Aug 2024 10:26:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 139A7287477
	for <lists+reiserfs-devel@lfdr.de>; Tue,  6 Aug 2024 08:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA7FE1BD006;
	Tue,  6 Aug 2024 08:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="MPre/Vk8";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="uEoBcGmZ";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="MPre/Vk8";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="uEoBcGmZ"
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406651BD013;
	Tue,  6 Aug 2024 08:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722932763; cv=none; b=mcgboYDDAQYY0bl02cUN2lW8UzF3v6a1hIvhxjEcNgeS/uJSelwSlZx9NIDM5axkH1Re8hq7rKOF/nCa5MohJt2QtPWjNp80NYIehsORzHUIH5d5rViqBoX70I1ashOMczGe2k29pYVcJsSmP3aVVeUXjAlM/p3Fp6u3zaubKmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722932763; c=relaxed/simple;
	bh=Uxq8yj0YGBfIwNGoCiqKWcjoXClhZfUdV7Ik356EHQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qeKPSXUwoSKjvP8ZD8rowC/OgsCkWOf9m4QCyVbz5XeJPWHj4f70gGpWsTWfIxZqw9sx5atAseeYqzs0X8IWR72mnLldEOjWh+GiDeI0wcdDNCcErmrd/TkZyH9Yz5r/PEKLOyo6SRURY3y7MV6nRKUlOv1U1DK/iXjAXYUbz9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=MPre/Vk8; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=uEoBcGmZ; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=MPre/Vk8; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=uEoBcGmZ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4B2061F8D9;
	Tue,  6 Aug 2024 08:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1722932759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3zFLW3UmxKUVVXjIggs++B4K08fotJs+XXT3n0klgn8=;
	b=MPre/Vk8Sc5pln8aK3+Jq/1MRwUaSFiWmNBSNaEEqz9z2BxLQjlJaMQvwXuEs5GaD3WhbL
	GlyIzELm9WFI65ULaH0ciWyyR/uODHOCidorvO6Ty+UhihoHvzIYuViK//m6eE4KkpWXBx
	lFFF3NzX3WksuwpsujiB4yFgc4Gntu8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1722932759;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3zFLW3UmxKUVVXjIggs++B4K08fotJs+XXT3n0klgn8=;
	b=uEoBcGmZF1VoYusw7QT8Zb98ADYsV7Jwry6aC82vLjkTaERH2RAPV708OoZmrCZLEQlEwY
	VYUiCedJ+wY9caCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b="MPre/Vk8";
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=uEoBcGmZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1722932759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3zFLW3UmxKUVVXjIggs++B4K08fotJs+XXT3n0klgn8=;
	b=MPre/Vk8Sc5pln8aK3+Jq/1MRwUaSFiWmNBSNaEEqz9z2BxLQjlJaMQvwXuEs5GaD3WhbL
	GlyIzELm9WFI65ULaH0ciWyyR/uODHOCidorvO6Ty+UhihoHvzIYuViK//m6eE4KkpWXBx
	lFFF3NzX3WksuwpsujiB4yFgc4Gntu8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1722932759;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3zFLW3UmxKUVVXjIggs++B4K08fotJs+XXT3n0klgn8=;
	b=uEoBcGmZF1VoYusw7QT8Zb98ADYsV7Jwry6aC82vLjkTaERH2RAPV708OoZmrCZLEQlEwY
	VYUiCedJ+wY9caCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3FC5313770;
	Tue,  6 Aug 2024 08:25:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NhKODxfesWYpawAAD6G6ig
	(envelope-from <jack@suse.cz>); Tue, 06 Aug 2024 08:25:59 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id DD05BA0762; Tue,  6 Aug 2024 10:25:58 +0200 (CEST)
Date: Tue, 6 Aug 2024 10:25:58 +0200
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
Message-ID: <20240806082558.ytq673mhuji32koz@quack3>
References: <39591663-9151-42f9-9906-4684acaa685c@gmail.com>
 <20240715172826.wbmlg52ckdxze7sg@quack3>
 <9aec9df8-ca82-4b2f-b227-5e318c66b97e@gmail.com>
 <20240717154434.jba66jupaf566tes@quack3>
 <83c22d71-8706-4779-8d20-6b18a75c95a5@gmail.com>
 <20240718093943.qtyc2bdt4oerjuek@quack3>
 <25a65d69-5f04-433b-a5a3-5fd8dbe787aa@gmail.com>
 <20240805130415.ws3t7sgvcg7cj5ev@quack3>
 <38de6ac2-a7d8-41dc-a065-68ce60d5b662@gmail.com>
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <38de6ac2-a7d8-41dc-a065-68ce60d5b662@gmail.com>
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.01 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -1.01
X-Rspamd-Queue-Id: 4B2061F8D9

On Mon 05-08-24 23:24:06, Mirsad Todorovac wrote:
> On 8/5/24 15:04, Jan Kara wrote:
> > On Fri 02-08-24 18:31:46, Mirsad Todorovac wrote:
> >> On 7/18/24 11:39, Jan Kara wrote:
> >>> On Thu 18-07-24 00:14:24, Mirsad Todorovac wrote:
> >>>>
> >>>>
> >>>> On 7/17/24 17:44, Jan Kara wrote:
> >>>>> On Tue 16-07-24 19:17:05, Mirsad Todorovac wrote:
> >>>>>> On 7/15/24 19:28, Jan Kara wrote:
> >>>>>>> Hello Mirsad!
> >>>>>>>
> >>>>>>> On Wed 10-07-24 20:09:27, Mirsad Todorovac wrote:
> >>>>>>>> On the linux-next vanilla next-20240709 tree, I have attempted the seed KCONFIG_SEED=0xEE7AB52F
> >>>>>>>> which was known from before to trigger various errors in compile and build process.
> >>>>>>>>
> >>>>>>>> Though this might seem as contributing to channel noise, Linux refuses to build this config,
> >>>>>>>> treating warnings as errors, using this build line:
> >>>>>>>>
> >>>>>>>> $ time nice make W=1 -k -j 36 |& tee ../err-next-20230709-01a.log; date
> >>>>>>>>
> >>>>>>>> As I know that the Chief Penguin doesn't like warnings, but I am also aware that there are plenty
> >>>>>>>> left, there seems to be more tedious work ahead to make the compilers happy.
> >>>>>>>>
> >>>>>>>> The compiler output is:
> >>>>>>>>
> >>>>>>>> ---------------------------------------------------------------------------------------------------------
> >>>>>>>> fs/reiserfs/do_balan.c: In function ‘balance_leaf_new_nodes_paste_whole’:
> >>>>>>>> fs/reiserfs/do_balan.c:1147:13: error: variable ‘leaf_mi’ set but not used [-Werror=unused-but-set-variable]
> >>>>>>>>  1147 |         int leaf_mi;
> >>>>>>>>       |             ^~~~~~~
> >>>>>>>
> >>>>>>> Frankly, I wouldn't bother with reiserfs. The warning is there for ages,
> >>>>>>> the code is going to get removed in two releases, so I guess we can live
> >>>>>>> with these warnings for a few more months...
> >>>>>>
> >>>>>> In essence I agree with you, but for sentimental reasons I would like to
> >>>>>> keep it because it is my first journaling Linux system on Knoppix 🙂
> >>>>>
> >>>>> As much as I understand your sentiment (I have a bit of history with that
> >>>>> fs as well) the maintenance cost isn't really worth it and most fs folks
> >>>>> will celebrate when it's removed. We have already announced the removal
> >>>>> year and half ago and I'm fully for executing that plan at the end of this
> >>>>> year.
> >>>>>
> >>>>>> Patch is also simple and a no-brainer, as proposed by Mr. Cook:
> >>>>>>
> >>>>>> -------------------------------><------------------------------------------
> >>>>>> diff --git a/fs/reiserfs/do_balan.c b/fs/reiserfs/do_balan.c
> >>>>>> index 5129efc6f2e6..fbe73f267853 100644
> >>>>>> --- a/fs/reiserfs/do_balan.c
> >>>>>> +++ b/fs/reiserfs/do_balan.c
> >>>>>> @@ -1144,7 +1144,9 @@ static void balance_leaf_new_nodes_paste_whole(struct tree_balance *tb,
> >>>>>>  {
> >>>>>>  	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
> >>>>>>  	int n = B_NR_ITEMS(tbS0);
> >>>>>> +#ifdef CONFIG_REISERFS_CHECK
> >>>>>>  	int leaf_mi;
> >>>>>> +#endif
> >>>>>
> >>>>> Well, I would not like this even for actively maintained code ;) If you
> >>>>> want to silence these warnings in this dead code, then I could live with
> >>>>> something like:
> >>>>>
> >>>>> #if defined( CONFIG_REISERFS_CHECK )
> >>>>> #define RFALSE(cond, format, args...) __RASSERT(!(cond), ....)
> >>>>> #else
> >>>>> - #define RFALSE( cond, format, args... ) do {;} while( 0 )
> >>>>> + #define RFALSE( cond, format, args... ) do { (void)cond; } while( 0 )
> >>>>> #endif
> >>>>
> >>>> Yes, one line change is much smarter than 107 line patch of mine :-)
> >>>>
> >>>> Verified, and this line solved all the warnings:
> >>>>
> >>>>   CC      fs/reiserfs/bitmap.o
> >>>>   CC      fs/reiserfs/do_balan.o
> >>>>   CC      fs/reiserfs/namei.o
> >>>>   CC      fs/reiserfs/inode.o
> >>>>   CC      fs/reiserfs/file.o
> >>>>   CC      fs/reiserfs/dir.o
> >>>>   CC      fs/reiserfs/fix_node.o
> >>>>   CC      fs/reiserfs/super.o
> >>>>   CC      fs/reiserfs/prints.o
> >>>>   CC      fs/reiserfs/objectid.o
> >>>>   CC      fs/reiserfs/lbalance.o
> >>>>   CC      fs/reiserfs/ibalance.o
> >>>>   CC      fs/reiserfs/stree.o
> >>>>   CC      fs/reiserfs/hashes.o
> >>>>   CC      fs/reiserfs/tail_conversion.o
> >>>>   CC      fs/reiserfs/journal.o
> >>>>   CC      fs/reiserfs/resize.o
> >>>>   CC      fs/reiserfs/item_ops.o
> >>>>   CC      fs/reiserfs/ioctl.o
> >>>>   CC      fs/reiserfs/xattr.o
> >>>>   CC      fs/reiserfs/lock.o
> >>>>   CC      fs/reiserfs/procfs.o
> >>>>   AR      fs/reiserfs/built-in.a
> >>>>
> >>>> Just FWIW, back then in year 2000/2001 a journaling file system on my
> >>>> Knoppix box was a quantum leap - it would simply replay the journal if
> >>>> there was a power loss before shutdown. No several minutes of fsck.
> >>>
> >>> Well, there was also ext3 at that time already :-) That's where I became
> >>> familiar with the idea of journalling. Reiserfs was interesting to me
> >>> because of completely different approach to on-disk format (b-tree with
> >>> formatted items), packing of small files / file tails (interesting in 2000,
> >>> not so much 20 years later) and reasonable scalability for large
> >>> directories.
> >>>
> >>>> I think your idea is great and if you wish a patch could be submitted
> >>>> after the merge window.
> >>>
> >>> I'll leave it up to you. If the warnings annoy you, send the patch along
> >>> the lines I've proposed (BTW (void)cond should better be (void)(cond) for
> >>> macro safety) and I'll push it to Linus.
> >>>
> >>> 								Honza
> >>
> >> Hi, Jan,
> >>
> >> After a short break, I just tried a full build with this hack against the vanilla
> >> linux-next tree:
> >>
> >> #define RFALSE( cond, format, args... ) do { (void)(cond); } while( 0 )
> >>
> >> and it breaks at least here:
> >>
> >> In file included from fs/reiserfs/do_balan.c:15:
> >> fs/reiserfs/do_balan.c: In function ‘balance_leaf_when_delete_del’:
> >> fs/reiserfs/do_balan.c:86:28: error: ‘ih’ undeclared (first use in this function)
> >>    86 |         RFALSE(ih_item_len(ih) + IH_SIZE != -tb->insert_size[0],
> >>       |                            ^~
> >> fs/reiserfs/reiserfs.h:919:54: note: in definition of macro ‘RFALSE’
> >>   919 | #define RFALSE( cond, format, args... ) do { (void) (cond); } while( 0 )
> >>       |                                                      ^~~~
> >> ./include/linux/byteorder/generic.h:91:21: note: in expansion of macro ‘__le16_to_cpu’
> >>    91 | #define le16_to_cpu __le16_to_cpu
> >>       |                     ^~~~~~~~~~~~~
> >> fs/reiserfs/do_balan.c:86:16: note: in expansion of macro ‘ih_item_len’
> >>    86 |         RFALSE(ih_item_len(ih) + IH_SIZE != -tb->insert_size[0],
> >>       |                ^~~~~~~~~~~
> >> fs/reiserfs/do_balan.c:86:28: note: each undeclared identifier is reported only once for each function it appears in
> >>    86 |         RFALSE(ih_item_len(ih) + IH_SIZE != -tb->insert_size[0],
> >>       |                            ^~
> >> fs/reiserfs/reiserfs.h:919:54: note: in definition of macro ‘RFALSE’
> >>   919 | #define RFALSE( cond, format, args... ) do { (void) (cond); } while( 0 )
> >>       |                                                      ^~~~
> >> ./include/linux/byteorder/generic.h:91:21: note: in expansion of macro ‘__le16_to_cpu’
> >>    91 | #define le16_to_cpu __le16_to_cpu
> >>       |                     ^~~~~~~~~~~~~
> >> fs/reiserfs/do_balan.c:86:16: note: in expansion of macro ‘ih_item_len’
> >>    86 |         RFALSE(ih_item_len(ih) + IH_SIZE != -tb->insert_size[0],
> >>       |                ^~~~~~~~~~~
> >> fs/reiserfs/do_balan.c: In function ‘do_balance_starts’:
> >> fs/reiserfs/do_balan.c:1800:16: error: implicit declaration of function ‘check_before_balancing’ [-Werror=implicit-function-declaration]
> >>  1800 |         RFALSE(check_before_balancing(tb), "PAP-12340: locked buffers in TB");
> >>       |                ^~~~~~~~~~~~~~~~~~~~~~
> >> fs/reiserfs/reiserfs.h:919:54: note: in definition of macro ‘RFALSE’
> >>   919 | #define RFALSE( cond, format, args... ) do { (void) (cond); } while( 0 )
> >>       |                                                      ^~~~
> >> cc1: some warnings being treated as errors
> >> make[7]: *** [scripts/Makefile.build:244: fs/reiserfs/do_balan.o] Error 1
> >>   CC [M]  fs/reiserfs/stree.o
> >> In file included from fs/reiserfs/stree.c:15:
> >> fs/reiserfs/stree.c: In function ‘reiserfs_delete_item’:
> >> fs/reiserfs/stree.c:1283:24: error: ‘mode’ undeclared (first use in this function)
> >>  1283 |                 RFALSE(mode != M_DELETE, "PAP-5320: mode must be M_DELETE");
> >>       |                        ^~~~
> >> fs/reiserfs/reiserfs.h:919:54: note: in definition of macro ‘RFALSE’
> >>   919 | #define RFALSE( cond, format, args... ) do { (void) (cond); } while( 0 )
> >>       |                                                      ^~~~
> >> fs/reiserfs/stree.c:1283:24: note: each undeclared identifier is reported only once for each function it appears in
> >>  1283 |                 RFALSE(mode != M_DELETE, "PAP-5320: mode must be M_DELETE");
> >>       |                        ^~~~
> >> fs/reiserfs/reiserfs.h:919:54: note: in definition of macro ‘RFALSE’
> >>   919 | #define RFALSE( cond, format, args... ) do { (void) (cond); } while( 0 )
> >>       |                                                      ^~~~
> >>
> >> Last time it compiled, but now it expects variables in (void)(cond) expressions to be defined.
> >>
> >> I have try to fix those warnings, submitting the patch for review:
> > 
> > Yeah, this looks ok to me.
> > 
> > 								Honza
> 
> Hi, Jan,
> 
> As I understood from the previous experiences, and the Code of Conduct,
> and explicit Reviwed-by: or Acked-by: is required ...
> 
> Or otherwise, the Suggested-by: is used?

So I was waiting for you to submit official patch with proper changelog and
your Signed-off-by. Then I can pick up the patch into my tree and merge it. 

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

