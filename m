Return-Path: <reiserfs-devel+bounces-156-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5470A962361
	for <lists+reiserfs-devel@lfdr.de>; Wed, 28 Aug 2024 11:30:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF272B20F19
	for <lists+reiserfs-devel@lfdr.de>; Wed, 28 Aug 2024 09:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF765165EE7;
	Wed, 28 Aug 2024 09:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="YB11eQag";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="NxV11R5+";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="YB11eQag";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="NxV11R5+"
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177A716190C
	for <reiserfs-devel@vger.kernel.org>; Wed, 28 Aug 2024 09:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724837405; cv=none; b=RBdUgg6pPOt14KMKIVXnvGDaVX5igOgcJXOmXO4248YlB/X+fxw6zOWqtjuu/42r3RSkrH1DRvsPxRa+WtklGc6JDfSpB7X25ApCIxT0rhB1KLChmGSpwMop7Z+ez7FzNaHZE4d0oTA+rExuwiigfRzD7UpynimdxkBrTGzKAKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724837405; c=relaxed/simple;
	bh=7nsLHWnh1b/NUfpT3xnLmCv2XcRCK5GvIZQhRMbw5mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e3tseQecL4Sy0T6jwZHEDVUYsTiDeszcXQ+4MbD0WTiJ5loJ3g7O06liWtEpaI757WMa3U0UbYuNsfjuvfGCBxM1zHtNl75hzqX+uO3lLAacgqal3ltCS8/VgYECuQYavymOZmlW5ynNKmV0YDJ8WgY28fisBBIn2z5pt4UvTnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=YB11eQag; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=NxV11R5+; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=YB11eQag; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=NxV11R5+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2DD6D1FBED;
	Wed, 28 Aug 2024 09:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1724837402; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nGcw9BrkpkHWVYiAowAaVCe/Fl5kn7/Xz4fLN+1hwIk=;
	b=YB11eQagP6Q4le6aaH0Ra4RylOj2m6frmpHbJeUdK2p7jC5f0JqNt6qCzMTBqx25ZN/ek2
	J/squ43dF8ZNIm8fmmVBzKHchmFUTMA06X4VusBzte4rXNkzljODa7V+21n9xW2oNF3pXg
	s9/EriEZw6Sawnrl1xlP57/8rzHPTH4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1724837402;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nGcw9BrkpkHWVYiAowAaVCe/Fl5kn7/Xz4fLN+1hwIk=;
	b=NxV11R5+31ajEuetwT11EZqQFvLsS1WBFQ2Y6fvDXmdK91qyzQUZ2kc4IDpta5Dv4ipHtC
	haA8b7VY4qaiDrBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1724837402; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nGcw9BrkpkHWVYiAowAaVCe/Fl5kn7/Xz4fLN+1hwIk=;
	b=YB11eQagP6Q4le6aaH0Ra4RylOj2m6frmpHbJeUdK2p7jC5f0JqNt6qCzMTBqx25ZN/ek2
	J/squ43dF8ZNIm8fmmVBzKHchmFUTMA06X4VusBzte4rXNkzljODa7V+21n9xW2oNF3pXg
	s9/EriEZw6Sawnrl1xlP57/8rzHPTH4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1724837402;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nGcw9BrkpkHWVYiAowAaVCe/Fl5kn7/Xz4fLN+1hwIk=;
	b=NxV11R5+31ajEuetwT11EZqQFvLsS1WBFQ2Y6fvDXmdK91qyzQUZ2kc4IDpta5Dv4ipHtC
	haA8b7VY4qaiDrBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 249F61398F;
	Wed, 28 Aug 2024 09:30:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OcntCBruzmbqVgAAD6G6ig
	(envelope-from <jack@suse.cz>); Wed, 28 Aug 2024 09:30:02 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id DE96EA0968; Wed, 28 Aug 2024 11:29:53 +0200 (CEST)
Date: Wed, 28 Aug 2024 11:29:53 +0200
From: Jan Kara <jack@suse.cz>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: brauner@kernel.org, jack@suse.cz, viro@zeniv.linux.org.uk,
	reiserfs-devel@vger.kernel.org
Subject: Re: [PATCH -next] reiserfs: use LIST_HEAD() to simplify code
Message-ID: <20240828092953.v6c54nig3xosb5gm@quack3>
References: <20240821065136.2293615-1-lihongbo22@huawei.com>
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821065136.2293615-1-lihongbo22@huawei.com>
X-Spam-Score: -3.80
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email]
X-Spam-Flag: NO
X-Spam-Level: 

On Wed 21-08-24 14:51:36, Hongbo Li wrote:
> list_head can be initialized automatically with LIST_HEAD()
> instead of calling INIT_LIST_HEAD().
> 
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>

For reiserfs this cleanup is pointless. That code is scheduled to be
deleted in three months.

								Honza

> ---
>  fs/reiserfs/journal.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
> index e477ee0ff35d..606b363196aa 100644
> --- a/fs/reiserfs/journal.c
> +++ b/fs/reiserfs/journal.c
> @@ -795,8 +795,7 @@ static int write_ordered_buffers(spinlock_t * lock,
>  	struct reiserfs_jh *jh;
>  	int ret = j->j_errno;
>  	struct buffer_chunk chunk;
> -	struct list_head tmp;
> -	INIT_LIST_HEAD(&tmp);
> +	LIST_HEAD(tmp);
>  
>  	chunk.nr = 0;
>  	spin_lock(lock);
> -- 
> 2.34.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

