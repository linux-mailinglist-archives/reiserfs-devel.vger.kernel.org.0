Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57827382BE4
	for <lists+reiserfs-devel@lfdr.de>; Mon, 17 May 2021 14:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236891AbhEQMRg (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 17 May 2021 08:17:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234754AbhEQMRg (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 17 May 2021 08:17:36 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B065EC061573;
        Mon, 17 May 2021 05:16:18 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id w33so492800lfu.7;
        Mon, 17 May 2021 05:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bpg0yo4zd9e4wgCvkS6BR8yRBmNDCnC7ieiyGUPdPVc=;
        b=X38FB1g+bA2WdLtLPEg2NrmkK7EeNXvscBt99RlP9vSpFsTCT0EfGbprIgtlTHJC1U
         cCdyfaURALQ6G74244t8XorpFu9r8ryPDahUDciszM9qN+zmhgZu7M6J3hMWUoTMcthr
         bnB3L/xVvYEFREK2DCg3twRsZ9dGLpJGDOiO9fbhbuPoRHoXWIaOMDT312XvryD0az17
         u3Yf0qTKtW4BUEXBsJ0p9R0V37Dx1iTsgJ2SNMkki+TG0/X1exxVCweVk60B5sYZSXrt
         UwKzbMVNDNjQ0QLT63sFdAxqdSJBhfWeXLAe2vXWMCCcHgdS5q63Q25Oji2hI1UC+Pdi
         2BnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bpg0yo4zd9e4wgCvkS6BR8yRBmNDCnC7ieiyGUPdPVc=;
        b=FHLk6Kz6vPUp/A4Joo4dczTP6zkeKzSvKo3y4ONAum7zdyPNhn8Ao7I+bqGTEmK1R2
         S/12UuT7LykSTIH6sDeu4GxceZwuRVjUWQIRjSguImmDyY8kVSQB1sw+DP/aHjPLio6k
         UEOihaMg+JeorRDsD7LaHVAYs6W7LY/lWnPsfiBx/2uO/M72azLbobLGCDKbdrxhgIS2
         YeRTcyXwJdNmEVrVPF48v9oS3YKowGCLnqsdFRmmzaFqU6dxT9y3ouyJzWu1kyLWN5zj
         78ODrOHLJz3M9MS/OeLcmk9tc1OKxAhGyUMRh30limND+7M06HALbcDxhT+dGjhfOyhv
         hvTQ==
X-Gm-Message-State: AOAM530EUpMBbfA/a9tpHsS8bfyZsXdV2kaMQcTPgisA1fXETK/7OJqG
        6WcufnCVUVKKMvDXArO/vM4=
X-Google-Smtp-Source: ABdhPJx10eT0n+8VyUM8+53tApBPCxIrFACbiNRF0GdwEF3deMfsdYpzK3vnBSJic3VtjM+JqSB1+g==
X-Received: by 2002:a05:6512:2398:: with SMTP id c24mr42525549lfv.244.1621253777198;
        Mon, 17 May 2021 05:16:17 -0700 (PDT)
Received: from localhost.localdomain ([94.103.227.227])
        by smtp.gmail.com with ESMTPSA id i21sm535690lfg.265.2021.05.17.05.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 05:16:16 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     jack@suse.cz, tiantao6@hisilicon.com, rdunlap@infradead.org
Cc:     reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Skripkin <paskripkin@gmail.com>,
        syzbot+0ba9909df31c6a36974d@syzkaller.appspotmail.com
Subject: [PATCH v2] reiserfs: add check for invalid 1st journal block
Date:   Mon, 17 May 2021 15:15:45 +0300
Message-Id: <20210517121545.29645-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517101523.GB31755@quack2.suse.cz>
References: <20210517101523.GB31755@quack2.suse.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

syzbot reported divide error in reiserfs.
The problem was in incorrect journal 1st block.

Syzbot's reproducer manualy generated wrong superblock
with incorrect 1st block. In journal_init() wasn't
any checks about this particular case.

For example, if 1st journal block is before superblock
1st block, it can cause zeroing important superblock members
in do_journal_end().

Reported-by: syzbot+0ba9909df31c6a36974d@syzkaller.appspotmail.com
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---

Changes in v2:
  Added necessary !SB_ONDISK_JOURNAL_DEVICE(sb) in "if"

---
 fs/reiserfs/journal.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 9edc8e2b154e..0834b101c316 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -2758,6 +2758,20 @@ int journal_init(struct super_block *sb, const char *j_dev_name,
 		goto free_and_return;
 	}
 
+	/*
+	 * Sanity check to see if journal first block is correct.
+	 * If journal first block is invalid it can cause
+	 * zeroing important superblock members.
+	 */
+	if (!SB_ONDISK_JOURNAL_DEVICE(sb) &&
+	    SB_ONDISK_JOURNAL_1st_BLOCK(sb) < SB_JOURNAL_1st_RESERVED_BLOCK(sb)) {
+		reiserfs_warning(sb, "journal-1393",
+				 "journal 1st super block is invalid: 1st reserved block %d, but actual 1st block is %d",
+				 SB_JOURNAL_1st_RESERVED_BLOCK(sb),
+				 SB_ONDISK_JOURNAL_1st_BLOCK(sb));
+		goto free_and_return;
+	}
+
 	if (journal_init_dev(sb, journal, j_dev_name) != 0) {
 		reiserfs_warning(sb, "sh-462",
 				 "unable to initialize journal device");
-- 
2.31.1

