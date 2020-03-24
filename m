Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CBA31906B5
	for <lists+reiserfs-devel@lfdr.de>; Tue, 24 Mar 2020 08:48:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727575AbgCXHr7 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 24 Mar 2020 03:47:59 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55322 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727440AbgCXHr7 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 24 Mar 2020 03:47:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=r3d8FSs7qf8eFJptJEIKInacOughT5PJjt7ce+bRV7g=; b=CEibCPeSW7I0vPJNQTd+Sut4be
        tYalCMwxxFZ1aEmLq6PNqW2WKfpo8RCTi4yUgI4lG5/rRePFRSoSmaRfu/meRetZM3sjGMSVDP90Z
        pPt5SWMk7s5pqR2PWwXGe0FpUWLolKFy+3dPdX1eU1cgmip/2kmcNMpimCW6w5wv8YhXjcsI2BA8U
        rUe5lWHmJ+DE+NS7hS4+/wIvIvWr6Of1KgKeTTGptK+W7Mc+23QGYm+grkvnbobQzquVj4JjcK15g
        Z6bWs4nbxJ7JTCLfOVmVzfASYDKVxu2O8RUDCQGf99a0KS5hPynAY4TZMnoePENrZpM+J2q3LY13F
        btBFR/cw==;
Received: from [2001:4bb8:18c:2a9e:999c:283e:b14a:9189] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jGeI2-0001DO-PH; Tue, 24 Mar 2020 07:47:59 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-block@vger.kernel.org, linux-raid@vger.kernel.org,
        linux-scsi@vger.kernel.org, reiserfs-devel@vger.kernel.org
Subject: [PATCH 16/21] block: remove block/partitions/sun.h
Date:   Tue, 24 Mar 2020 08:25:25 +0100
Message-Id: <20200324072530.544483-17-hch@lst.de>
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

Just move the two defines to block/partitions/sun.c.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/partitions/sun.c | 4 +++-
 block/partitions/sun.h | 8 --------
 2 files changed, 3 insertions(+), 9 deletions(-)
 delete mode 100644 block/partitions/sun.h

diff --git a/block/partitions/sun.c b/block/partitions/sun.c
index 90f36724e796..28b44100f2b1 100644
--- a/block/partitions/sun.c
+++ b/block/partitions/sun.c
@@ -9,7 +9,9 @@
  */
 
 #include "check.h"
-#include "sun.h"
+
+#define SUN_LABEL_MAGIC          0xDABE
+#define SUN_VTOC_SANITY          0x600DDEEE
 
 int sun_partition(struct parsed_partitions *state)
 {
diff --git a/block/partitions/sun.h b/block/partitions/sun.h
deleted file mode 100644
index 4c8877a5b52d..000000000000
--- a/block/partitions/sun.h
+++ /dev/null
@@ -1,8 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- *  fs/partitions/sun.h
- */
-
-#define SUN_LABEL_MAGIC          0xDABE
-#define SUN_VTOC_SANITY          0x600DDEEE
-
-- 
2.25.1

