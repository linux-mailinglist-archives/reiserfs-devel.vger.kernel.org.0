Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98A782BC7CF
	for <lists+reiserfs-devel@lfdr.de>; Sun, 22 Nov 2020 19:22:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728175AbgKVSWI (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sun, 22 Nov 2020 13:22:08 -0500
Received: from bedivere.hansenpartnership.com ([96.44.175.130]:38562 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727795AbgKVSWF (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 22 Nov 2020 13:22:05 -0500
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 5724C128028B;
        Sun, 22 Nov 2020 10:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1606069324;
        bh=h3sTlT+FA6NHXH38/foFLBJi59858PUlbpLzv2N/tQY=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=rW4pDHaLDXSFZXr6Cvxz8pUU95XYbgWiZrc9VupyznX2uzr45WZkkmPcoVv7UQLC7
         fsMPdBOfQk9ceeuIggpWHLoyVFttsPe9E/go/w8zBhamKaY37ALEH+1JPMFR7KYHwj
         pjW3T1Eqz9YAkW2FP12UvIfqAj7a03n4eq2U3CyI=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id tKkBL_hAklxm; Sun, 22 Nov 2020 10:22:04 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id DB46B1280287;
        Sun, 22 Nov 2020 10:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1606069324;
        bh=h3sTlT+FA6NHXH38/foFLBJi59858PUlbpLzv2N/tQY=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=rW4pDHaLDXSFZXr6Cvxz8pUU95XYbgWiZrc9VupyznX2uzr45WZkkmPcoVv7UQLC7
         fsMPdBOfQk9ceeuIggpWHLoyVFttsPe9E/go/w8zBhamKaY37ALEH+1JPMFR7KYHwj
         pjW3T1Eqz9YAkW2FP12UvIfqAj7a03n4eq2U3CyI=
Message-ID: <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Kees Cook <keescook@chromium.org>, Jakub Kicinski <kuba@kernel.org>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
        amd-gfx@lists.freedesktop.org, bridge@lists.linux-foundation.org,
        ceph-devel@vger.kernel.org, cluster-devel@redhat.com,
        coreteam@netfilter.org, devel@driverdev.osuosl.org,
        dm-devel@redhat.com, drbd-dev@lists.linbit.com,
        dri-devel@lists.freedesktop.org, GR-everest-linux-l2@marvell.com,
        GR-Linux-NIC-Dev@marvell.com, intel-gfx@lists.freedesktop.org,
        intel-wired-lan@lists.osuosl.org, keyrings@vger.kernel.org,
        linux1394-devel@lists.sourceforge.net, linux-acpi@vger.kernel.org,
        linux-afs@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        linux-atm-general@lists.sourceforge.net,
        linux-block@vger.kernel.org, linux-can@vger.kernel.org,
        linux-cifs@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-decnet-user@lists.sourceforge.net,
        linux-ext4@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-geode@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-hams@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-i3c@lists.infradead.org, linux-ide@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
        linux-integrity@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mm@kvack.org,
        linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org,
        linux-rdma@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        netfilter-devel@vger.kernel.org, nouveau@lists.freedesktop.org,
        op-tee@lists.trustedfirmware.org, oss-drivers@netronome.com,
        patches@opensource.cirrus.com, rds-devel@oss.oracle.com,
        reiserfs-devel@vger.kernel.org, samba-technical@lists.samba.org,
        selinux@vger.kernel.org, target-devel@vger.kernel.org,
        tipc-discussion@lists.sourceforge.net,
        usb-storage@lists.one-eyed-alien.net,
        virtualization@lists.linux-foundation.org,
        wcn36xx@lists.infradead.org, x86@kernel.org,
        xen-devel@lists.xenproject.org, linux-hardening@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>, Joe Perches <joe@perches.com>
Date:   Sun, 22 Nov 2020 10:21:59 -0800
In-Reply-To: <202011220816.8B6591A@keescook>
References: <cover.1605896059.git.gustavoars@kernel.org>
         <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
         <202011201129.B13FDB3C@keescook>
         <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
         <202011220816.8B6591A@keescook>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Sun, 2020-11-22 at 08:17 -0800, Kees Cook wrote:
> On Fri, Nov 20, 2020 at 11:51:42AM -0800, Jakub Kicinski wrote:
> > On Fri, 20 Nov 2020 11:30:40 -0800 Kees Cook wrote:
> > > On Fri, Nov 20, 2020 at 10:53:44AM -0800, Jakub Kicinski wrote:
> > > > On Fri, 20 Nov 2020 12:21:39 -0600 Gustavo A. R. Silva wrote:  
> > > > > This series aims to fix almost all remaining fall-through
> > > > > warnings in order to enable -Wimplicit-fallthrough for Clang.
> > > > > 
> > > > > In preparation to enable -Wimplicit-fallthrough for Clang,
> > > > > explicitly add multiple break/goto/return/fallthrough
> > > > > statements instead of just letting the code fall through to
> > > > > the next case.
> > > > > 
> > > > > Notice that in order to enable -Wimplicit-fallthrough for
> > > > > Clang, this change[1] is meant to be reverted at some point.
> > > > > So, this patch helps to move in that direction.
> > > > > 
> > > > > Something important to mention is that there is currently a
> > > > > discrepancy between GCC and Clang when dealing with switch
> > > > > fall-through to empty case statements or to cases that only
> > > > > contain a break/continue/return statement[2][3][4].  
> > > > 
> > > > Are we sure we want to make this change? Was it discussed
> > > > before?
> > > > 
> > > > Are there any bugs Clangs puritanical definition of fallthrough
> > > > helped find?
> > > > 
> > > > IMVHO compiler warnings are supposed to warn about issues that
> > > > could be bugs. Falling through to default: break; can hardly be
> > > > a bug?!  
> > > 
> > > It's certainly a place where the intent is not always clear. I
> > > think this makes all the cases unambiguous, and doesn't impact
> > > the machine code, since the compiler will happily optimize away
> > > any behavioral redundancy.
> > 
> > If none of the 140 patches here fix a real bug, and there is no
> > change to machine code then it sounds to me like a W=2 kind of a
> > warning.
> 
> FWIW, this series has found at least one bug so far:
> https://lore.kernel.org/lkml/CAFCwf11izHF=g1mGry1fE5kvFFFrxzhPSM6qKAO8gxSp=Kr_CQ@mail.gmail.com/


Well, it's a problem in an error leg, sure, but it's not a really
compelling reason for a 141 patch series, is it?  All that fixing this
error will do is get the driver to print "oh dear there's a problem"
under four more conditions than it previously did.

We've been at this for three years now with nearly a thousand patches,
firstly marking all the fall throughs with /* fall through */ and later
changing it to fallthrough.  At some point we do have to ask if the
effort is commensurate with the protection afforded.  Please tell me
our reward for all this effort isn't a single missing error print.

James


