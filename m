Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB49319069E
	for <lists+reiserfs-devel@lfdr.de>; Tue, 24 Mar 2020 08:47:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727523AbgCXHro (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 24 Mar 2020 03:47:44 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55224 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727380AbgCXHro (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 24 Mar 2020 03:47:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=Wz1KckdzQiBBsLPM0X/ib0LxYBGTqDZiRX8oa5i/3ek=; b=ngIKOd+lzQ36yblOx7fmVUE8b7
        Nik8OR1gG0G+skxQ3oegFeQj4pPkm2NrwGKEwgu80SlCe+85BUR2ptswC3qk5i1OKnmkGyuRa0aLU
        vAqoLw9kIomGjmVaaiza6tGKWvBRTZbMq66AoxxenNvDENb978dBpezYDUO2o0pQZ9/4dxz7VF2qz
        xEzqc9o8qO87grVbpdCNRb2M/x+yfg4htG6uJjTB27xtDf61r9SO/ImLw37/13scSjv9V3223Xl43
        xTAAtGhzX06wvHJTxAQPnPB9r7uXbSTW518lHLZeB2RRranAPffZiEAa321OPDMBhp4dXZH8rgeem
        ZiA049og==;
Received: from [2001:4bb8:18c:2a9e:999c:283e:b14a:9189] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jGeHn-00018v-Rj; Tue, 24 Mar 2020 07:47:44 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-block@vger.kernel.org, linux-raid@vger.kernel.org,
        linux-scsi@vger.kernel.org, reiserfs-devel@vger.kernel.org
Subject: [PATCH 10/21] block: cleanup how md_autodetect_dev is called
Date:   Tue, 24 Mar 2020 08:25:19 +0100
Message-Id: <20200324072530.544483-11-hch@lst.de>
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

Add a new include/linux/raid/detect.h header to declare the
md_autodetect_dev prototype which can be shared between md and
the partition code.  Then use IS_BUILTIN to call it instead of the
ifdef magic.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/partition-generic.c   | 11 ++++-------
 drivers/md/md.c             |  1 +
 include/linux/raid/detect.h |  3 +++
 3 files changed, 8 insertions(+), 7 deletions(-)
 create mode 100644 include/linux/raid/detect.h

diff --git a/block/partition-generic.c b/block/partition-generic.c
index fef6bacb2bbb..4d771ae835ed 100644
--- a/block/partition-generic.c
+++ b/block/partition-generic.c
@@ -18,14 +18,11 @@
 #include <linux/ctype.h>
 #include <linux/genhd.h>
 #include <linux/blktrace_api.h>
+#include <linux/raid/detect.h>
 #include "blk.h"
 
 #include "partitions/check.h"
 
-#ifdef CONFIG_BLK_DEV_MD
-extern void md_autodetect_dev(dev_t dev);
-#endif
- 
 static ssize_t part_partition_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
 {
@@ -407,10 +404,10 @@ static bool blk_add_partition(struct gendisk *disk, struct block_device *bdev,
 		return true;
 	}
 
-#ifdef CONFIG_BLK_DEV_MD
-	if (state->parts[p].flags & ADDPART_FLAG_RAID)
+	if (IS_BUILTIN(CONFIG_BLK_DEV_MD) &&
+	    (state->parts[p].flags & ADDPART_FLAG_RAID))
 		md_autodetect_dev(part_to_dev(part)->devt);
-#endif
+
 	return true;
 }
 
diff --git a/drivers/md/md.c b/drivers/md/md.c
index 8238fb64f87f..1c7193715f07 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -58,6 +58,7 @@
 #include <linux/delay.h>
 #include <linux/raid/md_p.h>
 #include <linux/raid/md_u.h>
+#include <linux/raid/detect.h>
 #include <linux/slab.h>
 #include <linux/percpu-refcount.h>
 
diff --git a/include/linux/raid/detect.h b/include/linux/raid/detect.h
new file mode 100644
index 000000000000..37dd3f40cd31
--- /dev/null
+++ b/include/linux/raid/detect.h
@@ -0,0 +1,3 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+void md_autodetect_dev(dev_t dev);
-- 
2.25.1

