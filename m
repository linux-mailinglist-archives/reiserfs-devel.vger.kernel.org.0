Return-Path: <reiserfs-devel+bounces-33-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB614825B35
	for <lists+reiserfs-devel@lfdr.de>; Fri,  5 Jan 2024 20:48:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E190B1C236F6
	for <lists+reiserfs-devel@lfdr.de>; Fri,  5 Jan 2024 19:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B51135EF7;
	Fri,  5 Jan 2024 19:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ucr.edu header.i=@ucr.edu header.b="WRCyNmy8";
	dkim=pass (1024-bit key) header.d=ucr.edu header.i=@ucr.edu header.b="KSa5b0oc"
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mx5.ucr.edu (mx.ucr.edu [138.23.62.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEC935F0C
	for <reiserfs-devel@vger.kernel.org>; Fri,  5 Jan 2024 19:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucr.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucr.edu
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1704484085; x=1736020085;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4RAM7Q3jvKG9hpvdQGPT5Rs+UqT5CESNG9v2DlePuR4=;
  b=WRCyNmy8X04TvXtCX5RL2dGBdw5HBliPY9S9G7oAMFLIDGPMIFJ96vse
   R/bf5uc8/U5S4fnupl6+XgX4/B8rGHJX0HxFU2u8inhlT3IQo9EwTgXZy
   vvfaUcezmHw7E2YyoqEqcQW7I0Y5JJhy4Sf4iUhKz7aFEaTw0sx/038Rk
   dkOr5Kn5lyakruAj+TQLnG3/0hfGPLKQ5COOH0NfkUhsW2Qa6rOHdDJyv
   Hj6nFzFCyj4X1HtmvOksw8vepuXBP4eH0xnnrz2IL9e+ACqhILSLZ/zaF
   /AQ/aN4f/oFvfswnK/yTeNxc7W56C/GEkd2H/H4cHsqzSe5Voh5kwOkBM
   w==;
X-CSE-ConnectionGUID: OQErlNJGSxqMKc2urqJivQ==
X-CSE-MsgGUID: JKrFG5yUQ0qBMBSCnXmMpw==
Received: from mail-pf1-f197.google.com ([209.85.210.197])
  by smtpmx5.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Jan 2024 11:48:04 -0800
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-6d9b050e9a8so2205950b3a.1
        for <reiserfs-devel@vger.kernel.org>; Fri, 05 Jan 2024 11:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ucr.edu; s=rmail; t=1704484083; x=1705088883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p8kMB0lwL3SIN7tBgJt70PPAf3r74a/+RPa0NBR1D5M=;
        b=KSa5b0oc7fsmgsXTrYJF7IazTJSjhkqOFySkWzcy5T1Kyd/xjSvc+VMdyEfT7NYvvc
         MMYWr8bL6X5bvSuDA2A3DxiEwMOk4AJ64pVD7gGJbzl3UXCIWfG+ifUdtHvJvK33GRdV
         azy4+PYQGNTfMHsW8HAFhbbIUQ1ykDVnz4Gyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704484083; x=1705088883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p8kMB0lwL3SIN7tBgJt70PPAf3r74a/+RPa0NBR1D5M=;
        b=oqYX0Fchuur5bL/PSYCHKnmzc0i8MNgVOQiX0A60bbAYg/f3ztnxulryj1bISN/st5
         Mx4eay1fifcAfjtGS6Oy2bxIHZplQvEsjp9Ekl/uTTyPp5YJHrWFmYinyALEYHEYcBBt
         2Z7IBF1nwyGx1HUO0xHnmV0DyjXItvveC870yvMgkgImi5gVeNsIeNeyKYfivOb8KotH
         kL5zXIZbL1Vb7ExCTSlQk7QJgxhiBorRq6te5x0HYHdtgKSk2QQcu1WZgKHHrAKeqXqR
         xcvYVYY3DgOAWlGHKMRW2HNI7fl6JdupGSgmcbVkiB1JTQnl9IN17KSe1i7zYuuGgl3Y
         YV+g==
X-Gm-Message-State: AOJu0Ywq0tNV6/f61pmi3nHbNfwAkFpmBIAUIzLKCMoortJB4tPygsEW
	aylTzhl2gba3Ar/KRXFYekp9PamgOPQiDu8MQLGJEvxyEytlydK444vAZeDMKr/6+PwxeAsIh3u
	EONJiaPlmV0gQ0wzhNHEWAzNDiC4vRvtYOyA4j5Ms2oYZe7KEGvr1S3MUGuMmyWuv6pNFfIKdir
	G8QotcjiLVIc8Npqk=
X-Received: by 2002:a05:6a00:3319:b0:6d9:ac87:9db7 with SMTP id cq25-20020a056a00331900b006d9ac879db7mr2970664pfb.4.1704484082820;
        Fri, 05 Jan 2024 11:48:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGF7kNh+j2C3GhhA9/d8eJrjDwJ4AIQGcOI6ZWXyoJorKTBh+f4Wkh5T0LvDkN9CM6RxWPhww==
X-Received: by 2002:a05:6a00:3319:b0:6d9:ac87:9db7 with SMTP id cq25-20020a056a00331900b006d9ac879db7mr2970651pfb.4.1704484082450;
        Fri, 05 Jan 2024 11:48:02 -0800 (PST)
Received: from localhost (kq.cs.ucr.edu. [169.235.27.223])
        by smtp.gmail.com with UTF8SMTPSA id it18-20020a056a00459200b006d980fa11e9sm1751012pfb.51.2024.01.05.11.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jan 2024 11:48:02 -0800 (PST)
From: Xiaochen Zou <xzou017@ucr.edu>
To: reiserfs-devel@vger.kernel.org
Cc: Xiaochen Zou <xzou017@ucr.edu>
Subject: [PATCH] fs/reiserfs: Null check to prevent null-ptr-deref bug
Date: Fri,  5 Jan 2024 11:48:32 -0800
Message-Id: <20240105194832.1196581-1-xzou017@ucr.edu>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's necessary to perform a null check on the return value of
sb_getblk() to prevent null-ptr-deref bugs

Signed-off-by: Xiaochen Zou <xzou017@ucr.edu>
---
 fs/reiserfs/fix_node.c |  2 ++
 fs/reiserfs/journal.c  | 13 ++++++++++++-
 fs/reiserfs/stree.c    |  2 ++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/fs/reiserfs/fix_node.c b/fs/reiserfs/fix_node.c
index 6c13a8d9a73c..cfa2520a34c3 100644
--- a/fs/reiserfs/fix_node.c
+++ b/fs/reiserfs/fix_node.c
@@ -888,6 +888,8 @@ static int get_empty_nodes(struct tree_balance *tb, int h)
 		       "PAP-8135: reiserfs_new_blocknrs failed when got new blocks");
 
 		new_bh = sb_getblk(sb, *blocknr);
+		if (unlikely(!new_bh))
+			return -ENOMEM;
 		RFALSE(buffer_dirty(new_bh) ||
 		       buffer_journaled(new_bh) ||
 		       buffer_journal_dirty(new_bh),
diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 171c912af50f..c8e6e9c07f31 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -2115,6 +2115,7 @@ static int journal_read_transaction(struct super_block *sb,
 	struct reiserfs_journal_desc *desc;
 	struct reiserfs_journal_commit *commit;
 	unsigned int trans_id = 0;
+	int err = 0;
 	struct buffer_head *c_bh;
 	struct buffer_head *d_bh;
 	struct buffer_head **log_blocks = NULL;
@@ -2209,11 +2210,19 @@ static int journal_read_transaction(struct super_block *sb,
 			real_blocks[i] =
 			    sb_getblk(sb,
 				      le32_to_cpu(desc->j_realblock[i]));
+			if (unlikely(!real_blocks[i])) {
+				err = -ENOMEM;
+				goto out;
+			}
 		} else {
 			real_blocks[i] =
 			    sb_getblk(sb,
 				      le32_to_cpu(commit->
 						  j_realblock[i - trans_half]));
+			if (unlikely(!real_blocks[i])) {
+				err = -ENOMEM;
+				goto out;
+			}
 		}
 		if (real_blocks[i]->b_blocknr > SB_BLOCK_COUNT(sb)) {
 			reiserfs_warning(sb, "journal-1207",
@@ -2300,11 +2309,13 @@ static int journal_read_transaction(struct super_block *sb,
 	/* check for trans_id overflow */
 	if (journal->j_trans_id == 0)
 		journal->j_trans_id = 10;
+
+out:
 	brelse(c_bh);
 	brelse(d_bh);
 	kfree(log_blocks);
 	kfree(real_blocks);
-	return 0;
+	return err;
 }
 
 /*
diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
index 2138ee7d271d..eee861680348 100644
--- a/fs/reiserfs/stree.c
+++ b/fs/reiserfs/stree.c
@@ -562,6 +562,8 @@ static int search_by_key_reada(struct super_block *s,
 
 	for (i = 0; i < num; i++) {
 		bh[i] = sb_getblk(s, b[i]);
+		if (unlikely(!bh[i]))
+			return -ENOMEM;
 	}
 	/*
 	 * We are going to read some blocks on which we
-- 
2.25.1


