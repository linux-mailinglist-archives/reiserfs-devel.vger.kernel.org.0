Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28F731545EC
	for <lists+reiserfs-devel@lfdr.de>; Thu,  6 Feb 2020 15:17:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727955AbgBFORw (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 6 Feb 2020 09:17:52 -0500
Received: from mail7.static.mailgun.info ([104.130.122.7]:57842 "EHLO
        mail7.static.mailgun.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727769AbgBFORw (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 6 Feb 2020 09:17:52 -0500
X-Greylist: delayed 305 seconds by postgrey-1.27 at vger.kernel.org; Thu, 06 Feb 2020 09:17:51 EST
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1580998671; h=From: Date: Message-Id: To: Subject: Sender;
 bh=6vvzpajk0Ger0ZFbyMUSR24iSrQhS76w+nQ9jXzHEsU=; b=Uh0tF60UBIzE2zymkSRJNRcBR68kreZi4yP3qCxwlbz3GV5O305bcxjMg9bbZvM+gnKzplqi
 zIcFL4LHM8TubczOhZI1691Ctou50aGIHi1xT9801/iRrjxR7spFDBQAQunhU7k3wCV1N3gT
 CDaAH0V8y8co/SXDf1xoeifabt8=
X-Mailgun-Sending-Ip: 104.130.122.7
X-Mailgun-Sid: WyIxM2M2YSIsICJyZWlzZXJmcy1kZXZlbEB2Z2VyLmtlcm5lbC5vcmciLCAiMTdiNTQiXQ==
Received: from huitzilopochtli.metztli-it.com (99-130-254-3.lightspeed.sntcca.sbcglobal.net [99.130.254.3])
 by mxa.mailgun.org with ESMTP id 5e3c1eda.7ff3f865c0c0-smtp-out-n03;
 Thu, 06 Feb 2020 14:12:42 -0000 (UTC)
Received: by huitzilopochtli.metztli-it.com (Postfix, from userid 1000)
        id DE8584E43813; Thu,  6 Feb 2020 06:12:41 -0800 (PST)
Subject: Re: [PATCH] reiser4: prevent system lockups
To:     <edward.shishkin@gmail.com>, <reiserfs-devel@vger.kernel.org>
X-Mailer: mail (GNU Mailutils 3.5)
Message-Id: <20200206141241.DE8584E43813@huitzilopochtli.metztli-it.com>
Date:   Thu,  6 Feb 2020 06:12:41 -0800 (PST)
From:   Metztli Information Technology <jose.r.r@metztli.com>
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

That is 'one hell of' a shrewd finding, Ed!
> On Tue, Feb 4, 2020 at 4:24 PM Edward Shishkin <edward.shishkin@gmail.com> wrote:
>
> Hi all,
>
> Starting from Linux-4.15, VFS introduces optimizations, which
> are incompatible with Reiser4 (as well as with any FS possessing
> an advanced transaction manager). Here is the problematic commit:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aa65c29ce1b6e1990cd2c7d8004bbea7ff3aff38
Indeed, I knew *something* had changed but I focused heavily on confirming the validity of my reiser4 hacks; additionally, I began
examining attentively multiple Debian packaging for Linux major.minor changes, custom debian patches, as well as the packaging custom default .config
--believing the Debian Kernel Team modifications might have had introduced the hanging issue, Sir.
>
> The attached patch fixes the problem. This patch is against
> Linux-5.4+reiser4. Please, apply.
5.4.6 [?]

>
> Later I'll prepare backports for all the mentioned kernels and will
> put them on Sourceforge.
Cool! I was notified of your latest reiser4-for-5.4.17.patch.gz release.

> If someone urgently needs a backport, then
> let me know.
>
> Thanks,
> Edward.
Your dedication and outsized efforts toward maintaining and enhancing REISER4 are MUCH ADMIRED and APPRECIATED, Ed, THANK YOU!


Best Professional Regards.
