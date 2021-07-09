Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 143823C26D1
	for <lists+reiserfs-devel@lfdr.de>; Fri,  9 Jul 2021 17:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232248AbhGIPcW (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 9 Jul 2021 11:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232053AbhGIPcV (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 9 Jul 2021 11:32:21 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 600F2C0613DD;
        Fri,  9 Jul 2021 08:29:37 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d12so9037493pfj.2;
        Fri, 09 Jul 2021 08:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SRhuB7O2XAu8vSzkSuT1X9orJzyM3E85HIUuYc+MjD8=;
        b=MJpLLBp0fbGOpmRl2rVK73sAPES2FcW6KJYkCdu1iGorFBt3iU5UQlr2cdKLpMOgZ9
         mVMFaZvRa3mcP2lq7cPHx037SF/FjFYLylRl9p6CAXoFFekMAyyoxxNW/cXDcIXsh9Jd
         Ep9SEYu7GpE/KcYjXcXpxa9Xeq35IOU2+8ugiN9MYf+5REZRkvYuAjfTYyEcFPWqi+Ls
         DXPA+slQ77hUa1i9suhAwQBGVdav8tH7hkOZ/JBU07JbOOLVCiK94awMSSxns4rPU+/b
         XhBHGfP5s6/90nVEs5bQvo8aXvKvM0fWq3wakTcm97IEAhw6kwISanmI3D+FYvLCN+s+
         yqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SRhuB7O2XAu8vSzkSuT1X9orJzyM3E85HIUuYc+MjD8=;
        b=Diepyp2fEcJhnvxRZv6WoiT0a9vb31cC6KxPqW2PZrF0dpfyVjja57wuG7WC35WUEW
         mnfD0b65HP/u/d/AevJawY1aZOuLMly8jJUNIIlAASEJbzJxQkMOnaHeCJmTPDKtYhLW
         v88bS/erJHdJpzxnRScOJ4DUL9Y7mbBEeXrbUm4lJcgFGn6Hb0v4tRTntIU2xrLKjNC6
         0OSv2CctMiVtvUcN1kvsFGwAIjq7MK3BdWc2vJG1D2cjRc9daO7hxY3jkcXdFrmgU9EL
         ig8WfYB2yZlB/zmt1ZxT7jiRkgThRSxPAptRHFRawF8YmBeHIdUqN0ULfQWSa3qNCj2t
         G/ng==
X-Gm-Message-State: AOAM530NJd8Vn60oh0qq1ycIBuze+7GVrEVzLv2TzyuhUxY1tXW9VDRk
        m/ILUfeuevgVTfsKLzGbzco=
X-Google-Smtp-Source: ABdhPJz4s6OMN016S2mf3l/rqsZu8KFjYQffgIqvasWgy5XnWfU8qNDLQvlrtkQg0ZmqItxJBw9cIg==
X-Received: by 2002:a63:4b09:: with SMTP id y9mr38747813pga.350.1625844576854;
        Fri, 09 Jul 2021 08:29:36 -0700 (PDT)
Received: from fedora.. ([2405:201:6008:6ce2:9fb0:9db:90a4:39e2])
        by smtp.googlemail.com with ESMTPSA id q3sm7302215pfb.184.2021.07.09.08.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 08:29:36 -0700 (PDT)
From:   Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
To:     rkovhaev@gmail.com, jack@suse.cz
Cc:     Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>,
        reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot+c31a48e6702ccb3d64c9@syzkaller.appspotmail.com
Subject: [PATCH] reiserfs: check directry items on read from disk
Date:   Fri,  9 Jul 2021 20:59:29 +0530
Message-Id: <20210709152929.766363-1-chouhan.shreyansh630@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

While verifying the leaf item that we read from the disk, reiserfs
doesn't check the directory items, this could cause a crash when we
read a directory item from the disk that has an invalid deh_location.

This patch adds a check to the directory items read from the disk that
does a bounds check on deh_location for the directory entries. Any
directory entry header with a directory entry offset greater than the
item length is considered invalid.

Reported-by: syzbot+c31a48e6702ccb3d64c9@syzkaller.appspotmail.com
Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
---
 fs/reiserfs/stree.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
index 476a7ff49482..ef42729216d1 100644
--- a/fs/reiserfs/stree.c
+++ b/fs/reiserfs/stree.c
@@ -387,6 +387,24 @@ void pathrelse(struct treepath *search_path)
 	search_path->path_length = ILLEGAL_PATH_ELEMENT_OFFSET;
 }
 
+static int has_valid_deh_location(struct buffer_head *bh, struct item_head *ih)
+{
+	struct reiserfs_de_head *deh;
+	int i;
+
+	deh = B_I_DEH(bh, ih);
+	for (i = 0; i < ih_entry_count(ih); i++) {
+		if (deh_location(&deh[i]) > ih_item_len(ih)) {
+			reiserfs_warning(NULL, "reiserfs-5094",
+					 "directory entry location seems wrong %h",
+					 &deh[i]);
+			return 0;
+		}
+	}
+
+	return 1;
+}
+
 static int is_leaf(char *buf, int blocksize, struct buffer_head *bh)
 {
 	struct block_head *blkh;
@@ -454,11 +472,14 @@ static int is_leaf(char *buf, int blocksize, struct buffer_head *bh)
 					 "(second one): %h", ih);
 			return 0;
 		}
-		if (is_direntry_le_ih(ih) && (ih_item_len(ih) < (ih_entry_count(ih) * IH_SIZE))) {
-			reiserfs_warning(NULL, "reiserfs-5093",
-					 "item entry count seems wrong %h",
-					 ih);
-			return 0;
+		if (is_direntry_le_ih(ih)) {
+			if (ih_item_len(ih) < (ih_entry_count(ih) * IH_SIZE)) {
+				reiserfs_warning(NULL, "reiserfs-5093",
+						 "item entry count seems wrong %h",
+						 ih);
+				return 0;
+			}
+			return has_valid_deh_location(bh, ih);
 		}
 		prev_location = ih_location(ih);
 	}
-- 
2.31.1

