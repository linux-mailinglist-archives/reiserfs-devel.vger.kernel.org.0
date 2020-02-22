Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F82D168C62
	for <lists+reiserfs-devel@lfdr.de>; Sat, 22 Feb 2020 05:51:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbgBVEvu (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 21 Feb 2020 23:51:50 -0500
Received: from mail7.static.mailgun.info ([104.130.122.7]:12654 "EHLO
        mail7.static.mailgun.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726198AbgBVEvu (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 21 Feb 2020 23:51:50 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1582347109; h=From: Date: Message-Id: To: Subject: Sender;
 bh=ygi287Yqc0Arn9eJylrCVYq59I/LURTULqbMmA9CDlA=; b=iabcy4P/W7ponwjJVqLKLatwCBGw91CrwRdzrOFtCnWCr7wklqbzTgKntajXjdvKgH63zXUV
 XTqNqTag6rmhyAeZIE/6759n1Ow1nCFa39CXSXSmS5852AvoWWcf78Iuhmhukv+U9PEE5Ypw
 f3wjsrVm9D4TkaBWFDgQTk11pw8=
X-Mailgun-Sending-Ip: 104.130.122.7
X-Mailgun-Sid: WyIxM2M2YSIsICJyZWlzZXJmcy1kZXZlbEB2Z2VyLmtlcm5lbC5vcmciLCAiMTdiNTQiXQ==
Received: from huitzilopochtli.metztli-it.com (99-130-254-3.lightspeed.sntcca.sbcglobal.net [99.130.254.3])
 by mxa.mailgun.org with ESMTP id 5e50b34d.7f63e2083228-smtp-out-n01;
 Sat, 22 Feb 2020 04:51:25 -0000 (UTC)
Received: by huitzilopochtli.metztli-it.com (Postfix, from userid 1000)
        id 740D350BE086; Fri, 21 Feb 2020 20:51:24 -0800 (PST)
Subject: reiser4 patch for 5.5.1 and fs/fs-writeback.c
To:     <edward.shishkin@gmail.com>, <reiserfs-devel@vger.kernel.org>
X-Mailer: mail (GNU Mailutils 3.5)
Message-Id: <20200222045124.740D350BE086@huitzilopochtli.metztli-it.com>
Date:   Fri, 21 Feb 2020 20:51:24 -0800 (PST)
From:   Metztli Information Technology <jose.r.r@metztli.com>
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Niltze, Ed-

Starting with kernel 5.4.19, linux/fs/fs-writeback.c , at line 2066, changes
from
set_worker_desc("flush-%s", dev_name(wb->bdi->dev));

to
set_worker_desc("flush-%s", bdi_dev_name(wb->bdi));

I realized that when I was hacking 5.4.19 and, subsequently, my currently running kernel --as there was no RC3:

uname -a
Linux huitzilopochtli 5.4.0-4+reiser4.0.2-amd64 #1 SMP Debian 5.4.20-1+reiser4.0.2 (2020-02-14) x86_64 GNU/Linux

< https://sourceforge.net/projects/metztli-reiser4/files/Reiser4-SFRN-4.0.2_Linux-5.4.20-1-RC2_for-Debian_Buster/ >


I have just built 5.5.5-1 and realized, upon applying reiser4-for-5.5.1.patch.gz, that your patch should be modified
 accordingly; else, the patch will fail and will necessitate manual intervention, i.e., similar to 5.4.18 vs 5.4.19:

< https://metztli.it/readOnlyEphemeral/fs-writeback_c.png >

Apropos, I have not had *any* kernel hanging issues in my local, nor remote, reiser4 environments during building software
 ever since you released: [PATCH] reiser4: prevent system lockups.


< https://metztli.blog/index.php/amatl/reiser-nahui/patch-reiser4-prevent-system-lockups >


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
