Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BECDC19063F
	for <lists+reiserfs-devel@lfdr.de>; Tue, 24 Mar 2020 08:29:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbgCXH35 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 24 Mar 2020 03:29:57 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:49398 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725905AbgCXH35 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 24 Mar 2020 03:29:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=66d7fQX1gRhVaGW0R4AHAD9c7QuxR8Lw9Pxebm0tgL4=; b=q1EeF/kE0z173VzonGUgVmGI/S
        xXFYuhd8+8t2LiFXWRHbJ5Pp2UlUtHgf27Lcyk5a1WpGXZa0UkC0/C7XZ8366wKwR5mebazFUxxD/
        lO2benQiHeAiUCbydyJbmLryqOfi366IZgT6sIWSyMp02jKc5TmoPe6ArljcEDGX+mlLGcfnI4WsX
        YJt6HszHhGARa5TIyZ6ZY50KeXxMJ96zppk9dQTi0Yv8LR8RnrnMSkprlYtXhtUaJWuPeKvMS4xNg
        sdw6EID9aXrwGJbTFWEIoTcalMDdthPQWcYt0xJRLSmM/d0o1cdNn6fgLnE18CvNEgh6sUxVZxegB
        KCwzJ0kA==;
Received: from 213-225-10-87.nat.highway.a1.net ([213.225.10.87] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jGe0a-0002VD-ES; Tue, 24 Mar 2020 07:29:56 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-block@vger.kernel.org, linux-raid@vger.kernel.org,
        linux-scsi@vger.kernel.org, reiserfs-devel@vger.kernel.org
Subject: [PATCH 01/21] block: remove the blk_lookup_devt export
Date:   Tue, 24 Mar 2020 08:25:10 +0100
Message-Id: <20200324072530.544483-2-hch@lst.de>
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

This function is only used by init/do_mounts.c, which can't be modular.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/genhd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/genhd.c b/block/genhd.c
index 6a60131baffa..c5d20a48b4de 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -1487,7 +1487,6 @@ dev_t blk_lookup_devt(const char *name, int partno)
 	class_dev_iter_exit(&iter);
 	return devt;
 }
-EXPORT_SYMBOL(blk_lookup_devt);
 
 struct gendisk *__alloc_disk_node(int minors, int node_id)
 {
-- 
2.25.1

