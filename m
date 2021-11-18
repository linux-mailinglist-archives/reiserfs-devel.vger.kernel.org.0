Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1148455955
	for <lists+reiserfs-devel@lfdr.de>; Thu, 18 Nov 2021 11:45:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235730AbhKRKsu (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 18 Nov 2021 05:48:50 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:58728 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245744AbhKRKst (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 18 Nov 2021 05:48:49 -0500
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id B0ABD218B8;
        Thu, 18 Nov 2021 10:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1637232348; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7yxGpvysaQjXI6Ptt8Gp6dG+FEHHiyleCV3iHc2uni8=;
        b=REl+qZG7r3KzLa/AZSLfHfENXkNYaV/qQ4fksyh96zKlaCHrgiuJjbqZKrHfQ46FGDpqJl
        xqwjTkGLUXJbMddkAHUu6swtYDCT2umUF3gF7Aiu1dbwIfhsCj/LnNKU5ha2/x7iDNpUPa
        lIEg50spgwzgnnxYhDHDOdUNHeEaVEQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1637232348;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7yxGpvysaQjXI6Ptt8Gp6dG+FEHHiyleCV3iHc2uni8=;
        b=96eMI/IgypBaORscUQ3ttn971Z59zrz2+l5ld/ajM+MPPl/5jQylJ4VRSYRlqb7jEsqFFk
        ZkyeVrhHFoDB5uAg==
Received: from quack2.suse.cz (unknown [10.100.200.198])
        by relay2.suse.de (Postfix) with ESMTP id 2C9BBA3B85;
        Thu, 18 Nov 2021 10:45:48 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
        id 3A39A1F2C78; Thu, 18 Nov 2021 11:45:44 +0100 (CET)
Date:   Thu, 18 Nov 2021 11:45:44 +0100
From:   Jan Kara <jack@suse.cz>
To:     NeilBrown <neilb@suse.de>
Cc:     Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>,
        reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] reiserfs: don't use congestion_wait()
Message-ID: <20211118104544.GB13047@quack2.suse.cz>
References: <163712368225.13692.3419908086400748349@noble.neil.brown.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163712368225.13692.3419908086400748349@noble.neil.brown.name>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Wed 17-11-21 15:34:42, NeilBrown wrote:
> 
> Block devices do not, in general, report congestion any more, so this
> congestion_wait() is effectively just a sleep.
> 
> It isn't entirely clear what is being waited for, but as we only wait
> when j_async_throttle is elevated, it seems reasonable to stop waiting
> when j_async_throttle becomes zero - or after the same timeout.
> 
> So change to use wait_event_event_timeout() for waiting, and
> wake_up_var() to signal an end to waiting.
> 
> Signed-off-by: NeilBrown <neilb@suse.de>
> ---
> 
> I have no idea who might take this.... Jens and Jan have both landed
> reiserfs patches recently...

Yeah, I guess I can take this one. Honestly the whole code around
j_async_throttle looks a bit suspicious but your patch does not make it
worse so it looks safe to me :).


								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
