Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6520F9760F
	for <lists+reiserfs-devel@lfdr.de>; Wed, 21 Aug 2019 11:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbfHUJZy (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 21 Aug 2019 05:25:54 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5176 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726852AbfHUJZx (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 21 Aug 2019 05:25:53 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 68BCDB772E1C3F0CF649;
        Wed, 21 Aug 2019 17:25:48 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Wed, 21 Aug 2019
 17:25:40 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <jack@suse.cz>, <akpm@linux-foundation.org>,
        <linux.bhar@gmail.com>, <arnd@arndb.de>,
        <hariprasad.kelam@gmail.com>, <reiserfs-devel@vger.kernel.org>
CC:     <yi.zhang@huawei.com>, <zhengbin13@huawei.com>
Subject: [PATCH 6/7] fs/reiserfs/fix_node.c: remove set but not used variables
Date:   Wed, 21 Aug 2019 17:32:08 +0800
Message-ID: <1566379929-118398-7-git-send-email-zhengbin13@huawei.com>
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

fs/reiserfs/fix_node.c: In function get_num_ver:
fs/reiserfs/fix_node.c:379:6: warning: variable cur_free set but not used [-Wunused-but-set-variable]
fs/reiserfs/fix_node.c: In function dc_check_balance_internal:
fs/reiserfs/fix_node.c:1737:6: warning: variable maxsize set but not used [-Wunused-but-set-variable]

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 fs/reiserfs/fix_node.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/fs/reiserfs/fix_node.c b/fs/reiserfs/fix_node.c
index 6b0ddb2..1170922 100644
--- a/fs/reiserfs/fix_node.c
+++ b/fs/reiserfs/fix_node.c
@@ -376,7 +376,6 @@ static int get_num_ver(int mode, struct tree_balance *tb, int h,
 		       int to, int to_bytes, short *snum012, int flow)
 {
 	int i;
-	int cur_free;
 	int units;
 	struct virtual_node *vn = tb->tb_vn;
 	int total_node_size, max_node_size, current_item_size;
@@ -438,7 +437,6 @@ static int get_num_ver(int mode, struct tree_balance *tb, int h,
 	/* leaf level */
 	needed_nodes = 1;
 	total_node_size = 0;
-	cur_free = max_node_size;

 	/* start from 'from'-th item */
 	start_item = from;
@@ -1734,14 +1732,12 @@ static int dc_check_balance_internal(struct tree_balance *tb, int h)
 	 * and Fh is its father.
 	 */
 	struct buffer_head *Sh, *Fh;
-	int maxsize, ret;
+	int ret;
 	int lfree, rfree /* free space in L and R */ ;

 	Sh = PATH_H_PBUFFER(tb->tb_path, h);
 	Fh = PATH_H_PPARENT(tb->tb_path, h);

-	maxsize = MAX_CHILD_SIZE(Sh);
-
 	/*
 	 * using tb->insert_size[h], which is negative in this case,
 	 * create_virtual_node calculates:
--
2.7.4

