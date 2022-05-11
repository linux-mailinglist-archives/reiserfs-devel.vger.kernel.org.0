Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5CD3522B5D
	for <lists+reiserfs-devel@lfdr.de>; Wed, 11 May 2022 06:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231858AbiEKEmA (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 11 May 2022 00:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238781AbiEKEl6 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 11 May 2022 00:41:58 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2FE7AE274
        for <reiserfs-devel@vger.kernel.org>; Tue, 10 May 2022 21:41:51 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id x52so939699pfu.11
        for <reiserfs-devel@vger.kernel.org>; Tue, 10 May 2022 21:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=s3Cdswvtyrq8qHVwuRB9YRoTAIoD9G/2//h6WeFZHzo=;
        b=crfI6LDY4zdwb51InG7AHpY2OQsv0U+ZcsbrWQ4xznl2v6tqINUkJbYT6vduPxTeKj
         LcsKJ9SCTBRB+F7T1yGAGOy9gYKd4/MGgemnnE0Hkdd7D5sC7q5AF/HBEcegIFV2OAz0
         QYPAZoQxk+vBn9FVbvTE1x46byRhAKtTgcNka2ceI4Hll4kFNuppRhVDY81QO19S7HTI
         yoc1Z1o4MIF+Lc1o5XZKcnVyoITI3L7XV0zq77flA/u1JDjRYp99ezMpF8TnAzPMQ08b
         nu04waRdwYR8dPLU0516NKRoSLa1lr5tnijeqK5/oJ+laGkoIMgVReFiofoBZXSEfZCG
         wieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=s3Cdswvtyrq8qHVwuRB9YRoTAIoD9G/2//h6WeFZHzo=;
        b=IpfpfoKDL4PXk99zu8W5bHhiXOL/6yrgJ1lvwnl155cLTiHuHB4MqnEZZrgFqgezyX
         mFgfaoHv6QZxCBU3zuSDHbWmbWAQnY4BpfC8lX4XzuW18UtaS3xTaqpplGCl7JBxxeVt
         /GBY8gaf2kAEMdK/5pp9LBh/CRfXPeURJy1/x7WvP3QHTtqewpXJyM3Gl2s9jF6Q+cIn
         v2ATu7QuN9FNgkaYTMmJhur6iZNR5GYP+PAnCwldEyKs6ztR2jIXLBp23RFuIG4Yhbmo
         Ez2DdeF+OPkouUdeP0pSHKw/iZFz4yUYyw7OhxPh/EbdW5anTH101VzhBwffDC0SLkla
         W2qA==
X-Gm-Message-State: AOAM533uK06JxzH13+D9fCEgBXI4DJVV+Fj1HjekvGIhnkgwfAH9b/FV
        nOiQH8J4pYL13mDGFBkEQ1uWaQFzaIN7mU/a/Nw=
X-Google-Smtp-Source: ABdhPJxRT2VF3kksMu0TjrqavK6VDv9EtZvdjThs9Dpa9DoMjqaRUkX4hOeywSSVMMQvh0qSdR7nrPytG4wy2W750qY=
X-Received: by 2002:a62:5ec6:0:b0:510:71a1:f2f6 with SMTP id
 s189-20020a625ec6000000b0051071a1f2f6mr23804137pfb.69.1652244111305; Tue, 10
 May 2022 21:41:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:319:0:0:0:0 with HTTP; Tue, 10 May 2022 21:41:50
 -0700 (PDT)
From:   Private Mail <privatemail1961@gmail.com>
Date:   Tue, 10 May 2022 21:41:50 -0700
Message-ID: <CANjAOAhh9gBV+h7FM7L0tu5AiLZs7dsMvjxZGHKuXKsf=W+EYg@mail.gmail.com>
Subject: Have you had this? It is for your Benefit
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.3 required=5.0 tests=ADVANCE_FEE_4_NEW_MONEY,
        BAYES_50,DEAR_BENEFICIARY,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
        DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLY,
        LOTS_OF_MONEY,MONEY_FRAUD_5,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Our Ref: BG/WA0151/2022

Dear Beneficiary

Subject: An Estate of US$15.8 Million

Blount and Griffin Genealogical Investigators specializes in probate
research to locate missing heirs and beneficiaries to estates in the
United Kingdom and Europe.

We can also help you find wills, obtain copies of certificates, help
you to administer an estate, as well as calculating how an estate,
intestacy or trust should be distributed.

You may be entitled to a large pay out for an inheritance in Europe
worth US$15.8 million. We have discovered an estate belonging to the
late Depositor has remained unclaimed since he died in 2011 and we
have strong reasons to believe you are the closest living relative to
the deceased we can find.

You may unknowingly be the heir of this person who died without
leaving a will (intestate). We will conduct a probate research to
prove your entitlement, and can submit a claim on your behalf all at
no risk to yourselves.

Our service fee of 10% will be paid to us after you have received the estate.

The estate transfer process should take just a matter of days as we
have the mechanism and expertise to get this done very quickly. This
message may come to you as a shock, however we hope to work with you
to transfer the estate to you as quickly as possible.

Feel free to email our senior case worker Mr. Malcolm Casey on email:
malcolmcasey68@yahoo.com for further discussions.

With warm regards,

Mr. Blount W. Gort, CEO.
Blount and Griffin Associates Inc
