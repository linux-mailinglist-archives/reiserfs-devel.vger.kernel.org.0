Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57EF597608
	for <lists+reiserfs-devel@lfdr.de>; Wed, 21 Aug 2019 11:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbfHUJZv (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 21 Aug 2019 05:25:51 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5170 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726730AbfHUJZu (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 21 Aug 2019 05:25:50 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 50FF0DE13D9B2CB2CF4A;
        Wed, 21 Aug 2019 17:25:48 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Wed, 21 Aug 2019
 17:25:39 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <jack@suse.cz>, <akpm@linux-foundation.org>,
        <linux.bhar@gmail.com>, <arnd@arndb.de>,
        <hariprasad.kelam@gmail.com>, <reiserfs-devel@vger.kernel.org>
CC:     <yi.zhang@huawei.com>, <zhengbin13@huawei.com>
Subject: [PATCH 3/7] fs/reiserfs/lbalance.c: remove set but not used variables
Date:   Wed, 21 Aug 2019 17:32:05 +0800
Message-ID: <1566379929-118398-4-git-send-email-zhengbin13@huawei.com>
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

fs/reiserfs/lbalance.c: In function leaf_paste_entries:
fs/reiserfs/lbalance.c:1325:9: warning: variable old_entry_num set but not used [-Wunused-but-set-variable]

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 fs/reiserfs/lbalance.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/reiserfs/lbalance.c b/fs/reiserfs/lbalance.c
index f5cebd7..7f86856 100644
--- a/fs/reiserfs/lbalance.c
+++ b/fs/reiserfs/lbalance.c
@@ -1322,7 +1322,7 @@ void leaf_paste_entries(struct buffer_info *bi,
 	char *item;
 	struct reiserfs_de_head *deh;
 	char *insert_point;
-	int i, old_entry_num;
+	int i;
 	struct buffer_head *bh = bi->bi_bh;

 	if (new_entry_count == 0)
@@ -1362,7 +1362,6 @@ void leaf_paste_entries(struct buffer_info *bi,
 		put_deh_location(&deh[i],
 				 deh_location(&deh[i]) + paste_size);

-	old_entry_num = ih_entry_count(ih);
 	put_ih_entry_count(ih, ih_entry_count(ih) + new_entry_count);

 	/* prepare space for pasted records */
--
2.7.4

