Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF2C443C0E3
	for <lists+reiserfs-devel@lfdr.de>; Wed, 27 Oct 2021 05:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239089AbhJ0Dm2 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 26 Oct 2021 23:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232661AbhJ0Dm2 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 26 Oct 2021 23:42:28 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C398DC061570;
        Tue, 26 Oct 2021 20:40:03 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id s24so1083527plp.0;
        Tue, 26 Oct 2021 20:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zyqIHjUAZJUCPVU3obv7Mk0Xb8zYZpGJ80LlJg4jvSA=;
        b=ThXkgHlwcFlR5t3Zi8ceXLze5pCjjdvbb5o6Z3sbnHH3j6fPHbtgyNj4cO8yJnrZ/Q
         bbGNAP9VRfv6r3DDTZK956aPTqzp+plwYOxbjr8fAwrybTiGrUcoZPAxbHu4zte+CkzW
         fXW3hl0nhHuVzCFmzlQZp0fL9hNn2raNNfuerV0b20jvOcXK0brd8Mt8rbPE7kbn5wkV
         JjeUyC7iP0asn9z8OcjexjvzbM7gzcVBP0uUUIcRSsBhBhU5zgwI6r2oRmrTDT9hDmgc
         u1Mr7EwiHV+zcUL4AWdG9sze6PXIlk4sJq5SbfYM+XaSc/9/U5qK0srGHbN8CZ7+AoF4
         yizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zyqIHjUAZJUCPVU3obv7Mk0Xb8zYZpGJ80LlJg4jvSA=;
        b=znBpnspV8nQbppCavsxtzHhku4y3Nmn6wimlkiFAGy/qJh0LEZiwZ/ucBLHhQfkXif
         K13nS3wGDs5Rc6Pcc5g5BeGmkjmj4WtRzPw+Zcsx/WyrMyf9faz4R7JNdyg1Dd2JkS0l
         l6Ie72cy8sobKBXFoT/o6TO8vu3xVO5PqfFKx5JsfKC2uxWHA2x96b9LTGggKJGOucH8
         aEer6oW20LcWGzvbhZlV/5OKqRXWeQRKVidsV3I2/4SroTXLycKhivOM21AzguitOGF8
         MXWVEPX6b0Xm2q7WSIe7RvSQhinYBNiamjsOCSudLBN23jY2UPkv+a6+IYSe1SplNer/
         Be8w==
X-Gm-Message-State: AOAM530beuOSP/7Jmo3ybw3ZrqkwJPh0r0G1I184jxAh2klRaWnjad8W
        m1gKHm5Y//P8OlJw3tPjldWHe8RNVdXrLfeQ
X-Google-Smtp-Source: ABdhPJwuN6d4mEKYvdzLBYr1GzFIOWcl1rB1T9pG4gfDhx0ZmuYt8jFqsUcee4mLjHfVG7RhrwjEsw==
X-Received: by 2002:a17:903:1111:b0:13f:d1d7:fb67 with SMTP id n17-20020a170903111100b0013fd1d7fb67mr25438685plh.85.1635306003201;
        Tue, 26 Oct 2021 20:40:03 -0700 (PDT)
Received: from localhost.localdomain ([94.177.118.99])
        by smtp.gmail.com with ESMTPSA id u10sm662852pfi.172.2021.10.26.20.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 20:40:02 -0700 (PDT)
From:   Dongliang Mu <mudongliangabcd@gmail.com>
To:     Yu Kuai <yukuai3@huawei.com>,
        Dongliang Mu <mudongliangabcd@gmail.com>,
        Jan Kara <jack@suse.cz>, Miklos Szeredi <mszeredi@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        David Howells <dhowells@redhat.com>
Cc:     reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] fs: reiserfs: free new_opts in reiserfs_remount
Date:   Wed, 27 Oct 2021 11:39:25 +0800
Message-Id: <20211027033947.3992059-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Since the commit c3d98ea08291 ("VFS: Don't use save/replace_mount_options
if not using generic_show_options") eliminates replace_mount_options
in reiserfs, but did not handle the allocated new_opts,
it will cause memory leak in the reiserfs_remount.

Fix this by freeing new_opts in the reiserfs_remount temporarily.

Fixes: c3d98ea08291 ("VFS: Don't use save/replace_mount_options if not using generic_show_options")
Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
 fs/reiserfs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 58481f8d63d5..b36865c8b66a 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -1594,6 +1594,7 @@ static int reiserfs_remount(struct super_block *s, int *mount_flags, char *arg)
 	}
 
 out_ok_unlocked:
+	kfree(new_opts);
 	return 0;
 
 out_err_unlock:
-- 
2.25.1

