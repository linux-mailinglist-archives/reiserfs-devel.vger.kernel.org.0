Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCD4A34F17B
	for <lists+reiserfs-devel@lfdr.de>; Tue, 30 Mar 2021 21:12:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232973AbhC3TMB (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 30 Mar 2021 15:12:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232975AbhC3TLy (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 30 Mar 2021 15:11:54 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADB9EC061574
        for <reiserfs-devel@vger.kernel.org>; Tue, 30 Mar 2021 12:11:53 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id u4so21146158ljo.6
        for <reiserfs-devel@vger.kernel.org>; Tue, 30 Mar 2021 12:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=c/bM2iTwwwhJspfDda/Rzv9WOY2uDwV5qgFRj7WODxE=;
        b=Q3KQ4JzeKIfYq8DXPSFEGixL91QO3tDtVgLl06WDChYzTfIhnhYczrTfYvdtEhDOic
         Jx0Qzs0yQTTfJHCjU2A11t3r9VVh7Lc827znaJ+tFlzNuF3ntoMt9Rwq/uSP+TT0fM3S
         8h1S6c0C62X6Go61D6Tta4mH7WFMExAifVr/TGSI3m2MowO+p8X7CtPySyrb9WdVIYzH
         aPh3wDv/fxwI0X+StN6DLvP4zCwjSLN5ZOeM3itfNFrEFtASM3T5PgSeijbEdrLdaGB+
         yevTJptPX9ylSopB3JDwPsr2VeAt71wfRS15/fsWUF4yV5ZmUu2w+GNZuX3NJYEaUhS5
         vrXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=c/bM2iTwwwhJspfDda/Rzv9WOY2uDwV5qgFRj7WODxE=;
        b=rdHT1IZYf8wSwljT2o44iVatkDghG9toH7DUE0KZuA5EjOo0zV14SOtmeU6sZgLKO9
         zLh5C/CTCY9x4uqQ3U1sDxS4TWbAyHnQKMr38rIY3z40SOU9O3/Lj42OUbDSxmnC4OOd
         KQO+u6ScUhg8cc9BVfgBdgyWF/oVZgXSbRKa/RTBvJZxTmiP5H7yyaKc8iuIOr0Bvz6j
         2pPMjQAzZyAkY2YopWEhUNPpHwPGNf4xyXbNuy2hw6r+DsQzGagQ7N94amOWBUQvTorP
         5HRc+01DpTf/hJDd18GwHG3Wkz13s0FH5moIslQUc9jFvM1fo1+YFg3uoV13I8V4murJ
         b94g==
X-Gm-Message-State: AOAM5337SkfB5zmLpJW3w8nSlVULpqsFjZBVnk0D9byJn8w2T9csDpUz
        DfkGeD/BijM03QKseW+5/pv6mfIJqxHNPaQ1gpA=
X-Google-Smtp-Source: ABdhPJyvu4FyMswAj723a6ppcZ6rPkX9sbgzf9qQtFlAfb792nXXmC4hgzOdOIM1sYKyuuZfEhTKuzYSV14Ya7axIjY=
X-Received: by 2002:a2e:5c03:: with SMTP id q3mr22574455ljb.68.1617131511563;
 Tue, 30 Mar 2021 12:11:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aa6:c0c6:0:b029:c7:cbe0:ec00 with HTTP; Tue, 30 Mar 2021
 12:11:50 -0700 (PDT)
Reply-To: xinghien080@gmail.com
From:   Frau Xing Hien <vidalvaime808@gmail.com>
Date:   Tue, 30 Mar 2021 13:11:50 -0600
Message-ID: <CACXvTzY-hV3kPdoxAj1vfmKtMUfyg7jxctmghyUbnPZMV90jgg@mail.gmail.com>
Subject: =?UTF-8?Q?Gesch=C3=A4ftsvorschlag?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

--=20
Guten Tag, mein Name ist Frau Xing Hien Ich bin Banker, Direktor f=C3=BCr
Kredit und Marketing. Wing Hang Bank, Hongkong, Wing Hang Bank Bank
Center, 24 Des Voeux Road Central, Hongkong. Ich habe einige Mittel,
die ich habe Ich m=C3=B6chte das Land verlassen. Ich brauche einen guten
Partner, dem ich vertrauen kann. Es ist risikofrei und legal. Antworte
darauf

E-Mail: xinghien080@gmail.com

Frau Xing Hien
