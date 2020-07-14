Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B62AD21F217
	for <lists+reiserfs-devel@lfdr.de>; Tue, 14 Jul 2020 15:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbgGNNFW (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 14 Jul 2020 09:05:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43704 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726352AbgGNNFW (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 14 Jul 2020 09:05:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594731920;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=6VIoOR5Zq1Eiat1CGdfDl2SCC7HipCcOifvnlXpfoZM=;
        b=gk/Cv5KjdD1GxEyjoEnVGcskFFvAkad281touT6cmtbU59CpplKv5Lhuoo3w6ytmkJJTyk
        fhALV/MyJlUy72Phy25SBFhnUpj1jOVWKJ9MNqXl3LeFieiCYie5coJGCEUO+5PH3aNHLh
        FGhFao8m080mSgZJHZZh5wwit7wysA8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-JdVieS8DMamRbcl8eEK1TQ-1; Tue, 14 Jul 2020 09:05:18 -0400
X-MC-Unique: JdVieS8DMamRbcl8eEK1TQ-1
Received: by mail-qt1-f197.google.com with SMTP id u93so12486416qtd.8
        for <reiserfs-devel@vger.kernel.org>; Tue, 14 Jul 2020 06:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6VIoOR5Zq1Eiat1CGdfDl2SCC7HipCcOifvnlXpfoZM=;
        b=Mj5M65IHaYd5/EryydaFHxDb6tkTUpyxDGdlNKu/b6yg2ORbi/H22PXBR8gxm86xIa
         sirwHXQp88N668HrT1bFFDffYPl8pd6N2yF2xboiDcg6PCWVuE4Umep5yE9UQjIFUBio
         2xJGKa8SscTf1NJZr7ZyAJiNMH9Q24WuTD6qf+sYgSecDPvOxNbHAedMFwbi8xMe7mPb
         WNRWwlLsC3lSEBGyNZ+mnWDj19ouHTvFMqY15qxNrf0ghe6OmOSjrOKVCROj/9SMIlAd
         JaLZqUUJICb0SO/DPmkC6i3lJJSo5qasBqF8j3D7aCfpwWI7rSW2K1rjtmemOLVi3gUg
         MsfQ==
X-Gm-Message-State: AOAM530S1P9JcqpRpVrySvh+G5l2AbxTjUTJ8rF7WN80PKmZpyg9cebW
        gy0SyfMY+JreZXF6qYKTrm3Ee2YeG5PgQUIlo7iZ5C5ESkr6idZ2hxkDfOFJXVnGlucGSa9o6VZ
        C+UrnahFqyMSDnHbGf07hWlxnSvI=
X-Received: by 2002:ac8:197b:: with SMTP id g56mr4449155qtk.105.1594731917837;
        Tue, 14 Jul 2020 06:05:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVKa3PW5ERXw99RIG+5uzKIILhRlDiEsTBc59MTNrGF1RtX7vID/XbIEyJTmTUVgPSjNdDnA==
X-Received: by 2002:ac8:197b:: with SMTP id g56mr4449125qtk.105.1594731917573;
        Tue, 14 Jul 2020 06:05:17 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id b53sm23888483qtc.65.2020.07.14.06.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 06:05:16 -0700 (PDT)
From:   trix@redhat.com
To:     jack@suse.cz, william.kucharski@oracle.com, jeffm@suse.com,
        willy@infradead.org, joseph.qi@linux.alibaba.com,
        liao.pingfang@zte.com.cn
Cc:     reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] reiserfs : fix improper free in reiserfs_get_block
Date:   Tue, 14 Jul 2020 06:05:09 -0700
Message-Id: <20200714130509.11791-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

From: Tom Rix <trix@redhat.com>

clang static analysis flags this error

inode.c:1083:5: warning: Argument to kfree() is the address of the
  local variable 'unf_single', which is not memory allocated by
  malloc() [unix.Malloc]
                                kfree(un);
                                ^~~~~~~~~
Assignment of 'un'

	/*
	 * We use this in case we need to allocate
	 * only one block which is a fastpath
	 */
	unp_t unf_single = 0;

	...

	if (blocks_needed == 1) {
		un = &unf_single;
	} else {
		un = kcalloc(min(blocks_needed, max_to_insert),
			     UNFM_P_SIZE, GFP_NOFS);
		if (!un) {
			un = &unf_single;
			blocks_needed = 1;
			max_to_insert = 0;
		}
	}

The logic to free 'un'

	if (blocks_needed != 1)
		kfree(un);

Because the kcalloc failure falls back to using unf_single,
the if-check for the free is wrong.

So improve the check.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 fs/reiserfs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index 1509775da040..4d62148e43e6 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -1079,7 +1079,7 @@ int reiserfs_get_block(struct inode *inode, sector_t block,
 						     UNFM_P_SIZE *
 						     blocks_needed);
 
-			if (blocks_needed != 1)
+			if (un != &unf_single)
 				kfree(un);
 
 			if (retval) {
-- 
2.18.1

