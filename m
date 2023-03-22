Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF1386C5AD0
	for <lists+reiserfs-devel@lfdr.de>; Thu, 23 Mar 2023 00:49:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjCVXtM (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 22 Mar 2023 19:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjCVXtL (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 22 Mar 2023 19:49:11 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6A8021A13
        for <reiserfs-devel@vger.kernel.org>; Wed, 22 Mar 2023 16:49:09 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id l7so2571390qvh.5
        for <reiserfs-devel@vger.kernel.org>; Wed, 22 Mar 2023 16:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679528948;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=91UiJeEJ1mze14WbHMd5QA14OarckVBimVzBrDtBEh8=;
        b=b9viAn/QX2ir0mYpG7uim+/ubehS0DQyw6jcgTK3+ae2zG3IImHS2QfTDnUM6JssiY
         62+JO9gkyJyCjO7jCQugUQQV5IPgc4R7Lh+XzyK3FcTbj9p0J+wRtwfsaZQ1EzEpOm6p
         aKUdn8FSSozTFwcvkyq8eBJ51A/wqN6v3t412kaCvEuKfAv/noobjvEzn/NfxVIwF4G8
         bc1zfWE9HrnPygx2lzUt+e2PkvV+0ahsJik8IirmUCrvTThhSr5cwTAJjQNnEGFmD/6v
         dezoTkhKzs2Be4CanpEFYlY0rkERwK3mnBqC9iV/sbYL+uJWToUbiBU9mjamNbbRwsNX
         5LUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679528948;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=91UiJeEJ1mze14WbHMd5QA14OarckVBimVzBrDtBEh8=;
        b=PByPUeM+gdQ4WtIyugErXfDHIjBVJfPivJX+vz9uZL2HxoAcSh0TorEgz7jQTO7CAu
         gmuaBBc3YKsbBJb8F1lRVGe2fQs1ZQgeHeajpGP4Net36ihRZahUCKEJ2q+pb5jNsB8X
         3cs5i/QLGydhPHd+A1sfE+LPPS3dtv/rLy8bNOkuzkS42hsmBfJ0SJk8mjwrzTzNaT0t
         yftCQxtsCCcA+B07iaiUWz+7pWWmUz69F/oBUUfrc6brT3d5i8WjqmpHMlEWZmO2EAA+
         K2bwodBIMMIeYXOq4fUabOkZAy90ngS89kayXxaxB9sO6TH2bYapZ3E2UdRj69G/AuoJ
         D92w==
X-Gm-Message-State: AO0yUKXIRpQBRt+2Pl6SUDfiV9daKqbdEkpt8Gyk/8+dWucL+Rxp+2ur
        Jb749SrVyVYFWW2GVIMAst9TU3UHAAsLe/CG5Agcjl/GzFQ=
X-Google-Smtp-Source: AK7set9xdpr3AxFG0JECpsH+HN/vBfyQRWZlojg1Syaq6Rs25soEu3kdu70JCQGyYH8Qs5JoeM4L7Ea7YomI9HPNynY=
X-Received: by 2002:ad4:4f2e:0:b0:56e:a0ba:cc3e with SMTP id
 fc14-20020ad44f2e000000b0056ea0bacc3emr1193195qvb.0.1679528948512; Wed, 22
 Mar 2023 16:49:08 -0700 (PDT)
MIME-Version: 1.0
From:   S V <nerfur@gmail.com>
Date:   Thu, 23 Mar 2023 02:48:57 +0300
Message-ID: <CAKDfvLbmX6xNiUAdsTmWrN4PK9zC_LRbqmNEG_wu=YedpaH33A@mail.gmail.com>
Subject: Want to try luck with OpenBSD?
To:     reiserfs-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hello, I know it may sound pretty rude, but don't you consider
possibility of porting your fs to OpenBSD or any other *BSD OS?
All of them have lean, understandable code base and high demand for
some additional fs, why not?

-- 
Nerfur Dragon
-==(UDIC)==-
