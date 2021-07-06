Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B0D23BCBD0
	for <lists+reiserfs-devel@lfdr.de>; Tue,  6 Jul 2021 13:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232088AbhGFLRe (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 6 Jul 2021 07:17:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:52740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232085AbhGFLRa (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 6 Jul 2021 07:17:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88BCF61C2D;
        Tue,  6 Jul 2021 11:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625570091;
        bh=SAJYWcgcH/e2eq5T9fBY2MEs3b92Zz95isfe+F+4SJ4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=r6HEBA2eAMPy80lphuS750xgwoH0v+kX40n4FAv/4lUOLmwl5aBqwuGbz9w0GOCTp
         tJSjOsYkYP6LCZjgsoEgaYUSJL+STK220xxlKv2v+pBPvLdMJ8Sxfm6dXkk4n+yALU
         oGSJFwuoUBWeZ+S7wYnkCLwNGWsD9ttihwpDgM9QpH4WRzh13/RHlmuWrfKq+DO1po
         2vENcRbl7uCQRgChM21Vz1Tj4EWRMItPDtDLpcIcoXB1LX8XqwX7HXwrt0o5FreGlV
         9uFk0qeJkA/AWGkpbPcqY4pvCrVUP+Vt9Ph682C8Rddidv3MuyB8DAHmH7CmdDN0wN
         pBy7MQ3cXIoKw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Pavel Skripkin <paskripkin@gmail.com>,
        syzbot+0ba9909df31c6a36974d@syzkaller.appspotmail.com,
        Jan Kara <jack@suse.cz>, Sasha Levin <sashal@kernel.org>,
        reiserfs-devel@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 029/189] reiserfs: add check for invalid 1st journal block
Date:   Tue,  6 Jul 2021 07:11:29 -0400
Message-Id: <20210706111409.2058071-29-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111409.2058071-1-sashal@kernel.org>
References: <20210706111409.2058071-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

From: Pavel Skripkin <paskripkin@gmail.com>

[ Upstream commit a149127be52fa7eaf5b3681a0317a2bbb772d5a9 ]

syzbot reported divide error in reiserfs.
The problem was in incorrect journal 1st block.

Syzbot's reproducer manualy generated wrong superblock
with incorrect 1st block. In journal_init() wasn't
any checks about this particular case.

For example, if 1st journal block is before superblock
1st block, it can cause zeroing important superblock members
in do_journal_end().

Link: https://lore.kernel.org/r/20210517121545.29645-1-paskripkin@gmail.com
Reported-by: syzbot+0ba9909df31c6a36974d@syzkaller.appspotmail.com
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Jan Kara <jack@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/reiserfs/journal.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 9edc8e2b154e..0834b101c316 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -2758,6 +2758,20 @@ int journal_init(struct super_block *sb, const char *j_dev_name,
 		goto free_and_return;
 	}
 
+	/*
+	 * Sanity check to see if journal first block is correct.
+	 * If journal first block is invalid it can cause
+	 * zeroing important superblock members.
+	 */
+	if (!SB_ONDISK_JOURNAL_DEVICE(sb) &&
+	    SB_ONDISK_JOURNAL_1st_BLOCK(sb) < SB_JOURNAL_1st_RESERVED_BLOCK(sb)) {
+		reiserfs_warning(sb, "journal-1393",
+				 "journal 1st super block is invalid: 1st reserved block %d, but actual 1st block is %d",
+				 SB_JOURNAL_1st_RESERVED_BLOCK(sb),
+				 SB_ONDISK_JOURNAL_1st_BLOCK(sb));
+		goto free_and_return;
+	}
+
 	if (journal_init_dev(sb, journal, j_dev_name) != 0) {
 		reiserfs_warning(sb, "sh-462",
 				 "unable to initialize journal device");
-- 
2.30.2

