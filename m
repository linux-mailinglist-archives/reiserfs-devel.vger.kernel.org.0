Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20A24552E63
	for <lists+reiserfs-devel@lfdr.de>; Tue, 21 Jun 2022 11:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348475AbiFUJdm (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 21 Jun 2022 05:33:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347196AbiFUJdl (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 21 Jun 2022 05:33:41 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B3D25C74
        for <reiserfs-devel@vger.kernel.org>; Tue, 21 Jun 2022 02:33:38 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id p69so11790716ybc.5
        for <reiserfs-devel@vger.kernel.org>; Tue, 21 Jun 2022 02:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=/0bRExIb6Mv4sy5raFRmeQINC+UUx7zEZcUUOWWOPJg=;
        b=BiofAIIq/0TGUbif5xfua6MHQbF/TEGLESjmO5wWDNELus2Yth6LHFqjXNs0SotHLi
         3nunPRvZ2HNnTKYwumnitaMDrTKx+B/NABwdxS4MuYXZ/9i1ukH3L2pLK//783mp9qdo
         8j5pdl1BpH62KaIifGwhn/cPmawEY3brGtjSXcUv+Gb7eYsqmzNZiC85SLqO6UXcOh4C
         oOwQsw2gVTtAw7sISHW2lCefHXd/7AJVqyvKmV4/ivy2Ps4Oz2aG6rarmVF66gWrbl/0
         BYym3Vda9rsENSfTsHVBs9m3pEIxzM9afJDFncMakemOkCLq7WIGOBiSf7SJ8HzBv4OR
         01OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=/0bRExIb6Mv4sy5raFRmeQINC+UUx7zEZcUUOWWOPJg=;
        b=5SVXc+O5BLp2FQicZ8ayH3RHz1WarJBwCrRLAzOogZ4KmtWmTQHMlFK35/QzPnFKbo
         ons+mbPhIeElXzuPVJaCSU7AUNltApu8vwBVXv2a382LXoKSsqWPVHMIiv566Mha2zsn
         0RHrN/zvevYGSNM58yxQUMLTOGq9y5R5XT7PcZWk0plfX2IBU8FN6btjJ2mM8Qndt1S2
         fcs/DZiOPWx2KC8H+yjozLMKa62QFVfKfyg5UZOGerMXxZ8sJLOWMvYNzwlGEwZv+GkC
         BgM9idPBtMtMJRx9d2m6K1Wf91pm+JniK9cdY+0DbL9/jwH3upfoC51pjgF791kD25kW
         5Imw==
X-Gm-Message-State: AJIora9Kvs2HVwcO5PdA/Z4mZ7bLc0h072LsYneEZpGVOiL1bWGA1+3z
        f6x+6fF1bt56AlrIlZbdjBpmwLVr9MbUmt2q9io=
X-Google-Smtp-Source: AGRyM1sbjpqcQcxnH/xPk/j5L+ye1Co8mpsKbukG7ooH4uFw39FWrir2hmhAP+fWKD9FmAPhbqrsOHvaNixK1ZubVso=
X-Received: by 2002:a25:a066:0:b0:664:411a:1071 with SMTP id
 x93-20020a25a066000000b00664411a1071mr30940830ybh.366.1655804017049; Tue, 21
 Jun 2022 02:33:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:e10a:b0:2d9:e631:94d0 with HTTP; Tue, 21 Jun 2022
 02:33:36 -0700 (PDT)
Reply-To: dimitryedik@gmail.com
From:   Dimitry Edik <lsbthdwrds@gmail.com>
Date:   Tue, 21 Jun 2022 02:33:36 -0700
Message-ID: <CAGrL05bXK3=PHqJEkRVAF5VYwadgdLPM0i73116vtOGv7L2cAg@mail.gmail.com>
Subject: Dear Partner,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_MONEY_PERCENT,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b2e listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [lsbthdwrds[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  2.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  0.0 T_MONEY_PERCENT X% of a lot of money for you
        *  2.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hello Dear,

My Name is Dimitry Edik from Russia A special assistance to my Russia
boss who deals in oil import and export He was killed by the Ukraine
soldiers at the border side. He supplied
oil to the Philippines company and he was paid over 90 per cent of the
transaction and the remaining $18.6 Million dollars have been paid into a
Taiwan bank in the Philippines..i want a partner that will assist me
with the claims. Is a (DEAL ) 40% for you and 60% for me
I have all information for the claims.
Kindly read and reply to me back is 100 per cent risk-free

Yours Sincerely
Dimitry Edik
