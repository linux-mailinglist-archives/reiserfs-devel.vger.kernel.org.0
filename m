Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB2D99760D
	for <lists+reiserfs-devel@lfdr.de>; Wed, 21 Aug 2019 11:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbfHUJZw (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 21 Aug 2019 05:25:52 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5171 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726227AbfHUJZw (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 21 Aug 2019 05:25:52 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 4CC4E37B125968F7928A;
        Wed, 21 Aug 2019 17:25:48 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Wed, 21 Aug 2019
 17:25:41 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <jack@suse.cz>, <akpm@linux-foundation.org>,
        <linux.bhar@gmail.com>, <arnd@arndb.de>,
        <hariprasad.kelam@gmail.com>, <reiserfs-devel@vger.kernel.org>
CC:     <yi.zhang@huawei.com>, <zhengbin13@huawei.com>
Subject: [PATCH 7/7] fs/reiserfs/do_balan.c: remove set but not used variables
Date:   Wed, 21 Aug 2019 17:32:09 +0800
Message-ID: <1566379929-118398-8-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566379929-118398-1-git-send-email-zhengbin13@huawei.com>
References: <1566379929-118398-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

fs/reiserfs/do_balan.c: In function balance_leaf_when_delete:
fs/reiserfs/do_balan.c:245:20: warning: variable ih set but not used [-Wunused-but-set-variable]
fs/reiserfs/do_balan.c: In function balance_leaf_insert_left:
fs/reiserfs/do_balan.c:301:7: warning: variable version set but not used [-Wunused-but-set-variable]
fs/reiserfs/do_balan.c: In function balance_leaf_insert_right:
fs/reiserfs/do_balan.c:649:7: warning: variable version set but not used [-Wunused-but-set-variable]
fs/reiserfs/do_balan.c: In function balance_leaf_new_nodes_insert:
fs/reiserfs/do_balan.c:953:7: warning: variable version set but not used [-Wunused-but-set-variable]

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 fs/reiserfs/do_balan.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/fs/reiserfs/do_balan.c b/fs/reiserfs/do_balan.c
index 9c02d96..ffb6d7f 100644
--- a/fs/reiserfs/do_balan.c
+++ b/fs/reiserfs/do_balan.c
@@ -239,10 +239,8 @@ static int balance_leaf_when_delete_left(struct tree_balance *tb)
 static int balance_leaf_when_delete(struct tree_balance *tb, int flag)
 {
 	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
-	int item_pos = PATH_LAST_POSITION(tb->tb_path);
 	struct buffer_info bi;
 	int n;
-	struct item_head *ih;

 	RFALSE(tb->FR[0] && B_LEVEL(tb->FR[0]) != DISK_LEAF_NODE_LEVEL + 1,
 	       "vs- 12000: level: wrong FR %z", tb->FR[0]);
@@ -251,7 +249,6 @@ static int balance_leaf_when_delete(struct tree_balance *tb, int flag)
 	RFALSE(!tb->blknum[0] && !PATH_H_PPARENT(tb->tb_path, 0),
 	       "PAP-12010: tree can not be empty");

-	ih = item_head(tbS0, item_pos);
 	buffer_info_init_tbS0(tb, &bi);

 	/* Delete or truncate the item */
@@ -298,7 +295,6 @@ static unsigned int balance_leaf_insert_left(struct tree_balance *tb,
 	if (tb->item_pos == tb->lnum[0] - 1 && tb->lbytes != -1) {
 		/* part of new item falls into L[0] */
 		int new_item_len, shift;
-		int version;

 		ret = leaf_shift_left(tb, tb->lnum[0] - 1, -1);

@@ -317,8 +313,6 @@ static unsigned int balance_leaf_insert_left(struct tree_balance *tb,
 		leaf_insert_into_buf(&bi, n + tb->item_pos - ret, ih, body,
 			     min_t(int, tb->zeroes_num, ih_item_len(ih)));

-		version = ih_version(ih);
-
 		/*
 		 * Calculate key component, item length and body to
 		 * insert into S[0]
@@ -646,13 +640,11 @@ static void balance_leaf_insert_right(struct tree_balance *tb,
 	if (tb->item_pos == n - tb->rnum[0] + 1 && tb->rbytes != -1) {
 		loff_t old_key_comp, old_len, r_zeroes_number;
 		const char *r_body;
-		int version, shift;
+		int shift;
 		loff_t offset;

 		leaf_shift_right(tb, tb->rnum[0] - 1, -1);

-		version = ih_version(ih);
-
 		/* Remember key component and item length */
 		old_key_comp = le_ih_k_offset(ih);
 		old_len = ih_item_len(ih);
@@ -950,14 +942,12 @@ static void balance_leaf_new_nodes_insert(struct tree_balance *tb,
 	if (tb->item_pos == n - tb->snum[i] + 1 && tb->sbytes[i] != -1) {
 		int old_key_comp, old_len, r_zeroes_number;
 		const char *r_body;
-		int version;

 		/* Move snum[i]-1 items from S[0] to S_new[i] */
 		leaf_move_items(LEAF_FROM_S_TO_SNEW, tb, tb->snum[i] - 1, -1,
 				tb->S_new[i]);

 		/* Remember key component and item length */
-		version = ih_version(ih);
 		old_key_comp = le_ih_k_offset(ih);
 		old_len = ih_item_len(ih);

--
2.7.4

