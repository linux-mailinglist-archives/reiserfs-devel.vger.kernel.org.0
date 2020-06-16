Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF86B1FBE20
	for <lists+reiserfs-devel@lfdr.de>; Tue, 16 Jun 2020 20:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbgFPSf7 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 16 Jun 2020 14:35:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:33688 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725896AbgFPSf7 (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 16 Jun 2020 14:35:59 -0400
Received: from embeddedor (unknown [189.207.59.248])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C0073207C4;
        Tue, 16 Jun 2020 18:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592332559;
        bh=y5nipqECzRoU0upBSu9r4jZKgeIM1+hGBnUU069dVTU=;
        h=Date:From:To:Cc:Subject:From;
        b=JDmkMEOWAhQ7AopfAInYXgz4LrmM6R6SfOlUn6T5HWcnpZ5wtgnhOhzjlb+vVllTH
         Bvp417BwY893bUo7we2fj4lA+GxtHQ4ljtYv5mMtWswzjkppH67GBT7ZUNgEtXM5kb
         SqepgiO91quswbCdIZ+Ojr6n65t/0P1/o9uzw4wo=
Date:   Tue, 16 Jun 2020 13:41:18 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH][next] reiserfs: bitmap: Assign array_size() to a variable
Message-ID: <20200616184118.GA1917@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Assign array_size() to variable _size_ and use it in both vmalloc()
and memset(). These sorts of multiplication factors need to be wrapped
in array_size().

This issue was found with the help of Coccinelle and, audited and fixed
manually.

Addresses-KSPP-ID: https://github.com/KSPP/linux/issues/83
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 fs/reiserfs/bitmap.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/reiserfs/bitmap.c b/fs/reiserfs/bitmap.c
index bf708ac287b4..3ca601893d2e 100644
--- a/fs/reiserfs/bitmap.c
+++ b/fs/reiserfs/bitmap.c
@@ -1455,12 +1455,13 @@ int reiserfs_init_bitmap_cache(struct super_block *sb)
 {
 	struct reiserfs_bitmap_info *bitmap;
 	unsigned int bmap_nr = reiserfs_bmap_count(sb);
+	size_t size = array_size(bmap_nr, sizeof(*bitmap));
 
-	bitmap = vmalloc(array_size(bmap_nr, sizeof(*bitmap)));
+	bitmap = vmalloc(size);
 	if (bitmap == NULL)
 		return -ENOMEM;
 
-	memset(bitmap, 0xff, sizeof(*bitmap) * bmap_nr);
+	memset(bitmap, 0xff, size);
 
 	SB_AP_BITMAP(sb) = bitmap;
 
-- 
2.27.0

