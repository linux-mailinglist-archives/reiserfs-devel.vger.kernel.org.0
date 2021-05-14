Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E04C3812CD
	for <lists+reiserfs-devel@lfdr.de>; Fri, 14 May 2021 23:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232300AbhENVZP (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 14 May 2021 17:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbhENVZN (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 14 May 2021 17:25:13 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1DA8C06174A;
        Fri, 14 May 2021 14:24:01 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id i9so261333lfe.13;
        Fri, 14 May 2021 14:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1X1qqR18ibDA8Udwd1HR4GJ3nNYqAECGtnk+wa5BBMA=;
        b=sJzyUdaa48kevw7fWKwm3u85jFi14ga/9QrErXb/7J/hKcdKHIErYxCwVjGZltJP2P
         9erRSLtiGS6shwMNRcfn353dgqq56LQ3Yg7cUechC3twDwChmKuKvl6kstWEkTtaUO/p
         jh/fT2S7UCl0vRGCpUVdVw2jaq30GM5oWJ5MPZ1j8pA6i+gTubTq570GxhG0IyHjYpfB
         RL+q2LwPCrhq5OA2quUy3PapIZgmMx4QdN/9msCTv9ulxGR+/ast+ta+dHX6+D+aKFKg
         vLdBDZw7lrzVfm+XUtU28Eg+Jtsmb4O6MqBH/ZVmpnkDMA8UJZKMN0WOTxdj8i4wACQx
         QcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1X1qqR18ibDA8Udwd1HR4GJ3nNYqAECGtnk+wa5BBMA=;
        b=AoWDHc7wwZKaDLy34OHyzO8WpMWiBKA4A/MJSVm9b8UniXH4CEzCHhiuMMTRWYsn7t
         MKYRdp3H/hNssb+o44uYdcuW5/7ZxtXQiwns4aEhI3Np1agzadV2T4W44Sz+T3m+wWWN
         X6WqEZLvTvBKhC3aT/cxXr9SDHxWz0zURn8+K5h/HpSw8NVdkhGFjJDL+Mp/eJVBncls
         4sANkLTK7BZxGjtN7soI8y8C1CRHL2oaTxNRUIKqR04fGqUyEV48KdxhUmMSXH5ATlCC
         EUWWm0rOv+Enp7iIzDzBD02tHR5Mz9C6G8AUrKkHzxFNQVBxeBFMpotCKwpEuINpoKsB
         iIUQ==
X-Gm-Message-State: AOAM532XqAb60FumYbujlIXQbJ6jAAxzd/f4CLccruwMrzTexjrMXi//
        v6BdSs96AncDBmjQ+4iKxX8=
X-Google-Smtp-Source: ABdhPJwAM4h05dw5Bdo5lFkCQHzaSUlc3mnzgVd4HTo75FN1MDATMgvElUanfQEn55suNFTen0MmeQ==
X-Received: by 2002:a05:6512:3e7:: with SMTP id n7mr32877664lfq.150.1621027440275;
        Fri, 14 May 2021 14:24:00 -0700 (PDT)
Received: from localhost.localdomain ([94.103.227.227])
        by smtp.gmail.com with ESMTPSA id v16sm967202lfi.131.2021.05.14.14.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 14:23:59 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     jack@suse.cz, tiantao6@hisilicon.com, rdunlap@infradead.org
Cc:     reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Skripkin <paskripkin@gmail.com>,
        syzbot+0ba9909df31c6a36974d@syzkaller.appspotmail.com
Subject: [PATCH] reiserfs: add check for invalid 1st journal block
Date:   Sat, 15 May 2021 00:23:35 +0300
Message-Id: <20210514212335.9709-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.31.1
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

Reported-and-tested-by: syzbot+0ba9909df31c6a36974d@syzkaller.appspotmail.com
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 fs/reiserfs/journal.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 9edc8e2b154e..d58f24a08385 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -2758,6 +2758,19 @@ int journal_init(struct super_block *sb, const char *j_dev_name,
 		goto free_and_return;
 	}
 
+	/*
+	 * Sanity check to see is journal first block correct.
+	 * If journal first block is invalid it can cause
+	 * zeroing important superblock members.
+	 */
+	if (SB_ONDISK_JOURNAL_1st_BLOCK(sb) < SB_JOURNAL_1st_RESERVED_BLOCK(sb)) {
+		reiserfs_warning(sb, "journal-1393",
+			"journal 1st super block is invalid: 1st reserved block %d, but actual 1st block is %d",
+			SB_JOURNAL_1st_RESERVED_BLOCK(sb),
+			SB_ONDISK_JOURNAL_1st_BLOCK(sb));
+		goto free_and_return;
+	}
+
 	if (journal_init_dev(sb, journal, j_dev_name) != 0) {
 		reiserfs_warning(sb, "sh-462",
 				 "unable to initialize journal device");
-- 
2.31.1

