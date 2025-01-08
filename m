Return-Path: <reiserfs-devel+bounces-170-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A26A05F45
	for <lists+reiserfs-devel@lfdr.de>; Wed,  8 Jan 2025 15:47:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B83847A18F2
	for <lists+reiserfs-devel@lfdr.de>; Wed,  8 Jan 2025 14:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A051F9439;
	Wed,  8 Jan 2025 14:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="h1N7+SoM";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="QO2MUoot";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="h1N7+SoM";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="QO2MUoot"
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6943613B288;
	Wed,  8 Jan 2025 14:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736347552; cv=none; b=FquvLtbb3F68sAKwcsy7cUwKfAQqG76oKTbh3qsX/KOr599X3hLUa9v6a5JmDsS7r3QfI8knCKJrBRsfWXMIJObQusBrG2kGYDYrbM7qQIwqf8jzb31y6P+PTlFIWHw8p+2cKWUqIW5n/93PeP1OIlTv7lwk0bXxmJ+EM3NfKxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736347552; c=relaxed/simple;
	bh=9j/wEKx8frIchU3ofPf6En/NAciBp2fy+HDtvFntefo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MYajIQmU1s1lmqmdfeiNoq2BXOrJpKusJW08/gbVlnESMVVyeqRoO1HXSaT3UH4j6MidUl6A73Wve0forczENW2yv0ejiLXmzHrhXtuOGxfUgfGDJby8D01M0riScgGVqRQtysLL4BtwtKYK0dpYfewO/oUsP3yhKpqcheMzTWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=h1N7+SoM; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=QO2MUoot; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=h1N7+SoM; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=QO2MUoot; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CCBB5210F5;
	Wed,  8 Jan 2025 14:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736347542; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gw7t8M0pKp46ssLAVt+a0jQVLXzlhFkxUuNvWh4NTdU=;
	b=h1N7+SoM+Wt2CfbyI7y2TlkpPz2JNHccPN/xfVZzC6JHY/KRo+1JMpKoy5Xjo+OrVjSbKo
	l3UR7nJdQIVP3sPDmheC25BrkYLBJN+45y5ldqXYaTfcVWVdj00kQDaT5S6Duxn8G8/4nv
	IDp42g+8HOTNgnQVKSWVmsj5Ug5QjV4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736347542;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gw7t8M0pKp46ssLAVt+a0jQVLXzlhFkxUuNvWh4NTdU=;
	b=QO2MUoot2IH5TknfnFRlGvRsIouHf1qR0IEMkDW7glRUFVD3LqufDmJPR+pPnIbfHdb7mp
	B0DQ20rqsrASeXAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1736347542; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gw7t8M0pKp46ssLAVt+a0jQVLXzlhFkxUuNvWh4NTdU=;
	b=h1N7+SoM+Wt2CfbyI7y2TlkpPz2JNHccPN/xfVZzC6JHY/KRo+1JMpKoy5Xjo+OrVjSbKo
	l3UR7nJdQIVP3sPDmheC25BrkYLBJN+45y5ldqXYaTfcVWVdj00kQDaT5S6Duxn8G8/4nv
	IDp42g+8HOTNgnQVKSWVmsj5Ug5QjV4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1736347542;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gw7t8M0pKp46ssLAVt+a0jQVLXzlhFkxUuNvWh4NTdU=;
	b=QO2MUoot2IH5TknfnFRlGvRsIouHf1qR0IEMkDW7glRUFVD3LqufDmJPR+pPnIbfHdb7mp
	B0DQ20rqsrASeXAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BB3BC1351A;
	Wed,  8 Jan 2025 14:45:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id h8v+LJaPfmfoTwAAD6G6ig
	(envelope-from <jack@suse.cz>); Wed, 08 Jan 2025 14:45:42 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 0053EA0889; Wed,  8 Jan 2025 15:45:41 +0100 (CET)
Date: Wed, 8 Jan 2025 15:45:41 +0100
From: Jan Kara <jack@suse.cz>
To: syzbot <syzbot+d796ad2656d5b38910ee@syzkaller.appspotmail.com>
Cc: brauner@kernel.org, djwong@kernel.org, jack@suse.cz, 
	linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [reiserfs?] KASAN: use-after-free Read in
 reiserfs_fill_super (3)
Message-ID: <extrhc27tkgqmoiqzlhtdild4y5ijtmlebf3mnljtvftf3azeq@zw4jnnwmmza2>
References: <670030bd.050a0220.49194.0497.GAE@google.com>
 <677e4dd0.050a0220.3b3668.02e2.GAE@google.com>
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <677e4dd0.050a0220.3b3668.02e2.GAE@google.com>
X-Spam-Level: 
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=921b01cbfd887a9b];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[d796ad2656d5b38910ee];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Spam-Score: -1.30
X-Spam-Flag: NO

On Wed 08-01-25 02:05:04, syzbot wrote:
> syzbot suspects this issue was fixed by commit:
> 
> commit fb6f20ecb121cef4d7946f834a6ee867c4e21b4a
> Author: Jan Kara <jack@suse.cz>
> Date:   Thu Oct 17 10:28:23 2024 +0000
> 
>     reiserfs: The last commit
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=168c7edf980000
> start commit:   59b723cd2adb Linux 6.12-rc6
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=921b01cbfd887a9b
> dashboard link: https://syzkaller.appspot.com/bug?extid=d796ad2656d5b38910ee
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1765c740580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12a786a7980000
> 
> If the result looks correct, please mark the issue as fixed by replying with:

Well, obviously :). As well as all the other reiserfs bugs. Syzkaller guys,
perhaps you can do some management action and close all reiserfs bugs in
one big sweep?
 
#syz fix: reiserfs: The last commit

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

