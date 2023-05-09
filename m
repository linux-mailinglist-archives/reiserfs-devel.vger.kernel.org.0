Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C727D6FCA85
	for <lists+reiserfs-devel@lfdr.de>; Tue,  9 May 2023 17:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235231AbjEIPtF (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 9 May 2023 11:49:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230181AbjEIPtE (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 9 May 2023 11:49:04 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7ABE3598
        for <reiserfs-devel@vger.kernel.org>; Tue,  9 May 2023 08:49:03 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-965f7bdab6bso896969566b.3
        for <reiserfs-devel@vger.kernel.org>; Tue, 09 May 2023 08:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683647342; x=1686239342;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9MgH2yk3oKPfzsyrz/5pM854nV5ZPzia2UxJXZBDwzc=;
        b=bRi8xcDrQ4zIrqHkOPSRw+LMVLVoJsGc1OMDRyaJRAKrnCH7esC/FcCk2wwt8U5KK4
         q+GtVoX/FIgQZrQQy2LNzYcXdEdeBe4S/QEOD782VPnvK9fzTjgbr24V5UhlwzrvvcbV
         Fj93PoJAw0UxT56GLWFHj/KT1mdTXDFfhk1YZcRdeYQiGFsPWlG75epYiDlmBROGF4uA
         E3RA7OyxF3JSGcCSdx38pkrb/SHP44Y48KdAtZvPV5nihzjsJYGH6i02/2H87wY6Et3E
         H8Xd9XwDy9BdvvkeiQvPVx+aYiDpO+zDnX3T/jD018wJgDtXIYBMVerp9pS+zcC6knjf
         AAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683647342; x=1686239342;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9MgH2yk3oKPfzsyrz/5pM854nV5ZPzia2UxJXZBDwzc=;
        b=fbs+VcMSaA2kIJYip42+hEEyVinpxSdz3xKTjNQnDu0bPf7NOptLO+0AiIQa4P2HK2
         8Mrser0ndYm105/Sc+FBJ4C02xVj2TJLHEx4q3Bdt/2SFESfJppd/dAGR3k4Gco6hH5e
         ihIX6PKIzy5WQu11NMR96Hu2PwfO/wFGCFIJ4ucnXhGDUlXEZMNlWKLlDoU080i23MKK
         /iiSFFqY3t+DuN+O7huYqQ6zM18iEqJfg6nTArATPVPDBG8nGNuXJIVOV8UQFm2pPPtg
         5+KrhlV/N/u52dcjQKqzA+UEnyP3yNWSABX2obHevL33ISDKjN/I3UFn6P4LY3G8VrG0
         /L6A==
X-Gm-Message-State: AC+VfDyECESbKR1XPHnjKK9+lXGMz0ab/v3H2VBj7B6YTrTcZeoh4SFF
        BjsU30WYkNM1zNV5yEg1R01Y7NyKPzHedR3iMW8=
X-Google-Smtp-Source: ACHHUZ7bFBKXrDOBS+zHO6h8pfTyQTjdqx3zSVzxLowtE5vDfkQqK+vIDkM1mW4PzMaTmdEAe9Yo2jMeF35vZRO8sW8=
X-Received: by 2002:a17:907:c22:b0:961:2956:2ed9 with SMTP id
 ga34-20020a1709070c2200b0096129562ed9mr16260849ejc.25.1683647341791; Tue, 09
 May 2023 08:49:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:db04:b0:953:7456:30e4 with HTTP; Tue, 9 May 2023
 08:49:00 -0700 (PDT)
Reply-To: rhsheikhalhamed@gmail.com
From:   Abu Dhabi Investment Authority <hagdfcost@gmail.com>
Date:   Tue, 9 May 2023 16:49:00 +0100
Message-ID: <CAGUzCAcx3pFr9RZOe8Q0fYGz2sk8svUJF5bvK+phQzA3YbiBWA@mail.gmail.com>
Subject: Salam Alaikum /ADIA LOAN OFFER
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.4 required=5.0 tests=BAYES_50,DEAR_SOMETHING,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:644 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [hagdfcost[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  2.0 DEAR_SOMETHING BODY: Contains 'Dear (something)'
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.8 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Dear Sir/Madam,

We are a United Arab Emirates based investment company known as Abu
Dhabi Investment Authority working on expanding its portfolio globally
and financing projects.

We are offering Corporate and Personal Loan at 3.5% Interest Rate for
a duration of 5 to 10 years.

Contact us on Email: rhsheikhalhamed@gmail.com ,for more information
and proceeding!

We also give 2% commission to consultants and brokers who introduce
project owners for finance or other opportunities.


Yours truly,
Mahmoud Al Hamoud
(Personal Assistant)
Abu Dhabi Investment Authority
211 Corniche, PO Box 3600
Abu Dhabi,United Arab Emirates
