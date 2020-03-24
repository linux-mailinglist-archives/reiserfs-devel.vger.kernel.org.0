Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DDA4190658
	for <lists+reiserfs-devel@lfdr.de>; Tue, 24 Mar 2020 08:34:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727358AbgCXHeX (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 24 Mar 2020 03:34:23 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:53032 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbgCXHeX (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 24 Mar 2020 03:34:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=ywVacO/qEWcDEEGL6cUmLbPWF3cv1CYpXW4Ge7CU8vY=; b=XwJ7LZt46v9TQAsU1E5xecj+WR
        7DdCv4pz9qaB87dHu/TRkNRwWCsN4NW79pezekaEOQm0rpQSIze3XNJoDW3VDp9pmf0X/tzqGRJiY
        j0fhlIz/ByRlWsW/jt89tBScMBZRc+KW19U8CBK+eb96/4djcyYFOXr/U6BChnSHYKXZvuvyhGW39
        6I9fHdhZRdA99T2+dE3T4FCqBSKGTks296iB2puKEO7oOfL3VoOnpMoQ8ey/UXzH/iS8nusx+CdAP
        RC62EbPH3b4nAw+ij6aKUXjuuPEgQ8tIoLLYvW9rHJQ+u+riszExq5+uaUGQo7Sdlubr78tAeu3Jp
        xM1eI3Vw==;
Received: from 213-225-10-87.nat.highway.a1.net ([213.225.10.87] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jGe4s-0004XE-LX; Tue, 24 Mar 2020 07:34:23 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-block@vger.kernel.org, linux-raid@vger.kernel.org,
        linux-scsi@vger.kernel.org, reiserfs-devel@vger.kernel.org
Subject: [PATCH 03/21] block: move disk_name and related helpers out of partition-generic.c
Date:   Tue, 24 Mar 2020 08:25:12 +0100
Message-Id: <20200324072530.544483-4-hch@lst.de>
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

Thes functions aren't really related to partition support, so move them
to a more suitable place.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/bio.c               |  6 ++++++
 block/genhd.c             | 21 +++++++++++++++++++++
 block/partition-generic.c | 32 --------------------------------
 3 files changed, 27 insertions(+), 32 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index 0985f3422556..209715765a7a 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -680,6 +680,12 @@ struct bio *bio_clone_fast(struct bio *bio, gfp_t gfp_mask, struct bio_set *bs)
 }
 EXPORT_SYMBOL(bio_clone_fast);
 
+const char *bio_devname(struct bio *bio, char *buf)
+{
+	return disk_name(bio->bi_disk, bio->bi_partno, buf);
+}
+EXPORT_SYMBOL(bio_devname);
+
 static inline bool page_is_mergeable(const struct bio_vec *bv,
 		struct page *page, unsigned int len, unsigned int off,
 		bool *same_page)
diff --git a/block/genhd.c b/block/genhd.c
index c5d20a48b4de..2484348d1850 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -69,6 +69,27 @@ void set_capacity_revalidate_and_notify(struct gendisk *disk, sector_t size,
 
 EXPORT_SYMBOL_GPL(set_capacity_revalidate_and_notify);
 
+/*
+ * Format the device name of the indicated disk into the supplied buffer and
+ * return a pointer to that same buffer for convenience.
+ */
+char *disk_name(struct gendisk *hd, int partno, char *buf)
+{
+	if (!partno)
+		snprintf(buf, BDEVNAME_SIZE, "%s", hd->disk_name);
+	else if (isdigit(hd->disk_name[strlen(hd->disk_name)-1]))
+		snprintf(buf, BDEVNAME_SIZE, "%sp%d", hd->disk_name, partno);
+	else
+		snprintf(buf, BDEVNAME_SIZE, "%s%d", hd->disk_name, partno);
+
+	return buf;
+}
+
+const char *bdevname(struct block_device *bdev, char *buf)
+{
+	return disk_name(bdev->bd_disk, bdev->bd_part->partno, buf);
+}
+EXPORT_SYMBOL(bdevname);
 
 void part_inc_in_flight(struct request_queue *q, struct hd_struct *part, int rw)
 {
diff --git a/block/partition-generic.c b/block/partition-generic.c
index 98256e6beabb..6bf5aec2a0dc 100644
--- a/block/partition-generic.c
+++ b/block/partition-generic.c
@@ -25,38 +25,6 @@
 extern void md_autodetect_dev(dev_t dev);
 #endif
  
-/*
- * disk_name() is used by partition check code and the genhd driver.
- * It formats the devicename of the indicated disk into
- * the supplied buffer (of size at least 32), and returns
- * a pointer to that same buffer (for convenience).
- */
-
-char *disk_name(struct gendisk *hd, int partno, char *buf)
-{
-	if (!partno)
-		snprintf(buf, BDEVNAME_SIZE, "%s", hd->disk_name);
-	else if (isdigit(hd->disk_name[strlen(hd->disk_name)-1]))
-		snprintf(buf, BDEVNAME_SIZE, "%sp%d", hd->disk_name, partno);
-	else
-		snprintf(buf, BDEVNAME_SIZE, "%s%d", hd->disk_name, partno);
-
-	return buf;
-}
-
-const char *bdevname(struct block_device *bdev, char *buf)
-{
-	return disk_name(bdev->bd_disk, bdev->bd_part->partno, buf);
-}
-
-EXPORT_SYMBOL(bdevname);
-
-const char *bio_devname(struct bio *bio, char *buf)
-{
-	return disk_name(bio->bi_disk, bio->bi_partno, buf);
-}
-EXPORT_SYMBOL(bio_devname);
-
 static ssize_t part_partition_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
 {
-- 
2.25.1

