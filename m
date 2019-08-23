Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D11589AB72
	for <lists+reiserfs-devel@lfdr.de>; Fri, 23 Aug 2019 11:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730870AbfHWJgQ (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 23 Aug 2019 05:36:16 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5207 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725797AbfHWJgQ (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 23 Aug 2019 05:36:16 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id E5679F0705B31F686C4B;
        Fri, 23 Aug 2019 17:36:12 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Fri, 23 Aug 2019
 17:36:04 +0800
From:   yu kuai <yukuai3@huawei.com>
To:     <reiserfs-devel@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <zhengbin13@huawei.com>, <yukuai3@yukuai.com>,
        <yi.zhang@huawei.com>
Subject: [PATCH] reiserfs: fix set but not used variable 'blkh'
Date:   Fri, 23 Aug 2019 17:42:36 +0800
Message-ID: <1566553356-8345-1-git-send-email-yukuai3@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Gcc '-Wunused-but-set-variable' warning: 
fs/reiserfs/prints.c:749:21: warning: variable blkh set but not used

Fix it by using blkh instead of regenerating it by B_BLK_HEAD(bh)

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: yu kuai <yukuai3@huawei.com>
---
 fs/reiserfs/prints.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/fs/reiserfs/prints.c b/fs/reiserfs/prints.c
index 9fed1c0..590d42b 100644
--- a/fs/reiserfs/prints.c
+++ b/fs/reiserfs/prints.c
@@ -749,15 +749,16 @@ static void check_internal_block_head(struct buffer_head *bh)
 	struct block_head *blkh;
 
 	blkh = B_BLK_HEAD(bh);
-	if (!(B_LEVEL(bh) > DISK_LEAF_NODE_LEVEL && B_LEVEL(bh) <= MAX_HEIGHT))
+	if (!(blkh_level(blkh) > DISK_LEAF_NODE_LEVEL &&
+		blkh_level(blkh) <= MAX_HEIGHT))
 		reiserfs_panic(NULL, "vs-6025", "invalid level %z", bh);
 
-	if (B_NR_ITEMS(bh) > (bh->b_size - BLKH_SIZE) / IH_SIZE)
+	if (blkh_nr_item(blkh) > (bh->b_size - BLKH_SIZE) / IH_SIZE)
 		reiserfs_panic(NULL, "vs-6030", "invalid item number %z", bh);
 
-	if (B_FREE_SPACE(bh) !=
-	    bh->b_size - BLKH_SIZE - KEY_SIZE * B_NR_ITEMS(bh) -
-	    DC_SIZE * (B_NR_ITEMS(bh) + 1))
+	if (blkh_free_space(p_blkh) !=
+	    bh->b_size - BLKH_SIZE - KEY_SIZE * blkh_nr_item(blkh) -
+	    DC_SIZE * (blkh_nr_item(blkh) + 1))
 		reiserfs_panic(NULL, "vs-6040", "invalid free space %z", bh);
 
 }
-- 
2.7.4

