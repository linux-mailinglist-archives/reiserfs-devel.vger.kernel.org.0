Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFECD63C92E
	for <lists+reiserfs-devel@lfdr.de>; Tue, 29 Nov 2022 21:19:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233743AbiK2UTx (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 29 Nov 2022 15:19:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235210AbiK2UTw (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 29 Nov 2022 15:19:52 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F5B22662
        for <reiserfs-devel@vger.kernel.org>; Tue, 29 Nov 2022 12:19:51 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id r12so23846006lfp.1
        for <reiserfs-devel@vger.kernel.org>; Tue, 29 Nov 2022 12:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=AqQSb1g9vJ9ibp0rLrs1bP8KmPiIRzl6Sv7Ib9/3DfXLnf6h2m0aFVCHKfn++fDZWW
         o/VZoLt/Swg+3Aw/tpKm+bFIOa51DkuC2YZ47E9w58m39iyh0geBo3tLpcQ4GVO/pX9e
         qlayjZMpPIXed9gjiigK24JDpzNBelF8DpWQMjuqdk+DK0NM/a46ahOjwgGOiqWkXIPX
         oqRXHoYPBKVEDJ3CVLFUApWXytPfo+XV+fRC9oPjMcyt2LGW/LZA0hX0xZj5ejEGzkzt
         xht+Oz88NJqGGEuGqqGkW6L8+Y3v1/YIGY8Vr8yP107NuRkEJU0AhASONohvxiNnuw6p
         cOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=SatPLJUY6vcZtVO/Yu7kz2FGAi7z+1KDfGNmLRN+ph+FzgM8UFpfqbs+d5aJzf93x3
         lRW9WFJoOpAnuWqd3Y7TsksvGRgT5P/Zhxk2AL0aMaLnRXruLeSQ5/Xf5SeI5VjRNWgF
         nP7A3LBOKRtpIUZ16hTwcKZdnP6Frcb0Bcx0/OfcEm5oOvR5IGHEBcuo+bDO7Iqkpdcg
         YSDnhT8Spfpui8tSQO4X3g674u6GRjAdoS+BeSsSLZ9oEbgYYk9/CkE2DaOicX2jKDfO
         XOZf7G6bwvq0nFjDe/4t0Selfp07a0TTBG59sQMYpn3kqrHgm9PgE3YHwXC2N0gBTBcJ
         dVAw==
X-Gm-Message-State: ANoB5pkjTIh+fKcg51bF5g17G7300jPmvRk2TZ+7E9yGRoMnx7ypQhyX
        fyedp4w71JZctAvgQv4jNr7hLy8Yp9vXS0axmpI=
X-Google-Smtp-Source: AA0mqf6wsDlYvhHi0J07TEMd57XL3BA8Q5E5wvUsFujVHgMq526DpezlAgyoM9bAQnQmfsImlo8LUj7A749VbPJuoh8=
X-Received: by 2002:ac2:5fb0:0:b0:4b0:65b0:7f30 with SMTP id
 s16-20020ac25fb0000000b004b065b07f30mr13760827lfe.385.1669753189099; Tue, 29
 Nov 2022 12:19:49 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6520:1d6:b0:22e:e610:6979 with HTTP; Tue, 29 Nov 2022
 12:19:48 -0800 (PST)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham" <chiogb002@gmail.com>
Date:   Tue, 29 Nov 2022 20:19:48 +0000
Message-ID: <CAHoLJnkVKAmjXzjRF9_qDs5ab+ddz92ttMF+tU=dTX+qE_o5yA@mail.gmail.com>
Subject: hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Regard, Mr.Abraham
