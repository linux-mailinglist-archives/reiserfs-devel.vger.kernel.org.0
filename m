Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C09AD1906AB
	for <lists+reiserfs-devel@lfdr.de>; Tue, 24 Mar 2020 08:47:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727556AbgCXHry (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 24 Mar 2020 03:47:54 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55290 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727380AbgCXHry (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 24 Mar 2020 03:47:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=Pr/RehRPh8nFjGKjHemQk7hDj8UU9w6ywzXadoPeoUo=; b=bXJRFSqChPaWB9F1oMcZ3p2vgk
        DkbJU+4bWGiIi9O0DPcjaWIUb9KKBIF+vrzotnKajiSovFENLf+19X5LKMyBbeb20MhZkkibUL9hO
        hYIX6xDSK3pHa0XiWqmTwzbFgcZNcRmkV3UgrnCDl66ZXOAwdEb3NhInBcZEi8ESOGcbFG89MgGtK
        zdPFBPbmeuyAYgq+/5V8+yx/+MracnStxpljGQffq8S6Hiz0Xti/fq63x9SvPqA+NivJfsHQtMd9t
        5T+XzfOSoOs+X1jsSuRw1WS/i0utAZtQoulL05ZFBkfNowz4xP0Rl7pr85B1jBPduJvoon1CJLtwH
        z/c3+Khw==;
Received: from [2001:4bb8:18c:2a9e:999c:283e:b14a:9189] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jGeHx-0001BP-VD; Tue, 24 Mar 2020 07:47:54 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-block@vger.kernel.org, linux-raid@vger.kernel.org,
        linux-scsi@vger.kernel.org, reiserfs-devel@vger.kernel.org
Subject: [PATCH 14/21] block: remove block/partitions/osf.h
Date:   Tue, 24 Mar 2020 08:25:23 +0100
Message-Id: <20200324072530.544483-15-hch@lst.de>
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

Just move the single define to block/partitions/osf.c.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/partitions/osf.c | 2 +-
 block/partitions/osf.h | 7 -------
 2 files changed, 1 insertion(+), 8 deletions(-)
 delete mode 100644 block/partitions/osf.h

diff --git a/block/partitions/osf.c b/block/partitions/osf.c
index 4b873973d6c0..84560d0765ed 100644
--- a/block/partitions/osf.c
+++ b/block/partitions/osf.c
@@ -9,9 +9,9 @@
  */
 
 #include "check.h"
-#include "osf.h"
 
 #define MAX_OSF_PARTITIONS 18
+#define DISKLABELMAGIC (0x82564557UL)
 
 int osf_partition(struct parsed_partitions *state)
 {
diff --git a/block/partitions/osf.h b/block/partitions/osf.h
deleted file mode 100644
index 80a58c382b3f..000000000000
--- a/block/partitions/osf.h
+++ /dev/null
@@ -1,7 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- *  fs/partitions/osf.h
- */
-
-#define DISKLABELMAGIC (0x82564557UL)
-
-- 
2.25.1

