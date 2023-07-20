Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9344975ADB7
	for <lists+reiserfs-devel@lfdr.de>; Thu, 20 Jul 2023 14:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbjGTMC1 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 20 Jul 2023 08:02:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjGTMCZ (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 20 Jul 2023 08:02:25 -0400
X-Greylist: delayed 302 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 20 Jul 2023 05:01:35 PDT
Received: from us-smtp-delivery-110.mimecast.com (us-smtp-delivery-110.mimecast.com [170.10.129.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F71DE4C
        for <reiserfs-devel@vger.kernel.org>; Thu, 20 Jul 2023 05:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=globallogic.com;
        s=mimecast20210517; t=1689854493;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=c7080CelcZWJ+mm58M6YqWdRAhB/qpuLOxcf6z5iFjE=;
        b=YXg7nqReo/OT1uH5acRp3A+hYMiyzxu13zyt1RzPjUr7Xt6QQNNuuJQrZGAn+RaH9prnGU
        22SmT5rM4TifgODOFjm5POeL7/xPBKJ7b/X12exEABdT9qrx457mBx1Xof5QJR8kz5/J2t
        jwghUS8I3fzL9o87D9482G1CfnBVlkioy0Ttc3D7app/3UqNzirpclp1TXNV66TAcyh38t
        SaDVjPPV5oD52Ki0ob4XZRaolgHiebUBnBUYQVPVxXb/rQ1hZaQXncf4HASPt3/Cr/fOtt
        de9OWgA52krhjXuVUc1dmVt9EZL5aw9SY6fwzMqWHgVtrIz+36zADSJgW6uNzQ==
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400-WfN6Fc1EMaucOJY1SM7NKg-1; Thu, 20 Jul 2023 07:54:54 -0400
X-MC-Unique: WfN6Fc1EMaucOJY1SM7NKg-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2b6f51c5cb3so6377301fa.0
        for <reiserfs-devel@vger.kernel.org>; Thu, 20 Jul 2023 04:54:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689854093; x=1690458893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zKG32RJmktJUtYwwr5AmeLuuqCefhppODB7FHPQZ6qY=;
        b=Er3+zQwEWznK3YF7zIQgeABBLE8nkQD/wwVIJ7VKgsca3pTMK1lP8AFGF6dZaB/M+B
         Af39I8DEJIwTzfin57qJW21xz7RaILY4+nYBvKF7jQnqvoDjgF23LGjAGvj3HnaDVbEi
         q8tmsHSSbHtNp+sVyq5S95yTd93YCAi2/UZureUvaZ4qbj4XV2EbKdP40AtA0Rg/lfFC
         Ol2WhF5hzuUcMbr+yWp5aSs7bp00awFwBDknDDuBVCJHvUe3HK0XAu4pQ8FchZebY3PB
         BkHYS+xG2uvOOBkSmvXvwnM7bnfH0bhE27bX9v4upwl5ZeDs8/3t7p44UVk18nHeL9Yf
         0nfw==
X-Gm-Message-State: ABy/qLYzrd5esput+aawdU/mSOMscD74coll4YsxlgfHf25gcNZEpWDz
        1qbUR8fxWZZ5jq3CdhHJIWVGFaC68iMhAvrSfBkMUUNNnbWo6I9r2VX8gnmYjVLqbie44xVGjIC
        Ryvq9CgfCXXFBUeS3yCcbMNgDww==
X-Received: by 2002:a2e:9c5a:0:b0:2b6:e2c1:9816 with SMTP id t26-20020a2e9c5a000000b002b6e2c19816mr2396506ljj.20.1689854093042;
        Thu, 20 Jul 2023 04:54:53 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFE+uhwlIoZmhEaZEOE2VzyxeDpRzH2cApHsCZt6zV8THgaNBN9iWPCPWLlAzlw3hu/5MN/3w==
X-Received: by 2002:a2e:9c5a:0:b0:2b6:e2c1:9816 with SMTP id t26-20020a2e9c5a000000b002b6e2c19816mr2396494ljj.20.1689854092740;
        Thu, 20 Jul 2023 04:54:52 -0700 (PDT)
Received: from wro1-ldl-p30447.synapse.com ([94.42.83.62])
        by smtp.gmail.com with ESMTPSA id a17-20020a2e9811000000b002b836d8c839sm237340ljj.40.2023.07.20.04.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 04:54:52 -0700 (PDT)
From:   Piotr Siminski <piotr.siminski@globallogic.com>
To:     Jan Kara <jack@suse.cz>, reiserfs-devel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Piotr Siminski <piotr.siminski@globallogic.com>
Subject: [PATCH] MAINTAINERS: change reiserfs status to obsolete
Date:   Thu, 20 Jul 2023 13:54:45 +0200
Message-Id: <20230720115445.15583-1-piotr.siminski@globallogic.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: globallogic.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Reiserfs file system is no longer supported and is going to be removed
in 2025 as stated in commit eb103a51640e ("reiserfs: Deprecate reiserfs").

Signed-off-by: Piotr Siminski <piotr.siminski@globallogic.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a5c16bb92fe2..c340c6fc7923 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18064,7 +18064,7 @@ F:=09include/linux/regmap.h
=20
 REISERFS FILE SYSTEM
 L:=09reiserfs-devel@vger.kernel.org
-S:=09Supported
+S:=09Obsolete
 F:=09fs/reiserfs/
=20
 REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM
--=20
2.34.1

