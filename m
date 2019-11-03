Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21529ED2C1
	for <lists+reiserfs-devel@lfdr.de>; Sun,  3 Nov 2019 10:45:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbfKCJpK (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sun, 3 Nov 2019 04:45:10 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35217 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbfKCJpJ (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 3 Nov 2019 04:45:09 -0500
Received: by mail-pl1-f196.google.com with SMTP id x6so6304000pln.2;
        Sun, 03 Nov 2019 01:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=E5t0jS8GRvsiApUx+zMF9sOBkkg/xnXP7ZhDzMQ5uJU=;
        b=eFHlFTmGQNdtnA4UEV5HUa1B+VTp9mejM6wQWUS9qTNDQeFl1guWoWa2WL/En44+kP
         mdKdhcPpXbd6FlXDoCJdAOetqsIAu4YliQB/wYRNMXkdNPINeILi6nx9wXo75KUuS9jw
         vSZO4BjpoH9RHnCfqEtkKutHcO2bmai+julIURXDpHE4377+MMwWn0hio8jlbl5wuvSx
         faMm0BZzmm09esZB/x8I1LYlw7eepkB9u5Yyc2WcTxxHXwRDaZV8pLpHcPw81buuYUVs
         PFrroOSH6tpguZromxEiX7TP/nSrnC24XX0Jct7nyphwXn97jN5YpyP3l72DcdD7jt39
         iYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition:user-agent;
        bh=E5t0jS8GRvsiApUx+zMF9sOBkkg/xnXP7ZhDzMQ5uJU=;
        b=szgV5vUUjgeM+cDDh12RoQ33kZyn0FbtvlI2jW5ugjRFuzHo2nkpCQUPXUOOqmK7oi
         zVLXUc0Yv6A5VoBMd7Qlo7jXmX6IkJc/phKDCOnn4W6aFeRmtHUvnDLGdesgaxKF1M9I
         rEV7QfCd3UCapiokH5uj7lGlJ9L6mkB/FyIc2pWzoJSez7adLvyrvqUxNZeE7mhktNU4
         1pyfJDXsxG0Wvx0uagTjFi4mPOo3xkJzNscNnRVfMG1a6V09Z37HRz3zk4olVIOqbbwF
         EuQrZTdOFJkWsQXMxUa3hrV8bvOsenkIW02SZVBFCGPJl3+U9FAqejQ+GjcJGLRQJiGm
         lI5g==
X-Gm-Message-State: APjAAAV1DdbRUFRI5jDJyw1uhe5wXCe1JZkt8cVaI6CVbD7qjsx+4XNZ
        MLej8kmUG1OVYWx8FraFZ7A=
X-Google-Smtp-Source: APXvYqzzlIM/zXwqZVRzvRr+bKf0JoGWmmoN/pOgRJ3t4PWOiygLMEW+xlAi3veKVhnFqR6OKta5kQ==
X-Received: by 2002:a17:902:8a84:: with SMTP id p4mr22343165plo.285.1572774307426;
        Sun, 03 Nov 2019 01:45:07 -0800 (PST)
Received: from vostro (173-228-88-234.dsl.dynamic.fusionbroadband.com. [173.228.88.234])
        by smtp.gmail.com with ESMTPSA id z125sm7614192pfb.134.2019.11.03.01.45.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Nov 2019 01:45:06 -0800 (PST)
Date:   Sun, 3 Nov 2019 01:44:54 -0800
From:   Nikitas Angelinas <nikitas.angelinas@gmail.com>
To:     Andrew Morton <akpm@linux-foundation.org>, zhengbin@vostro,
        zhengbin13@huawei.com, Jan Kara <jack@suse.cz>
Cc:     Al Viro <viro@zeniv.linux.org.uk>, reiserfs-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, nikitas.angelinas@gmail.com
Subject: [PATCH] reiserfs: replace open-coded atomic_dec_and_mutex_lock()
Message-ID: <20191103094431.GA18576-nikitas.angelinas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.7.0 (2016-08-17)
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Replace the open-coded logic of atomic_dec_and_mutex_lock() in
reiserfs_file_release().

Signed-off-by: Nikitas Angelinas <nikitas.angelinas@gmail.com>
---
 fs/reiserfs/file.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/fs/reiserfs/file.c b/fs/reiserfs/file.c
index 843aadc..84cf8bd 100644
--- a/fs/reiserfs/file.c
+++ b/fs/reiserfs/file.c
@@ -38,16 +38,10 @@ static int reiserfs_file_release(struct inode *inode, struct file *filp)
 
 	BUG_ON(!S_ISREG(inode->i_mode));
 
-        if (atomic_add_unless(&REISERFS_I(inode)->openers, -1, 1))
+	if (!atomic_dec_and_mutex_lock(&REISERFS_I(inode)->openers,
+				       &REISERFS_I(inode)->tailpack))
 		return 0;
 
-	mutex_lock(&REISERFS_I(inode)->tailpack);
-
-        if (!atomic_dec_and_test(&REISERFS_I(inode)->openers)) {
-		mutex_unlock(&REISERFS_I(inode)->tailpack);
-		return 0;
-	}
-
 	/* fast out for when nothing needs to be done */
 	if ((!(REISERFS_I(inode)->i_flags & i_pack_on_close_mask) ||
 	     !tail_has_to_be_packed(inode)) &&
-- 
2.10.0

