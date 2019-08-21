Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 420269760E
	for <lists+reiserfs-devel@lfdr.de>; Wed, 21 Aug 2019 11:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbfHUJZx (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 21 Aug 2019 05:25:53 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:37818 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726988AbfHUJZx (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 21 Aug 2019 05:25:53 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 7D51DC719DBAA4811FA1;
        Wed, 21 Aug 2019 17:25:48 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Wed, 21 Aug 2019
 17:25:39 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <jack@suse.cz>, <akpm@linux-foundation.org>,
        <linux.bhar@gmail.com>, <arnd@arndb.de>,
        <hariprasad.kelam@gmail.com>, <reiserfs-devel@vger.kernel.org>
CC:     <yi.zhang@huawei.com>, <zhengbin13@huawei.com>
Subject: [PATCH 1/7] fs/reiserfs/journal.c: remove set but not used variables
Date:   Wed, 21 Aug 2019 17:32:03 +0800
Message-ID: <1566379929-118398-2-git-send-email-zhengbin13@huawei.com>
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

fs/reiserfs/journal.c: In function flush_older_commits:
fs/reiserfs/journal.c:894:15: warning: variable first_trans_id set but not used [-Wunused-but-set-variable]
fs/reiserfs/journal.c: In function flush_journal_list:
fs/reiserfs/journal.c:1354:38: warning: variable last set but not used [-Wunused-but-set-variable]
fs/reiserfs/journal.c: In function do_journal_release:
fs/reiserfs/journal.c:1916:6: warning: variable flushed set but not used [-Wunused-but-set-variable]
fs/reiserfs/journal.c: In function do_journal_end:
fs/reiserfs/journal.c:3993:6: warning: variable old_start set but not used [-Wunused-but-set-variable]

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 fs/reiserfs/journal.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 4517a13..fbd527d 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -891,7 +891,6 @@ static int flush_older_commits(struct super_block *s,
 	struct list_head *entry;
 	unsigned int trans_id = jl->j_trans_id;
 	unsigned int other_trans_id;
-	unsigned int first_trans_id;

 find_first:
 	/*
@@ -914,8 +913,6 @@ static int flush_older_commits(struct super_block *s,
 		return 0;
 	}

-	first_trans_id = first_jl->j_trans_id;
-
 	entry = &first_jl->j_list;
 	while (1) {
 		other_jl = JOURNAL_LIST_ENTRY(entry);
@@ -1351,7 +1348,7 @@ static int flush_journal_list(struct super_block *s,
 			      struct reiserfs_journal_list *jl, int flushall)
 {
 	struct reiserfs_journal_list *pjl;
-	struct reiserfs_journal_cnode *cn, *last;
+	struct reiserfs_journal_cnode *cn;
 	int count;
 	int was_jwait = 0;
 	int was_dirty = 0;
@@ -1509,7 +1506,6 @@ static int flush_journal_list(struct super_block *s,
 					 b_blocknr, __func__);
 		}
 free_cnode:
-		last = cn;
 		cn = cn->next;
 		if (saved_bh) {
 			/*
@@ -1911,7 +1907,6 @@ static int do_journal_release(struct reiserfs_transaction_handle *th,
 			      struct super_block *sb, int error)
 {
 	struct reiserfs_transaction_handle myth;
-	int flushed = 0;
 	struct reiserfs_journal *journal = SB_JOURNAL(sb);

 	/*
@@ -1933,7 +1928,6 @@ static int do_journal_release(struct reiserfs_transaction_handle *th,
 						     1);
 			journal_mark_dirty(&myth, SB_BUFFER_WITH_SB(sb));
 			do_journal_end(&myth, FLUSH_ALL);
-			flushed = 1;
 		}
 	}

@@ -3988,7 +3982,6 @@ static int do_journal_end(struct reiserfs_transaction_handle *th, int flags)
 	struct buffer_head *c_bh;	/* commit bh */
 	struct buffer_head *d_bh;	/* desc bh */
 	int cur_write_start = 0;	/* start index of current log write */
-	int old_start;
 	int i;
 	int flush;
 	int wait_on_commit;
@@ -4245,7 +4238,6 @@ static int do_journal_end(struct reiserfs_transaction_handle *th, int flags)
 	journal->j_num_work_lists++;

 	/* reset journal values for the next transaction */
-	old_start = journal->j_start;
 	journal->j_start =
 	    (journal->j_start + journal->j_len +
 	     2) % SB_ONDISK_JOURNAL_SIZE(sb);
--
2.7.4

