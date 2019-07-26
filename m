Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A28A760FF
	for <lists+reiserfs-devel@lfdr.de>; Fri, 26 Jul 2019 10:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbfGZIir (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 26 Jul 2019 04:38:47 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43555 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbfGZIir (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 26 Jul 2019 04:38:47 -0400
Received: by mail-pf1-f195.google.com with SMTP id i189so24170341pfg.10;
        Fri, 26 Jul 2019 01:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=OErtjgtck0WYHrq2s+gRLUV620lMFnBrd6HnTxIAPgU=;
        b=UAhTdssUA4+XWhrHM2GbqjnQIy3n3cxguHpOBXBKFR5OuQj5lqh7lPgCDf4wjYe53m
         /jD86Y6YqBz/X3y43vrb0CGz02kJeFecG2r8rINfDHOhw8oGnOJNFPGiAkuvDXLDgc+U
         im9PeG6/7ekRqdmCeihHPpNGG0b6o1rLb/q9CwiRFuC1yrlKC84EN904QY5a97Ezn6fx
         zA+svGsMmSk1js2bnWypOWvortNwPTv1XfwDYRT5aW91HhvTSwoEFK4WZAuDPMRsfdcR
         rsClamSBeGWsTBlEtHgMJkoNXobLsVaLb1ixUFOQ73Q+pmDx07hWUaB4/y/fD9Dypptj
         fwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=OErtjgtck0WYHrq2s+gRLUV620lMFnBrd6HnTxIAPgU=;
        b=ahmewyal9YlxDG+8tGDTdfAjlZT+zvKNiHHh4CBMZ2+ZcaF1W03H3R9kluuK1z2r2P
         KgRTZmnqzgHuJX18bKl8Sbe8fRU9oLz+jVexjI+SISSiVnITnZy0O6HGDDJuGz2wZCoT
         qeJlfU6mOE69RIhv2/CbPI8QnACosJD1nujJ3olht8cSbClFNp+EykwPBQyHALQk8wcY
         yL8ngzyUYH2xm8YgW4jJ1oL+MvX4HPOGEQkNtOJ2J+PnynS9lFWPLqSuzQFBIwOpOAr3
         /mXcbbHpzoOeRS/8+pKIIjnJMA95wfWqrbDfb1DgEEBVdtkUT90xKBEUY/8FjNHpWVKx
         Eq4Q==
X-Gm-Message-State: APjAAAUDb/tweOSBIFuA609iMyunulM63l1N/IVgpugzogi8wM18Xac4
        5BMdN24TUwzwFvDsBKDQHOE=
X-Google-Smtp-Source: APXvYqyzEWcneSVZNWDYX/qw8hVQ/5juZptKMLrsrRTXkTsVqqB80bQjE+Anev90pquWhM0Hc1IhxQ==
X-Received: by 2002:a17:90a:974b:: with SMTP id i11mr95889116pjw.21.1564130326643;
        Fri, 26 Jul 2019 01:38:46 -0700 (PDT)
Received: from oslab.tsinghua.edu.cn ([2402:f000:4:72:808::3ca])
        by smtp.gmail.com with ESMTPSA id v126sm12901542pgb.23.2019.07.26.01.38.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 01:38:46 -0700 (PDT)
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
To:     jack@suse.cz, akpm@linux-foundation.org, arnd@arndb.de,
        linux.bhar@gmail.com, hariprasad.kelam@gmail.com
Cc:     reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] fs: reiserfs: Fix possible null-pointer dereferences in remove_from_transaction()
Date:   Fri, 26 Jul 2019 16:38:38 +0800
Message-Id: <20190726083838.8301-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.0
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

In remove_from_transaction(), there is an if statement on line 3447 to
check whether bh is NULL:
    if (bh)

When bh is NULL, it is used on line 3450:
    clear_buffer_journaled(bh);
and lines 3453-3456:
    clear_buffer_journal_dirty(bh);
    clear_buffer_dirty(bh);
    clear_buffer_journal_test(bh);
    put_bh(bh);

Thus, possible null-pointer dereferences may occur.

To fix these bugs, bh is checked before being used.

These bugs are found by a static analysis tool STCheck written by us.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 fs/reiserfs/journal.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 4517a1394c6f..d115578597b6 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -3444,12 +3444,13 @@ static int remove_from_transaction(struct super_block *sb,
 	if (cn == journal->j_last) {
 		journal->j_last = cn->prev;
 	}
-	if (bh)
+	if (bh) {
 		remove_journal_hash(sb, journal->j_hash_table, NULL,
 				    bh->b_blocknr, 0);
-	clear_buffer_journaled(bh);	/* don't log this one */
+		clear_buffer_journaled(bh);	/* don't log this one */
+	}
 
-	if (!already_cleaned) {
+	if (!already_cleaned && bh) {
 		clear_buffer_journal_dirty(bh);
 		clear_buffer_dirty(bh);
 		clear_buffer_journal_test(bh);
-- 
2.17.0

