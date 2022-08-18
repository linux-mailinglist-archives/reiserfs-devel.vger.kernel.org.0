Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D689598676
	for <lists+reiserfs-devel@lfdr.de>; Thu, 18 Aug 2022 16:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343759AbiHROx2 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 18 Aug 2022 10:53:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343769AbiHROx0 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 18 Aug 2022 10:53:26 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76EEF221
        for <reiserfs-devel@vger.kernel.org>; Thu, 18 Aug 2022 07:53:24 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id e15so2496836lfs.0
        for <reiserfs-devel@vger.kernel.org>; Thu, 18 Aug 2022 07:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc;
        bh=DodWHn8jPlip/mIG7oEuL9BF8+ztzQgUP7dJ413D3Nk=;
        b=NzvNRIvp7ZWCed5O4xCRYW77MBHM6xAOZTemalvI045mKZ9yxtl/wXDhPqz1RcMzBk
         7Zb9XhiJmS8GvHJxcMXICP18yNqMnTXvXBXp8pNlJgBMWiOTHsrVGnICHa2Atd1pRRJN
         VJVDTPdr68342Hc0zcD9FUWhzgvkTPqJPZtoRrPWItsPTcckI2mYtKNWthB+zjQQ6Zxo
         SCA0QIrRy3N/jsMX9Hu3D5T1kSKLrTG4tmpNDgW59Tw2pGyZ4gX2EBhhRWp2K5EQdc8O
         ixhJEcY5anUWhbRwS/QxF/uIJhkFu637HKmqllRS+dykoj1ir5udQJvVWbZPinXn6bKG
         k4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc;
        bh=DodWHn8jPlip/mIG7oEuL9BF8+ztzQgUP7dJ413D3Nk=;
        b=fPUT3Qfj5dXWsIT2Gv4v8gqqaofcJzRMp62vAQtdQObe8qddWJGp5drUggWsxVeZa3
         dGyoX/mOpwRFgA93NQKarC9hB2+9zyV4DbBvjMyjJXPtmmrSdk/5WzqBNgiVPniX4XH3
         cnLXkJXD1i46Df9b/Gb45kNVk7GEpHqusNOJ6178YKdeFMDLicahSvBn3qoDp22HCPEF
         EheNvhJ2r3BWrzj/ZI9en6uqT0bH2HeNZDe+zoEE2WeL2j141ez/PDTj9EfBH6996m2o
         OoTcEv7dTXPr5IiL2jwoMH+g70sK2jDokJwpcsTNvwIDjYrrg+Wle6CQSOgh32Ltutyt
         gs8Q==
X-Gm-Message-State: ACgBeo0xJAevu3oOBLV1XUlmV6K65aa5uJko00HIKfJTDUFcIXOLmwcE
        WMLLnb6h+kWQAbG9laNrRa3hbb92zUuzaTkQD6U=
X-Google-Smtp-Source: AA6agR6R+c+zvkklZJIQ0xS1ZCFRCi0sfJ+kEmcx3keEL6CrOisyEC0Nm6Qyq3b+LkLXa6HqW/9jY2kZ+fhLjaHCb6Q=
X-Received: by 2002:a05:6512:239f:b0:491:cd95:f67d with SMTP id
 c31-20020a056512239f00b00491cd95f67dmr1024193lfv.184.1660834402057; Thu, 18
 Aug 2022 07:53:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:ad06:0:0:0:0:0 with HTTP; Thu, 18 Aug 2022 07:53:21
 -0700 (PDT)
Reply-To: golsonfinancial@gmail.com
From:   OLSON FINANCIAL GROUP <kcpools16@gmail.com>
Date:   Thu, 18 Aug 2022 07:53:21 -0700
Message-ID: <CAM8gsMfqRsyrEJJ3FcJV0itgxh=0JX_c1wz8dz8pHOizRJPChg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

--=20
Hallo guten Tag,
Ben=C3=B6tigen Sie dringend einen Kredit f=C3=BCr den Hauskauf? oder ben=C3=
=B6tigen
Sie ein Gesch=C3=A4fts- oder Privatdarlehen, um zu investieren? ein neues
Gesch=C3=A4ft er=C3=B6ffnen, Rechnungen bezahlen? Und Sie zahlen uns
Installationen zur=C3=BCck? Wir sind ein zertifiziertes Finanzunternehmen.
Wir bieten Privatpersonen und Unternehmen Kredite an. Zu einem sehr
niedrigen Zinssatz von 2%. F=C3=BCr weitere Informationen
mailen Sie uns an: golsonfinancial@gmail.com........
