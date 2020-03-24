Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A30A1906C1
	for <lists+reiserfs-devel@lfdr.de>; Tue, 24 Mar 2020 08:48:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727549AbgCXHsH (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 24 Mar 2020 03:48:07 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55370 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727440AbgCXHsG (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 24 Mar 2020 03:48:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=JmWwdNQhQik7z3MKyCw6mte6bJqX+YjLmZ6VekFebB0=; b=GZqqM1CqsVPATFcb0qt1wRlPdQ
        naTAe0kb5/uATyiqfR9YTyOjhXIeFJCLkkL2PA5QdNX2w0X2jnYsrNzEb5p9a1EultfWX2BV7Qk7P
        mgJbC0PDGCgJF2AlC8tU+Yko25DWug/Otxd4rESg4M4sJ2Un3rSwrvh398u1VW26RLVIuk4iE1lmM
        WIH5Q0zHZQmh/aFYto73x8wJXvTEAlTt9VzUa3SWzvHxJdcwjUN9ZmYb8/Cm3azKaHJ/gUjHEcQIk
        REy+GTS1bmSK7yuJtueCBqz9Yo8HbJbeNZ1g6gPazNGk7ifX3vJpU5edRVAKV5e0fkW7n3WfdeH5y
        U9tlcO/g==;
Received: from [2001:4bb8:18c:2a9e:999c:283e:b14a:9189] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jGeIA-0001FZ-1z; Tue, 24 Mar 2020 07:48:06 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-block@vger.kernel.org, linux-raid@vger.kernel.org,
        linux-scsi@vger.kernel.org, reiserfs-devel@vger.kernel.org
Subject: [PATCH 19/21] partitions/msdos: remove LINUX_SWAP_PARTITION
Date:   Tue, 24 Mar 2020 08:25:28 +0100
Message-Id: <20200324072530.544483-20-hch@lst.de>
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

Just always use NEW_SOLARIS_X86_PARTITION and explain the situation,
as that is less confusing than two names for a single value.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/partitions/msdos.c        | 18 ++++++++++++------
 include/linux/msdos_partition.h |  3 +--
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/block/partitions/msdos.c b/block/partitions/msdos.c
index 88ee5ee7f442..e44e2f0a02cc 100644
--- a/block/partitions/msdos.c
+++ b/block/partitions/msdos.c
@@ -77,13 +77,19 @@ static int aix_magic_present(struct parsed_partitions *state, unsigned char *p)
 		p[2] == AIX_LABEL_MAGIC3 &&
 		p[3] == AIX_LABEL_MAGIC4))
 		return 0;
-	/* Assume the partition table is valid if Linux partitions exists */
+
+	/*
+	 * Assume the partition table is valid if Linux partitions exists.
+	 * Note that old Solaris/x86 partitions use the same indicator as
+	 * Linux swap partitions, so we consider that a Linux partition as
+	 * well.
+	 */
 	for (slot = 1; slot <= 4; slot++, pt++) {
-		if (pt->sys_ind == LINUX_SWAP_PARTITION ||
-			pt->sys_ind == LINUX_RAID_PARTITION ||
-			pt->sys_ind == LINUX_DATA_PARTITION ||
-			pt->sys_ind == LINUX_LVM_PARTITION ||
-			is_extended_partition(pt))
+		if (pt->sys_ind == SOLARIS_X86_PARTITION ||
+		    pt->sys_ind == LINUX_RAID_PARTITION ||
+		    pt->sys_ind == LINUX_DATA_PARTITION ||
+		    pt->sys_ind == LINUX_LVM_PARTITION ||
+		    is_extended_partition(pt))
 			return 0;
 	}
 	d = read_part_sector(state, 7, &sect);
diff --git a/include/linux/msdos_partition.h b/include/linux/msdos_partition.h
index e151af072cd1..2cb82db2a43c 100644
--- a/include/linux/msdos_partition.h
+++ b/include/linux/msdos_partition.h
@@ -27,12 +27,11 @@ enum msdos_sys_ind {
 	LINUX_EXTENDED_PARTITION = 0x85,
 	WIN98_EXTENDED_PARTITION = 0x0f,
 
-	LINUX_SWAP_PARTITION = 0x82,
 	LINUX_DATA_PARTITION = 0x83,
 	LINUX_LVM_PARTITION = 0x8e,
 	LINUX_RAID_PARTITION = 0xfd,	/* autodetect RAID partition */
 
-	SOLARIS_X86_PARTITION =	LINUX_SWAP_PARTITION,
+	SOLARIS_X86_PARTITION =	0x82,	/* also Linux swap partitions */
 	NEW_SOLARIS_X86_PARTITION = 0xbf,
 
 	DM6_AUX1PARTITION = 0x51,	/* no DDO:  use xlated geom */
-- 
2.25.1

