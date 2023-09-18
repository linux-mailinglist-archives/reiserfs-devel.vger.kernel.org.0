Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82FF57A4E55
	for <lists+reiserfs-devel@lfdr.de>; Mon, 18 Sep 2023 18:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbjIRQLB (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 18 Sep 2023 12:11:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230115AbjIRQKp (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 18 Sep 2023 12:10:45 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CA89268F
        for <reiserfs-devel@vger.kernel.org>; Mon, 18 Sep 2023 08:58:29 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 3F9831FED9;
        Mon, 18 Sep 2023 13:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1695043575; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CptKVtlJsn1lzDDkoAwpgGBZfa1qJH+GKj8YGELD9pE=;
        b=pgW55TSiIzxpbssBsNVF2lC+9A7nQfP2VLFIdBOjbI419ZxOHAODbOQkpl1JzLcbGAKROa
        cqRK0rcs9MUFhffVbsxV603nZklMWr7nHEWABvvbknPKslNnqTPMgaYdLPmEH5l3UhMgAe
        6ZY8HnFG+xx6X/iI05kn8AzNwdOaYsU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1695043575;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CptKVtlJsn1lzDDkoAwpgGBZfa1qJH+GKj8YGELD9pE=;
        b=jtw/3Mcp80MGTZv4eCty+vRjAu4Oloz+0t+B28GaA3b7kXi6AHoUvpWIFFJ+qEhg4tj4AY
        YbbyfgYelATWggAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2E0B013480;
        Mon, 18 Sep 2023 13:26:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id ujE0C/dPCGX9FgAAMHmgww
        (envelope-from <jack@suse.cz>); Mon, 18 Sep 2023 13:26:15 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
        id 99B59A0759; Mon, 18 Sep 2023 15:26:14 +0200 (CEST)
Date:   Mon, 18 Sep 2023 15:26:14 +0200
From:   Jan Kara <jack@suse.cz>
To:     Peter Lafreniere <peter@n8pjl.ca>
Cc:     linux-um@lists.infradead.org, richard@nod.at,
        anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
        reiserfs-devel@vger.kernel.org, jack@suse.cz
Subject: Re: [PATCH RESEND] um: Remove CONFIG_REISERFS_FS from defconfig
Message-ID: <20230918132614.zmmuc72purc2psik@quack3>
References: <20230910232640.113938-1-peter@n8pjl.ca>
 <20230918125744.4342-1-peter@n8pjl.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918125744.4342-1-peter@n8pjl.ca>
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Mon 18-09-23 12:58:26, Peter Lafreniere wrote:
> ReiserFS has been deprecated for a year and a half, yet is still built
> as part of a defconfig UML kernel.
> 
> According to commit eb103a51640e ("reiserfs: Deprecate reiserfs"), the
> filesystem is slated to be removed in 2025. Remove it from the defconfig
> profile now, as part of its deprecation process.
> 
> Signed-off-by: Peter Lafreniere <peter@n8pjl.ca>

Makes sense but I've noticed there are many more architectures that define
CONFIG_REISERFS_FS in their defconfig (sh, powerpc, mips, m68k, ia64, arm,
alpha). So perhaps we should do this for all of them when we are at it?

								Honza

> ---
> Fixed invalid DKIM settings causing the previous patch to be rejected.
> 
>  arch/um/configs/i386_defconfig   | 1 -
>  arch/um/configs/x86_64_defconfig | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/arch/um/configs/i386_defconfig b/arch/um/configs/i386_defconfig
> index e543cbac8792..9c9c77f1255a 100644
> --- a/arch/um/configs/i386_defconfig
> +++ b/arch/um/configs/i386_defconfig
> @@ -61,7 +61,6 @@ CONFIG_UML_NET_DAEMON=y
>  CONFIG_UML_NET_MCAST=y
>  CONFIG_UML_NET_SLIRP=y
>  CONFIG_EXT4_FS=y
> -CONFIG_REISERFS_FS=y
>  CONFIG_QUOTA=y
>  CONFIG_AUTOFS_FS=m
>  CONFIG_ISO9660_FS=m
> diff --git a/arch/um/configs/x86_64_defconfig b/arch/um/configs/x86_64_defconfig
> index 939cb12318ca..03b10d3f6816 100644
> --- a/arch/um/configs/x86_64_defconfig
> +++ b/arch/um/configs/x86_64_defconfig
> @@ -59,7 +59,6 @@ CONFIG_UML_NET_DAEMON=y
>  CONFIG_UML_NET_MCAST=y
>  CONFIG_UML_NET_SLIRP=y
>  CONFIG_EXT4_FS=y
> -CONFIG_REISERFS_FS=y
>  CONFIG_QUOTA=y
>  CONFIG_AUTOFS_FS=m
>  CONFIG_ISO9660_FS=m
> -- 
> 2.42.0
> 
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
