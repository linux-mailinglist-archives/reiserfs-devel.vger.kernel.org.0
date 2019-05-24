Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 113852A0DA
	for <lists+reiserfs-devel@lfdr.de>; Sat, 25 May 2019 00:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404445AbfEXWBb (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 24 May 2019 18:01:31 -0400
Received: from mail7.static.mailgun.info ([104.130.122.7]:39871 "EHLO
        mail7.static.mailgun.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404303AbfEXWBa (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 24 May 2019 18:01:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1558735289; h=From: Date: Message-Id: To: Subject: Sender;
 bh=XG+4PTxCXrXFYd5HCm0mwZr9N0Np8jiHB/B+451g/Ic=; b=ipoRy2UUxlgd1Nz8NslNUaAtrKIeQMJPR+hHde6WqAjTqk6nYtRIXGDAjqb78zZmCNl06EU0
 KUGdjTZiDHCvCVAqlyTB7ozKnoEcOMIBdCsBZTk+CSLbLCAQBsXYzsHOW2Tn7Z7P++/GogfG
 SSA+E6gODyzZWFmDXutcmhN6FCI=
X-Mailgun-Sending-Ip: 104.130.122.7
X-Mailgun-Sid: WyIxM2M2YSIsICJyZWlzZXJmcy1kZXZlbEB2Z2VyLmtlcm5lbC5vcmciLCAiMTdiNTQiXQ==
Received: from huitzilopochtli.metztli-it.com (99-130-254-3.lightspeed.sntcca.sbcglobal.net [99.130.254.3])
 by mxa.mailgun.org with ESMTP id 5ce869b9.7f9510639a08-smtp-out-n02;
 Fri, 24 May 2019 22:01:29 -0000 (UTC)
Received: by huitzilopochtli.metztli-it.com (Postfix, from userid 1000)
        id A6F013C59B12; Fri, 24 May 2019 15:01:27 -0700 (PDT)
Subject: Re: PATCH: Updated Reiser4 probe enabled against GNU Parted git://git.sv.gnu.org/parted.git
To:     <edward.shishkin@gmail.com>, <reiserfs-devel@vger.kernel.org>,
        <22113@debbugs.gnu.org>, <bcl@redhat.com>
X-Mailer: mail (GNU Mailutils 3.1.1)
Message-Id: <20190524220127.A6F013C59B12@huitzilopochtli.metztli-it.com>
Date:   Fri, 24 May 2019 15:01:27 -0700 (PDT)
From:   jose.r.r@metztli.com (Metztli Information Technology)
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org



On Fri, May 24, 2019 at 7:46 AM Edward Shishkin <edward.shishkin@gmail.com> wrote:
>
> On 05/24/2019 01:05 AM, Metztli Information Technology wrote:
> > Niltze [Hello]-
> >
> > Just updated Reiser for patch against GNU Parted
> > git clone git://git.sv.gnu.org/parted.git
>
> Uh, it is in upstream already?
LOL, no.

I just followed Debian maintainer's original advice on updating patch against git branch of GNU Parted.
< https://marc.info/?l=reiserfs-devel&m=155865303620491&w=2 >

> Someone must have died ...

Well, that's the reasoning behind GNU Parted gatekeeper
< https://www.brianlane.com/about-brian-c-lane/ >

for not merging reiser4 patch.

I just wonder if now that 'Big Blue' acquired Red Hat, the GNU Parted gatekeeper will act in a consistent
manner and quit his employer on 'ethical and moral' grounds in light of Watson's complicity tainting the company.
< https://russia-insider.com/en/head-ibm-sympathized-hitler-conducted-census-jews-preparation-camps-russian-tv-news/ri26587 >
< https://youtu.be/tCBT8H47sZ0 >
(and/or "Democracy For The Few" by Michael Parenti).

i.e., "...I have absolutely
no desire to see [IBM]'s work or name do anything but disappear into
obscurity."
< http://lists.gnu.org/archive/html/bug-parted/2015-12/msg00008.html >

Well, maybe I quoted him too soon. Unlike Reiser, who is down and dirt-poor and thus all the West 'morally and ethically righteous' developers kick and pile 
scorn onto, 'Big Blue's wealth quells USA technology ecosystem and their employees' ethical and moral sophistry, as is evidenced by, say no issues with JFS,
for instance.

>
> Thanks,
> Edward.
>
> >
> > apply patch
> >
> > ./bootstrap
> >
> > ./configure
> >
> > make
> >
> > make install
> >
> >
> > Huelmati [Enjoy]!
> >
> >
>

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Stretch w/ Linux 5.0.15 AMD64
---------------------------------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-------------------------------------------------------------------------------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/
