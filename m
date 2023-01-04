Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC3665D3F0
	for <lists+reiserfs-devel@lfdr.de>; Wed,  4 Jan 2023 14:15:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239344AbjADNPC (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 4 Jan 2023 08:15:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239356AbjADNOp (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 4 Jan 2023 08:14:45 -0500
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87EBC3CABD
        for <reiserfs-devel@vger.kernel.org>; Wed,  4 Jan 2023 05:13:03 -0800 (PST)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-150debe2b7cso4060330fac.0
        for <reiserfs-devel@vger.kernel.org>; Wed, 04 Jan 2023 05:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2m/uNsCm/OsAUZxAnJOSdXXDa9Gh4wg88n4VPL2lMU=;
        b=lCgU019qWlB6hc5H8dIPyQQQlSDDv4nOSqdCGEm7oGvRPZIUsDzDb+jIsy5XJY0lqa
         NVZ3rPCxoCBQN+ZB0g8WtTnLObQUirCGXiqBTwyW8lojaLPj/XKYHs7+7kpPgkK/Xyh3
         mBoWvUhKe5KAX5Iiq6RX5nEXTqx5mHZnYwGSAMiNFyhgTnzp5ms688RTQCngK5IOgmD1
         wZm/uSF8C6aphgRs1oLkjeoKbzDL6tdMbOEnrOEyKXW+Dk5Zk7cGuJHQyiiDfe0BnhbM
         hy2fLTP7y4pga9NskOGhWsRDRJ+ajoAxeUxrq+SMgu5hDrYjhyn0DBWUTnP9hOjVJAjs
         zIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2m/uNsCm/OsAUZxAnJOSdXXDa9Gh4wg88n4VPL2lMU=;
        b=7t7ebvckKfChGgIVl0KYVe5MYgvOV6mAyNhJauH4ZLiLmy5HqOzOULRq463GMJJLWt
         zlRl/TyUQE/Gvo0Zpg4Eyyyw0qvdmXPOmLaBHAXgMMZhO5bHSFbWQm9dQN8hfvuuKRx8
         k+8tbfNHF4noKMjA3H8zj58njUmNUDHjuO6XhVSfgzikMkTyh8jl/gbSTgsYutwCE5P7
         QdQsGqP74OANuEpMXVnueTLfWexMUmsWbeskD7d6A4yfEbeta7SLuljNb4d5Yd7Pewbc
         W5dkV7wBAt+cECDq7whyHbTLCoxE3ASyRjtLYiudU6IRP/XbnOzQ1ebZx5WgXR5gu6/X
         Xgxg==
X-Gm-Message-State: AFqh2kr1ZYKMdSxPst8SXkCz+BmDskZahct1+Ju+YaQ1q7tf+p6OHkz5
        u4lx1dz7Dh9LREoXXzn/XLMV8UjG6/V6RqUEvkQ=
X-Google-Smtp-Source: AMrXdXu2Le1lxXunQLAXwd/vevpJ+1+n+0Zh5sfIyw8J7/AQp7sqEktVL/FBalayfY/Ogu8RcvMPBR4VcvoXZ6420uU=
X-Received: by 2002:a05:6870:b38a:b0:150:dd30:9b96 with SMTP id
 w10-20020a056870b38a00b00150dd309b96mr395097oap.188.1672837982668; Wed, 04
 Jan 2023 05:13:02 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6358:6584:b0:df:e24f:9756 with HTTP; Wed, 4 Jan 2023
 05:13:01 -0800 (PST)
Reply-To: Gregdenzell9@gmail.com
From:   Greg Denzell <anahenary@gmail.com>
Date:   Wed, 4 Jan 2023 13:13:01 +0000
Message-ID: <CALciK_uuEQom3dK3mdU_vxQS8i+DQ2PkYhCND2iwO1T+9mo6Og@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Seasons Greetings!

This will remind you again that I have not yet received your reply to
my last message to you.
