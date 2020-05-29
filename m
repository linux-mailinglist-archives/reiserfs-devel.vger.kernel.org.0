Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33D9A1E71FA
	for <lists+reiserfs-devel@lfdr.de>; Fri, 29 May 2020 03:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728679AbgE2BQH (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 28 May 2020 21:16:07 -0400
Received: from mxhk.zte.com.cn ([63.217.80.70]:53008 "EHLO mxhk.zte.com.cn"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728340AbgE2BQG (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 28 May 2020 21:16:06 -0400
X-Greylist: delayed 941 seconds by postgrey-1.27 at vger.kernel.org; Thu, 28 May 2020 21:16:05 EDT
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
        by Forcepoint Email with ESMTPS id 05FAB560F5E999B3359A;
        Fri, 29 May 2020 09:00:21 +0800 (CST)
Received: from notes_smtp.zte.com.cn (notessmtp.zte.com.cn [10.30.1.239])
        by mse-fl2.zte.com.cn with ESMTP id 04T10JBx015586;
        Fri, 29 May 2020 09:00:19 +0800 (GMT-8)
        (envelope-from wang.yi59@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
          by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
          with ESMTP id 2020052909005386-3735750 ;
          Fri, 29 May 2020 09:00:53 +0800 
From:   Yi Wang <wang.yi59@zte.com.cn>
To:     jeffm@suse.com
Cc:     jack@suse.cz, reiserfs-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, xue.zhihong@zte.com.cn,
        wang.yi59@zte.com.cn, wang.liang82@zte.com.cn,
        Liao Pingfang <liao.pingfang@zte.com.cn>
Subject: [PATCH] reiserfs: Replace kmalloc with kcalloc in the comment
Date:   Fri, 29 May 2020 09:02:30 +0800
Message-Id: <1590714150-15895-1-git-send-email-wang.yi59@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release 8.5.3FP6|November
 21, 2013) at 2020-05-29 09:00:54,
        Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2020-05-29 09:00:24,
        Serialize complete at 2020-05-29 09:00:24
X-MAIL: mse-fl2.zte.com.cn 04T10JBx015586
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

From: Liao Pingfang <liao.pingfang@zte.com.cn>

Use kcalloc instead of kmalloc in the comment according to
the previous kcalloc() call.

Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>
---
 fs/reiserfs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index 6419e6d..21ad762 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -1066,7 +1066,7 @@ int reiserfs_get_block(struct inode *inode, sector_t block,
 			} else {
 				/* paste hole to the indirect item */
 				/*
-				 * If kmalloc failed, max_to_insert becomes
+				 * If kcalloc failed, max_to_insert becomes
 				 * zero and it means we only have space for
 				 * one block
 				 */
-- 
2.9.5

