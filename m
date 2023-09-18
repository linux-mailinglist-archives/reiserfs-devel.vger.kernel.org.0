Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA65E7A4F59
	for <lists+reiserfs-devel@lfdr.de>; Mon, 18 Sep 2023 18:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbjIRQkh (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 18 Sep 2023 12:40:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbjIRQkL (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 18 Sep 2023 12:40:11 -0400
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AB6B83E6
        for <reiserfs-devel@vger.kernel.org>; Mon, 18 Sep 2023 09:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n8pjl.ca;
        s=protonmail2; t=1695054973; x=1695314173;
        bh=NOCWuGgx6TByWSIA4slIKttyguCA2SmfrwgzSjl+euQ=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=oZe6LP7TdsuCZpLFglGgKNaK7G+ZlzKX9vwpqf4gSmtV6rxEbTUAkGd+KkjC1gx97
         nQJtu+XHlWVGs8wioYFfsNCinnc+jeXDwlzZnrb+G9/7uwez3Ik3OS6vNOKNApbJVl
         aEmBFH2NmU6lgO1PEfdgOpNGUK/bnbfwl4H0IXO9Gx0EmC2PzUOHCQMJhNGQgFUzVT
         nlblEgz6QNQUMggNqUi/Ua1g9Wfrh5XiPyzgoWnGY6GPhveq9AfqHT/rLqZxAfL7qG
         9D0xJShWzWfsMJ41KKbgWcvfE5zYlPRenX1QAszBd4WGvN26zlD0y58ZziUkJ6E0Uw
         EVYgCmeygIpDA==
Date:   Mon, 18 Sep 2023 16:35:52 +0000
To:     geert@linux-m68k.org
From:   Peter Lafreniere <peter@n8pjl.ca>
Cc:     anton.ivanov@cambridgegreys.com, jack@suse.cz,
        johannes@sipsolutions.net, linux-um@lists.infradead.org,
        peter@n8pjl.ca, reiserfs-devel@vger.kernel.org, richard@nod.at
Subject: Re: [PATCH RESEND] um: Remove CONFIG_REISERFS_FS from defconfig
Message-ID: <20230918163544.8604-1-peter@n8pjl.ca>
In-Reply-To: <CAMuHMdWzN0Gs2FTQDFeBLz2498dv3ZYCBL2xOvL5YdHAveaH9g@mail.gmail.com>
References: <20230910232640.113938-1-peter@n8pjl.ca> <20230918125744.4342-1-peter@n8pjl.ca> <20230918132614.zmmuc72purc2psik@quack3> <CAMuHMdWzN0Gs2FTQDFeBLz2498dv3ZYCBL2xOvL5YdHAveaH9g@mail.gmail.com>
Feedback-ID: 53133685:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hi Geert,

On Monday, September 18th, 2023 at 10:58, Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> Hi Jan,
>=20
> On Mon, Sep 18, 2023 at 3:26=E2=80=AFPM Jan Kara jack@suse.cz wrote:
>=20
> > On Mon 18-09-23 12:58:26, Peter Lafreniere wrote:
> >=20
> > > ReiserFS has been deprecated for a year and a half, yet is still buil=
t
> > > as part of a defconfig UML kernel.
> > >=20
> > > According to commit eb103a51640e ("reiserfs: Deprecate reiserfs"), th=
e
> > > filesystem is slated to be removed in 2025. Remove it from the defcon=
fig
> > > profile now, as part of its deprecation process.
> > >=20
> > > Signed-off-by: Peter Lafreniere peter@n8pjl.ca
> >=20
> > Makes sense but I've noticed there are many more architectures that def=
ine
> > CONFIG_REISERFS_FS in their defconfig (sh, powerpc, mips, m68k, ia64, a=
rm,
> > alpha). So perhaps we should do this for all of them when we are at it?
>=20
>=20
> The policy for the m68k defconfigs is to enable all available exotic
> file systems as modules, so support for them is available when needed.
>=20
> Please let me know why this should be changed, as long as ReiserFS is
> still available in the upstream kernel.

I understand that policy and it makes particular sense for older/hobbyist
hardware like the m68k classic where ReiserFS is included in make defconfig=
.

However, ReiserFS is deprecated and should be phased out as best as possibl=
e
before its removal, and pruning config options for a filesystem that is=20
considered obsolete and should not be used on the newest kernels is a step
towards that.

ReiserFS is still availiable to be configured by anyone who builds their ow=
n
kernel and is still availiable in all(mod|yes)config. As such I can justify
the removal of some old config options that doesn't actually remove support=
 for
the filesystem when it simplifies the deprecation and removal processes for=
 an
ancient, largely unused filesystem.

Please remember that users who build and install their own kernel on hobbyi=
st
hardware should be capable enough to select one Kconfig option if they happ=
en to
need ReiserFS. If not, then removing ReiserFS from the defconfig on a kerne=
l
update is an easier issue to work around than waiting to remove the filesys=
tem
from the tree entirely.

>=20
> Gr{oetje,eeting}s,
>=20
> Geert
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>=20
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
> -- Linus Torvalds

Cheers,

Peter Lafreniere=20
<peter@n8pjl.ca>

And I sent the wrong email the first time. So sorry about that.

