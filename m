Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2C2052C74A
	for <lists+reiserfs-devel@lfdr.de>; Thu, 19 May 2022 01:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230261AbiERXEY (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 18 May 2022 19:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbiERXEX (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 18 May 2022 19:04:23 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE4B25A7A3
        for <reiserfs-devel@vger.kernel.org>; Wed, 18 May 2022 16:04:23 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id q135so6147025ybg.10
        for <reiserfs-devel@vger.kernel.org>; Wed, 18 May 2022 16:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=mZ3wqB4NmL7z6lpFr/h15h1rYqsZKafJnUpMVahbEPg=;
        b=KzrNFLIZeK+N2j58ACUy+pkQjcrhkA2gczBuhGsFKwO0URN9DXTSmV1sUpB46IDQMG
         ol15U2+nT6yxqfIpTDxd+croN4ZtfTvrgz9bydUojwuQ/Zl/HCfIXuhqs9rftWlmGOlw
         xQlUXQt4cZKg+wrpK5GZMzvz5M//76vhJrcRNCR0kXtF+MNl81tRA2iJBMFBDMPpTQy9
         BJ9kOJi2/7TH19RCBxyipCj2PB0uUA86/2B0aBpPzXuGP+aQpyxrr1aT3zYTYFGlT2qJ
         +D+PaGrXaBhgx+LnACtxsrEL4XxNsFze+1LSa/aMam9B6QWVDR3Aqfo+vw/roVKREMmU
         VPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=mZ3wqB4NmL7z6lpFr/h15h1rYqsZKafJnUpMVahbEPg=;
        b=WUiVkN/sQFENxoCEfiayEDD0sATS3dQbWLLa3iA3/1/c2NvLy/tU3usNP2oWawv0O6
         LsV5FWO9TIeV4xukVyHO0iLE/7/0FLoHnGZeRU/kh039PP0MzW3uwOrMoSG45qW2Yn9J
         HM6lfPqJiHNRT2EryhRPOczlXYCnaeXNxDcymmLe4VBKbO82P8qwmNpV12WyI+aBW1zC
         qrvgUgC4hq3k9Z2QTWhE7pZngVfPCL78ugQD/pk5sJD3EDKwqJco/Gfti23ninIyTANi
         doWQkUrPhczoS1Vr3zB+en51JgT7Lm0WOPabEMcanPFewmc6uHaiM2VbtakpKaDixYo+
         tbRQ==
X-Gm-Message-State: AOAM531Ft3v/qmZWV5frY2se7XWk18bgnwaz2gbMf9aSeEpDOVeBoyMy
        F3i0489CyMRWcHNWFQlvS5NXHbafTw5cFocnNg8=
X-Google-Smtp-Source: ABdhPJxKhovwIKl8U+UNvlH7JDeqVI64I/Qlso76jX6U4gn9VcEhrDWR19OpTZ+ppyL/m7JtZaH81tQVPquiWgmeT4Q=
X-Received: by 2002:a25:3746:0:b0:64c:4ab2:8277 with SMTP id
 e67-20020a253746000000b0064c4ab28277mr1783036yba.631.1652915062344; Wed, 18
 May 2022 16:04:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:7143:0:0:0:0 with HTTP; Wed, 18 May 2022 16:04:21
 -0700 (PDT)
Reply-To: tonywenn@asia.com
From:   Tony Wen <weboutloock4@gmail.com>
Date:   Thu, 19 May 2022 07:04:21 +0800
Message-ID: <CAE2_YrCAAy_1sqMVr1iVazg6K5gPc+X4XZkCzCEQaCaQXCDYFQ@mail.gmail.com>
Subject: engage
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b34 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4959]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [weboutloock4[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [weboutloock4[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.4 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Can I engage your services?
