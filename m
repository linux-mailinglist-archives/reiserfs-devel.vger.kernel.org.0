Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B8151906B7
	for <lists+reiserfs-devel@lfdr.de>; Tue, 24 Mar 2020 08:48:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727579AbgCXHsC (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 24 Mar 2020 03:48:02 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55338 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727440AbgCXHsB (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 24 Mar 2020 03:48:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=Ggtrxn14Dukf+bHjnQshYSmvEb2lTie3OCsW9pc8jJQ=; b=gOpiJCb+DcE4SIIJysdYfsgtFS
        f2W2sciN3Go+Ame/ZHJWXI5MDUygqSBuxjx/X0mTWV4MSAfAsSdtHHnfH4zx/nHVJzXVe1OSKQCaW
        mBFVEQ07xoDHweGaF/ZxXzspxt3gaj4JjAaXdR8kO6upCVNNQ4+qzLg6fp1J9mZgfgcbUJ5qO1xen
        yx4UHNUhMnuqiXTrnl4exTq09WM0gOok8933ld0rviytm+7aYsI2eayqW3HbipmAERWa6W343b8rG
        HG3D+vJhz4cCD/gw/dmZ8nEbc+P3ztTkrtCQX0PxT3iZLVT2FIw2zVNeIqmvhO1b8iRbKtpRb+5Hb
        H0bvtfPg==;
Received: from [2001:4bb8:18c:2a9e:999c:283e:b14a:9189] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jGeI5-0001ET-7z; Tue, 24 Mar 2020 07:48:01 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-block@vger.kernel.org, linux-raid@vger.kernel.org,
        linux-scsi@vger.kernel.org, reiserfs-devel@vger.kernel.org
Subject: [PATCH 17/21] block: move struct partition out of genhd.h
Date:   Tue, 24 Mar 2020 08:25:26 +0100
Message-Id: <20200324072530.544483-18-hch@lst.de>
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

struct partition is the on-disk format of a MSDOS partition table entry.
Move it out of genhd.h into a new msdos_partition.h header and give it
a msdos_ prefix to avoid confusion.
Also move the magic number from block/partitions/msdos.h to the new
header so that it can be used by the SCSI drivers looking at the DOS
partition tables.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/partitions/ldm.c          |  6 +++---
 block/partitions/msdos.c        | 28 ++++++++++++++--------------
 block/partitions/msdos.h        |  8 --------
 drivers/scsi/BusLogic.c         |  8 +++++---
 drivers/scsi/aacraid/linit.c    |  7 ++++---
 drivers/scsi/scsi_debug.c       |  5 +++--
 drivers/scsi/scsicam.c          |  3 ++-
 include/linux/genhd.h           | 13 -------------
 include/linux/msdos_partition.h | 20 ++++++++++++++++++++
 9 files changed, 51 insertions(+), 47 deletions(-)
 delete mode 100644 block/partitions/msdos.h
 create mode 100644 include/linux/msdos_partition.h

diff --git a/block/partitions/ldm.c b/block/partitions/ldm.c
index a2d97ee1908c..6fdfcb40c537 100644
--- a/block/partitions/ldm.c
+++ b/block/partitions/ldm.c
@@ -14,10 +14,10 @@
 #include <linux/stringify.h>
 #include <linux/kernel.h>
 #include <linux/uuid.h>
+#include <linux/msdos_partition.h>
 
 #include "ldm.h"
 #include "check.h"
-#include "msdos.h"
 
 /*
  * ldm_debug/info/error/crit - Output an error message
@@ -493,7 +493,7 @@ static bool ldm_validate_partition_table(struct parsed_partitions *state)
 {
 	Sector sect;
 	u8 *data;
-	struct partition *p;
+	struct msdos_partition *p;
 	int i;
 	bool result = false;
 
@@ -508,7 +508,7 @@ static bool ldm_validate_partition_table(struct parsed_partitions *state)
 	if (*(__le16*) (data + 0x01FE) != cpu_to_le16 (MSDOS_LABEL_MAGIC))
 		goto out;
 
-	p = (struct partition*)(data + 0x01BE);
+	p = (struct msdos_partition *)(data + 0x01BE);
 	for (i = 0; i < 4; i++, p++)
 		if (SYS_IND (p) == LDM_PARTITION) {
 			result = true;
diff --git a/block/partitions/msdos.c b/block/partitions/msdos.c
index c572022f3781..88ee5ee7f442 100644
--- a/block/partitions/msdos.c
+++ b/block/partitions/msdos.c
@@ -20,9 +20,9 @@
  *  Re-organised Feb 1998 Russell King
  */
 #include <linux/msdos_fs.h>
+#include <linux/msdos_partition.h>
 
 #include "check.h"
-#include "msdos.h"
 #include "efi.h"
 
 /*
@@ -34,17 +34,17 @@
 
 #define SYS_IND(p)	get_unaligned(&p->sys_ind)
 
-static inline sector_t nr_sects(struct partition *p)
+static inline sector_t nr_sects(struct msdos_partition *p)
 {
 	return (sector_t)get_unaligned_le32(&p->nr_sects);
 }
 
-static inline sector_t start_sect(struct partition *p)
+static inline sector_t start_sect(struct msdos_partition *p)
 {
 	return (sector_t)get_unaligned_le32(&p->start_sect);
 }
 
-static inline int is_extended_partition(struct partition *p)
+static inline int is_extended_partition(struct msdos_partition *p)
 {
 	return (SYS_IND(p) == DOS_EXTENDED_PARTITION ||
 		SYS_IND(p) == WIN98_EXTENDED_PARTITION ||
@@ -67,7 +67,7 @@ msdos_magic_present(unsigned char *p)
 #define AIX_LABEL_MAGIC4	0xC1
 static int aix_magic_present(struct parsed_partitions *state, unsigned char *p)
 {
-	struct partition *pt = (struct partition *) (p + 0x1be);
+	struct msdos_partition *pt = (struct msdos_partition *) (p + 0x1be);
 	Sector sect;
 	unsigned char *d;
 	int slot, ret = 0;
@@ -121,7 +121,7 @@ static void parse_extended(struct parsed_partitions *state,
 			   sector_t first_sector, sector_t first_size,
 			   u32 disksig)
 {
-	struct partition *p;
+	struct msdos_partition *p;
 	Sector sect;
 	unsigned char *data;
 	sector_t this_sector, this_size;
@@ -145,7 +145,7 @@ static void parse_extended(struct parsed_partitions *state,
 		if (!msdos_magic_present(data + 510))
 			goto done;
 
-		p = (struct partition *) (data + 0x1be);
+		p = (struct msdos_partition *) (data + 0x1be);
 
 		/*
 		 * Usually, the first entry is the real data partition,
@@ -402,14 +402,14 @@ static void parse_minix(struct parsed_partitions *state,
 #ifdef CONFIG_MINIX_SUBPARTITION
 	Sector sect;
 	unsigned char *data;
-	struct partition *p;
+	struct msdos_partition *p;
 	int i;
 
 	data = read_part_sector(state, offset, &sect);
 	if (!data)
 		return;
 
-	p = (struct partition *)(data + 0x1be);
+	p = (struct msdos_partition *)(data + 0x1be);
 
 	/* The first sector of a Minix partition can have either
 	 * a secondary MBR describing its subpartitions, or
@@ -453,7 +453,7 @@ int msdos_partition(struct parsed_partitions *state)
 	sector_t sector_size = bdev_logical_block_size(state->bdev) / 512;
 	Sector sect;
 	unsigned char *data;
-	struct partition *p;
+	struct msdos_partition *p;
 	struct fat_boot_sector *fb;
 	int slot;
 	u32 disksig;
@@ -487,7 +487,7 @@ int msdos_partition(struct parsed_partitions *state)
 	 * partition table. Reject this in case the boot indicator
 	 * is not 0 or 0x80.
 	 */
-	p = (struct partition *) (data + 0x1be);
+	p = (struct msdos_partition *) (data + 0x1be);
 	for (slot = 1; slot <= 4; slot++, p++) {
 		if (p->boot_ind != 0 && p->boot_ind != 0x80) {
 			/*
@@ -509,7 +509,7 @@ int msdos_partition(struct parsed_partitions *state)
 	}
 
 #ifdef CONFIG_EFI_PARTITION
-	p = (struct partition *) (data + 0x1be);
+	p = (struct msdos_partition *) (data + 0x1be);
 	for (slot = 1 ; slot <= 4 ; slot++, p++) {
 		/* If this is an EFI GPT disk, msdos should ignore it. */
 		if (SYS_IND(p) == EFI_PMBR_OSTYPE_EFI_GPT) {
@@ -518,7 +518,7 @@ int msdos_partition(struct parsed_partitions *state)
 		}
 	}
 #endif
-	p = (struct partition *) (data + 0x1be);
+	p = (struct msdos_partition *) (data + 0x1be);
 
 	disksig = le32_to_cpup((__le32 *)(data + 0x1b8));
 
@@ -565,7 +565,7 @@ int msdos_partition(struct parsed_partitions *state)
 	strlcat(state->pp_buf, "\n", PAGE_SIZE);
 
 	/* second pass - output for each on a separate line */
-	p = (struct partition *) (0x1be + data);
+	p = (struct msdos_partition *) (0x1be + data);
 	for (slot = 1 ; slot <= 4 ; slot++, p++) {
 		unsigned char id = SYS_IND(p);
 		int n;
diff --git a/block/partitions/msdos.h b/block/partitions/msdos.h
deleted file mode 100644
index 123e666bb932..000000000000
--- a/block/partitions/msdos.h
+++ /dev/null
@@ -1,8 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- *  fs/partitions/msdos.h
- */
-
-#define MSDOS_LABEL_MAGIC		0xAA55
-
-
diff --git a/drivers/scsi/BusLogic.c b/drivers/scsi/BusLogic.c
index 3170b295a5da..186259417449 100644
--- a/drivers/scsi/BusLogic.c
+++ b/drivers/scsi/BusLogic.c
@@ -36,6 +36,7 @@
 #include <linux/jiffies.h>
 #include <linux/dma-mapping.h>
 #include <linux/slab.h>
+#include <linux/msdos_partition.h>
 #include <scsi/scsicam.h>
 
 #include <asm/dma.h>
@@ -3410,9 +3411,10 @@ static int blogic_diskparam(struct scsi_device *sdev, struct block_device *dev,
 	   a partition table entry whose end_head matches one of the
 	   standard BusLogic geometry translations (64/32, 128/32, or 255/63).
 	 */
-	if (*(unsigned short *) (buf + 64) == 0xAA55) {
-		struct partition *part1_entry = (struct partition *) buf;
-		struct partition *part_entry = part1_entry;
+	if (*(unsigned short *) (buf + 64) == MSDOS_LABEL_MAGIC) {
+		struct msdos_partition *part1_entry =
+				(struct msdos_partition *)buf;
+		struct msdos_partition *part_entry = part1_entry;
 		int saved_cyl = diskparam->cylinders, part_no;
 		unsigned char part_end_head = 0, part_end_sector = 0;
 
diff --git a/drivers/scsi/aacraid/linit.c b/drivers/scsi/aacraid/linit.c
index ee6bc2f9b80a..0443b74390cf 100644
--- a/drivers/scsi/aacraid/linit.c
+++ b/drivers/scsi/aacraid/linit.c
@@ -33,6 +33,7 @@
 #include <linux/syscalls.h>
 #include <linux/delay.h>
 #include <linux/kthread.h>
+#include <linux/msdos_partition.h>
 
 #include <scsi/scsi.h>
 #include <scsi/scsi_cmnd.h>
@@ -328,9 +329,9 @@ static int aac_biosparm(struct scsi_device *sdev, struct block_device *bdev,
 	buf = scsi_bios_ptable(bdev);
 	if (!buf)
 		return 0;
-	if(*(__le16 *)(buf + 0x40) == cpu_to_le16(0xaa55)) {
-		struct partition *first = (struct partition * )buf;
-		struct partition *entry = first;
+	if (*(__le16 *)(buf + 0x40) == cpu_to_le16(MSDOS_LABEL_MAGIC)) {
+		struct msdos_partition *first = (struct msdos_partition *)buf;
+		struct msdos_partition *entry = first;
 		int saved_cylinders = param->cylinders;
 		int num;
 		unsigned char end_head, end_sec;
diff --git a/drivers/scsi/scsi_debug.c b/drivers/scsi/scsi_debug.c
index 44cb054d5e66..4c6c448dc2df 100644
--- a/drivers/scsi/scsi_debug.c
+++ b/drivers/scsi/scsi_debug.c
@@ -38,6 +38,7 @@
 #include <linux/hrtimer.h>
 #include <linux/uuid.h>
 #include <linux/t10-pi.h>
+#include <linux/msdos_partition.h>
 
 #include <net/checksum.h>
 
@@ -4146,7 +4147,7 @@ static int scsi_debug_host_reset(struct scsi_cmnd *SCpnt)
 static void __init sdebug_build_parts(unsigned char *ramp,
 				      unsigned long store_size)
 {
-	struct partition *pp;
+	struct msdos_partition *pp;
 	int starts[SDEBUG_MAX_PARTS + 2];
 	int sectors_per_part, num_sectors, k;
 	int heads_by_sects, start_sec, end_sec;
@@ -4171,7 +4172,7 @@ static void __init sdebug_build_parts(unsigned char *ramp,
 
 	ramp[510] = 0x55;	/* magic partition markings */
 	ramp[511] = 0xAA;
-	pp = (struct partition *)(ramp + 0x1be);
+	pp = (struct msdos_partition *)(ramp + 0x1be);
 	for (k = 0; starts[k + 1]; ++k, ++pp) {
 		start_sec = starts[k];
 		end_sec = starts[k + 1] - 1;
diff --git a/drivers/scsi/scsicam.c b/drivers/scsi/scsicam.c
index 665d7db2f94c..682cf08ab041 100644
--- a/drivers/scsi/scsicam.c
+++ b/drivers/scsi/scsicam.c
@@ -17,6 +17,7 @@
 #include <linux/genhd.h>
 #include <linux/kernel.h>
 #include <linux/blkdev.h>
+#include <linux/msdos_partition.h>
 #include <asm/unaligned.h>
 
 #include <scsi/scsicam.h>
@@ -61,7 +62,7 @@ bool scsi_partsize(struct block_device *bdev, sector_t capacity, int geom[3])
 {
 	int cyl, ext_cyl, end_head, end_cyl, end_sector;
 	unsigned int logical_end, physical_end, ext_physical_end;
-	struct partition *p, *largest = NULL;
+	struct msdos_partition *p, *largest = NULL;
 	void *buf;
 	int ret = false;
 
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 77f8bb8edfcd..3d84da9ec0fa 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -70,19 +70,6 @@ enum {
 #include <linux/fs.h>
 #include <linux/workqueue.h>
 
-struct partition {
-	unsigned char boot_ind;		/* 0x80 - active */
-	unsigned char head;		/* starting head */
-	unsigned char sector;		/* starting sector */
-	unsigned char cyl;		/* starting cylinder */
-	unsigned char sys_ind;		/* What partition type */
-	unsigned char end_head;		/* end head */
-	unsigned char end_sector;	/* end sector */
-	unsigned char end_cyl;		/* end cylinder */
-	__le32 start_sect;	/* starting sector counting from 0 */
-	__le32 nr_sects;		/* nr of sectors in partition */
-} __attribute__((packed));
-
 struct disk_stats {
 	u64 nsecs[NR_STAT_GROUPS];
 	unsigned long sectors[NR_STAT_GROUPS];
diff --git a/include/linux/msdos_partition.h b/include/linux/msdos_partition.h
new file mode 100644
index 000000000000..a8e2c1b4bc66
--- /dev/null
+++ b/include/linux/msdos_partition.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_MSDOS_PARTITION_H
+#define _LINUX_MSDOS_PARTITION_H
+
+#define MSDOS_LABEL_MAGIC		0xAA55
+
+struct msdos_partition {
+	u8 boot_ind;		/* 0x80 - active */
+	u8 head;		/* starting head */
+	u8 sector;		/* starting sector */
+	u8 cyl;			/* starting cylinder */
+	u8 sys_ind;		/* What partition type */
+	u8 end_head;		/* end head */
+	u8 end_sector;		/* end sector */
+	u8 end_cyl;		/* end cylinder */
+	__le32 start_sect;	/* starting sector counting from 0 */
+	__le32 nr_sects;	/* nr of sectors in partition */
+} __packed;
+
+#endif /* LINUX_MSDOS_PARTITION_H */
-- 
2.25.1

