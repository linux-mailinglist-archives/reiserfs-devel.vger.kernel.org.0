Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0048D58E252
	for <lists+reiserfs-devel@lfdr.de>; Wed, 10 Aug 2022 00:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbiHIWDQ (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 9 Aug 2022 18:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbiHIWC6 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 9 Aug 2022 18:02:58 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4A7F11C14
        for <reiserfs-devel@vger.kernel.org>; Tue,  9 Aug 2022 15:02:25 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id f65so12575459pgc.12
        for <reiserfs-devel@vger.kernel.org>; Tue, 09 Aug 2022 15:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=GI1h58u9NHz7rI/vIwOU5DkUcoHPmL+b4tk5i/xxv5Y=;
        b=fzoZFZr9uaD+Ol8dog9ev4n4H6KtnfCf6iFR8U4sXzUQAhT916kHBQxgoo5wHIPZhM
         k6uwoSf+Vcz+2Niy6KfCEBhjHFkE3SuUx1Wwj8+FJYekXZ43tWPU9yuWMya21/kumiyC
         53SMmF/knIdQn5IJ2OvWLrORLHbFDXSLUM0fZA0u5CIqEFcJ9G0/2moCvceGSv/ErCMQ
         sHBjS6GXU2t9Igf/hRKHI8UBuCWPeQNxZdBv+/CaQDx543yQe7vWRhzWJbRMe/T9GRkW
         +n/8iw6ht13iemYwd+TuaoQnJv+k0a7/C5EKwxHaP3zCvuvNKboK8jcm7gtX8n1LcEpp
         QIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=GI1h58u9NHz7rI/vIwOU5DkUcoHPmL+b4tk5i/xxv5Y=;
        b=cHo1vDIRZdBtU0DXKSskPC+/2F6buUfklPDBJRRtpufj33vuqUftcEUVqEep+N/YFe
         rIzaTTK6TIUQZKFRZqxApq4OObAdqFGGfEwqTujNTwMTR4xEn+x2YfeQZR8NgWVYIU1n
         +bBkX0EiK7hNxptgjY5zjHqNRjuFZ0tL+xoZj931mE0BxakDr3QOg9DMcEpo5XkGSMEu
         YaZUSw8EAxV1fyd8jgv6jpC/UKiK1GCi9LekeMtuZrXZ9zFGlWxckdPa42S4PxtDfLUP
         1cyoaD2zR9lWB2Kz1wD9iC4mysieT0MI8AuExL+6RjcdyOIDSdzYbqV6AmBv6NRtIXPi
         zGfQ==
X-Gm-Message-State: ACgBeo2oPnmL0WoGj/j6K1hI7TgYdaPQi7ARbnHo2d8B6UQP2rui3iiw
        CQnvwZiDuvzjRXTL+BD7iz63tKqL+KM/IXW2QLE=
X-Google-Smtp-Source: AA6agR67+W+N9G4rDGCNPmDGhJC2I5vWqu/xXr0oQwEoHCs2+/LTlGKRhKpou8uXjahOgm716T7jye4ez6Sy3tHehso=
X-Received: by 2002:a05:6a00:1c4b:b0:52e:6c05:8f1f with SMTP id
 s11-20020a056a001c4b00b0052e6c058f1fmr25184233pfw.7.1660082544633; Tue, 09
 Aug 2022 15:02:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:e8a6:b0:2d4:fb1c:cc5e with HTTP; Tue, 9 Aug 2022
 15:02:23 -0700 (PDT)
Reply-To: wijh555@gmail.com
From:   "Dr. Ali Moses" <alimoses07@gmail.com>
Date:   Tue, 9 Aug 2022 15:02:23 -0700
Message-ID: <CADWzZe6xiUQUBwAGmm5yaRp-EJqtEy__T2dK3fCthnsFKypbGw@mail.gmail.com>
Subject: Good Day,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:52f listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [alimoses07[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [wijh555[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [alimoses07[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

-- 
Hello,
We the Board Directors believe you are in good health, doing great and
with the hope that this mail will meet you in good condition, We are
privileged and delighted to reach you via email" And we are urgently
waiting to hear from you. and again your number is not connecting.

My regards,
Dr. Ali Moses..

Sincerely,
Prof. Chin Guang
