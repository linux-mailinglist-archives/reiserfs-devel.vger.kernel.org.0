Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B20743CC4E
	for <lists+reiserfs-devel@lfdr.de>; Wed, 27 Oct 2021 16:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238722AbhJ0Oh0 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 27 Oct 2021 10:37:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238657AbhJ0Oh0 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 27 Oct 2021 10:37:26 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19F45C061570;
        Wed, 27 Oct 2021 07:35:01 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id m21so3061348pgu.13;
        Wed, 27 Oct 2021 07:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=thGbGpMmDBLVFCgnHjtOHQz7SQaxdSW9d+9l+tEtUqc=;
        b=ldKmAOyUDN64FyhAHEjvFrdt6dBfRGeA7ig2+ULovFnlu9zQDtg5/RdNkjY5+o1gww
         Qzu7x0ToRdIuf7fotbHgkKtG0j0lKjJaTacuWipZCwwNynjegtF3KrkkjrnhRHNg3S6M
         0Ef4VWYFM1KE+8mH8JsbkYEnn0blhU4p04hDpXawndaMLprISgHBAszpqujvhLAsivkN
         GQ2nFpe1noGxMD6hmOIu/FkkD4xQ/CRCyERLdOZFuB/0WSC/DX0PZK2c80uCGo9cBcD6
         EJzDuZaJMIZ4YulniDBNLJ5N5XRxd+G6yHPL24IMXgIo7XryV6CPBxLQjmIDE3W4Sj8/
         /Buw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=thGbGpMmDBLVFCgnHjtOHQz7SQaxdSW9d+9l+tEtUqc=;
        b=jn8Mnf+A9ZYYk9lYN1ySWBc6fkX5wznDa7as+jZiDe3Gu5DSwTkjZgSAWXsIROX4xQ
         ORjTs3Iltet1p5afcCGuhzTkLXzf1Ds+FcNtZF8cNX77zWQh9ChUciS+dRaL2hCjwbhr
         BrooMxNXMx7m/EepVZ03YuRox5EhwrEDHfmraBKL9RRNmp/22HxNolen3P3Iodq1pGJy
         EawV6ohoO+qryfq3sZstyx7AOdsk2B2kAAPbGTrIweFpxmFDL3bealCF0mNw46IORrKX
         caMv1oAvq8Oek3fl11Im1rRka4trz8GQx28FO1gNXtAP8qgt1AbqCMo0BeeaGnK/Oe9u
         FhYg==
X-Gm-Message-State: AOAM5304kEwH2FouXLCfAHASxgQRrXd98yb35EqPCGOCfJjb55jVhUc5
        SquZ15l9/Du2MI+Clbc6Nj0=
X-Google-Smtp-Source: ABdhPJwV9/vWHLM/HAyanL3zKT+kRpGtHmBTAKNWM89KDm8AYwvq4ZVNs8WDmHwfEeIB77iE8O8mWg==
X-Received: by 2002:a63:9516:: with SMTP id p22mr20577450pgd.297.1635345300367;
        Wed, 27 Oct 2021 07:35:00 -0700 (PDT)
Received: from localhost.localdomain ([94.177.118.99])
        by smtp.gmail.com with ESMTPSA id g11sm67392pgn.41.2021.10.27.07.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 07:34:59 -0700 (PDT)
From:   Dongliang Mu <mudongliangabcd@gmail.com>
To:     Jan Kara <jack@suse.cz>, Dongliang Mu <mudongliangabcd@gmail.com>,
        Miklos Szeredi <mszeredi@redhat.com>,
        Yu Kuai <yukuai3@huawei.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        David Howells <dhowells@redhat.com>
Cc:     reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] fs: reiserfs: remove useless new_opts in reiserfs_remount
Date:   Wed, 27 Oct 2021 22:34:41 +0800
Message-Id: <20211027143445.4156459-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Since the commit c3d98ea08291 ("VFS: Don't use save/replace_mount_options
if not using generic_show_options") eliminates replace_mount_options
in reiserfs_remount, but does not handle the allocated new_opts,
it will cause memory leak in the reiserfs_remount.

Because new_opts is useless in reiserfs_mount, so we fix this bug by
removing the useless new_opts in reiserfs_remount.

Fixes: c3d98ea08291 ("VFS: Don't use save/replace_mount_options if not using generic_show_options")
Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
 fs/reiserfs/super.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 58481f8d63d5..f7b05c6b3dcf 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -1437,7 +1437,6 @@ static int reiserfs_remount(struct super_block *s, int *mount_flags, char *arg)
 	unsigned long safe_mask = 0;
 	unsigned int commit_max_age = (unsigned int)-1;
 	struct reiserfs_journal *journal = SB_JOURNAL(s);
-	char *new_opts;
 	int err;
 	char *qf_names[REISERFS_MAXQUOTAS];
 	unsigned int qfmt = 0;
@@ -1445,10 +1444,6 @@ static int reiserfs_remount(struct super_block *s, int *mount_flags, char *arg)
 	int i;
 #endif
 
-	new_opts = kstrdup(arg, GFP_KERNEL);
-	if (arg && !new_opts)
-		return -ENOMEM;
-
 	sync_filesystem(s);
 	reiserfs_write_lock(s);
 
@@ -1599,7 +1594,6 @@ static int reiserfs_remount(struct super_block *s, int *mount_flags, char *arg)
 out_err_unlock:
 	reiserfs_write_unlock(s);
 out_err:
-	kfree(new_opts);
 	return err;
 }
 
-- 
2.25.1

