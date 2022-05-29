Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32449537221
	for <lists+reiserfs-devel@lfdr.de>; Sun, 29 May 2022 20:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbiE2SOb (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sun, 29 May 2022 14:14:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230027AbiE2SOa (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 29 May 2022 14:14:30 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76F1384A3B
        for <reiserfs-devel@vger.kernel.org>; Sun, 29 May 2022 11:14:29 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id w14so13642501lfl.13
        for <reiserfs-devel@vger.kernel.org>; Sun, 29 May 2022 11:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=QTCWBzEezgLv+Z2QZNvCkKQgrxXaSDur4w34RcJaRzY=;
        b=DYAcNpau/HuHuIQ0hlzZvgKUfencN+wOvGWxQ7qX/JsEen9Abvds7Vc6EUOmt+uCMw
         eSIUoN9YndJZfRB1CvU5TfutX+Yp9mNDmpuBzRVZsZbIMClsEklz2UMV5v1I6n8S61Ky
         oLQU8rCosywK9Q8XMX889OUS3HxMNwRJnH9s0qceDyV8y/jU8mSlyG2VBvIGvMKgSVOF
         Ikm5mjC0hDkyav+AedK4h616inc4APi/WKNWGPd+j7iHMqodbR06Hhqt1+s5/7sxVmQ7
         9uJaon8mFdF2u07qEuSt/Pve76OAErrMy0WiFFIy3fqmy+k0i11erWnE2qm9SuivQsD/
         LaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=QTCWBzEezgLv+Z2QZNvCkKQgrxXaSDur4w34RcJaRzY=;
        b=ODHcSiAcBQIcy+9i4s+8+HwTejcUPi+2Uvr8/jbdAd4u00W8mpoS6aZ6vHD9S8ILJi
         wqnvM/DksUkaFU89QIvOzpkMNDcusgSoBdgHmKU+QB0rj8t7xzJwi0afBQinLcrapC4F
         0OSm4McnSHg+KvpFtve5rUal3OugF+7FbmCPHWAgUv2dTCdxKWCS7Em55XDSV1gdx8QR
         zoVCmHmSy6nSCFd1GVNQRADv1w6Ty7Q5iBfidORVnXkyG8c+uz7l5QUyDADP049mz3YQ
         hCI4RCOO9Pb/4KN9bYTSuKE5vnXOV0H29HAdpZYqDkYcWEaiWY+JFXsYOqY8XnVEVkRV
         ldFA==
X-Gm-Message-State: AOAM530Ie0gVY3/kENy8Mf8mMI3lxjThOu5Y8Lnk+PqosP2B2kBDAzjO
        YrnMwI6SkVAwducXAftsp53bQcvR+5bXkYxlAnY=
X-Google-Smtp-Source: ABdhPJxtQwOVMIk47kIQuzDs0EAEKecKSQj+nHOs0+OKAyujH3zvzxojDZkFrj+sTHKHjY0dtX/nAMfV45pNeTdy2us=
X-Received: by 2002:ac2:598e:0:b0:478:8c11:8d97 with SMTP id
 w14-20020ac2598e000000b004788c118d97mr19549613lfn.654.1653848067859; Sun, 29
 May 2022 11:14:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6504:1b8d:b0:1cd:988f:3318 with HTTP; Sun, 29 May 2022
 11:14:26 -0700 (PDT)
Reply-To: illuminatifame157@gmail.com
From:   illuminati <yusufabawa2@gmail.com>
Date:   Sun, 29 May 2022 11:14:26 -0700
Message-ID: <CAARX415gW8b_nWUXwB44qL5XLLRNTQCjOufBS+V3fr8s9XhiVw@mail.gmail.com>
Subject: illuminati
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:12b listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [yusufabawa2[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [yusufabawa2[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [illuminatifame157[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  2.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  0.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

--=20
WILLKOMMEN BEI DER ILLUMINATI BROTHERHOOD ORGANISATION, einem Club der
Reichen und Ber=C3=BChmten, ist die =C3=A4lteste und gr=C3=B6=C3=9Fte Brude=
rschaft der
Welt und besteht aus 3 Millionen Mitgliedern. Wir sind eine gro=C3=9Fe
Familie unter einem Vater, der das h=C3=B6chste Wesen ist. GOTT
. Ich glaube, wir alle haben einen Traum, einen Traum, etwas Gro=C3=9Fes im
Leben zu werden, so viele Menschen sterben heute, ohne ihre Tr=C3=A4ume zu
verwirklichen. Einige von uns sind dazu bestimmt, Pr=C3=A4sident unserer
verschiedenen L=C3=A4nder zu werden oder zu werden. einer der weltbesten
Musiker, Fu=C3=9Fballer, Politiker, Gesch=C3=A4ftsmann, Komiker oder ein He=
lfer
f=C3=BCr andere Menschen zu sein, die in Not sind E.T.C. M=C3=B6chten Sie
Mitglied dieser gro=C3=9Fartigen Organisation werden und Ihren ersten
Vorteil von 1.000.000 Euro erhalten? Wenn JA, antworten Sie bitte auf
diese E-Mail: illuminatifame157@gmail.com oder WhatsApp the great
Grandmaster mit +12312246136
