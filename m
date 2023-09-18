Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 469D27A50C0
	for <lists+reiserfs-devel@lfdr.de>; Mon, 18 Sep 2023 19:14:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbjIRROv (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 18 Sep 2023 13:14:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231573AbjIRROs (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 18 Sep 2023 13:14:48 -0400
X-Greylist: delayed 4171 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 18 Sep 2023 10:14:42 PDT
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch [185.70.41.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4450293
        for <reiserfs-devel@vger.kernel.org>; Mon, 18 Sep 2023 10:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n8pjl.ca;
        s=protonmail2; t=1695046482; x=1695305682;
        bh=Km91J5JZrnd7URdpT5rh0YawCfFvdMqpbXm9xOXQn1s=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=s58EZzuaw7picVWTRX+/V8Pt6XW9FVjJurAT1S3a3Quz+v++x4AqaBChG//SSRq4E
         C6YmeJzLFS4YD5HbeQNxSxxfoVS8rMDEVPSaPF0/6w/fr4g8Mhv2qyYw0fEeqBSViI
         wNNHg6iMiebglnBPXFBHRXtWP0P2uxKPeC3JT7vXnijFAxx6IlEYGV5JYE3giyN5Il
         10cmybDZ3aJSgHJnQl9aBYlfWY1+3p4iOJedy4iIUb3T9nmtfKDkIvnkObtHCm8CTZ
         LRH17HwP0oj4oVS26INgpzpeVfqFny0pAxwyLm3AzAyKfoicxxNWhP4ZmUo3rwmtPE
         zdgznI8lt8ofQ==
Date:   Mon, 18 Sep 2023 14:14:21 +0000
To:     jack@suse.cz
From:   Peter Lafreniere <peter@n8pjl.ca>
Cc:     Peter Lafreniere <peter@n8pjl.ca>, linux-um@lists.infradead.org,
        anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
        reiserfs-devel@vger.kernel.org, richard@nod.at
Subject: Re: [PATCH RESEND] um: Remove CONFIG_REISERFS_FS from defconfig
Message-ID: <20230918141359.11097-1-peter@n8pjl.ca>
In-Reply-To: <20230918132614.zmmuc72purc2psik@quack3>
References: <20230910232640.113938-1-peter@n8pjl.ca> <20230918125744.4342-1-peter@n8pjl.ca> <20230918132614.zmmuc72purc2psik@quack3>
Feedback-ID: 53133685:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Monday, September 18th, 2023 at 09:26, Jan Kara <jack@suse.cz> wrote:
> On Mon 18-09-23 12:58:26, Peter Lafreniere wrote:
>=20
> > ReiserFS has been deprecated for a year and a half, yet is still built
> > as part of a defconfig UML kernel.
> >=20
> > According to commit eb103a51640e ("reiserfs: Deprecate reiserfs"), the
> > filesystem is slated to be removed in 2025. Remove it from the defconfi=
g
> > profile now, as part of its deprecation process.
> >=20
> > Signed-off-by: Peter Lafreniere peter@n8pjl.ca
>=20
>=20
> Makes sense but I've noticed there are many more architectures that defin=
e
> CONFIG_REISERFS_FS in their defconfig (sh, powerpc, mips, m68k, ia64, arm=
,
> alpha). So perhaps we should do this for all of them when we are at it?

I agree. I can send a patch series for those arches except for ia64, which =
has
already been removed from linux-next.

>=20
> Honza
>=20
> > ---
> > Fixed invalid DKIM settings causing the previous patch to be rejected.
> >=20
> > arch/um/configs/i386_defconfig | 1 -
> > arch/um/configs/x86_64_defconfig | 1 -
> > 2 files changed, 2 deletions(-)
> >=20
> > diff --git a/arch/um/configs/i386_defconfig b/arch/um/configs/i386_defc=
onfig
> > index e543cbac8792..9c9c77f1255a 100644
> > --- a/arch/um/configs/i386_defconfig
> > +++ b/arch/um/configs/i386_defconfig
> > @@ -61,7 +61,6 @@ CONFIG_UML_NET_DAEMON=3Dy
> > CONFIG_UML_NET_MCAST=3Dy
> > CONFIG_UML_NET_SLIRP=3Dy
> > CONFIG_EXT4_FS=3Dy
> > -CONFIG_REISERFS_FS=3Dy
> > CONFIG_QUOTA=3Dy
> > CONFIG_AUTOFS_FS=3Dm
> > CONFIG_ISO9660_FS=3Dm
> > diff --git a/arch/um/configs/x86_64_defconfig b/arch/um/configs/x86_64_=
defconfig
> > index 939cb12318ca..03b10d3f6816 100644
> > --- a/arch/um/configs/x86_64_defconfig
> > +++ b/arch/um/configs/x86_64_defconfig
> > @@ -59,7 +59,6 @@ CONFIG_UML_NET_DAEMON=3Dy
> > CONFIG_UML_NET_MCAST=3Dy
> > CONFIG_UML_NET_SLIRP=3Dy
> > CONFIG_EXT4_FS=3Dy
> > -CONFIG_REISERFS_FS=3Dy
> > CONFIG_QUOTA=3Dy
> > CONFIG_AUTOFS_FS=3Dm
> > CONFIG_ISO9660_FS=3Dm
> > --
> > 2.42.0
>=20
> --
> Jan Kara jack@suse.com
>=20
> SUSE Labs, CRi

