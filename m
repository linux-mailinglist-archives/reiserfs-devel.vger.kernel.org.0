Return-Path: <reiserfs-devel+bounces-119-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C95A8C122B
	for <lists+reiserfs-devel@lfdr.de>; Thu,  9 May 2024 17:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3083D1C20FF2
	for <lists+reiserfs-devel@lfdr.de>; Thu,  9 May 2024 15:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B0EB16F274;
	Thu,  9 May 2024 15:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="BxCIL8g8";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="8ndoIYlx";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="WLHj8jA9";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="yY9aGTSq"
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2E716F282;
	Thu,  9 May 2024 15:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715269529; cv=none; b=eqIIWg7WT2AqnI5L4bCVatYfwcnafq58i7N9gqaLztRCYdp2Vv71NJ6wl4KsSS9KodMvnn4uIeG9ihAvA3UdiHGAjpIih4qztPfLdw0I67A+Xym/UgzPU2Dv3eGlHVnGsZokPOG+r9dh61p5hscxMPyUnFWFFQP1FVr0VjTZ2g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715269529; c=relaxed/simple;
	bh=tDLTQZAb9SG1XdjocUm4pDKCouH3nPrdmMzpJmOQmfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NLbJL16kwZLOPqh2DRoWgl1mSdSkMJml12+BoU8yvBB/IHlLBBwIlNNOhizDQRTHJqqk6dscnSXsROVVHg0IuekoHh5FnPDww4uRqM34QJ/6Gxb0G7hyHgaCgGQ3p3XZsYmlz6eiB6HKIeBZDDwelKZRhu8MT2u8IShB3XZMMJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=BxCIL8g8; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=8ndoIYlx; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=WLHj8jA9; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=yY9aGTSq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0655A5BE4C;
	Thu,  9 May 2024 15:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1715269525;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uHl1CT8N0tfpIcW5kJoxII7Vd1TSpSdEssxUnTvGgjA=;
	b=BxCIL8g8L3SE07XM4Tc5gLnSrv8ml4GZRwoPySghzYkEn69V7yCJETE7VKRty+ITVH3ED/
	56hP1zFB7UdcNwpS6GBwKk1ZpQySZ/oqhfH3Z/2RunXjwzB82nLqxAGks9lZXBXCmmRkLs
	XBx8djX7wZdNwfbbZDs6HLaTR7InyDM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1715269525;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uHl1CT8N0tfpIcW5kJoxII7Vd1TSpSdEssxUnTvGgjA=;
	b=8ndoIYlxlr6ojx4p8trp0/6zoOARhoxN8ABqMw8yXeYp8jzFbZ1ff+UJiHzQQBzB89BiHP
	EXUB5loMdcmLBdAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=WLHj8jA9;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=yY9aGTSq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1715269524;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uHl1CT8N0tfpIcW5kJoxII7Vd1TSpSdEssxUnTvGgjA=;
	b=WLHj8jA9is/QepOEATw5kVVLeWRsgS1ozPy4eamq0lksHouPMgYMXq6qgsHrvj+9F7UOx8
	rn6JEfkecjU1tVmUB3xGn3lSaaq6u5RPnu6PwvlI3V96BViMqu74ZAk72q39bH5TD7kAun
	DEx4tKs97MA3RttuTAer47E6j64Gojw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1715269524;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uHl1CT8N0tfpIcW5kJoxII7Vd1TSpSdEssxUnTvGgjA=;
	b=yY9aGTSqLFKut1egrKSMe4FP5Q2q2H+dmaMCqdEAzDYckZSo2kwtmxd7dtM5T0U9jk149+
	79mso5iv4hpa5SAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D8DEB13941;
	Thu,  9 May 2024 15:45:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IhOINJPvPGZWGQAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Thu, 09 May 2024 15:45:23 +0000
Date: Thu, 9 May 2024 17:45:20 +0200
From: David Sterba <dsterba@suse.cz>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Sam Sun <samsun1006219@gmail.com>, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, syzkaller-bugs@googlegroups.com,
	xrivendell7@gmail.com, reiserfs-devel@vger.kernel.org
Subject: Re: [Linux kernel bug] general protection fault in alloc_object
Message-ID: <20240509154520.GH13977@twin.jikos.cz>
Reply-To: dsterba@suse.cz
References: <CAEkJfYN_xh-zU-8ZgaSDdTgDejBv0uGHa_KW-Vi3CijZi5UZ+A@mail.gmail.com>
 <87pltwo056.ffs@tglx>
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pltwo056.ffs@tglx>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Level: 
X-Spamd-Result: default: False [-4.21 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linux-foundation.org,googlegroups.com];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[7];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.cz:replyto,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 0655A5BE4C
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -4.21

On Wed, May 08, 2024 at 04:20:53PM +0200, Thomas Gleixner wrote:
> On Tue, May 07 2024 at 14:32, Sam Sun wrote:
> > ```
> > general protection fault, probably for non-canonical address
> > 0xdffffc0040000001: 0000 [#1] PREEMPT SMP KASAN NOPTI
> > KASAN: probably user-memory-access in range
> > [0x0000000200000008-0x000000020000000f]
> 
> This is a reiserfs issue. It crashes at random places:
> 
> [  348.634665][ T5992] REISERFS (device loop0): Using tea hash to sort names
> [  348.780602][ T5993] (udev-worker)[5993]: segfault at 200000001 ip 0000000200000001 sp 00007fffca0e6190 error 14 in udevadm[5613a8f19000+1a000] likely on CPU 3 (core 0, socket 3)
> [  348.796165][ T5993] Code: Unable to access opcode bytes at 0x1ffffffd7.
> [  348.831600][ T5016] systemd-journald[5016]: /var/log/journal/a042c4e41bfd4c9697a628486ba7707d/system.journal: Journal file corrupted, rotating.
> [  348.840565][ T6004] systemd-udevd[6004]: segfault at 100040048 ip 00007fde601b58a3 sp 00007fffca0e6250 error 4 in libc.so.6[7fde60108000+155000] likely on CPU 5 (core 0, socket 5)
> [  348.844214][ T6004] Code: 89 10 49 8b b4 24 a8 10 00 00 eb 34 0f 1f 00 4c 8b 2d 69 f5 0f 00 64 45 8b 75 00 e8 27 42 fc ff e8 52 fe fa ff e9 01 fe ff ff <48> 8b 0a 48 8b 42 08 48 89 41 08 48 89 08 49 8b b4 24 a8 10 00 00
> [  356.765557][ T5992] ==================================================================
> [  356.767188][ T5992] BUG: unable to handle page fault for address: 0000000100040058
> [  356.767204][ T5992] #PF: supervisor read access in kernel mode
> [  356.767219][ T5992] #PF: error_code(0x0000) - not-present page
> [  356.767233][ T5992] PGD 80000004ca01f067 P4D 80000004ca01f067 PUD 0 
> [  356.767266][ T5992] Oops: 0000 [#1] PREEMPT SMP KASAN PTI
> [  356.767294][ T5992] CPU: 4 PID: 5992 Comm: a Not tainted 6.9.0-rc7-00012-gdccb07f2914c-dirty #43
> [  356.767325][ T5992] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [  356.767342][ T5992] RIP: 0010:stack_depot_save_flags+0x14b/0x8e0
> 
> Can we just get rid of this mess?

It's been on the deprecation and removal path, scheduled for 2025.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eb103a51640ee32ab01c51e13bf8fca211f25f61
I wouldn't be surpised if somebody sends a patch on 1.1. to do that.

