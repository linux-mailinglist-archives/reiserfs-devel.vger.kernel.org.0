Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A97C77A4F74
	for <lists+reiserfs-devel@lfdr.de>; Mon, 18 Sep 2023 18:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbjIRQmw (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 18 Sep 2023 12:42:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230483AbjIRQmk (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 18 Sep 2023 12:42:40 -0400
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 119985FDE
        for <reiserfs-devel@vger.kernel.org>; Mon, 18 Sep 2023 09:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n8pjl.ca;
        s=protonmail2; t=1695055231; x=1695314431;
        bh=MxvEGHu4PtwN8mGrIyQuS2LPbQNlvfj3VnD5jiLU7lc=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=VgM7sEMUObxhy8J/FthQz5uVyKAzVBVCMwGKG+3ouY5osT0Rb1fa86tMORiLFRjz8
         cGV4vKiEX+WES/DiNV0lIlKlHd4aSr7dnzsR0QgTgFXP06iCrX/AW2yQwkLyhbqeT7
         8lP1XTKgFPtQdDkGVx7/ZDVPz/ti0NLUlDayxIMork8EC4xUGPEMpTt1V4h2e2r1Bw
         bX7nkazpz3KeGSWLwAS/3zQ4q/hRmSOjAjHbbf+GXOofQSbQdV5zlEzUI3MITqLG4x
         OzqnYnrdRx7M+pWjb+3Gd64OygYOf85Uz+uvJBJRHvLdeBbMTVU9XTEZs3pelB+GWU
         6/gdC44vi6a+Q==
Date:   Mon, 18 Sep 2023 16:40:22 +0000
To:     peter@n8pjl.ca
From:   Peter Lafreniere <peter@n8pjl.ca>
Cc:     anton.ivanov@cambridgegreys.com, geert@linux-m68k.org,
        jack@suse.cz, johannes@sipsolutions.net,
        linux-um@lists.infradead.org, reiserfs-devel@vger.kernel.org,
        richard@nod.at
Subject: um: Remove CONFIG_REISERFS_FS from defconfig
Message-ID: <20230918164017.8827-1-peter@n8pjl.ca>
In-Reply-To: <20230918163544.8604-1-peter@n8pjl.ca>
References: <20230910232640.113938-1-peter@n8pjl.ca> <20230918125744.4342-1-peter@n8pjl.ca> <20230918132614.zmmuc72purc2psik@quack3> <CAMuHMdWzN0Gs2FTQDFeBLz2498dv3ZYCBL2xOvL5YdHAveaH9g@mail.gmail.com> <20230918163544.8604-1-peter@n8pjl.ca>
Feedback-ID: 53133685:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        TO_EQ_FM_DIRECT_MX autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

> > > Makes sense but I've noticed there are many more architectures that d=
efine
> > > CONFIG_REISERFS_FS in their defconfig (sh, powerpc, mips, m68k, ia64,=
 arm,
> > > alpha). So perhaps we should do this for all of them when we are at i=
t?
> >=20
> > The policy for the m68k defconfigs is to enable all available exotic
> > file systems as modules, so support for them is available when needed.
> >=20
> > Please let me know why this should be changed, as long as ReiserFS is
> > still available in the upstream kernel.
>=20
>=20
> I understand that policy and it makes particular sense for older/hobbyist
> hardware like the m68k classic where ReiserFS is included in make defconf=
ig.
>=20
> However, ReiserFS is deprecated and should be phased out as best as possi=
ble
> before its removal, and pruning config options for a filesystem that is
> considered obsolete and should not be used on the newest kernels is a ste=
p
> towards that.
>=20
> ReiserFS is still availiable to be configured by anyone who builds their =
own
> kernel and is still availiable in all(mod|yes)config. As such I can justi=
fy
> the removal of some old config options that doesn't actually remove suppo=
rt for
> the filesystem when it simplifies the deprecation and removal processes f=
or an
> ancient, largely unused filesystem.
>=20
> Please remember that users who build and install their own kernel on hobb=
yist
> hardware should be capable enough to select one Kconfig option if they ha=
ppen to
> need ReiserFS. If not, then removing ReiserFS from the defconfig on a ker=
nel
> update is an easier issue to work around than waiting to remove the files=
ystem
> from the tree entirely.

Though as Jan said, you're free to not accept a patch removing the config o=
ption
until the filesystem is gone for good. I just feel like it's easier to remo=
ve
ReiserFS from all defconfigs in one fell swoop.

Cheers,

Peter Lafreniere
<peter@n8pjl.ca>

