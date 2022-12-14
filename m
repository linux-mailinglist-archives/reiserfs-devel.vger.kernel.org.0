Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B26164C521
	for <lists+reiserfs-devel@lfdr.de>; Wed, 14 Dec 2022 09:34:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237645AbiLNIel (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 14 Dec 2022 03:34:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237502AbiLNIek (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 14 Dec 2022 03:34:40 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B45BC64DB
        for <reiserfs-devel@vger.kernel.org>; Wed, 14 Dec 2022 00:34:39 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id m19so21458271edj.8
        for <reiserfs-devel@vger.kernel.org>; Wed, 14 Dec 2022 00:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eA0h/w977llyBwMxQNx7FPnKRX9qJCv7OUJeBYB0Bb0=;
        b=Z5yOWiFR6s+ETW52ZdxDMKVsr9AfmXAH1iC2OAgL8ExjEMNgVWKw5Ddgj0rDst+mCk
         QMvF5k+ksoR+NnfMotHTuBD46mH1URbCIGHBgPZsjmt8BGI2ER53t+0i7w6Pvf3Pp/N9
         u4pzDQqtEZyZtrnP7nDLX8K20c7r4RGf9MYlKqwwsTRwewo9vIBK/syCwe2Dq+robdLX
         BKVdnxFPFtWNGWfLkXS5d6rUhwpiyi3s0v9M/lMiWOXDnSnXD/rhsaZ0j5/L8P/XAVhs
         E+N8r2eXrZtHpwctU+2WF7fvqM3oyGcauJMLLvipG8xrowQg/cGFse7TmAHUot7SlKSf
         wIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eA0h/w977llyBwMxQNx7FPnKRX9qJCv7OUJeBYB0Bb0=;
        b=A73nyBweuETwAXgEXYngnIoG5sE9k5500uRHe2Y0eeqHWvC/UvkNoO+OWViOQB9TJE
         GohAnToRA9CKIcqe/RQeYS2+qnoZwaj14bli0BALibZuSKW8h8bHqxwV/3hm24cRTccH
         YT3U1ovyhrEcz4kUJvJyXrI8bd31jGe4C2DxBPGq3Huas89f3UusBhWtCK1zweupj/Bt
         XX6GQoovOKzNmxQWlwSdTqnBxGFynM5N4YfCPQIIcjaI0FQ0roWvDG9oBBMZLYe8ateq
         ZIrA+MaSnrCVSzs1LRd4v1wK49Et0HtcA0MIq0SomO1lFVQ5Cv+07xIrNsjv6E1Yzcj8
         IZ/A==
X-Gm-Message-State: ANoB5pnbvrxeDZFAsiItxKVV/vRkDMo5maLto9+ld2bfINqBP9Bx8crZ
        POX5nYYJgwtIImBI8+w4Btg9y1h7dTU0jiGdQzQ=
X-Google-Smtp-Source: AA0mqf78hLvcJdrP6V5Hth4Qew3Rin6VIMZgEOKcX123XqmUX9G4Xl9SgoWcWlDVPLnvcys6DqYxKRsS3E4aUjjp6TY=
X-Received: by 2002:a05:6402:559:b0:46c:94ff:76dc with SMTP id
 i25-20020a056402055900b0046c94ff76dcmr12293417edx.158.1671006878190; Wed, 14
 Dec 2022 00:34:38 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6f02:4084:b0:27:8b12:efa6 with HTTP; Wed, 14 Dec 2022
 00:34:37 -0800 (PST)
Reply-To: plml44@hotmail.com
From:   Philip Manul <justintentou@gmail.com>
Date:   Wed, 14 Dec 2022 00:34:37 -0800
Message-ID: <CAK9eWvjLVUbQAdLVmh3B=f0u-HBVvm6=cwW5DiMhp0Exeai0YA@mail.gmail.com>
Subject: REP:
To:     in <in@proposal.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.3 required=5.0 tests=ADVANCE_FEE_3_NEW,BAYES_50,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UNCLAIMED_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:533 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [plml44[at]hotmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [justintentou[at]gmail.com]
        *  2.4 UNCLAIMED_MONEY BODY: People just leave money laying around
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  3.0 ADVANCE_FEE_3_NEW Appears to be advance fee fraud (Nigerian
        *      419)
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

--=20
Guten tag,
Mein Name ist Philip Manul. Ich bin von Beruf Rechtsanwalt. Ich habe
einen verstorbenen Kunden, der zuf=C3=A4llig denselben Namen mit Ihnen
teilt. Ich habe alle Papierdokumente in meinem Besitz. Ihr Verwandter,
mein verstorbener Kunde, hat hier in meinem Land einen nicht
beanspruchten Fonds zur=C3=BCckgelassen. Ich warte auf Ihre Antwort zum
Verfahren.
Philip Manul.

************************************************************

Good day,
My name is Philip Manul. I am a lawyer by profession. I have a
deceased client who happens to share the same surname with you. I have
all paper documents in my possession. Your relative my late client
left an unclaimed fund here in my country. I await your reply for
Procedure.
Philip Manul.
