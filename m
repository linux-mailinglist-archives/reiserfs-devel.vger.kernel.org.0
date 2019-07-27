Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E19B777B6
	for <lists+reiserfs-devel@lfdr.de>; Sat, 27 Jul 2019 10:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728254AbfG0Ik2 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sat, 27 Jul 2019 04:40:28 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35579 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728140AbfG0Ik2 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sat, 27 Jul 2019 04:40:28 -0400
Received: by mail-pg1-f194.google.com with SMTP id s1so19549459pgr.2;
        Sat, 27 Jul 2019 01:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=i2a3JghIDojvoauDxYM8+buIOlZvvNl0l8VTKuMMZH8=;
        b=q2uw0fTIS/jP7eRCk4gk3NZjvZG0YSTKE75V0UeNxXZqIDfGKMqV1uFflZpgrOhCHI
         ATzEm7sn4Z2iGNw6KEbIruUmyXGhnb6KMjD+QZZlTsRInt4m6mPzrazdIHs8vuIxdfOT
         MPxQ/tJnkU664AK3OkYgt0D4poVuKgezP/dhbeAo8llzj4dqKIeQze1LG8Kl5IN5hrqs
         wpWcEooBJj9POJ9FqZegcHcVGB8Ry7PqVRa6lOFjjn0RY0fAC0MietLKoMNG/Zc6Int/
         +XW6RY4buw8rcfkrqluIx3ManuCEQp4rfMKHythf7ArzK3ume35VMHHs+HSo/OvXG5YK
         jzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=i2a3JghIDojvoauDxYM8+buIOlZvvNl0l8VTKuMMZH8=;
        b=ms20vEt/pqY0vpSoetRhal3FTcwId2s/Uf98rhhXK1LGvIBmzbSz+G0pp/UQ6n+tko
         7uBVqAH/ephzKpZMfqzHRJpH9yzEvHPKEUEbE/AcGFcdRzrF+St68FlkU94O0Wb5cTiY
         qTA5UsiuaF+hbNIEPzs0+BTjXAJfTEMLtBY9L7R7Cj3ihTqR2EHU5Qrbb48YkaN/Q0Cg
         SQEWYM0YDsb5Zro+jHTN2c+NHubchi7Q2ntjrJuGxEZEU4ocEnlETUuT+qP0audyCmJR
         ixQ8J55ezjUI1ZgsUlokJKSnAmPBcg5RdARcNNmOk4zY+Elx8Z5pEb+SHm3Rbi1lWM3O
         I7Hg==
X-Gm-Message-State: APjAAAWtz0UMUmLUP4c942x+GFIreRltAEhM6e6QZlcHCEuEhA/AYJmJ
        yyij8clRkwk1/2A+PLkhsoA=
X-Google-Smtp-Source: APXvYqzhKKzbZR8YMGfRgKDaXxqsYkgY5jU812m4JbwzbaexLJfqErW5O57CWJa1160BVrhcI6c2HA==
X-Received: by 2002:a65:4b89:: with SMTP id t9mr25970756pgq.55.1564216827592;
        Sat, 27 Jul 2019 01:40:27 -0700 (PDT)
Received: from oslab.tsinghua.edu.cn ([2402:f000:4:72:808::3ca])
        by smtp.gmail.com with ESMTPSA id v14sm56590157pfm.164.2019.07.27.01.40.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 27 Jul 2019 01:40:27 -0700 (PDT)
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
To:     jack@suse.cz, akpm@linux-foundation.org, arnd@arndb.de,
        hariprasad.kelam@gmail.com, linux.bhar@gmail.com
Cc:     reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] fs: reiserfs: Remove unnecessary check of bh in remove_from_transaction()
Date:   Sat, 27 Jul 2019 16:40:19 +0800
Message-Id: <20190727084019.11307-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.0
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On lines 3430-3434, bh has been assured to be non-null:
    cn = get_journal_hash_dev(sb, journal->j_hash_table, blocknr);
    if (!cn || !cn->bh) {
        return ret;
    }
    bh = cn->bh;

Thus, the check of bh on line 3447 is unnecessary and can be removed.
Thank Andrew Morton for good advice.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 fs/reiserfs/journal.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 4517a1394c6f..11155b8513db 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -3444,9 +3444,8 @@ static int remove_from_transaction(struct super_block *sb,
 	if (cn == journal->j_last) {
 		journal->j_last = cn->prev;
 	}
-	if (bh)
-		remove_journal_hash(sb, journal->j_hash_table, NULL,
-				    bh->b_blocknr, 0);
+	remove_journal_hash(sb, journal->j_hash_table, NULL,
+			    bh->b_blocknr, 0);
 	clear_buffer_journaled(bh);	/* don't log this one */
 
 	if (!already_cleaned) {
-- 
2.17.0

