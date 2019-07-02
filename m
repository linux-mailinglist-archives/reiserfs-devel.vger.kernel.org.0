Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31C565D5BD
	for <lists+reiserfs-devel@lfdr.de>; Tue,  2 Jul 2019 19:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbfGBRyg (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 2 Jul 2019 13:54:36 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34221 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbfGBRyg (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 2 Jul 2019 13:54:36 -0400
Received: by mail-pf1-f196.google.com with SMTP id c85so8641707pfc.1;
        Tue, 02 Jul 2019 10:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=x2oGE8L2LkldVAnMsmVZNsFIWU5LSlRITuHEbOuWo/Y=;
        b=tJOWbJuLS4Fzr61+fLex6Q30q38/FOeqGM3/ApyK4/nlZpbA4oKGgQI61RokImsF8G
         rWK3/wxaV3eRQnK8ZvLHL1w86i70B8jTfXlShlSwu0Jkhd59S9oUJ7va58GyPHcSKl+J
         2t28wJFsAVAOJ5utTmmDWk4zDww2ifVxNCd9xFgDRcoxv+vyZuJpVRzjC4sIO/QgZ+FI
         21QaF0TeNHCskjM20Kkd5Zi5oYCLzNRH4kPdVvhfDWUkh2T4Hi+XDX92OcE18CcC953X
         MF1VGkVa7qUe35dIrhZLRplmBN2XkQweVEk3UNQ8wK/eqjvfimErBRVjwflT7srmtLyN
         blhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=x2oGE8L2LkldVAnMsmVZNsFIWU5LSlRITuHEbOuWo/Y=;
        b=CGwthRpdlPG+yyVO9jxur+2JuvHZPvhXbcKqF/iAQXx7QQko7H4M0aIxPvtzra/XKP
         +2dr7YqXlNqwbGAoN5fgJ6CxNjIO/S6S8qCGAW/uu4QRnO8RGm9MSsWkWeuysc3j4BSq
         iknH5pdwbVRe4nxryLK0XCCB3H9EpdO55s+1wUpnXp1KqFqSJ7v3Ax4JUX+2K3eL6yrc
         0fOnN5XYrTUpLY5XrZd3yT+Rv7cScKzixSlOOs9OAbkKaxgs77Rj7jbWofMy89SYlDGG
         5O4kFJYIqpKQdGSC4et9xQsbLavM59FrOMW/Wj4ChILepd56cup8lMGCEOGfLmSb5gup
         mBiA==
X-Gm-Message-State: APjAAAU2LnSbj316ez/vHdDxvKeD17XpR99UVdv6gcgHG+GdBl+4SX9T
        6P575SS7+tBQI4mcpqpq7QU=
X-Google-Smtp-Source: APXvYqzamqOqSo3YIjvOh36o8DnwBhRc4D5kWpg524l3jNyk1KHnlB6jCgMIsFOxzfohRR6mWr+OEg==
X-Received: by 2002:a17:90a:fa07:: with SMTP id cm7mr6779121pjb.138.1562090075606;
        Tue, 02 Jul 2019 10:54:35 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.92.187])
        by smtp.gmail.com with ESMTPSA id g2sm26969061pfb.95.2019.07.02.10.54.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 10:54:34 -0700 (PDT)
Date:   Tue, 2 Jul 2019 23:24:30 +0530
From:   Hariprasad Kelam <hariprasad.kelam@gmail.com>
To:     Jan Kara <jack@suse.cz>, Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Bharath Vedartham <linux.bhar@gmail.com>,
        Hariprasad Kelam <hariprasad.kelam@gmail.com>,
        reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] fs: reiserfs: journal: Change return type of
 dirty_one_transaction
Message-ID: <20190702175430.GA5882@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Change return type of dirty_one_transaction from int to void. As this
function always return success.

Fixes below issue reported by coccicheck
fs/reiserfs/journal.c:1690:5-8: Unneeded variable: "ret". Return "0" on
line 1719

Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
---
 fs/reiserfs/journal.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 36346dc..4517a13 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -94,7 +94,7 @@ static int journal_join(struct reiserfs_transaction_handle *th,
 			struct super_block *sb);
 static void release_journal_dev(struct super_block *super,
 			       struct reiserfs_journal *journal);
-static int dirty_one_transaction(struct super_block *s,
+static void dirty_one_transaction(struct super_block *s,
 				 struct reiserfs_journal_list *jl);
 static void flush_async_commits(struct work_struct *work);
 static void queue_log_writer(struct super_block *s);
@@ -1682,12 +1682,11 @@ static int write_one_transaction(struct super_block *s,
 }
 
 /* used by flush_commit_list */
-static int dirty_one_transaction(struct super_block *s,
+static void dirty_one_transaction(struct super_block *s,
 				 struct reiserfs_journal_list *jl)
 {
 	struct reiserfs_journal_cnode *cn;
 	struct reiserfs_journal_list *pjl;
-	int ret = 0;
 
 	jl->j_state |= LIST_DIRTY;
 	cn = jl->j_realblock;
@@ -1716,7 +1715,6 @@ static int dirty_one_transaction(struct super_block *s,
 		}
 		cn = cn->next;
 	}
-	return ret;
 }
 
 static int kupdate_transactions(struct super_block *s,
-- 
2.7.4

