Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA0C36EFBA6
	for <lists+reiserfs-devel@lfdr.de>; Wed, 26 Apr 2023 22:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235354AbjDZUao (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 26 Apr 2023 16:30:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbjDZUan (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 26 Apr 2023 16:30:43 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F7DA1FE5
        for <reiserfs-devel@vger.kernel.org>; Wed, 26 Apr 2023 13:30:42 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-63b5ce4f069so9252969b3a.1
        for <reiserfs-devel@vger.kernel.org>; Wed, 26 Apr 2023 13:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682541041; x=1685133041;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JL3yT3Q33W5/BCQtgOVvz2cK4S2v0dqNTi6RS5aes9g=;
        b=IY9dFxnVGNr9gCAtFI+8ke3b2v8HAEw27jd6KRcA3lY2ESrwhk8R4wB8pgRc0P0q0U
         KHsQK9E81FM0/fJDYsHIGF6lfWPa0AHZUvtKXz+ViqCvTFOYY7gsgWER6lu7zQTmiK1+
         AAqZ/Cb71+StZjp33VdntI1wDme/e7mseGaSC7fu2xRX80DPSuc4vmlfrLW5Edt1oiyL
         XHfp+OyQRxplA1KT5YcjE25gbwmTrQpxVrczZZd64UGnRhTAditF88yo9Ef/+S9ExGXV
         r8/jxgEvC1wqODLgqvIMx2TdIlmDsBjd2vTlDinCa0Do93N8ZzJ12oIvK/YTMl5l5V8Z
         BOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682541041; x=1685133041;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JL3yT3Q33W5/BCQtgOVvz2cK4S2v0dqNTi6RS5aes9g=;
        b=ORL/HylwS4U4NUxdaFCYdcsTwh6HgphgZiJAe46j6+FO/YQMMnFDNB5hiPWVeti2ZJ
         SqhDY4TX4z8+lnx9gOKRD93ofOJSyUMOzhfJNAwLs77TR8WeaN2e4ZNFcWxLIcPf+c2V
         DfJpY9wI38G0HO/2CWYuZctZSWYJA2XECVk34myRKgrnuMRGQxMBdgjAnnnQ6BnfYxGF
         yQuLSi2EJ8fhytB/EB3B1BPgsBs/9fGIYtxl5XE7CqeATRZTH5An8JWBYWKLlqd1Fm//
         kNxiAsya984hAt3ITeUSZ3ZaI6Zy5w3wCajS7YJRRvZ1AGkqMsIJnIpgyIIsAVGgAX8g
         ta5g==
X-Gm-Message-State: AC+VfDyP6JrtQPMHWdQ9ZDZ1dlhYH2ky7NcQtRmYfkGMMkacuW+Dm+7a
        CTCa1uwC4uJwnTq8HD2TeDiEiBmaPoxOTE5F0/M=
X-Google-Smtp-Source: ACHHUZ6G4KZcQv6HJhw0bkrBW4/2pEddNGMEqpsl95lWQNwzQR/RtW78yQz6WSu27ikENqNlfa6LSZY8TbYbRRJmpW4=
X-Received: by 2002:a05:6a20:3d01:b0:f6:9492:93c0 with SMTP id
 y1-20020a056a203d0100b000f6949293c0mr7142390pzi.29.1682541041453; Wed, 26 Apr
 2023 13:30:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7022:6397:b0:62:6247:38e with HTTP; Wed, 26 Apr 2023
 13:30:40 -0700 (PDT)
Reply-To: klassoumark@gmail.com
From:   Mark Klassou <pastoremmanuelkonan74@gmail.com>
Date:   Wed, 26 Apr 2023 20:30:40 +0000
Message-ID: <CAAbfB5QqHW7jZJgLfb1ZdiEp_FtHnD94BVYg4wzyZ7QRpVQx+A@mail.gmail.com>
Subject: Re
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.9 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Good Morning,

I was only wondering if you got my previous email? I have been trying
to reach you by email. Kindly get back to me swiftly, it is very
important.

Yours faithfully
Mark Klassou.
