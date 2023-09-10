Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2375E79A0A1
	for <lists+reiserfs-devel@lfdr.de>; Mon, 11 Sep 2023 01:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbjIJXb5 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sun, 10 Sep 2023 19:31:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbjIJXb5 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 10 Sep 2023 19:31:57 -0400
X-Greylist: delayed 300 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 10 Sep 2023 16:31:51 PDT
Received: from aib29gb127.yyz1.oracleemaildelivery.com (aib29gb127.yyz1.oracleemaildelivery.com [192.29.72.127])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95ACD184
        for <reiserfs-devel@vger.kernel.org>; Sun, 10 Sep 2023 16:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oci-2023;
 d=n8pjl.ca;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=+QmQ39qJAAicmUv+YuxOplwYcssmPoT+fv3BqZix0gE=;
 b=cMBY11lBX3zAl4jH/9XHe1TshHdQ0BSWyowOIHEDdyieM9cMzLpSPK6H9YanHCUCejmMOunI9bsK
   NUCeaD+3x8l4ldoP8dhLEvcm9sImjxNB75pXo8CNP85B+2xhoIV/VcEYOmoQqNsAZBHBqDJYmPR/
   mCHIFOflhAbPEVcdBrw9iNMY8Xb5U3OojMZLPwszO/qmcu3AuwLQcZDPznOTJbrZeAhCLeuI+OP1
   R71zhBxnOaslxHng6s3oWyt6PCJJvLUmTW3M7yljwjE2PP/Kr6hXU6vdjsX4+vUYMseUmN6Zwli0
   N+l+SNK7TlBSdx1H8V17aU40g4f16uWwMq9wqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-yyz-20200204;
 d=yyz1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=+QmQ39qJAAicmUv+YuxOplwYcssmPoT+fv3BqZix0gE=;
 b=bDiI1zNIoUk8cjiNkOEbdjZuVYqPE7B7uX8RRd9Dj8jyktH4NuOZlssx0OOxWl6dk6WH/IzcFfnY
   jKMddOsImgfCBFMKsqEoyLWp9/cklz51VkcWezVZjDQ27FYy+NBAaZr+DgURHL1/ac7F5KJ66+2w
   LSCk+vU0oKr1CqSwjDsqE5OPR3mPfaeHlTDiMIT2LMyJ84vl3eAkLPv/i40jnsVbsPg1cwmjVBeL
   5u+jeSvaxvNfPHtHTUYoBCj+qdpdL2GyHfpvzhlhwWWhv/Lzi+6CQIE0ngmWprNA6F6AxcybDvQK
   F4NIZxrxZLfgDMKAa7E+fHs0pv/b1IZKITBCbw==
Received: by omta-ad1-fd3-402-ca-toronto-1.omtaad1.vcndpyyz.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20230808 64bit (built Aug  8
 2023))
 with ESMTPS id <0S0S00DPFMGQKE40@omta-ad1-fd3-402-ca-toronto-1.omtaad1.vcndpyyz.oraclevcn.com> for
 reiserfs-devel@vger.kernel.org; Sun, 10 Sep 2023 23:26:50 +0000 (GMT)
From:   Peter Lafreniere <peter@n8pjl.ca>
To:     linux-um@lists.infradead.org
Cc:     Peter Lafreniere <peter@n8pjl.ca>, richard@nod.at,
        anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
        reiserfs-devel@vger.kernel.org, jack@suse.cz
Subject: [PATCH] um: Remove CONFIG_REISERFS_FS from defconfig
Date:   Sun, 10 Sep 2023 19:26:39 -0400
Message-id: <20230910232640.113938-1-peter@n8pjl.ca>
X-Mailer: git-send-email 2.42.0
MIME-version: 1.0
Content-transfer-encoding: 8bit
Reporting-Meta: AAFqYSi/Nz3yT+WmCCacHVh+wGgnWcRssPo3r9AOwMYpK0BBDia596AYNaQBaKkJ
 65vPtlWjwOBoyR5SC1xZcTzSX7EZjvCw1YsYEW4xREVQk7eTwP7EJ27BdA45K66X
 EYRTrzo6/yNxR7xCUuoraO/CpLE/vR+EBMH6JRea0126t6v66exACPWyRP4W+DlJ
 fF51rWsL2NR8sh4NazMNTJP3LFjnMsPZpcpY7xFEwyceKwHl3ms6S3hgVPrXma/9
 3UbvhI0MW1yatcslYMH+VM2mDf2vRB5k1ajYVZcrJF50hEgXPRJzYQe2/VhRX2H4
 XO2kYkSwvdyLxG8KpeZzTtu9/YnsbiDlBdGgyxRUjALd1VFT2oNrC73nbgdaqvjx
 ad0ZGGD1HExp7a5fhET7W3v0A+nXBnAhv862HOAmQnG35a26IsU61YPNOctuDFGG 9mw=
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

ReiserFS has been deprecated for a year and a half, yet is still built
as part of a defconfig UML kernel.

According to commit eb103a51640e ("reiserfs: Deprecate reiserfs"), the
filesystem is slated to be removed in 2025. Remove it from the defconfig
profile now, as part of its deprecation process.

Signed-off-by: Peter Lafreniere <peter@n8pjl.ca>
---
 arch/um/configs/i386_defconfig   | 1 -
 arch/um/configs/x86_64_defconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/um/configs/i386_defconfig b/arch/um/configs/i386_defconfig
index e543cbac8792..9c9c77f1255a 100644
--- a/arch/um/configs/i386_defconfig
+++ b/arch/um/configs/i386_defconfig
@@ -61,7 +61,6 @@ CONFIG_UML_NET_DAEMON=y
 CONFIG_UML_NET_MCAST=y
 CONFIG_UML_NET_SLIRP=y
 CONFIG_EXT4_FS=y
-CONFIG_REISERFS_FS=y
 CONFIG_QUOTA=y
 CONFIG_AUTOFS_FS=m
 CONFIG_ISO9660_FS=m
diff --git a/arch/um/configs/x86_64_defconfig b/arch/um/configs/x86_64_defconfig
index 939cb12318ca..03b10d3f6816 100644
--- a/arch/um/configs/x86_64_defconfig
+++ b/arch/um/configs/x86_64_defconfig
@@ -59,7 +59,6 @@ CONFIG_UML_NET_DAEMON=y
 CONFIG_UML_NET_MCAST=y
 CONFIG_UML_NET_SLIRP=y
 CONFIG_EXT4_FS=y
-CONFIG_REISERFS_FS=y
 CONFIG_QUOTA=y
 CONFIG_AUTOFS_FS=m
 CONFIG_ISO9660_FS=m
-- 
2.42.0

