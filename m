Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BAC8183485
	for <lists+reiserfs-devel@lfdr.de>; Thu, 12 Mar 2020 16:20:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727941AbgCLPUE (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 12 Mar 2020 11:20:04 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:38640 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727459AbgCLPUE (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 12 Mar 2020 11:20:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=y1k54/RCrWMgsg56SVfY5gv0+tiIpydNURMFUvNel+w=; b=D+M8Y/SRb4mZ9vfU382IJ/5N5p
        6DNRgJlcTyyMLHQVMqf+9zbdh7KNHnT8GJLrhQOZs+afpdFxrNYAVww04zSyXH+i/el6FQg7CGaOp
        fKjFFC2psh2pG7q1rqXeNAS9WeIYADoVFp8zAyZZn4UqsThuj40LZGihOKNx8Ihps1i52auPZ1OQY
        p8TL6TqZxw/wEX4ns6MdYQSnZoauTWFWaU4dOjw6B1lTGZ0OXwB082351AWsZzfuQ1wQdsWeL1LcB
        fyuDDBDEAmxhxp59HW6MeR2vgehlS5e2xL3/oCdr6BbDuFrWwbytsyl7jl3bZbDYnPUftxGbm+Tgp
        sTt2UmcQ==;
Received: from [2001:4bb8:184:5cad:8026:d98c:a056:3e33] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jCPcx-0006cN-38; Thu, 12 Mar 2020 15:20:03 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-block@vger.kernel.org, linux-raid@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-ext4@vger.kernel.org,
        reiserfs-devel@vger.kernel.org
Subject: [PATCH 08/21] scsi: simplify scsi_partsize
Date:   Thu, 12 Mar 2020 16:19:26 +0100
Message-Id: <20200312151939.645254-9-hch@lst.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200312151939.645254-1-hch@lst.de>
References: <20200312151939.645254-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Call scsi_bios_ptable from scsi_partsize instead of requiring boilerplate
code in the callers.  Also switch the calling convention to match that
of the ->bios_param instances calling this function, and use true/false
for the return value instead of the weird -1 convention.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 Documentation/scsi/scsi_mid_low_api.txt | 21 ---------
 drivers/scsi/aic7xxx/aic79xx_osm.c      | 13 ++----
 drivers/scsi/aic7xxx/aic7xxx_osm.c      | 13 ++----
 drivers/scsi/arcmsr/arcmsr_hba.c        | 13 ++----
 drivers/scsi/megaraid.c                 | 13 +-----
 drivers/scsi/scsicam.c                  | 61 +++++++++++++------------
 include/scsi/scsicam.h                  |  7 ++-
 7 files changed, 46 insertions(+), 95 deletions(-)

diff --git a/Documentation/scsi/scsi_mid_low_api.txt b/Documentation/scsi/scsi_mid_low_api.txt
index 2a4be1c3e6db..537f04728487 100644
--- a/Documentation/scsi/scsi_mid_low_api.txt
+++ b/Documentation/scsi/scsi_mid_low_api.txt
@@ -299,7 +299,6 @@ Summary:
    scsi_host_alloc - return a new scsi_host instance whose refcount==1
    scsi_host_get - increments Scsi_Host instance's refcount
    scsi_host_put - decrements Scsi_Host instance's refcount (free if 0)
-   scsi_partsize - parse partition table into cylinders, heads + sectors
    scsi_register - create and register a scsi host adapter instance.
    scsi_remove_device - detach and remove a SCSI device
    scsi_remove_host - detach and remove all SCSI devices owned by host
@@ -472,26 +471,6 @@ void scsi_host_get(struct Scsi_Host *shost)
 void scsi_host_put(struct Scsi_Host *shost)
 
 
-/**
- * scsi_partsize - parse partition table into cylinders, heads + sectors
- * @buf: pointer to partition table
- * @capacity: size of (total) disk in 512 byte sectors
- * @cyls: outputs number of cylinders calculated via this pointer
- * @hds: outputs number of heads calculated via this pointer
- * @secs: outputs number of sectors calculated via this pointer
- *
- *      Returns 0 on success, -1 on failure
- *
- *      Might block: no
- *
- *      Notes: Caller owns memory returned (free with kfree() )
- *
- *      Defined in: drivers/scsi/scsicam.c
- **/
-int scsi_partsize(unsigned char *buf, unsigned long capacity,
-                  unsigned int *cyls, unsigned int *hds, unsigned int *secs)
-
-
 /**
  * scsi_register - create and register a scsi host adapter instance.
  * @sht:        pointer to scsi host template
diff --git a/drivers/scsi/aic7xxx/aic79xx_osm.c b/drivers/scsi/aic7xxx/aic79xx_osm.c
index 57992519384e..dc4fe334efd0 100644
--- a/drivers/scsi/aic7xxx/aic79xx_osm.c
+++ b/drivers/scsi/aic7xxx/aic79xx_osm.c
@@ -723,24 +723,17 @@ static int
 ahd_linux_biosparam(struct scsi_device *sdev, struct block_device *bdev,
 		    sector_t capacity, int geom[])
 {
-	uint8_t *bh;
 	int	 heads;
 	int	 sectors;
 	int	 cylinders;
-	int	 ret;
 	int	 extended;
 	struct	 ahd_softc *ahd;
 
 	ahd = *((struct ahd_softc **)sdev->host->hostdata);
 
-	bh = scsi_bios_ptable(bdev);
-	if (bh) {
-		ret = scsi_partsize(bh, capacity,
-				    &geom[2], &geom[0], &geom[1]);
-		kfree(bh);
-		if (ret != -1)
-			return (ret);
-	}
+	if (scsi_partsize(bdev, capacity, geom))
+		return 0;
+
 	heads = 64;
 	sectors = 32;
 	cylinders = aic_sector_div(capacity, heads, sectors);
diff --git a/drivers/scsi/aic7xxx/aic7xxx_osm.c b/drivers/scsi/aic7xxx/aic7xxx_osm.c
index d5c4a0d23706..2edfa0594f18 100644
--- a/drivers/scsi/aic7xxx/aic7xxx_osm.c
+++ b/drivers/scsi/aic7xxx/aic7xxx_osm.c
@@ -695,11 +695,9 @@ static int
 ahc_linux_biosparam(struct scsi_device *sdev, struct block_device *bdev,
 		    sector_t capacity, int geom[])
 {
-	uint8_t *bh;
 	int	 heads;
 	int	 sectors;
 	int	 cylinders;
-	int	 ret;
 	int	 extended;
 	struct	 ahc_softc *ahc;
 	u_int	 channel;
@@ -707,14 +705,9 @@ ahc_linux_biosparam(struct scsi_device *sdev, struct block_device *bdev,
 	ahc = *((struct ahc_softc **)sdev->host->hostdata);
 	channel = sdev_channel(sdev);
 
-	bh = scsi_bios_ptable(bdev);
-	if (bh) {
-		ret = scsi_partsize(bh, capacity,
-				    &geom[2], &geom[0], &geom[1]);
-		kfree(bh);
-		if (ret != -1)
-			return (ret);
-	}
+	if (scsi_partsize(bdev, capacity, geom))
+		return 0;
+
 	heads = 64;
 	sectors = 32;
 	cylinders = aic_sector_div(capacity, heads, sectors);
diff --git a/drivers/scsi/arcmsr/arcmsr_hba.c b/drivers/scsi/arcmsr/arcmsr_hba.c
index 40dc8eac0e3a..c2c79a37a9ef 100644
--- a/drivers/scsi/arcmsr/arcmsr_hba.c
+++ b/drivers/scsi/arcmsr/arcmsr_hba.c
@@ -353,16 +353,11 @@ static irqreturn_t arcmsr_do_interrupt(int irq, void *dev_id)
 static int arcmsr_bios_param(struct scsi_device *sdev,
 		struct block_device *bdev, sector_t capacity, int *geom)
 {
-	int ret, heads, sectors, cylinders, total_capacity;
-	unsigned char *buffer;/* return copy of block device's partition table */
+	int heads, sectors, cylinders, total_capacity;
+
+	if (scsi_partsize(bdev, capacity, geom))
+		return 0;
 
-	buffer = scsi_bios_ptable(bdev);
-	if (buffer) {
-		ret = scsi_partsize(buffer, capacity, &geom[2], &geom[0], &geom[1]);
-		kfree(buffer);
-		if (ret != -1)
-			return ret;
-	}
 	total_capacity = capacity;
 	heads = 64;
 	sectors = 32;
diff --git a/drivers/scsi/megaraid.c b/drivers/scsi/megaraid.c
index ff6d4aa92421..f27ffd088c8a 100644
--- a/drivers/scsi/megaraid.c
+++ b/drivers/scsi/megaraid.c
@@ -2795,11 +2795,9 @@ megaraid_biosparam(struct scsi_device *sdev, struct block_device *bdev,
 		    sector_t capacity, int geom[])
 {
 	adapter_t	*adapter;
-	unsigned char	*bh;
 	int	heads;
 	int	sectors;
 	int	cylinders;
-	int	rval;
 
 	/* Get pointer to host config structure */
 	adapter = (adapter_t *)sdev->host->hostdata;
@@ -2826,15 +2824,8 @@ megaraid_biosparam(struct scsi_device *sdev, struct block_device *bdev,
 			geom[2] = cylinders;
 	}
 	else {
-		bh = scsi_bios_ptable(bdev);
-
-		if( bh ) {
-			rval = scsi_partsize(bh, capacity,
-					    &geom[2], &geom[0], &geom[1]);
-			kfree(bh);
-			if( rval != -1 )
-				return rval;
-		}
+		if (scsi_partsize(bdev, capacity, geom))
+			return 0;
 
 		dev_info(&adapter->dev->dev,
 			 "invalid partition on this disk on channel %d\n",
diff --git a/drivers/scsi/scsicam.c b/drivers/scsi/scsicam.c
index 248ab23d2e69..665d7db2f94c 100644
--- a/drivers/scsi/scsicam.c
+++ b/drivers/scsi/scsicam.c
@@ -48,29 +48,31 @@ EXPORT_SYMBOL(scsi_bios_ptable);
 
 /**
  * scsi_partsize - Parse cylinders/heads/sectors from PC partition table
- * @buf: partition table, see scsi_bios_ptable()
+ * @bdev: block device to parse
  * @capacity: size of the disk in sectors
- * @cyls: put cylinders here
- * @hds: put heads here
- * @secs: put sectors here
+ * @geom: output in form of [hds, cylinders, sectors]
  *
  * Determine the BIOS mapping/geometry used to create the partition
- * table, storing the results in @cyls, @hds, and @secs
+ * table, storing the results in @geom.
  *
- * Returns: -1 on failure, 0 on success.
+ * Returns: %false on failure, %true on success.
  */
-
-int scsi_partsize(unsigned char *buf, unsigned long capacity,
-	       unsigned int *cyls, unsigned int *hds, unsigned int *secs)
+bool scsi_partsize(struct block_device *bdev, sector_t capacity, int geom[3])
 {
-	struct partition *p = (struct partition *)buf, *largest = NULL;
-	int i, largest_cyl;
 	int cyl, ext_cyl, end_head, end_cyl, end_sector;
 	unsigned int logical_end, physical_end, ext_physical_end;
+	struct partition *p, *largest = NULL;
+	void *buf;
+	int ret = false;
 
+	buf = scsi_bios_ptable(bdev);
+	if (!buf)
+		return false;
 
 	if (*(unsigned short *) (buf + 64) == 0xAA55) {
-		for (largest_cyl = -1, i = 0; i < 4; ++i, ++p) {
+		int largest_cyl = -1, i;
+
+		for (i = 0, p = buf; i < 4; i++, p++) {
 			if (!p->sys_ind)
 				continue;
 #ifdef DEBUG
@@ -90,7 +92,7 @@ int scsi_partsize(unsigned char *buf, unsigned long capacity,
 		end_sector = largest->end_sector & 0x3f;
 
 		if (end_head + 1 == 0 || end_sector == 0)
-			return -1;
+			goto out_free_buf;
 
 #ifdef DEBUG
 		printk("scsicam_bios_param : end at h = %d, c = %d, s = %d\n",
@@ -115,19 +117,24 @@ int scsi_partsize(unsigned char *buf, unsigned long capacity,
 		  ,logical_end, physical_end, ext_physical_end, ext_cyl);
 #endif
 
-		if ((logical_end == physical_end) ||
-		  (end_cyl == 1023 && ext_physical_end == logical_end)) {
-			*secs = end_sector;
-			*hds = end_head + 1;
-			*cyls = capacity / ((end_head + 1) * end_sector);
-			return 0;
+		if (logical_end == physical_end ||
+		    (end_cyl == 1023 && ext_physical_end == logical_end)) {
+			geom[0] = end_head + 1;
+			geom[1] = end_sector;
+			geom[2] = (unsigned long)capacity /
+				((end_head + 1) * end_sector);
+			ret = true;
+			goto out_free_buf;
 		}
 #ifdef DEBUG
 		printk("scsicam_bios_param : logical (%u) != physical (%u)\n",
 		       logical_end, physical_end);
 #endif
 	}
-	return -1;
+
+out_free_buf:
+	kfree(buf);
+	return ret;
 }
 EXPORT_SYMBOL(scsi_partsize);
 
@@ -210,20 +217,14 @@ static int setsize(unsigned long capacity, unsigned int *cyls, unsigned int *hds
  */
 int scsicam_bios_param(struct block_device *bdev, sector_t capacity, int *ip)
 {
-	unsigned char *p;
 	u64 capacity64 = capacity;	/* Suppress gcc warning */
-	int ret;
-
-	p = scsi_bios_ptable(bdev);
-	if (!p)
-		return -1;
+	int ret = 0;
 
 	/* try to infer mapping from partition table */
-	ret = scsi_partsize(p, (unsigned long)capacity, (unsigned int *)ip + 2,
-			       (unsigned int *)ip + 0, (unsigned int *)ip + 1);
-	kfree(p);
+	if (scsi_partsize(bdev, capacity, ip))
+		return 0;
 
-	if (ret == -1 && capacity64 < (1ULL << 32)) {
+	if (capacity64 < (1ULL << 32)) {
 		/*
 		 * Pick some standard mapping with at most 1024 cylinders, and
 		 * at most 62 sectors per track - this works up to 7905 MB.
diff --git a/include/scsi/scsicam.h b/include/scsi/scsicam.h
index 57c729254569..08edd603e521 100644
--- a/include/scsi/scsicam.h
+++ b/include/scsi/scsicam.h
@@ -13,8 +13,7 @@
 
 #ifndef SCSICAM_H
 #define SCSICAM_H
-extern int scsicam_bios_param (struct block_device *bdev, sector_t capacity, int *ip);
-extern int scsi_partsize(unsigned char *buf, unsigned long capacity,
-           unsigned int  *cyls, unsigned int *hds, unsigned int *secs);
-extern unsigned char *scsi_bios_ptable(struct block_device *bdev);
+int scsicam_bios_param(struct block_device *bdev, sector_t capacity, int *ip);
+bool scsi_partsize(struct block_device *bdev, sector_t capacity, int geom[3]);
+unsigned char *scsi_bios_ptable(struct block_device *bdev);
 #endif /* def SCSICAM_H */
-- 
2.24.1

