Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 849DB2AEA42
	for <lists+reiserfs-devel@lfdr.de>; Wed, 11 Nov 2020 08:39:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725916AbgKKHjp (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 11 Nov 2020 02:39:45 -0500
Received: from mail7.static.mailgun.info ([104.130.122.7]:33496 "EHLO
        mail7.static.mailgun.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbgKKHjo (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 11 Nov 2020 02:39:44 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1605080384; h=Content-Transfer-Encoding: MIME-Version:
 Reply-To: Message-Id: Date: Subject: To: From: Sender;
 bh=mrPwHCzkcZhSA0GtLpH4KYk3BkUKty7a7HHalvTbKHI=; b=Fvu1ZLMSAcuSvjckHSls1PUmDeNEgc42hW3xkQUC1R3i80SS8FY3iEl/utrDFAcVWfjgoicE
 if9TZa+JxhbPexgnL7iX00pSDy34yJq6KV0C22F/kEVXtXfT9ttFIVfgNKRBEqlZMoe3Mgwl
 KBerkfq6avGEijsPyZKmHiGuhoE=
X-Mailgun-Sending-Ip: 104.130.122.7
X-Mailgun-Sid: WyIxM2M2YSIsICJyZWlzZXJmcy1kZXZlbEB2Z2VyLmtlcm5lbC5vcmciLCAiMTdiNTQiXQ==
Received: from huitzilopochtli.metztli-it.com
 (99-130-254-3.lightspeed.sntcca.sbcglobal.net [99.130.254.3]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5fab952cba0e43f3557cff3e (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Wed, 11 Nov 2020 07:39:24 GMT
Sender: jose=metztli-it.com@mixtli.metztli.it
Received: by huitzilopochtli.metztli-it.com (Postfix, from userid 1000)
        id F194470A9BFC; Tue, 10 Nov 2020 23:39:30 -0800 (PST)
From:   Metztli Information Technology <jose@metztli-it.com>
To:     reiserfs-devel@vger.kernel.org
Subject: Reiser4 \(detect only\) for GNU Parted v3.3
Date:   Tue, 10 Nov 2020 23:39:07 -0800
Message-Id: <20201111073908.40081-1-jose@metztli-it.com>
X-Mailer: git-send-email 2.27.0
Reply-To: jose.r.r@metztli.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org


As upcoming Debian Bullseye will use Debian packaging for GNU Parted v3.3-x
< https://github.com/Metztli/debian-parted-reiser4 >

I had to re-enable Reiser4 in GNU Parted first (found in the debian/patches/metztli directory in GitHub repo, as well).

Otherwise the non-reiser4 aware official Debian GNU parted 
< https://packages.debian.org/bullseye/parted >
will take precedence during installation and my Metztli Reiser4 netboot installers will fail.

Of course, this patch applies to standalone GNU Parted v3.3
< https://www.gnu.org/software/parted/ >

for those persons not on Linux Debian.


Best Professional Regards

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Buster w/ Linux 5.8.15 AMD64
---------------------------------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-------------------------------------------------------------------------------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/

