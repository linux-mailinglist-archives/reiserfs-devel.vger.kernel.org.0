Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7438916918E
	for <lists+reiserfs-devel@lfdr.de>; Sat, 22 Feb 2020 20:35:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbgBVTfG (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sat, 22 Feb 2020 14:35:06 -0500
Received: from mail7.static.mailgun.info ([104.130.122.7]:62933 "EHLO
        mail7.static.mailgun.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgBVTfG (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sat, 22 Feb 2020 14:35:06 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1582400106; h=From: Date: Message-Id: To: Subject: Sender;
 bh=q0NA/K1KCpCHsdjPrBAe4WOOQYHxHzuLAH0Kv9cfn6c=; b=Ie48GBzCsDKb0nWT2b3qTbS8qD4bibm+K+dF15W5VeDvmNj6RoJuS8XWYiIQ2uPmsY0zRJUk
 YAxxNBf/eF5Tiy1TNqsKq08ujzonbZZT4tCyd1IP9aBq+cZPhOYrBwSh8XomdXu3sJkDWe3k
 4V9QjZWvajiR1FjnpltIitazkMA=
X-Mailgun-Sending-Ip: 104.130.122.7
X-Mailgun-Sid: WyIxM2M2YSIsICJyZWlzZXJmcy1kZXZlbEB2Z2VyLmtlcm5lbC5vcmciLCAiMTdiNTQiXQ==
Received: from huitzilopochtli.metztli-it.com (99-130-254-3.lightspeed.sntcca.sbcglobal.net [99.130.254.3])
 by mxa.mailgun.org with ESMTP id 5e518258.7ff9fccc1df8-smtp-out-n02;
 Sat, 22 Feb 2020 19:34:48 -0000 (UTC)
Received: by huitzilopochtli.metztli-it.com (Postfix, from userid 1000)
        id C495950BFAD7; Sat, 22 Feb 2020 11:34:46 -0800 (PST)
Subject: Re: reiser4 patch for 5.5.1 and fs/fs-writeback.c
To:     <edward.shishkin@gmail.com>, <reiserfs-devel@vger.kernel.org>
X-Mailer: mail (GNU Mailutils 3.5)
Message-Id: <20200222193446.C495950BFAD7@huitzilopochtli.metztli-it.com>
Date:   Sat, 22 Feb 2020 11:34:46 -0800 (PST)
From:   Metztli Information Technology <jose.r.r@metztli.com>
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Sat, Feb 22, 2020 at 3:56 AM Edward Shishkin <edward.shishkin@gmail.com> wrote:
>
> On 02/22/2020 05:51 AM, Metztli Information Technology wrote:
> > Niltze, Ed-
> >
> > Starting with kernel 5.4.19, linux/fs/fs-writeback.c , at line 2066, changes
> > from
> > set_worker_desc("flush-%s", dev_name(wb->bdi->dev));
> >
> > to
> > set_worker_desc("flush-%s", bdi_dev_name(wb->bdi));
> >
> > I realized that when I was hacking 5.4.19 and, subsequently, my currently running kernel --as there was no RC3:
> >
> > uname -a
> > Linux huitzilopochtli 5.4.0-4+reiser4.0.2-amd64 #1 SMP Debian 5.4.20-1+reiser4.0.2 (2020-02-14) x86_64 GNU/Linux
> >
> > < https://sourceforge.net/projects/metztli-reiser4/files/Reiser4-SFRN-4.0.2_Linux-5.4.20-1-RC2_for-Debian_Buster/ >
> >
> >
> > I have just built 5.5.5-1 and realized, upon applying reiser4-for-5.5.1.patch.gz, that your patch should be modified
> >   accordingly; else, the patch will fail and will necessitate manual intervention, i.e., similar to 5.4.18 vs 5.4.19:
> >
> > < https://metztli.it/readOnlyEphemeral/fs-writeback_c.png >
>
> so, everything works fine after that "manual intervention"?

Indeed, Ed. No issues thus far. I upgraded my local dev environment to 5.4.20-1+reiser4 on February 15, 2020; in such environment I have built several PHP-7.3 iterations and I also built kernel 5.5.5-1+reiser4 yesterday. Additionally, replaced 5.4.20-1+reiser4 cloud flavour in a Google Compute Engine (GCE) customized Zstd transparent compression instance -- which hosts multiple PHP and Ruby applications and functions as a media / web server, as well -- without issues thus far.

Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Buster w/ Linux 5.4.18 AMD64
---------------------------------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-------------------------------------------------------------------------------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/
