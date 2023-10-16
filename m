Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52BF97CB41B
	for <lists+reiserfs-devel@lfdr.de>; Mon, 16 Oct 2023 22:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234299AbjJPUMX (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 16 Oct 2023 16:12:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234181AbjJPUL3 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 16 Oct 2023 16:11:29 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBEBB137;
        Mon, 16 Oct 2023 13:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=KwH8rvn6FHkzqJHIRCAABfbz3hM6PITuwJk7Xz8AOjo=; b=aQ/L5W+vtpaMF0GGxEFnpR9QFR
        Rg6gX5J1DlKurWsOfi/JUaqJSjKzMRHed4mWE7xvRljEtuBpd9iDFmk/6iTLA5BW1A2SUA9xfmDbO
        npA1DDHW82J+bHwrAtiLu0S+b4JybN/6YR1mISEXeN6Z1keZOYQ+HLEeUUNDrt5OF28c7Sdq0UgXH
        w9/3OjQodRKiWHKE/tYOWm/Glrxz1c3d4h58kFqQo9h+DSI/V8gspltcD44suVtpf0DPYPi7S73G7
        FQV/9/o8Chtpx3YiLtOXzo13MqtJoOsLRP5e1NIndafj9/RnIVfOBrb2LkTe53YY1r3Zb8nTCb4g2
        1uXx6r6Q==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1qsTvo-0085aU-OP; Mon, 16 Oct 2023 20:11:16 +0000
From:   "Matthew Wilcox (Oracle)" <willy@infradead.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-fsdevel@vger.kernel.org, gfs2@lists.linux.dev,
        linux-nilfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
        ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev,
        reiserfs-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
        Pankaj Raghav <p.raghav@samsung.com>
Subject: [PATCH v2 02/27] buffer: Make folio_create_empty_buffers() return a buffer_head
Date:   Mon, 16 Oct 2023 21:10:49 +0100
Message-Id: <20231016201114.1928083-3-willy@infradead.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20231016201114.1928083-1-willy@infradead.org>
References: <20231016201114.1928083-1-willy@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Almost all callers want to know the first BH that was allocated
for this folio.  We already have that handy, so return it.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Pankaj Raghav <p.raghav@samsung.com>
---
 fs/buffer.c                 | 24 +++++++++++++-----------
 include/linux/buffer_head.h |  4 ++--
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index dec41d84044b..81cdf36e5196 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -1646,8 +1646,8 @@ EXPORT_SYMBOL(block_invalidate_folio);
  * block_dirty_folio() via private_lock.  try_to_free_buffers
  * is already excluded via the folio lock.
  */
-void folio_create_empty_buffers(struct folio *folio, unsigned long blocksize,
-				unsigned long b_state)
+struct buffer_head *folio_create_empty_buffers(struct folio *folio,
+		unsigned long blocksize, unsigned long b_state)
 {
 	struct buffer_head *bh, *head, *tail;
 	gfp_t gfp = GFP_NOFS | __GFP_ACCOUNT | __GFP_NOFAIL;
@@ -1674,6 +1674,8 @@ void folio_create_empty_buffers(struct folio *folio, unsigned long blocksize,
 	}
 	folio_attach_private(folio, head);
 	spin_unlock(&folio->mapping->private_lock);
+
+	return head;
 }
 EXPORT_SYMBOL(folio_create_empty_buffers);
 
@@ -1775,13 +1777,15 @@ static struct buffer_head *folio_create_buffers(struct folio *folio,
 						struct inode *inode,
 						unsigned int b_state)
 {
+	struct buffer_head *bh;
+
 	BUG_ON(!folio_test_locked(folio));
 
-	if (!folio_buffers(folio))
-		folio_create_empty_buffers(folio,
-					   1 << READ_ONCE(inode->i_blkbits),
-					   b_state);
-	return folio_buffers(folio);
+	bh = folio_buffers(folio);
+	if (!bh)
+		bh = folio_create_empty_buffers(folio,
+				1 << READ_ONCE(inode->i_blkbits), b_state);
+	return bh;
 }
 
 /*
@@ -2681,10 +2685,8 @@ int block_truncate_page(struct address_space *mapping,
 		return PTR_ERR(folio);
 
 	bh = folio_buffers(folio);
-	if (!bh) {
-		folio_create_empty_buffers(folio, blocksize, 0);
-		bh = folio_buffers(folio);
-	}
+	if (!bh)
+		bh = folio_create_empty_buffers(folio, blocksize, 0);
 
 	/* Find the buffer that contains "offset" */
 	offset = offset_in_folio(folio, from);
diff --git a/include/linux/buffer_head.h b/include/linux/buffer_head.h
index 3dc4720e4773..1001244a8941 100644
--- a/include/linux/buffer_head.h
+++ b/include/linux/buffer_head.h
@@ -203,8 +203,8 @@ struct buffer_head *alloc_page_buffers(struct page *page, unsigned long size,
 		bool retry);
 void create_empty_buffers(struct page *, unsigned long,
 			unsigned long b_state);
-void folio_create_empty_buffers(struct folio *folio, unsigned long blocksize,
-				unsigned long b_state);
+struct buffer_head *folio_create_empty_buffers(struct folio *folio,
+		unsigned long blocksize, unsigned long b_state);
 void end_buffer_read_sync(struct buffer_head *bh, int uptodate);
 void end_buffer_write_sync(struct buffer_head *bh, int uptodate);
 void end_buffer_async_write(struct buffer_head *bh, int uptodate);
-- 
2.40.1

