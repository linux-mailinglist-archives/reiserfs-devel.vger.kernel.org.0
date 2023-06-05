Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0EF7228BF
	for <lists+reiserfs-devel@lfdr.de>; Mon,  5 Jun 2023 16:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232427AbjFEOXp (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 5 Jun 2023 10:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbjFEOXo (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 5 Jun 2023 10:23:44 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD77999
        for <reiserfs-devel@vger.kernel.org>; Mon,  5 Jun 2023 07:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=nqbacqYZqdaTLSdq8WdcklSNR+rRKGJ6t+mfKXpJf+w=; b=tHg1IFN1El5qctk9bEViczJsa5
        fv/TI/p170O3RrWljCjla+k//0frzq4O0c5I92bdSyQ5xCg1nuFcaDxBWYKlz4wp0CJUcH2Mz/9ng
        rbRLkLgDKYpUceOs9ooQ1daiBZQN5BRqSiy6q1juRHQAyZMV4QJsqu3pwsbAZ/9ET1xMGmNPhlvsW
        bh6FZjyq9jSwbTUWSKJ5YMoi3oqGq8DfQVAyCvpC5mvnWMfvh9uLP5HCGHsAQ6noO1ccoY7ektR4T
        q8onyxKXdlbqbl0YMvtA/R4H7b5Ogvd0aoApp4ePGcJ9CdAjg8cdZupu6agd2sF/p4+JFc63XxBdx
        1cimY+Sg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1q6B7U-00C64U-33; Mon, 05 Jun 2023 14:23:40 +0000
From:   "Matthew Wilcox (Oracle)" <willy@infradead.org>
To:     reiserfs-devel@vger.kernel.org
Cc:     "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        butt3rflyh4ck <butterflyhuangxx@gmail.com>
Subject: [PATCH] reiserfs: Check the return value from __getblk()
Date:   Mon,  5 Jun 2023 15:23:34 +0100
Message-Id: <20230605142335.2883264-1-willy@infradead.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

__getblk() can return a NULL pointer if we run out of memory or if
we try to access beyond the end of the device; check it and handle it
appropriately.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Link: https://lore.kernel.org/lkml/CAFcO6XOacq3hscbXevPQP7sXRoYFz34ZdKPYjmd6k5sZuhGFDw@mail.gmail.com/
Tested-by: butt3rflyh4ck <butterflyhuangxx@gmail.com>
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2") # probably introduced in 2002
---
 fs/reiserfs/journal.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 4d11d60f493c..dd58e0dca5e5 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -2326,7 +2326,7 @@ static struct buffer_head *reiserfs_breada(struct block_device *dev,
 	int i, j;
 
 	bh = __getblk(dev, block, bufsize);
-	if (buffer_uptodate(bh))
+	if (!bh || buffer_uptodate(bh))
 		return (bh);
 
 	if (block + BUFNR > max_block) {
@@ -2336,6 +2336,8 @@ static struct buffer_head *reiserfs_breada(struct block_device *dev,
 	j = 1;
 	for (i = 1; i < blocks; i++) {
 		bh = __getblk(dev, block + i, bufsize);
+		if (!bh)
+			break;
 		if (buffer_uptodate(bh)) {
 			brelse(bh);
 			break;
-- 
2.39.2

