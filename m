Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59ADD5507D2
	for <lists+reiserfs-devel@lfdr.de>; Sun, 19 Jun 2022 03:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231371AbiFSBIi (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sat, 18 Jun 2022 21:08:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiFSBIh (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sat, 18 Jun 2022 21:08:37 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99207DF8D
        for <reiserfs-devel@vger.kernel.org>; Sat, 18 Jun 2022 18:08:33 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id u13so2791344uaq.10
        for <reiserfs-devel@vger.kernel.org>; Sat, 18 Jun 2022 18:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=r9s45iLFR7996ZhX6f5bROMLZTrx/NqqeK2ijAW5crg=;
        b=huy5z3k1/AB9fvxwDzV9LPSp2Lg7qsnma4Z8nXwP9saFDwcR0jzF/WNQvnBE1mrQYX
         6E56YEp0vg5ZZuE/mIEb0Isv9LgdDkBYjW3lOemhak064Yt362gAmHyDKwbV8rg5cZG+
         j3qazxD5gSo8OSaOwwne01rW/s/MTlLcbewGEr57nYZW1OcirkNANqqXFD1JptD6fxTg
         RnR8w1JIeNelZUb7YHo5lKS05TxBzMfq8m3fX8JaVA2EenBLbYnchU54r1lVydcpUN+s
         nCR86w+KI5rg71KPtC0SolQ3mZm13xqAl1fBjHhQeqarv+7kWfAGhFKal5OnkcmvaMqR
         m5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=r9s45iLFR7996ZhX6f5bROMLZTrx/NqqeK2ijAW5crg=;
        b=f1m+jJYpn5lSCWia79CdnUlaSlT4cCUNZShs+BBHxnylWMFqk3MHGKiIHNPYmYSdix
         Oef8aeSnMkrjvfwN0DpnPwXD41qhaNzrw9GM1tb6dODxG/o8ywy+ETlv+AjzUgAyhuHI
         2RlMhSYFuAXN779YCwbKQ8elA/AxIb6H/f49NpD08PU0Way4LLXYQ/aqb78jqq8L3HNp
         Dc/TLvLn1YBUanz/wHLudEA44TOLUiCFQXeN9Jwc0mpbH+ktNKC/tc+Id4wQ8lZwMA1j
         6izWjBMiSHQEDWx61KUS7364FLM+GM4gW8mQj+sOmhRABrlZSW6Mtyw/yniJ3UTKeP1d
         PlwQ==
X-Gm-Message-State: AJIora8ML+Rv5W+myPENSigS5NdQTCXqGxgafTV+Nt6y4JSNm5vN5HJt
        imbFGjFrzEAt/oSomzEkQt2muBSwMlt+d6PVfb4=
X-Google-Smtp-Source: AGRyM1tcKyCLV+NYtx6Tw6kJwOHT2qxR58K3rQ9wCyyI7dd9Rcfq5+j0gui+a+9DMDKD/hJfqHjr/W4Sd6FeC/xuLAA=
X-Received: by 2002:a9f:3153:0:b0:37f:7c1:a62 with SMTP id n19-20020a9f3153000000b0037f07c10a62mr1805137uab.115.1655600912623;
 Sat, 18 Jun 2022 18:08:32 -0700 (PDT)
MIME-Version: 1.0
Sender: hamzaafarizaa@gmail.com
Received: by 2002:a05:612c:2220:b0:2cd:51e8:669d with HTTP; Sat, 18 Jun 2022
 18:08:32 -0700 (PDT)
From:   "Mrs. Hamza Farizaa" <hamzmrsfari@gmail.com>
Date:   Sat, 18 Jun 2022 18:08:32 -0700
X-Google-Sender-Auth: n2f4gwqXiKhOo3xKJGBgs3HVGf4
Message-ID: <CAHw4SCW6FvSdO8Um_m1o67mTTE3BU8iW7g82Y1TFYye9FTahmA@mail.gmail.com>
Subject: I think you can
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.5 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_80,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_FROM,FREEMAIL_REPLY,HK_SCAM,LOTS_OF_MONEY,MONEY_FRAUD_8,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: *  2.0 BAYES_80 BODY: Bayes spam probability is 80 to 95%
        *      [score: 0.8017]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [hamzaafarizaa[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:944 listed in]
        [list.dnswl.org]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  0.0 HK_SCAM No description available.
        *  1.0 FREEMAIL_REPLY From and body contain different freemails
        *  0.0 MONEY_FRAUD_8 Lots of money and very many fraud phrases
        *  3.0 ADVANCE_FEE_5_NEW_MONEY Advance Fee fraud and lots of money
        *  0.7 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

May peace be with you,

My Greetings in the name of our family, This is the second time i am
contacting you with regards to the charity work. I am Mrs. Fariza
Hamza, an aging widow suffering from longtime illness. I am currently
admitted in a private hospital here in the capital city of
Coted=E2=80=99Ivoire.

I have sum amounts of US$17.500 Million dollars i inherited from my
late husband Late Mr. Mohamed Hamza, the sum will be disclosed to you
for security purpose which he deposited in one of a Bank here and I
need a very honest and God fearing person that can use this funds for
God's work and purpose, 15% out of the total funds will be for your
compensation for doing this work of God. I found your email address
and i decided to contact you.

Please if you would be able to use these funds for the purpose and
God's work kindly reply me back. on ( hamzamrs027@gmail.com )

Yours Sister.

Mrs. Fariza Hamza.
