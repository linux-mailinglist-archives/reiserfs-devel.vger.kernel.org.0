Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A64FA19066B
	for <lists+reiserfs-devel@lfdr.de>; Tue, 24 Mar 2020 08:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgCXHit (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 24 Mar 2020 03:38:49 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55028 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725905AbgCXHit (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 24 Mar 2020 03:38:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=WYk3/oqh24meXDSbgYrDJkOrSEoeyHPo/YAaAnYll90=; b=hoi3s86nqm3dyEn5gF8ipJX0w3
        g8ccw5pQ1HSlUTk1BKWk4IBA7l6J0QmZirwkkX1iJBb7p2UBPj3cmYvYr5QSN//655pJom79raNMj
        vGFEtVIKGMP2x0L0B5ieXjkSNXJuv3a8RQ6YhsNEAa3D2atQcB95YBB2D6WOj925Bh6ovGyc0ad9P
        y0LyKPPnAVXQsWDydrIrBvo1BoCt4cfla1JQbhiCb1OJ1FuYwz+gKscNLH9kcsBCbFKCi26HR8r+h
        9r5XAkNYkGPTTneCYY7uVSpy0y3yA7mGwFrKxxDWFFzJOL2nf8f0tb+m0R1FmYL8N7kymKz97BOX1
        qy+BhzmQ==;
Received: from 213-225-10-87.nat.highway.a1.net ([213.225.10.87] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jGe9A-0006Zu-UF; Tue, 24 Mar 2020 07:38:49 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-block@vger.kernel.org, linux-raid@vger.kernel.org,
        linux-scsi@vger.kernel.org, reiserfs-devel@vger.kernel.org
Subject: [PATCH 05/21] block: remove alloc_part_info and free_part_info
Date:   Tue, 24 Mar 2020 08:25:14 +0100
Message-Id: <20200324072530.544483-6-hch@lst.de>
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

There isn't any good reason not to simply open code the allocation and
freeing of the partition_meta_info structure.  Especially as one of
the branches in alloc_part_info is entirely dead code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/partition-generic.c |  6 ++++--
 include/linux/genhd.h     | 15 +--------------
 2 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/block/partition-generic.c b/block/partition-generic.c
index e6fd2226a639..f2004f3bd6f7 100644
--- a/block/partition-generic.c
+++ b/block/partition-generic.c
@@ -249,7 +249,9 @@ struct hd_struct *add_partition(struct gendisk *disk, int partno,
 	p->policy = get_disk_ro(disk);
 
 	if (info) {
-		struct partition_meta_info *pinfo = alloc_part_info(disk);
+		struct partition_meta_info *pinfo;
+
+		pinfo = kzalloc_node(sizeof(*pinfo), GFP_KERNEL, disk->node_id);
 		if (!pinfo) {
 			err = -ENOMEM;
 			goto out_free_stats;
@@ -308,7 +310,7 @@ struct hd_struct *add_partition(struct gendisk *disk, int partno,
 	return p;
 
 out_free_info:
-	free_part_info(p);
+	kfree(p->info);
 out_free_stats:
 	free_part_stats(p);
 out_free:
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 612d38fce55c..77f8bb8edfcd 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -465,19 +465,6 @@ void part_dec_in_flight(struct request_queue *q, struct hd_struct *part,
 void part_inc_in_flight(struct request_queue *q, struct hd_struct *part,
 			int rw);
 
-static inline struct partition_meta_info *alloc_part_info(struct gendisk *disk)
-{
-	if (disk)
-		return kzalloc_node(sizeof(struct partition_meta_info),
-				    GFP_KERNEL, disk->node_id);
-	return kzalloc(sizeof(struct partition_meta_info), GFP_KERNEL);
-}
-
-static inline void free_part_info(struct hd_struct *part)
-{
-	kfree(part->info);
-}
-
 void update_io_ticks(struct hd_struct *part, unsigned long now);
 
 /* block/genhd.c */
@@ -755,7 +742,7 @@ static inline void hd_struct_kill(struct hd_struct *part)
 static inline void hd_free_part(struct hd_struct *part)
 {
 	free_part_stats(part);
-	free_part_info(part);
+	kfree(part->info);
 	percpu_ref_exit(&part->ref);
 }
 
-- 
2.25.1

