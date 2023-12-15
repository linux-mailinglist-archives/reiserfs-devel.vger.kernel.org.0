Return-Path: <reiserfs-devel+bounces-4-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 19533814563
	for <lists+reiserfs-devel@lfdr.de>; Fri, 15 Dec 2023 11:21:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B169BB236FE
	for <lists+reiserfs-devel@lfdr.de>; Fri, 15 Dec 2023 10:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1930B24B2F;
	Fri, 15 Dec 2023 10:20:39 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from wxsgout04.xfusion.com (wxsgout03.xfusion.com [36.139.52.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D05D24A0F;
	Fri, 15 Dec 2023 10:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xfusion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xfusion.com
Received: from wuxshcsitd00600.xfusion.com (unknown [10.32.133.213])
	by wxsgout04.xfusion.com (SkyGuard) with ESMTPS id 4Ss4s23RmKzB2757;
	Fri, 15 Dec 2023 18:17:10 +0800 (CST)
Received: from localhost (10.82.147.3) by wuxshcsitd00600.xfusion.com
 (10.32.133.213) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 15 Dec
 2023 18:20:33 +0800
Date: Fri, 15 Dec 2023 18:20:32 +0800
From: Wang Jinchao <wangjinchao@xfusion.com>
To: <reiserfs-devel@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <stone.xulei@xfusion.com>, <wangjinchao@xfusion.com>
Message-ID: <202312151820+0800-wangjinchao@xfusion.com>
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: wuxshcsitd00602.xfusion.com (10.32.132.250) To
 wuxshcsitd00600.xfusion.com (10.32.133.213)

Bcc: 
Subject: [PATCH] reiserfs: cleanup, remove duplicated including
Reply-To: 

remove the second #include <linux/xattr.h>

Signed-off-by: Wang Jinchao <wangjinchao@xfusion.com>
---
 fs/reiserfs/xattr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
index 998035a6388e..3465a6915fe1 100644
--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -52,7 +52,6 @@
 #include <linux/quotaops.h>
 #include <linux/security.h>
 #include <linux/posix_acl_xattr.h>
-#include <linux/xattr.h>
 
 #define PRIVROOT_NAME ".reiserfs_priv"
 #define XAROOT_NAME   "xattrs"
-- 
2.40.0


