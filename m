Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D35A534509
	for <lists+reiserfs-devel@lfdr.de>; Wed, 25 May 2022 22:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245702AbiEYUhP (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 25 May 2022 16:37:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237663AbiEYUhO (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 25 May 2022 16:37:14 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F38F57B18
        for <reiserfs-devel@vger.kernel.org>; Wed, 25 May 2022 13:37:12 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id gi33so35438123ejc.3
        for <reiserfs-devel@vger.kernel.org>; Wed, 25 May 2022 13:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=jF4MxsPSKKSAh34A0y7fWqFeFSCCDQ9NCjS0um7aELU=;
        b=S59PrzgIaU37CxQa5QDcQGpaL0Rzwj8fbrzyvHDTdI/zVjD+h3O5uerBgoRR+sXNw3
         qhCrs5JwAcubuPWUwkk9DCPAOyvIv5jksCWSiDH7GDJ9pyoPv5+d4HjAzFSQsd4UCLtr
         R8SbSioNR0bFddVMlg5P0dhnF5wP1r+k1jeFw++IruD70geGoHHYDl/3/Zf+a7SyLb0T
         ZJ18x2Yb2ZY64UPFu6LT6BIJvFBj4V4tCsXz+7ebbRKD/yc1BwFJSapftTDqfEsPHo+r
         zjjurOw+6I7oYnmxL5S/qgGlk8rpW0wzo8wgv+lh7kJ9QsByvjIhgOmnP1YrtGnedLnL
         bdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=jF4MxsPSKKSAh34A0y7fWqFeFSCCDQ9NCjS0um7aELU=;
        b=nla0xbtVPC+R46Dj0x+k5n8mIhDMvSxYBsvyahSxZb+DR0LLzQFjIGe9brxRkNzRuf
         peUi/N7AUEpKK5UbvBqqP4ucxfb/Di6d0V48s4e7dyxOupaCaNMFxhTB1pPCcu9FUkSM
         HxGIKR060A590rQp+18JcogR/i7TSIxHf2uil6g+4pnixmiKtlbgWz1++xxK9CfFgfR3
         AfefQFG9vYsCLkF1Nv+tmXYKSxE61AT2DkqnBsCkDKrLlJC/fJkvgiHGOWlxfr/fhrv4
         OpWS9p1xg2c/KqLF5bpf8IBw9KHi+eKMN9RdQ3s7T/1ID0WtLNvl3oGUtKOJq6I00X/h
         N5rg==
X-Gm-Message-State: AOAM532xzI1yaEEcP0xpRc4h9SIVdMCaShMe+9SgfZMixswPvMbiT8Lz
        iRCFhQcWbqWpnGmtNncdVhWvVZtNRoUWpoAoUBA=
X-Google-Smtp-Source: ABdhPJwLOhrnrjaQZ7ofyYnt8MrQPPjRnFW1WTi0KNijnhLmR/6GbhP89VgDEWEfpoos0F7KDaSGgVNf5lW4eJaTOEs=
X-Received: by 2002:a17:906:58d2:b0:6fd:daa7:3a6e with SMTP id
 e18-20020a17090658d200b006fddaa73a6emr30751345ejs.0.1653511030776; Wed, 25
 May 2022 13:37:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab4:a26b:0:0:0:0:0 with HTTP; Wed, 25 May 2022 13:37:10
 -0700 (PDT)
From:   Luisa Donstin <luisadonstin@gmail.com>
Date:   Wed, 25 May 2022 22:37:10 +0200
Message-ID: <CA+QBM2qCn-XAXdqKjsj-oqMGhfF2BxirhnFQrj_cPaViXZr0KA@mail.gmail.com>
Subject: Bitte kontaktaufnahme Erforderlich !!! Please Contact Required !!!
To:     contact@firstdiamondbk.com
Cc:     info@firstdiamondbk.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Guten Tag,

Ich habe mich nur gefragt, ob Sie meine vorherige E-Mail bekommen

haben ?

Ich habe versucht, Sie per E-Mail zu erreichen.

Kommen Sie bitte schnell zu mir zur=C3=BCck, es ist sehr wichtig.

Danke

Luisa Donstin

luisadonstin@gmail.com









----------------------------------




Good Afternoon,

I was just wondering if you got my Previous E-mail
have ?

I tried to reach you by E-mail.

Please come back to me quickly, it is very Important.

Thanks

Luisa Donstin

luisadonstin@gmail.com
