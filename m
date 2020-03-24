Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE8FC190677
	for <lists+reiserfs-devel@lfdr.de>; Tue, 24 Mar 2020 08:43:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727291AbgCXHnP (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 24 Mar 2020 03:43:15 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55104 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725923AbgCXHnP (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 24 Mar 2020 03:43:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=wB2/q/cPL36bV7uALazDWutD8iePtlx955IFpADXRW0=; b=fbUDoKp6D+eox4ph3OhjpG0PqM
        iqJ+sUBehbc0Mctrj1G76lX+iUtpiVcbAJ50pwL0/R9e1opvscg1YDXrp8awpZItmP4C6tntnYMcx
        c+QF0TNtBUDC+Vd5m6YS5E9CDRRQ8U3pMOogTkQh9T1Sd336B/2f5UXutLJAaxVtFs0BTevPW9FGC
        7jBy+8AW6Y8GnQmFFx/8+pPjrd2C0WPYYHtk+/KsuxO1n24+Ztes56WuKPG3tXBlSQWYePJgnGI3O
        cUG85FO1n/8x1MBB7rsu5ok8c/FGNKNJVPaUTEGMlQProtmU4sc3IJqSmmg/kXqvqXtc50PBz/bcp
        YhM9A78Q==;
Received: from 213-225-10-87.nat.highway.a1.net ([213.225.10.87] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jGeDT-00088Q-4y; Tue, 24 Mar 2020 07:43:15 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-block@vger.kernel.org, linux-raid@vger.kernel.org,
        linux-scsi@vger.kernel.org, reiserfs-devel@vger.kernel.org
Subject: [PATCH 07/21] scsi: move scsicam_bios_param to the end of scsicam.c
Date:   Tue, 24 Mar 2020 08:25:16 +0100
Message-Id: <20200324072530.544483-8-hch@lst.de>
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

This avoids the need for a forward declaration and generally keeps the
file in the lower level first, high level last order.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/scsi/scsicam.c | 120 ++++++++++++++++++++---------------------
 1 file changed, 59 insertions(+), 61 deletions(-)

diff --git a/drivers/scsi/scsicam.c b/drivers/scsi/scsicam.c
index 91a9530a4dcb..248ab23d2e69 100644
--- a/drivers/scsi/scsicam.c
+++ b/drivers/scsi/scsicam.c
@@ -21,10 +21,6 @@
 
 #include <scsi/scsicam.h>
 
-
-static int setsize(unsigned long capacity, unsigned int *cyls, unsigned int *hds,
-		   unsigned int *secs);
-
 /**
  * scsi_bios_ptable - Read PC partition table out of first sector of device.
  * @dev: from this device
@@ -50,63 +46,6 @@ unsigned char *scsi_bios_ptable(struct block_device *dev)
 }
 EXPORT_SYMBOL(scsi_bios_ptable);
 
-/**
- * scsicam_bios_param - Determine geometry of a disk in cylinders/heads/sectors.
- * @bdev: which device
- * @capacity: size of the disk in sectors
- * @ip: return value: ip[0]=heads, ip[1]=sectors, ip[2]=cylinders
- *
- * Description : determine the BIOS mapping/geometry used for a drive in a
- *      SCSI-CAM system, storing the results in ip as required
- *      by the HDIO_GETGEO ioctl().
- *
- * Returns : -1 on failure, 0 on success.
- */
-
-int scsicam_bios_param(struct block_device *bdev, sector_t capacity, int *ip)
-{
-	unsigned char *p;
-	u64 capacity64 = capacity;	/* Suppress gcc warning */
-	int ret;
-
-	p = scsi_bios_ptable(bdev);
-	if (!p)
-		return -1;
-
-	/* try to infer mapping from partition table */
-	ret = scsi_partsize(p, (unsigned long)capacity, (unsigned int *)ip + 2,
-			       (unsigned int *)ip + 0, (unsigned int *)ip + 1);
-	kfree(p);
-
-	if (ret == -1 && capacity64 < (1ULL << 32)) {
-		/* pick some standard mapping with at most 1024 cylinders,
-		   and at most 62 sectors per track - this works up to
-		   7905 MB */
-		ret = setsize((unsigned long)capacity, (unsigned int *)ip + 2,
-		       (unsigned int *)ip + 0, (unsigned int *)ip + 1);
-	}
-
-	/* if something went wrong, then apparently we have to return
-	   a geometry with more than 1024 cylinders */
-	if (ret || ip[0] > 255 || ip[1] > 63) {
-		if ((capacity >> 11) > 65534) {
-			ip[0] = 255;
-			ip[1] = 63;
-		} else {
-			ip[0] = 64;
-			ip[1] = 32;
-		}
-
-		if (capacity > 65535*63*255)
-			ip[2] = 65535;
-		else
-			ip[2] = (unsigned long)capacity / (ip[0] * ip[1]);
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL(scsicam_bios_param);
-
 /**
  * scsi_partsize - Parse cylinders/heads/sectors from PC partition table
  * @buf: partition table, see scsi_bios_ptable()
@@ -256,3 +195,62 @@ static int setsize(unsigned long capacity, unsigned int *cyls, unsigned int *hds
 	*hds = (unsigned int) heads;
 	return (rv);
 }
+
+/**
+ * scsicam_bios_param - Determine geometry of a disk in cylinders/heads/sectors.
+ * @bdev: which device
+ * @capacity: size of the disk in sectors
+ * @ip: return value: ip[0]=heads, ip[1]=sectors, ip[2]=cylinders
+ *
+ * Description : determine the BIOS mapping/geometry used for a drive in a
+ *      SCSI-CAM system, storing the results in ip as required
+ *      by the HDIO_GETGEO ioctl().
+ *
+ * Returns : -1 on failure, 0 on success.
+ */
+int scsicam_bios_param(struct block_device *bdev, sector_t capacity, int *ip)
+{
+	unsigned char *p;
+	u64 capacity64 = capacity;	/* Suppress gcc warning */
+	int ret;
+
+	p = scsi_bios_ptable(bdev);
+	if (!p)
+		return -1;
+
+	/* try to infer mapping from partition table */
+	ret = scsi_partsize(p, (unsigned long)capacity, (unsigned int *)ip + 2,
+			       (unsigned int *)ip + 0, (unsigned int *)ip + 1);
+	kfree(p);
+
+	if (ret == -1 && capacity64 < (1ULL << 32)) {
+		/*
+		 * Pick some standard mapping with at most 1024 cylinders, and
+		 * at most 62 sectors per track - this works up to 7905 MB.
+		 */
+		ret = setsize((unsigned long)capacity, (unsigned int *)ip + 2,
+		       (unsigned int *)ip + 0, (unsigned int *)ip + 1);
+	}
+
+	/*
+	 * If something went wrong, then apparently we have to return a geometry
+	 * with more than 1024 cylinders.
+	 */
+	if (ret || ip[0] > 255 || ip[1] > 63) {
+		if ((capacity >> 11) > 65534) {
+			ip[0] = 255;
+			ip[1] = 63;
+		} else {
+			ip[0] = 64;
+			ip[1] = 32;
+		}
+
+		if (capacity > 65535*63*255)
+			ip[2] = 65535;
+		else
+			ip[2] = (unsigned long)capacity / (ip[0] * ip[1]);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(scsicam_bios_param);
-- 
2.25.1

