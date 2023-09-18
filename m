Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B31E7A4A5B
	for <lists+reiserfs-devel@lfdr.de>; Mon, 18 Sep 2023 15:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240655AbjIRNAK (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 18 Sep 2023 09:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242017AbjIRM7o (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 18 Sep 2023 08:59:44 -0400
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 844E5CC8
        for <reiserfs-devel@vger.kernel.org>; Mon, 18 Sep 2023 05:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n8pjl.ca;
        s=protonmail2; t=1695041922; x=1695301122;
        bh=jFSuVM37gBzzT3DlSXH+u3vj6sxnz1gtZhD0blEKUx0=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=GQAKpSTbQf+pySgjFZNHQICah6ZILzxAU9AfMv5pQAjyU66s0cZYbmz8rQ3+PYlq8
         oVoFVbOeIsQao1ujOQR/gG9egtf8zBxaFZiuFEWZr8HbSJ2tdieT+7BlrwSzJSo9a0
         7HYc2nXVPue9w6ysyPH8ZErcqaXU1x7lPvSJztJk/xK+wbzfeRsRZzh1xIgzg7N2Zb
         MUnwqjmTJYKxKCITC9Q5F8qVI+DS/nFctPrkUW63TubposSC6dq04/U232yCCRpQNT
         6Jg8VUWY1qD0C8vnWSOCI5cYs2C4tvYs54l6JP61O/qyOvFwL79rFWCY4Y8PP9WCA0
         C2itn0Hub3BWQ==
Date:   Mon, 18 Sep 2023 12:58:26 +0000
To:     linux-um@lists.infradead.org
From:   Peter Lafreniere <peter@n8pjl.ca>
Cc:     Peter Lafreniere <peter@n8pjl.ca>, richard@nod.at,
        anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
        reiserfs-devel@vger.kernel.org, jack@suse.cz
Subject: [PATCH RESEND] um: Remove CONFIG_REISERFS_FS from defconfig
Message-ID: <20230918125744.4342-1-peter@n8pjl.ca>
In-Reply-To: <20230910232640.113938-1-peter@n8pjl.ca>
References: <20230910232640.113938-1-peter@n8pjl.ca>
Feedback-ID: 53133685:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
Fixed invalid DKIM settings causing the previous patch to be rejected.

 arch/um/configs/i386_defconfig   | 1 -
 arch/um/configs/x86_64_defconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/um/configs/i386_defconfig b/arch/um/configs/i386_defconfi=
g
index e543cbac8792..9c9c77f1255a 100644
--- a/arch/um/configs/i386_defconfig
+++ b/arch/um/configs/i386_defconfig
@@ -61,7 +61,6 @@ CONFIG_UML_NET_DAEMON=3Dy
 CONFIG_UML_NET_MCAST=3Dy
 CONFIG_UML_NET_SLIRP=3Dy
 CONFIG_EXT4_FS=3Dy
-CONFIG_REISERFS_FS=3Dy
 CONFIG_QUOTA=3Dy
 CONFIG_AUTOFS_FS=3Dm
 CONFIG_ISO9660_FS=3Dm
diff --git a/arch/um/configs/x86_64_defconfig b/arch/um/configs/x86_64_defc=
onfig
index 939cb12318ca..03b10d3f6816 100644
--- a/arch/um/configs/x86_64_defconfig
+++ b/arch/um/configs/x86_64_defconfig
@@ -59,7 +59,6 @@ CONFIG_UML_NET_DAEMON=3Dy
 CONFIG_UML_NET_MCAST=3Dy
 CONFIG_UML_NET_SLIRP=3Dy
 CONFIG_EXT4_FS=3Dy
-CONFIG_REISERFS_FS=3Dy
 CONFIG_QUOTA=3Dy
 CONFIG_AUTOFS_FS=3Dm
 CONFIG_ISO9660_FS=3Dm
--=20
2.42.0


