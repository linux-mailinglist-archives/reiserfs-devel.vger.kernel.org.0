Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2B27003DC
	for <lists+reiserfs-devel@lfdr.de>; Fri, 12 May 2023 11:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239781AbjELJe4 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 12 May 2023 05:34:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231767AbjELJe4 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 12 May 2023 05:34:56 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E54B4C1F
        for <reiserfs-devel@vger.kernel.org>; Fri, 12 May 2023 02:34:55 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id 41be03b00d2f7-51452556acdso6522296a12.2
        for <reiserfs-devel@vger.kernel.org>; Fri, 12 May 2023 02:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683884094; x=1686476094;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HoV3JkYW+m2YSydsWChxyq1Hq70FVpv6QJ9NnEFQ1pA=;
        b=MxWH8SmIk9pp4GN9X/IEUjhacTCeHdmT5SJAAbXZcFdhuYePZqAeAb9xNu34o2JPno
         dVj1PXMqFeErgzdXolN1nMkPOSNh+siPDlRFuD26PNF+Y4n0Lunh6exVNNhk6oMgEaGI
         O2eONyIYd0uiYmdy/bvdlmwZ7ExbexXxJoz6jODTI6Iypb+mUqOuOP+NtCrk82PPU/Fg
         /F+ayR/zm5RrI6X72rOtGcv/SsaDeZDDrJWXmbje8ElQQNTdrYGfndWwLDVfXLWTvqWz
         QdQiN+KFUAa3OOYqavWIYh0C+sTnMP9GAwQejRP1OKoJfv1a7Olry8I/idZIVYQKcEv+
         VyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683884094; x=1686476094;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HoV3JkYW+m2YSydsWChxyq1Hq70FVpv6QJ9NnEFQ1pA=;
        b=l66RMXrfTyb3cwt3YRi5Wkm2GytGs4IhDAFbgErywRT7JyFlN7KNxJxVgZyo930Mvj
         /goJi6to+nwNj/9SX4N9d6Mx8cml+ThIosS4DVV26T1rVb9yU3aoVnVavUL7KdYhmR75
         1OyaLB3yRxKLYJ2rp0JcV8NA5CCwRLHy0rn030gZOyrw1NHb0H8hGvHlhwGdDzpavjmO
         VkfSZcUThXEKCG+J9tQKq+IWY6BuBLvLfxXgGtIc4vLmFZo8SzYpsYYLF5gqOwm4yCjz
         5OTO9M8R0v3F7d4Ur5JbHwUqFO9Bs7XvnPgpaAvZuLOW9tiK7nTinbrOZszukGmBsgA2
         WuEQ==
X-Gm-Message-State: AC+VfDy022ojTO1wT3xda+d1cvOC7L7ZnD6agXgGxFaqzlSqqvTs8GMp
        gKU6KqTXM6REXZhXV9WidAW+uO5KU8DivgvliCU=
X-Google-Smtp-Source: ACHHUZ6s5LVOHQjyHA8XdKpNSkHcKGUFSA/7x9+0BZGR5M1BbpJkru5iaow6lMv7bcFsTBYi5qRbW8eYhjEOPsBrNU4=
X-Received: by 2002:a17:903:247:b0:1ab:16cd:51a3 with SMTP id
 j7-20020a170903024700b001ab16cd51a3mr32389182plh.10.1683884094573; Fri, 12
 May 2023 02:34:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7300:5351:b0:b2:195f:afcc with HTTP; Fri, 12 May 2023
 02:34:54 -0700 (PDT)
Reply-To: mariamkouame.info@myself.com
From:   Mariam Kouame <mariamkouame007@gmail.com>
Date:   Fri, 12 May 2023 02:34:54 -0700
Message-ID: <CAKQFrOK54XgiaFStJdpRtis9Uq7=1VH+gEOc1TvuTtTS17WYdg@mail.gmail.com>
Subject: from mariam kouame
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
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

Dear,

Please grant me permission to share a very crucial discussion with
you.I am looking forward to hearing from you at your earliest
convenience.

Mrs. Mariam Kouam
