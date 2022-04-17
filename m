Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A078F50476E
	for <lists+reiserfs-devel@lfdr.de>; Sun, 17 Apr 2022 11:40:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233838AbiDQJmv (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sun, 17 Apr 2022 05:42:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233837AbiDQJmt (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 17 Apr 2022 05:42:49 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E4B413F28
        for <reiserfs-devel@vger.kernel.org>; Sun, 17 Apr 2022 02:40:12 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id u18so14618787eda.3
        for <reiserfs-devel@vger.kernel.org>; Sun, 17 Apr 2022 02:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=z+v8ugHyK4Bi1bsAOtuex5rzJWIULuLfF++ZnJg6JJs=;
        b=WYOO+zgYP1Nt6omt1q7WI+cubp9YcawdgPegF3+SKZr9A5+lomXqKdt2NPm17nKzog
         eMo3Nwt8ifH61Br0MeUlvLPtU/X0jt3KfvqbbE3cMKOmJoRQ03irRHyWUZkxItOGGkAU
         VQkDPclN+tOJVa9rioHvjodgMrZ30RPl6mbIFBOX/0N9SVAWFCY+xMeAkmdsLEFcqOE8
         DH/rY3RwgjXq2Y31NNPQole6ej7dLfYuus28ZV/tRS6VpovSjgnYaS3DmDM5XfolNrPq
         yfQr2jkguALjUwjQ9fNJ6IOl9lOeyvxpVpn5w6Q0oEYjfT7/4+nY8T/34FNrbC+fGrS3
         +pEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=z+v8ugHyK4Bi1bsAOtuex5rzJWIULuLfF++ZnJg6JJs=;
        b=P1bRn4Fw8OAUFzgcpKSjJbE3oUG72zPt2xZlXw1IXS3UhbXv3jjMOiM1TI0f3otONy
         hZZd8FBYhTs+z+nnev8ruV4HWX0jBkCioe0tE+IKEAmRj2ujICIHlWnUJHHyRIRmPTfA
         EoHQlul00fYkIDhD+M+Q4zi7Xm93DOgzcZocV7Ux30lDKJhRNJmsQR60zGyIk3/DHjs+
         UkqiNdxxVmm0nIJhD0iHu9pImgs6+M/Y/KZ658Syft99p94LsOo5kywbt9LN89wb7EN5
         +cmPCYIkPk2oBJ9xWXoD8kr25rU9HfPd9ZXsAJ5yn6AAyVhevxdyk5mQ6wpdomgz6+PJ
         yZrg==
X-Gm-Message-State: AOAM5339X+gW2mJDEZ0huF9Cly0IJqwQ/GqkjbqgWWROGwei1UCUusYI
        9REftR+s/bnhA5Q60aAgVXG/huSEjujrQQM5Rdk=
X-Google-Smtp-Source: ABdhPJxDtemyC6R+dHw01+cF2StlqFxvk26r0FHe/Pb+COioreUlUd9wXhdei7MdMiLkQohIgmXtT/JkOlgiz1DmxJk=
X-Received: by 2002:a05:6402:42cb:b0:421:c735:1fd3 with SMTP id
 i11-20020a05640242cb00b00421c7351fd3mr7256530edc.341.1650188410838; Sun, 17
 Apr 2022 02:40:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6f02:502:b0:f:1274:1ad8 with HTTP; Sun, 17 Apr 2022
 02:40:10 -0700 (PDT)
Reply-To: markwillima00@gmail.com
From:   Mark <parkings2014@gmail.com>
Date:   Sun, 17 Apr 2022 02:40:10 -0700
Message-ID: <CAJOam4c4-ac+YEjGehb74drn8WSvVXtxFniFAtd19pfHtJf1rQ@mail.gmail.com>
Subject: Re: Greetings!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:543 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [parkings2014[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [markwillima00[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [parkings2014[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.6 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hello,

The HSBC Bank is a financial institution in United Kingdom. We
promotes long-term,sustainable and broad-based economic growth in
developing and emerging countries by providing financial support like
loans and investment to large, small and
medium-sized companies (SMEs) as well as fast-growing enterprises
which in turn helps to create secure and permanent jobs and reduce
poverty.

If you need fund to promotes your business, project(Project Funding),
Loan, planning, budgeting and expansion of your business(s) , do not
hesitate to indicate your interest as we are here to serve you better
by granting your request.


Thank you
Mr:Mark
