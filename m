Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D81336D1F99
	for <lists+reiserfs-devel@lfdr.de>; Fri, 31 Mar 2023 14:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbjCaMET (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 31 Mar 2023 08:04:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231978AbjCaMER (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 31 Mar 2023 08:04:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7A8C1CBAE
        for <reiserfs-devel@vger.kernel.org>; Fri, 31 Mar 2023 05:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680264210;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Wx3vtf0mWAsv14OEzo/oiyKAqTl2ZYLXwnoN7IpbtAc=;
        b=eTJtRXJxTlK3Bw9sGgJJeziPerAICVCWw9eE6Lm6xD0/pqkQGlgtrx5OKqF9hshnIvM8ro
        cl8zCJKfO0pSJehxxp+N1DeVuFlIdEWbRKGjisAhmgPoiMO2tR4+NEeXFr2GWEv8DAt6Fn
        d6qi+PSAC7x6zP6lrxAU8rnfVb34Vaw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-p6GQwt1ePrOM1IjlWTy2cA-1; Fri, 31 Mar 2023 08:03:29 -0400
X-MC-Unique: p6GQwt1ePrOM1IjlWTy2cA-1
Received: by mail-qt1-f197.google.com with SMTP id p22-20020a05622a00d600b003e38f7f800bso14349471qtw.9
        for <reiserfs-devel@vger.kernel.org>; Fri, 31 Mar 2023 05:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680264208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wx3vtf0mWAsv14OEzo/oiyKAqTl2ZYLXwnoN7IpbtAc=;
        b=ST/WH5E6SpmJBft387veoq324FvPXLlSlFHom06KtMN2qK91XGaSnkjN2Y54izSuAq
         kFjr044tPi4MHLxkJT2mtWmwB1fQOB6lU86up25bjkuXpfGAmAHWrX1yXButSEsBvBbv
         2oPsdO67+2W6lvp05KdG93ZYsgl1YkTUtEYzbFBaIJddZaEYoDbC5I6mc8OTbmqP6Ul9
         MzE140Hv7NWE6kCyW7BfZ27szVm6harTkFiaY893bpEgXqkEU70nL/XpCsZBrGLLja+E
         Qz8dtcv0F+sVV7HrBxmRVzKQdd7Fo9mlyAn6q29SjgFtzDiq6GU63JIEi2xUAivrCwzx
         hKVw==
X-Gm-Message-State: AO0yUKU1wqhTee1AnsXrau+3LrtDMJLOypShvkZHY0TtzywLxrSb4pRK
        IjJA3OhQn6mUC2J1sCgQJouZQQD6sxp3A9er41fbKrb4QJMnRM1iq0eMYbVpwZQBVHlHJY1AgZC
        GWJKrqmDrIFd4zqUkNc27/l9zv84=
X-Received: by 2002:a05:622a:b:b0:3d7:960e:5387 with SMTP id x11-20020a05622a000b00b003d7960e5387mr43506115qtw.35.1680264208200;
        Fri, 31 Mar 2023 05:03:28 -0700 (PDT)
X-Google-Smtp-Source: AK7set/ZpMzqAp6V4PuHglmLJBY+O32MWZXvMJwJo0y3JPh1yW5xOStZL/VMELHuwC+qx1W8VX1z1A==
X-Received: by 2002:a05:622a:b:b0:3d7:960e:5387 with SMTP id x11-20020a05622a000b00b003d7960e5387mr43506086qtw.35.1680264207923;
        Fri, 31 Mar 2023 05:03:27 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id x20-20020ac84a14000000b003e635f80e72sm575569qtq.48.2023.03.31.05.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 05:03:27 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     nathan@kernel.org, ndesaulniers@google.com, axboe@kernel.dk,
        akpm@linux-foundation.org, bvanassche@acm.org, jack@suse.cz,
        yi.zhang@huawei.com
Cc:     reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Tom Rix <trix@redhat.com>
Subject: [PATCH] reiserfs: remove unused iter variable
Date:   Fri, 31 Mar 2023 08:03:25 -0400
Message-Id: <20230331120325.1855111-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

clang with W=1 reports
fs/reiserfs/stree.c:1265:6: error: variable
  'iter' set but not used [-Werror,-Wunused-but-set-variable]
        int iter = 0;
            ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 fs/reiserfs/stree.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
index 84c12a1947b2..ce5003986789 100644
--- a/fs/reiserfs/stree.c
+++ b/fs/reiserfs/stree.c
@@ -1262,7 +1262,6 @@ int reiserfs_delete_item(struct reiserfs_transaction_handle *th,
 
 #ifdef CONFIG_REISERFS_CHECK
 	char mode;
-	int iter = 0;
 #endif
 
 	BUG_ON(!th->t_trans_id);
@@ -1274,7 +1273,6 @@ int reiserfs_delete_item(struct reiserfs_transaction_handle *th,
 		removed = 0;
 
 #ifdef CONFIG_REISERFS_CHECK
-		iter++;
 		mode =
 #endif
 		    prepare_for_delete_or_cut(th, inode, path,
-- 
2.27.0

