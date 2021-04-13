Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A96E335D4EA
	for <lists+reiserfs-devel@lfdr.de>; Tue, 13 Apr 2021 03:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239144AbhDMBnV (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 12 Apr 2021 21:43:21 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:16451 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239038AbhDMBnU (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 12 Apr 2021 21:43:20 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FK7bd0Fj2ztVfV;
        Tue, 13 Apr 2021 09:40:45 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Tue, 13 Apr 2021 09:42:54 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <jack@suse.cz>, <rdunlap@infradead.org>
CC:     <reiserfs-devel@vger.kernel.org>, Tian Tao <tiantao6@hisilicon.com>
Subject: [PATCH] fs/reiserfs/journal.c: delete useless variables
Date:   Tue, 13 Apr 2021 09:43:16 +0800
Message-ID: <1618278196-17749-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

The value of 'cn' is not used, so just delete it.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 fs/reiserfs/journal.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index e98f993..9edc8e2 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -461,7 +461,6 @@ int reiserfs_in_journal(struct super_block *sb,
 			b_blocknr_t * next_zero_bit)
 {
 	struct reiserfs_journal *journal = SB_JOURNAL(sb);
-	struct reiserfs_journal_cnode *cn;
 	struct reiserfs_list_bitmap *jb;
 	int i;
 	unsigned long bl;
@@ -497,13 +496,12 @@ int reiserfs_in_journal(struct super_block *sb,
 	bl = bmap_nr * (sb->s_blocksize << 3) + bit_nr;
 	/* is it in any old transactions? */
 	if (search_all
-	    && (cn =
-		get_journal_hash_dev(sb, journal->j_list_hash_table, bl))) {
+	    && (get_journal_hash_dev(sb, journal->j_list_hash_table, bl))) {
 		return 1;
 	}
 
 	/* is it in the current transaction.  This should never happen */
-	if ((cn = get_journal_hash_dev(sb, journal->j_hash_table, bl))) {
+	if ((get_journal_hash_dev(sb, journal->j_hash_table, bl))) {
 		BUG();
 		return 1;
 	}
-- 
2.7.4

