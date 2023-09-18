Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14AC77A4F45
	for <lists+reiserfs-devel@lfdr.de>; Mon, 18 Sep 2023 18:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230325AbjIRQhL (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 18 Sep 2023 12:37:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbjIRQg7 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 18 Sep 2023 12:36:59 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86CA730F1
        for <reiserfs-devel@vger.kernel.org>; Mon, 18 Sep 2023 09:32:09 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 468B121D11;
        Mon, 18 Sep 2023 16:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1695054728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=65viRQYpB50dold0K4n5XzmsPEOTnLbffREamdAK1tQ=;
        b=2QwSrhbDUIp5/TQREiRUVkEyjBl+gfB80m2OcJdPAl2M3FpoSeTejfBRq0Rn6xvipQ5EYf
        F2yW5VECNNxjlp7qf60mnz1SYtY8iwM+OWdse4ZRfXxtAUSHjUwnhXNcZmGVVfcoX+c8MF
        RnqPC+zRffsJnd+K6h7mORl1YtDtgFY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1695054728;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=65viRQYpB50dold0K4n5XzmsPEOTnLbffREamdAK1tQ=;
        b=Pxgaal1PBWSS/Hac9Ux2fgXyaGG+k92ZBcLPSNgtabneSAz5Zd78iUFSV27CVkELMCaNbV
        kAGjIUaTvxKqfLDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3737513480;
        Mon, 18 Sep 2023 16:32:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id CeR4DYh7CGU1fQAAMHmgww
        (envelope-from <jack@suse.cz>); Mon, 18 Sep 2023 16:32:08 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
        id 9F95CA0759; Mon, 18 Sep 2023 18:32:07 +0200 (CEST)
Date:   Mon, 18 Sep 2023 18:32:07 +0200
From:   Jan Kara <jack@suse.cz>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Jan Kara <jack@suse.cz>, Peter Lafreniere <peter@n8pjl.ca>,
        linux-um@lists.infradead.org, richard@nod.at,
        anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
        reiserfs-devel@vger.kernel.org
Subject: Re: [PATCH RESEND] um: Remove CONFIG_REISERFS_FS from defconfig
Message-ID: <20230918163207.3e2hev3zxnr3bakj@quack3>
References: <20230910232640.113938-1-peter@n8pjl.ca>
 <20230918125744.4342-1-peter@n8pjl.ca>
 <20230918132614.zmmuc72purc2psik@quack3>
 <CAMuHMdWzN0Gs2FTQDFeBLz2498dv3ZYCBL2xOvL5YdHAveaH9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWzN0Gs2FTQDFeBLz2498dv3ZYCBL2xOvL5YdHAveaH9g@mail.gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Mon 18-09-23 16:58:05, Geert Uytterhoeven wrote:
> Hi Jan,
> 
> On Mon, Sep 18, 2023 at 3:26 PM Jan Kara <jack@suse.cz> wrote:
> > On Mon 18-09-23 12:58:26, Peter Lafreniere wrote:
> > > ReiserFS has been deprecated for a year and a half, yet is still built
> > > as part of a defconfig UML kernel.
> > >
> > > According to commit eb103a51640e ("reiserfs: Deprecate reiserfs"), the
> > > filesystem is slated to be removed in 2025. Remove it from the defconfig
> > > profile now, as part of its deprecation process.
> > >
> > > Signed-off-by: Peter Lafreniere <peter@n8pjl.ca>
> >
> > Makes sense but I've noticed there are many more architectures that define
> > CONFIG_REISERFS_FS in their defconfig (sh, powerpc, mips, m68k, ia64, arm,
> > alpha). So perhaps we should do this for all of them when we are at it?
> 
> The policy for the m68k defconfigs is to enable all available exotic
> file systems as modules, so support for them is available when needed.
> 
> Please let me know why this should be changed, as long as ReiserFS is
> still available in the upstream kernel.

There's no need to change if you don't want to. I can just imagine how for
other archs which seem to enable only "useful" filesystems in defconfig
disabling a deprecated filesystem makes sense.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
