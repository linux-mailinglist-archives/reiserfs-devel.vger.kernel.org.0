Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B77D51906A2
	for <lists+reiserfs-devel@lfdr.de>; Tue, 24 Mar 2020 08:47:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727532AbgCXHrr (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 24 Mar 2020 03:47:47 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55244 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727380AbgCXHrr (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 24 Mar 2020 03:47:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=CwhMlmgOl8A5uIUM06YNpPhT9/ahPoKo8eaTFRx1HWc=; b=TGPBcimciroB8ho3bRUNA6X3nH
        lzHoisrD0RiI6h9vR4vE0x2k+kvemgGVhkuLReTkTCB3QJq0aztApfwC0fRsOtFrEI2Jc0nYP56Nv
        7/eMh0Rwvpj0weQFnFujDdkAnLn6Arf47JCSepPmvAuOleZR7PDX3QD1kai/Eqhb5ZdIZTuiFYh5W
        ScDMxoHhsbeaTQouQP6rc04Y7CRY3HNhxFSkHEmMsuAX7v7F+O/aH18JVvZnD0IRNMoSnvqEOD2Sg
        owrJJpSKsOv3+FII7Tc/Fztgk7yp4huQDECVJNKFbKCBtsVoTOLPUt0pKbXy5IzhuXw0TfMgWc0JD
        gAQRmiXw==;
Received: from [2001:4bb8:18c:2a9e:999c:283e:b14a:9189] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jGeHq-000194-Lt; Tue, 24 Mar 2020 07:47:47 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-block@vger.kernel.org, linux-raid@vger.kernel.org,
        linux-scsi@vger.kernel.org, reiserfs-devel@vger.kernel.org
Subject: [PATCH 11/21] block: remove warn_no_part
Date:   Tue, 24 Mar 2020 08:25:20 +0100
Message-Id: <20200324072530.544483-12-hch@lst.de>
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

The warn_no_part is initialized to 1 and never changed.  Remove
it and execute the code keyed off from it unconditionally.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/partitions/amiga.c | 10 ++++------
 block/partitions/check.c |  7 ++-----
 block/partitions/check.h |  3 ---
 3 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/block/partitions/amiga.c b/block/partitions/amiga.c
index 560936617d9c..7fecc760b78f 100644
--- a/block/partitions/amiga.c
+++ b/block/partitions/amiga.c
@@ -42,9 +42,8 @@ int amiga_partition(struct parsed_partitions *state)
 			goto rdb_done;
 		data = read_part_sector(state, blk, &sect);
 		if (!data) {
-			if (warn_no_part)
-				pr_err("Dev %s: unable to read RDB block %d\n",
-				       bdevname(state->bdev, b), blk);
+			pr_err("Dev %s: unable to read RDB block %d\n",
+			       bdevname(state->bdev, b), blk);
 			res = -1;
 			goto rdb_done;
 		}
@@ -85,9 +84,8 @@ int amiga_partition(struct parsed_partitions *state)
 		blk *= blksize;	/* Read in terms partition table understands */
 		data = read_part_sector(state, blk, &sect);
 		if (!data) {
-			if (warn_no_part)
-				pr_err("Dev %s: unable to read partition block %d\n",
-				       bdevname(state->bdev, b), blk);
+			pr_err("Dev %s: unable to read partition block %d\n",
+			       bdevname(state->bdev, b), blk);
 			res = -1;
 			goto rdb_done;
 		}
diff --git a/block/partitions/check.c b/block/partitions/check.c
index ffe408fead0c..8fe46881ef63 100644
--- a/block/partitions/check.c
+++ b/block/partitions/check.c
@@ -37,8 +37,6 @@
 #include "sysv68.h"
 #include "cmdline.h"
 
-int warn_no_part = 1; /*This is ugly: should make genhd removable media aware*/
-
 static int (*check_part[])(struct parsed_partitions *) = {
 	/*
 	 * Probe partition formats with tables at disk address 0
@@ -186,9 +184,8 @@ check_partition(struct gendisk *hd, struct block_device *bdev)
 	/* The partition is unrecognized. So report I/O errors if there were any */
 		res = err;
 	if (res) {
-		if (warn_no_part)
-			strlcat(state->pp_buf,
-				" unable to read partition table\n", PAGE_SIZE);
+		strlcat(state->pp_buf,
+			" unable to read partition table\n", PAGE_SIZE);
 		printk(KERN_INFO "%s", state->pp_buf);
 	}
 
diff --git a/block/partitions/check.h b/block/partitions/check.h
index 0fcf80117887..19852b494e93 100644
--- a/block/partitions/check.h
+++ b/block/partitions/check.h
@@ -50,6 +50,3 @@ put_partition(struct parsed_partitions *p, int n, sector_t from, sector_t size)
 		strlcat(p->pp_buf, tmp, PAGE_SIZE);
 	}
 }
-
-extern int warn_no_part;
-
-- 
2.25.1

