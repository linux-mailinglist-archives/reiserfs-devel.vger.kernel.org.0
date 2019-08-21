Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F157F9760A
	for <lists+reiserfs-devel@lfdr.de>; Wed, 21 Aug 2019 11:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbfHUJZv (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 21 Aug 2019 05:25:51 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5173 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726591AbfHUJZu (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 21 Aug 2019 05:25:50 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 5D43F7E0D8F8AD80956C;
        Wed, 21 Aug 2019 17:25:48 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Wed, 21 Aug 2019
 17:25:39 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <jack@suse.cz>, <akpm@linux-foundation.org>,
        <linux.bhar@gmail.com>, <arnd@arndb.de>,
        <hariprasad.kelam@gmail.com>, <reiserfs-devel@vger.kernel.org>
CC:     <yi.zhang@huawei.com>, <zhengbin13@huawei.com>
Subject: [PATCH 2/7] fs/reiserfs/stree.c: remove set but not used variables
Date:   Wed, 21 Aug 2019 17:32:04 +0800
Message-ID: <1566379929-118398-3-git-send-email-zhengbin13@huawei.com>
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

Fixes gcc '-Wunused-but-set-variable' warning:

fs/reiserfs/stree.c: In function search_by_key:
fs/reiserfs/stree.c:596:6: warning: variable right_neighbor_of_leaf_node set but not used [-Wunused-but-set-variable]

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 fs/reiserfs/stree.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
index 0037aea..da9ebe3 100644
--- a/fs/reiserfs/stree.c
+++ b/fs/reiserfs/stree.c
@@ -593,7 +593,6 @@ int search_by_key(struct super_block *sb, const struct cpu_key *key,
 	struct buffer_head *bh;
 	struct path_element *last_element;
 	int node_level, retval;
-	int right_neighbor_of_leaf_node;
 	int fs_gen;
 	struct buffer_head *reada_bh[SEARCH_BY_KEY_READA];
 	b_blocknr_t reada_blocks[SEARCH_BY_KEY_READA];
@@ -614,8 +613,6 @@ int search_by_key(struct super_block *sb, const struct cpu_key *key,

 	pathrelse(search_path);

-	right_neighbor_of_leaf_node = 0;
-
 	/*
 	 * With each iteration of this loop we search through the items in the
 	 * current node, and calculate the next current node(next path element)
@@ -701,7 +698,6 @@ int search_by_key(struct super_block *sb, const struct cpu_key *key,
 			 */
 			block_number = SB_ROOT_BLOCK(sb);
 			expected_level = -1;
-			right_neighbor_of_leaf_node = 0;

 			/* repeat search from the root */
 			continue;
--
2.7.4

