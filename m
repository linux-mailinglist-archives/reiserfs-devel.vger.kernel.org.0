Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3501E65BCE3
	for <lists+reiserfs-devel@lfdr.de>; Tue,  3 Jan 2023 10:16:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236960AbjACJQX (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 3 Jan 2023 04:16:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236934AbjACJQW (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 3 Jan 2023 04:16:22 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4201BDE
        for <reiserfs-devel@vger.kernel.org>; Tue,  3 Jan 2023 01:16:21 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id j8-20020a17090a3e0800b00225fdd5007fso20876094pjc.2
        for <reiserfs-devel@vger.kernel.org>; Tue, 03 Jan 2023 01:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FJYPIPbgrLqbUEgstYOfOz1W7/cTonzcVLLdfFZxjek=;
        b=lJkR7bxJ0ByZ9Sk9sWa91ha6OcLzdPXBUZILSh77KYiBkoQuJOCXzF89F5MktQt5BH
         LvRIWOsafFSpjFDCzXuxR5RZE8o9X9qvujhdZvxbxmkL4ttL6i4wORG+adJMDf2OpC4K
         vQycD22AZQlYp64DnHz06iQiUUxIgL8hB7zDFvdM5x3ZCxdR04CcdQDPxuVbHUaeksOk
         G0Q/I28TaoieYvIGTWx4TSm5X8fAZQ3DrOOfqcStMKKVEjvv8/68BboLUqy3v9M1J9Kb
         ztAcTG6pO57/FIhVOvZ3GiZaR19BwhYhh7KM24usH4NwkcFjqKedzpy157+qBpOGwyeX
         APsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJYPIPbgrLqbUEgstYOfOz1W7/cTonzcVLLdfFZxjek=;
        b=RPfAua38Wh0FaAEUSci4kyg926t9rjAaXHPxvqeR41WUrHZdWrjllOD6t7lLsDfW5+
         pFAjGo42QHNNdG1NwUuN/Nx18jUhZ/hy/5lkrD4TNXBUlU8VyXqP46G5w85kwcXso6aS
         gUW080waPzKhUPfJh3JdaeCV0aByo2i9oWa/0K1uImT4gZ0LnJiQknWZm8Vko3mzWnz9
         Jp+5QSElbP0sePv9XkI5fqmSQvn6a0VGQAu6I1Bwj5MHViNPebwX9hkicnMeIJRQHPu+
         oQJjMyWNl7MJxDNVA05LlgPunLYk1rvt8HSmULPpivSx0xuhLN7OBjh43cwr4Kg8mqeK
         mZBQ==
X-Gm-Message-State: AFqh2kqaR9BpQvp27Gpz00Ue5igShlch5UM3T4G3OWBQQbRPqfesYKqa
        nPXnXt9Y1X7buzuzTaDjby7tO0wpqVFoowAxlVA=
X-Google-Smtp-Source: AMrXdXv8CuVzQAaAw5wKCD0UzdPlvoSEt/z7OZxjHug0CLl11lV5m+QfSvELGQaN7olfy1zxfxmAoxycgqdE1s7g0eM=
X-Received: by 2002:a17:90b:3944:b0:225:f003:cd15 with SMTP id
 oe4-20020a17090b394400b00225f003cd15mr2337193pjb.34.1672737381548; Tue, 03
 Jan 2023 01:16:21 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6a10:b616:b0:366:a559:b393 with HTTP; Tue, 3 Jan 2023
 01:16:20 -0800 (PST)
Reply-To: wongshiule@gmail.com
From:   Wong Shiu <powrzdgf@gmail.com>
Date:   Tue, 3 Jan 2023 11:16:20 +0200
Message-ID: <CACW=C1+F_1CO5BFHbkm9TvaeZAAw=RYVEh8i52m_0F4oKu=oyg@mail.gmail.com>
Subject: Guten Tag
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        HK_RANDOM_ENVFROM,HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1042 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5088]
        *  1.0 HK_RANDOM_FROM From username looks random
        *  0.0 HK_RANDOM_ENVFROM Envelope sender username looks random
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [powrzdgf[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

--=20
Guten Tag

Ich habe Ihre E-Mail-Adresse in der Google-Datenbank gefunden,

Ist Ihre E-Mail-Adresse noch g=C3=BCltig? Ich habe einen guten
Gesch=C3=A4ftsvorschlag f=C3=BCr Sie,

Bei Interesse kontaktieren Sie mich bitte f=C3=BCr weitere Informationen
unter: wongshiule@gmail.com

Wong Shiu
