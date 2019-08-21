Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF1A9760C
	for <lists+reiserfs-devel@lfdr.de>; Wed, 21 Aug 2019 11:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbfHUJZw (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 21 Aug 2019 05:25:52 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5175 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726648AbfHUJZw (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 21 Aug 2019 05:25:52 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 6509C23E92F7AC547391;
        Wed, 21 Aug 2019 17:25:48 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Wed, 21 Aug 2019
 17:25:39 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <jack@suse.cz>, <akpm@linux-foundation.org>,
        <linux.bhar@gmail.com>, <arnd@arndb.de>,
        <hariprasad.kelam@gmail.com>, <reiserfs-devel@vger.kernel.org>
CC:     <yi.zhang@huawei.com>, <zhengbin13@huawei.com>
Subject: [PATCH 4/7] fs/reiserfs/objectid.c: remove set but not used variables
Date:   Wed, 21 Aug 2019 17:32:06 +0800
Message-ID: <1566379929-118398-5-git-send-email-zhengbin13@huawei.com>
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

fs/reiserfs/objectid.c: In function reiserfs_convert_objectid_map_v1:
fs/reiserfs/objectid.c:186:25: warning: variable new_objectid_map set but not used [-Wunused-but-set-variable]

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 fs/reiserfs/objectid.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/reiserfs/objectid.c b/fs/reiserfs/objectid.c
index 415d66c..34baf5c 100644
--- a/fs/reiserfs/objectid.c
+++ b/fs/reiserfs/objectid.c
@@ -183,13 +183,12 @@ int reiserfs_convert_objectid_map_v1(struct super_block *s)
 	int new_size = (s->s_blocksize - SB_SIZE) / sizeof(__u32) / 2 * 2;
 	int old_max = sb_oid_maxsize(disk_sb);
 	struct reiserfs_super_block_v1 *disk_sb_v1;
-	__le32 *objectid_map, *new_objectid_map;
+	__le32 *objectid_map;
 	int i;

 	disk_sb_v1 =
 	    (struct reiserfs_super_block_v1 *)(SB_BUFFER_WITH_SB(s)->b_data);
 	objectid_map = (__le32 *) (disk_sb_v1 + 1);
-	new_objectid_map = (__le32 *) (disk_sb + 1);

 	if (cur_size > new_size) {
 		/*
--
2.7.4

