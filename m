Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 748901906A9
	for <lists+reiserfs-devel@lfdr.de>; Tue, 24 Mar 2020 08:47:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727549AbgCXHrw (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 24 Mar 2020 03:47:52 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55272 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727380AbgCXHrw (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 24 Mar 2020 03:47:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=wBJnVPAawoSGW8xbPdOwFEQHqM7UVMcAa/6Rnl6uUxo=; b=T/R64aAPg3Q59uGQy1u9gg44E7
        VdU5ErHzsCecHw44HuuVPnSnVWAmHSt2Rlbn/J76G+bQGlw7xr6NC40UO/gdaaCe0nh1F8fCQOVsP
        Gw0Uz0Uo900Pka3iAecf5+uX4CEd/s7X4Q1xm06YNidKSskN3AU1xpjs1FIyxNhWKyu6pr9Y06sJ1
        2pMDL1rU8nZ96+YeRri0Y9IIV396zew7PYz41X2OoErgc+WXPsLTaZ8BywQCVlCGNNjy/dHWpS3Rr
        E4NZ5WfrA7m1t0Yv5dr7eZ9DGjHul2hpTFQn5qCocWDu5VF8PqsC0xcfF6bR1sB/tcVUSQPHT27hx
        o3M1wWtQ==;
Received: from [2001:4bb8:18c:2a9e:999c:283e:b14a:9189] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jGeHv-0001B2-Hr; Tue, 24 Mar 2020 07:47:51 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-block@vger.kernel.org, linux-raid@vger.kernel.org,
        linux-scsi@vger.kernel.org, reiserfs-devel@vger.kernel.org
Subject: [PATCH 13/21] block: remove block/partitions/karma.h
Date:   Tue, 24 Mar 2020 08:25:22 +0100
Message-Id: <20200324072530.544483-14-hch@lst.de>
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

Just move the single define to block/partitions/karma.c.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/partitions/karma.c | 3 ++-
 block/partitions/karma.h | 6 ------
 2 files changed, 2 insertions(+), 7 deletions(-)
 delete mode 100644 block/partitions/karma.h

diff --git a/block/partitions/karma.c b/block/partitions/karma.c
index 59812d705c3d..4d93512f4bd4 100644
--- a/block/partitions/karma.c
+++ b/block/partitions/karma.c
@@ -8,9 +8,10 @@
  */
 
 #include "check.h"
-#include "karma.h"
 #include <linux/compiler.h>
 
+#define KARMA_LABEL_MAGIC		0xAB56
+
 int karma_partition(struct parsed_partitions *state)
 {
 	int i;
diff --git a/block/partitions/karma.h b/block/partitions/karma.h
deleted file mode 100644
index 1b5eec57ee0c..000000000000
--- a/block/partitions/karma.h
+++ /dev/null
@@ -1,6 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- *  fs/partitions/karma.h
- */
-
-#define KARMA_LABEL_MAGIC		0xAB56
-- 
2.25.1

