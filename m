Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D6E97A4D76
	for <lists+reiserfs-devel@lfdr.de>; Mon, 18 Sep 2023 17:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbjIRPuW (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 18 Sep 2023 11:50:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbjIRPuR (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 18 Sep 2023 11:50:17 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0EABCD3
        for <reiserfs-devel@vger.kernel.org>; Mon, 18 Sep 2023 08:48:35 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 9CE631FF20;
        Mon, 18 Sep 2023 14:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1695047099; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7k/zMUERva64SewvTMtFZgYEqcH6fC89q9sFyyJsq/k=;
        b=Cl7e3mvx918s/0zUuN7kT7+zYVdL6sMszlDz1QEmDIXo/ku1cks5d61Bx6NZyKw2Hv/Z85
        Yphvifl7ReKud1tVOfnn0uUb7N8e2IAF29cwib2jkC511YpIoBG1XcEJyOGlF2r6yo1ggp
        oW6Ki1FdHP4dbew/XIolCDspW/mcoUY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1695047099;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7k/zMUERva64SewvTMtFZgYEqcH6fC89q9sFyyJsq/k=;
        b=Zr+B2n9JSNfwINesiPLJEqTd0qEXVM/hfLdX0H6Zf3DZN9mgd19Tm8kzd0OsK/SwmAVWh6
        s8dNKrYGpkvt1GCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8DB3113480;
        Mon, 18 Sep 2023 14:24:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id 4yiKIrtdCGV7NgAAMHmgww
        (envelope-from <jack@suse.cz>); Mon, 18 Sep 2023 14:24:59 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
        id 0609FA0759; Mon, 18 Sep 2023 16:24:59 +0200 (CEST)
Date:   Mon, 18 Sep 2023 16:24:58 +0200
From:   Jan Kara <jack@suse.cz>
To:     Peter Lafreniere <peter@n8pjl.ca>
Cc:     jack@suse.cz, linux-um@lists.infradead.org,
        anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
        reiserfs-devel@vger.kernel.org, richard@nod.at
Subject: Re: [PATCH RESEND] um: Remove CONFIG_REISERFS_FS from defconfig
Message-ID: <20230918142458.cwktedwchg5bm5cc@quack3>
References: <20230910232640.113938-1-peter@n8pjl.ca>
 <20230918125744.4342-1-peter@n8pjl.ca>
 <20230918132614.zmmuc72purc2psik@quack3>
 <20230918141359.11097-1-peter@n8pjl.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918141359.11097-1-peter@n8pjl.ca>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Mon 18-09-23 14:14:21, Peter Lafreniere wrote:
> On Monday, September 18th, 2023 at 09:26, Jan Kara <jack@suse.cz> wrote:
> > On Mon 18-09-23 12:58:26, Peter Lafreniere wrote:
> > 
> > > ReiserFS has been deprecated for a year and a half, yet is still built
> > > as part of a defconfig UML kernel.
> > > 
> > > According to commit eb103a51640e ("reiserfs: Deprecate reiserfs"), the
> > > filesystem is slated to be removed in 2025. Remove it from the defconfig
> > > profile now, as part of its deprecation process.
> > > 
> > > Signed-off-by: Peter Lafreniere peter@n8pjl.ca
> > 
> > 
> > Makes sense but I've noticed there are many more architectures that define
> > CONFIG_REISERFS_FS in their defconfig (sh, powerpc, mips, m68k, ia64, arm,
> > alpha). So perhaps we should do this for all of them when we are at it?
> 
> I agree. I can send a patch series for those arches except for ia64, which has
> already been removed from linux-next.

Than would be great. Thanks!

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
