Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 723A69DBD7
	for <lists+reiserfs-devel@lfdr.de>; Tue, 27 Aug 2019 05:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728406AbfH0DI5 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 26 Aug 2019 23:08:57 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5217 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728345AbfH0DI5 (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 26 Aug 2019 23:08:57 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 3104FB144201CA99AC2E;
        Tue, 27 Aug 2019 11:08:54 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Tue, 27 Aug 2019
 11:08:47 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <akpm@linux-foundation.org>, <sfr@canb.auug.org.au>,
        <jack@suse.cz>, <reiserfs-devel@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>
Subject: [PATCH 2/2] reiserfs: remove set but not used variable in do_balan.c
Date:   Tue, 27 Aug 2019 11:29:32 +0800
Message-ID: <20190827032932.46622-2-yanaijie@huawei.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190827032932.46622-1-yanaijie@huawei.com>
References: <20190827032932.46622-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Fix the following gcc warning:

fs/reiserfs/do_balan.c: In function balance_leaf_insert_right:
fs/reiserfs/do_balan.c:629:6: warning: variable ret set but not used
[-Wunused-but-set-variable]

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 fs/reiserfs/do_balan.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/reiserfs/do_balan.c b/fs/reiserfs/do_balan.c
index ffb6d7f0da94..4075e41408b4 100644
--- a/fs/reiserfs/do_balan.c
+++ b/fs/reiserfs/do_balan.c
@@ -626,7 +626,6 @@ static void balance_leaf_insert_right(struct tree_balance *tb,
 	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
 	int n = B_NR_ITEMS(tbS0);
 	struct buffer_info bi;
-	int ret;
 
 	/* new item or part of it doesn't fall into R[0] */
 	if (n - tb->rnum[0] >= tb->item_pos) {
@@ -690,7 +689,7 @@ static void balance_leaf_insert_right(struct tree_balance *tb,
 		/* whole new item falls into R[0] */
 
 		/* Shift rnum[0]-1 items to R[0] */
-		ret = leaf_shift_right(tb, tb->rnum[0] - 1, tb->rbytes);
+		leaf_shift_right(tb, tb->rnum[0] - 1, tb->rbytes);
 
 		/* Insert new item into R[0] */
 		buffer_info_init_right(tb, &bi);
-- 
2.17.2

