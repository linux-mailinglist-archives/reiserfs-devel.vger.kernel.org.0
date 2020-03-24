Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D125190699
	for <lists+reiserfs-devel@lfdr.de>; Tue, 24 Mar 2020 08:47:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727486AbgCXHrm (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 24 Mar 2020 03:47:42 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55220 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727380AbgCXHrm (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 24 Mar 2020 03:47:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=qPPoIIWC/ZEiPbTJzz/e/swr3av2RQ32kZzVCotpkHg=; b=hZgEqP8CRFdAA63cjTy3CFJnkv
        esT5mE42ELyKzaX+8R4THNWaHOwVWAbeVQIw6t0Ua26yzUf/Hee/MFTNIpEWHZC4EvBhnhlmu/OUK
        ynwWHhNYRT9hzIz12Cx93ylGoZ3T3018cUXXwnfjUieiRc++vGGdAqeQLPkwlRuJaxjOZOgYvX0jX
        CTw4xyW6/QPAwV+VUKslBUKWPYDOAhcDrYdd2CW0KGkXzyDK2qH0L5cy1LcdhY9kepyEhIOEGutc3
        T7xzbrpqRnrtWGY6hsascr+Mb7vq9nIO3Sw7scnD30Q5MZRsNGlF6cd/mPVhBV1W1nj3Em3dgCFrO
        UVvyl4Tg==;
Received: from 213-225-10-87.nat.highway.a1.net ([213.225.10.87] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jGeHl-00018q-E5; Tue, 24 Mar 2020 07:47:41 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-block@vger.kernel.org, linux-raid@vger.kernel.org,
        linux-scsi@vger.kernel.org, reiserfs-devel@vger.kernel.org
Subject: [PATCH 09/21] block: unexport read_dev_sector and put_dev_sector
Date:   Tue, 24 Mar 2020 08:25:18 +0100
Message-Id: <20200324072530.544483-10-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324072530.544483-1-hch@lst.de>
References: <20200324072530.544483-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

read_dev_sector and put_dev_sector are now only used by the partition
parsing code.  Remove the export for read_dev_sector and merge it into
the only caller.  Clean the mess up a bit by using goto labels and
the SECTOR_SHIFT constant.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/partition-generic.c | 31 +++++++++++++++++++------------
 block/partitions/check.h  | 14 +++++++-------
 include/linux/blkdev.h    |  9 ---------
 3 files changed, 26 insertions(+), 28 deletions(-)

diff --git a/block/partition-generic.c b/block/partition-generic.c
index f2004f3bd6f7..fef6bacb2bbb 100644
--- a/block/partition-generic.c
+++ b/block/partition-generic.c
@@ -484,22 +484,29 @@ int blk_add_partitions(struct gendisk *disk, struct block_device *bdev)
 	return ret;
 }
 
-unsigned char *read_dev_sector(struct block_device *bdev, sector_t n, Sector *p)
+void *read_part_sector(struct parsed_partitions *state, sector_t n, Sector *p)
 {
-	struct address_space *mapping = bdev->bd_inode->i_mapping;
+	struct address_space *mapping = state->bdev->bd_inode->i_mapping;
 	struct page *page;
 
-	page = read_mapping_page(mapping, (pgoff_t)(n >> (PAGE_SHIFT-9)), NULL);
-	if (!IS_ERR(page)) {
-		if (PageError(page))
-			goto fail;
-		p->v = page;
-		return (unsigned char *)page_address(page) +  ((n & ((1 << (PAGE_SHIFT - 9)) - 1)) << 9);
-fail:
-		put_page(page);
+	if (n >= get_capacity(state->bdev->bd_disk)) {
+		state->access_beyond_eod = true;
+		return NULL;
 	}
+
+	page = read_mapping_page(mapping,
+			(pgoff_t)(n >> (PAGE_SHIFT - 9)), NULL);
+	if (IS_ERR(page))
+		goto out;
+	if (PageError(page))
+		goto out_put_page;
+
+	p->v = page;
+	return (unsigned char *)page_address(page) +
+			((n & ((1 << (PAGE_SHIFT - 9)) - 1)) << SECTOR_SHIFT);
+out_put_page:
+	put_page(page);
+out:
 	p->v = NULL;
 	return NULL;
 }
-
-EXPORT_SYMBOL(read_dev_sector);
diff --git a/block/partitions/check.h b/block/partitions/check.h
index 6042f769471a..0fcf80117887 100644
--- a/block/partitions/check.h
+++ b/block/partitions/check.h
@@ -28,14 +28,14 @@ void free_partitions(struct parsed_partitions *state);
 struct parsed_partitions *
 check_partition(struct gendisk *, struct block_device *);
 
-static inline void *read_part_sector(struct parsed_partitions *state,
-				     sector_t n, Sector *p)
+typedef struct {
+	struct page *v;
+} Sector;
+
+void *read_part_sector(struct parsed_partitions *state, sector_t n, Sector *p);
+static inline void put_dev_sector(Sector p)
 {
-	if (n >= get_capacity(state->bdev->bd_disk)) {
-		state->access_beyond_eod = true;
-		return NULL;
-	}
-	return read_dev_sector(state->bdev, n, p);
+	put_page(p.v);
 }
 
 static inline void
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index f629d40c645c..53a1325efbc3 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1484,15 +1484,6 @@ static inline unsigned int block_size(struct block_device *bdev)
 	return bdev->bd_block_size;
 }
 
-typedef struct {struct page *v;} Sector;
-
-unsigned char *read_dev_sector(struct block_device *, sector_t, Sector *);
-
-static inline void put_dev_sector(Sector p)
-{
-	put_page(p.v);
-}
-
 int kblockd_schedule_work(struct work_struct *work);
 int kblockd_mod_delayed_work_on(int cpu, struct delayed_work *dwork, unsigned long delay);
 
-- 
2.25.1

