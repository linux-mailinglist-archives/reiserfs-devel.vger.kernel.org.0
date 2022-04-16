Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2B3E50357F
	for <lists+reiserfs-devel@lfdr.de>; Sat, 16 Apr 2022 11:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbiDPJIV (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sat, 16 Apr 2022 05:08:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbiDPJIU (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sat, 16 Apr 2022 05:08:20 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D22A9FC5
        for <reiserfs-devel@vger.kernel.org>; Sat, 16 Apr 2022 02:05:49 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id e194so5745836iof.11
        for <reiserfs-devel@vger.kernel.org>; Sat, 16 Apr 2022 02:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=KeMi8W+p20zdR41YZoRj2EapY7imNsLYkAgQIQsIzqY=;
        b=BqTgaVANr/P7nESqHMIIepmNPvPmCNHS30BmTk5LVlOc/eEJe6PZuk2WNHDmch03yQ
         0NrmGq4kH0vEyEqN84DMZc3EfDzctLOfcfIVTBtcUAPwVJtIiwb62aPPYsR81IfmrlMK
         t4J27PcJ47WrmDq1ZzOI/qTjeB1ZomiAVKQ79HuwCxdn8dHaMe+v91FpJf9Y8USpqIUr
         oly+d9Dsbr06SIFMG4hLLdYaCjBPbaxSHtQg/euMilgLQWiP1Al/zzHgxDAYn6MTrlo1
         9VZMTrXbpkRV2grSrft7n1PG6AsV1yeth14hFvhh1T4D0b0UdXASW42FDZFlDeJ4z10M
         /BTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=KeMi8W+p20zdR41YZoRj2EapY7imNsLYkAgQIQsIzqY=;
        b=TkE7mH3B/wvZR5+CIHv69Ei/ezI8+QJYlB4RAo9sYcNNPxNb1LdiEguhAjAYQ+DnlU
         ufPak39MAH5Rl9IqFIk+MdlH0qCd5ks6kJ59gdCNHgup2vzy+7jY4yuATImAPyugdgRB
         DPCitsVyv10Zfks8D5HF4hC3UhBgTOKFS1b1VApGrQm+eACHetr/8DAx9gBzTeFlkGue
         BFeT22vHkR/EvR6CTiPka0PrjqHq5se8bj0aadyF7LbEM/0NxnVfPkqyL+iKRHLwzTSG
         kNEtUTJ+w4KYArUH5s2wj/zvCdcq/IYCnSrjg3l/3oj3en4cgyVEUJPXIK1m1u2sP3Pg
         7/Vw==
X-Gm-Message-State: AOAM530XCJO7eYOkOGvq1FmaCKmzEf7GxImkHBSUphchPA60O2+pRbGQ
        ldI62ufqdUw7Oyq0BgXTnxzBLl1+Sf5ZWgjWmXw=
X-Google-Smtp-Source: ABdhPJznjjnEvw3u8CPA/Ast9EnrRErH2Yv4teZ6jlunqI57R6I5EfjQXkb8ldOMbNR0cwy+3bcIDg3La89SmJHnJIo=
X-Received: by 2002:a05:6638:24d6:b0:323:cda4:170d with SMTP id
 y22-20020a05663824d600b00323cda4170dmr1210495jat.269.1650099948121; Sat, 16
 Apr 2022 02:05:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:91c1:0:0:0:0:0 with HTTP; Sat, 16 Apr 2022 02:05:47
 -0700 (PDT)
Reply-To: danielseyba@yahoo.com
From:   Seyba Daniel <handase0011@gmail.com>
Date:   Sat, 16 Apr 2022 11:05:47 +0200
Message-ID: <CAOrmDEC6QWS2=Vh26wVnJbwCMK0HWuq=MhcEWCRJfTQXcTBPSg@mail.gmail.com>
Subject: Hello,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:d43 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [handase0011[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [handase0011[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hello,

I am so sorry contacting you in this means especially when we have never
met before. I urgently seek your service to represent me in investing in
your region / country and you will be rewarded for your service without
affecting your present job with very little time invested in it.

My interest is in buying real estate, private schools or companies with
potentials for rapid growth in long terms.

So please confirm interest by responding back.

My dearest regards

Seyba Daniel
