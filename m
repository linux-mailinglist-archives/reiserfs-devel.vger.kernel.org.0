Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08A954BCFBF
	for <lists+reiserfs-devel@lfdr.de>; Sun, 20 Feb 2022 17:19:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230487AbiBTQT7 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sun, 20 Feb 2022 11:19:59 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbiBTQT7 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 20 Feb 2022 11:19:59 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9469A286F9
        for <reiserfs-devel@vger.kernel.org>; Sun, 20 Feb 2022 08:19:37 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id p14so26976671ejf.11
        for <reiserfs-devel@vger.kernel.org>; Sun, 20 Feb 2022 08:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=ymEpgIXl54yuSlZg88NLeYK1RJf0YDtYgXWD/9J1GQ0=;
        b=Fd/D63HqwAzkWfGIXxUjIJ/VzuueSvLZ6+ALqM8Kn4xToEYjDE2wjctsGV3uCvUPZ+
         Rf8TYxiE/ZpW9/YU+KvN/ULEb7tKwI27u/5oK0PqEMMfmlHU+0/LYIo0buE1nMhWXE42
         9YJRzLFtEV+n2D4poXXuOF6Vf4aIeXVe2pxCfcgfzLkCK0fus9AlTvfg/G40NHxftTMA
         6xaaW+sg++yNSMLXvOHF7sZouIWWAB2/du6EtgKiuPHpUVO4E1msN3XbCi8gmo91ctdS
         Ug5y999OxlVsLRaEDXV/yFraEFIynAScaGh/3zzevJa22ggc82sBYr+4/loVY/57Lh33
         sRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=ymEpgIXl54yuSlZg88NLeYK1RJf0YDtYgXWD/9J1GQ0=;
        b=CECwPmGTKXjzvRzsat0cncSQ+Ud2VozPUAmy580V7VP13T7eu7ft5faAlWaNlsQamz
         AItKyqfNh7Ia+iGzzu8C5igp+cOSf8gDQcGyJEBooIu8WTTVyLl7QUV5li7qi0zuIMg0
         GbEecMHY7Z0pIywN0cGNIrNt7ltwrRqupB9T3HwBN8ueVN0nxu9d4PfrOAsUnDpnvKYd
         bFawqMx+VpisY5ZDyCmLezSZzGofPmu8w/p7VfkX2JUX7qnR4fnw1uNOKPRgZ/oJ2EAF
         +JuyfgbdD0YuIJ3lrz+XBBKMdiWsaMz2BtUFJDZXljUwUop7oRp8NtDENNp63hns36V4
         Ru4Q==
X-Gm-Message-State: AOAM532V6fzak8aZG5I/pmGaGPocNM/NvxS/xQ7F+7a/iquBkMqnPSHk
        KisOsgiUaLW4WSbryEOrFyQxJaNrfkULNMS60rI=
X-Google-Smtp-Source: ABdhPJyxuIqcvfwQZjX9rIKuLX5C+WMUQ3Bg2ewFsEISWnER85GEobKcG/qN5gjgu7POHp4Cb09blBJ4XNxtMH2CuYM=
X-Received: by 2002:a17:906:715:b0:6b7:21d5:dd0a with SMTP id
 y21-20020a170906071500b006b721d5dd0amr12792253ejb.500.1645373975639; Sun, 20
 Feb 2022 08:19:35 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a54:38c1:0:0:0:0:0 with HTTP; Sun, 20 Feb 2022 08:19:35
 -0800 (PST)
Reply-To: fatibaro01@yahoo.com
From:   Fatimah Baro <imanosose@gmail.com>
Date:   Sun, 20 Feb 2022 17:19:35 +0100
Message-ID: <CAFEyOE4M3CzrE3HHSFkzTzae=ZdjFbiQD8w9sP_Gu05Zbgh1_g@mail.gmail.com>
Subject: Business invitation
To:     imanosose <imanosose@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.8 required=5.0 tests=ADVANCE_FEE_3_NEW,BAYES_50,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Greetings from Burkina Faso,
Please pardon me if my request offend your person; I need you to stand
as my foreign partner for investment in your country. Please reply
immediately if you are interested, so that I can give you more
information.
Fatimah Baro
