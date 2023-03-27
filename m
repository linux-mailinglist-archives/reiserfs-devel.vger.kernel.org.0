Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 681F26CA180
	for <lists+reiserfs-devel@lfdr.de>; Mon, 27 Mar 2023 12:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232707AbjC0KdH (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 27 Mar 2023 06:33:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232655AbjC0KdG (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 27 Mar 2023 06:33:06 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63B5D10FA
        for <reiserfs-devel@vger.kernel.org>; Mon, 27 Mar 2023 03:33:04 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id b18so9899124ybp.1
        for <reiserfs-devel@vger.kernel.org>; Mon, 27 Mar 2023 03:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679913183;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IE0Q22t9nDUcBAUVsmYKmeg+5EtHh5OHc8AXl8b80GM=;
        b=fzIX1Z4cFoO+QCmPA+bU8qq/YUDwtIrljP7r/HRTtr6IDnzeTXO4sEMgfiSKeYYoC4
         /28rtd5/xYBXdr202UGc+xt4t5XSxKrFsAZ20biEJ4qPD5gG5kscx8wqSFuLkRrJH3+M
         DyRKENfx0e0ul7Pj0FeOzwo73FVzl/w4e0lkw9da2CyQTdR1dJTL5QVkv05cEyxL1Wye
         biOpUKrNV8JunJZ8abujtX1UPk61gbT3mWaT3EdX10XuH7Umlzbjq2qn4Wsgxi9Yp2uW
         UM7CPt2kwlHWvVrdAohge0pmv1xSGb3iVgw4OZhpfx96KmIRj+xnFtBB/Q9yDTmcWR65
         CK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679913183;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IE0Q22t9nDUcBAUVsmYKmeg+5EtHh5OHc8AXl8b80GM=;
        b=6WcMZFR5iap1Ic+Svh/jmOly6mihG/EufpaNLwUPOmBcRoZPTfytR8sSrk7fpOcy6v
         jPC2vk7Soe1WjlFlFVzPBYFOXBzmfgcg2jNy2Q+KILPCLAFGav9oLsbTUGZTLD7hun38
         BEzcvH1MFvbkJr6HhDoX+PruexxPt+EFNFlQdSy6UMtXKOsERckmu10jxsP6dEswq+qA
         zKzltAkd5/01VCaELTAiUKxJmC/aqMdpMXO+c/hV6GF69q4QjggaKUEf6j9Uus9b+YSD
         q6OQBfgMkEhWl8HFQ9LAg9oHExUfVSrTaXvIw74wQgtW62PUFT217moK6mjYIE4kQRVO
         SAIA==
X-Gm-Message-State: AAQBX9cShR6W0UOBvhmK8R7MIelQDvVUumtG1dCg4NDsA6UQl8kbAvq9
        w0ZMfc4c5sG0m7VBx/UFHXE/bCEHuNUBfYQN0Go=
X-Google-Smtp-Source: AKy350YDDP6Uj2kRAOaYC/l4Ye9t0tHTdLIMkRH9Q/0tdHqjyvxssQIGbMF3pKckPevEzT0+JO8Ykq0pTQe1PcoOHxc=
X-Received: by 2002:a05:6902:1108:b0:b6d:fc53:c5c0 with SMTP id
 o8-20020a056902110800b00b6dfc53c5c0mr9251769ybu.1.1679913183411; Mon, 27 Mar
 2023 03:33:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:3802:b0:344:68a5:3ba0 with HTTP; Mon, 27 Mar 2023
 03:33:03 -0700 (PDT)
Reply-To: annamalgorzata587@gmail.com
From:   "Leszczynska Anna Malgorzata." <celinekorommah@gmail.com>
Date:   Mon, 27 Mar 2023 03:33:03 -0700
Message-ID: <CANRApRcvFD23+XPL15cJyMMhZEK413bQhMdvm4EXROerHCJ4gA@mail.gmail.com>
Subject: Mrs. Leszczynska Anna Malgorzata.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.8 required=5.0 tests=ADVANCE_FEE_5_NEW,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM,UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b35 listed in]
        [list.dnswl.org]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [celinekorommah[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [annamalgorzata587[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.8 ADVANCE_FEE_5_NEW Appears to be advance fee fraud (Nigerian
        *      419)
        *  2.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

-- 
I am Mrs. Leszczynska Anna Malgorzatafrom  from Germany Presently
admitted  in one of the hospitals here in Ivory Coast.

I and my late husband do not have any child that is why I am donating
this money to you having known my condition that I will join my late
husband soonest.

I wish to donate towards education and the less privileged I ask for
your assistance. I am suffering from colon cancer I have some few
weeks to live according to my doctor.

The money should be used for this purpose.
Motherless babies
Children orphaned by aids.
Destitute children
Widows and Widowers.
Children who cannot afford education.

My husband stressed the importance of education and the less
privileged I feel that this is what he would have wanted me to do with
the money that he left for charity.

These services bring so much joy to the kids. Together we are
transforming lives and building brighter futures - but without you, it
just would not be possible.

Sincerely,

Mrs. Leszczynska Anna Malgorzata.
