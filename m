Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C64F8707D59
	for <lists+reiserfs-devel@lfdr.de>; Thu, 18 May 2023 11:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230337AbjERJzH (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 18 May 2023 05:55:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230351AbjERJzF (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 18 May 2023 05:55:05 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F7B8212B
        for <reiserfs-devel@vger.kernel.org>; Thu, 18 May 2023 02:54:54 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2ac836f4447so18687891fa.2
        for <reiserfs-devel@vger.kernel.org>; Thu, 18 May 2023 02:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684403693; x=1686995693;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4iLMYpmfb3z/2deYzUXPTLD8r7dOEl24VshhI2JWgLI=;
        b=n1Icscrm334IZLvHzzRavc3bHWLZN2JimwZvDOJFdjGJvHHQ5vGZAM1zKXZn7Hmv47
         oybJDA4w4wvuTj/VqYGECs5XI0/tXrWSCOZ+aO1J5rgjwoIHjnqsRul53NlKbsjtgYxx
         or0vnyKvs2zLSIeO/43ZAGG/t9Avz2UFvMDfozMN1VIek/gr3E1Aaiiqj0V6midruiLN
         wEHC90/KMqSsfTLJSan/vd7cJktjUrmAFhTXWxmWU8RTeB4VUaEP2kwBtiS+NypbXFcM
         X8nuwf4LAPPu3lMyVjQ9maJqpBcH2PcP8cQg/lrsll1Y91LpeLZqzSCWkdxJkZvmE1cW
         xtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684403693; x=1686995693;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4iLMYpmfb3z/2deYzUXPTLD8r7dOEl24VshhI2JWgLI=;
        b=EiGMei+3KmOHrIWrnkraOFFRf+1wZdHWutv3opXnwZUwwEwI78NZxsAsQtzRsjoF+u
         cauQuzC5QQ9kHxHF//Fwo8zLIr9mvlvWV6N/2DojNmjg7nG5eItlQqKMtsZyJFd174WO
         lQfNt87IPBm5XuPhRQFOlmma7eZ6pjMbAMd+yDiEtN1Eb8+rTWnLw+qeohaIkG8pP9Re
         GJ8BvmK30txoxGs5GZC8h5l2BKwUj/7113ZnGUl+0IOgbbgk/kRLWvtGvBZtMM56uJiG
         +IuLDGC2cTCRAcnO6I1ZK+vr82ulsEBmZaauGpDCbvyg4W1i7kJ+WR0JSA4837D3VzTA
         UdZQ==
X-Gm-Message-State: AC+VfDwXrDvBp4H3Jz8Q2ByWJ/HjAHBLc2EN+YPhP5EgnzsKlPaJNUMx
        RKZ3v7TKOkUubj9JRCU+Do+Gv/mADJ5z5vlQm/E=
X-Google-Smtp-Source: ACHHUZ7VeyZz8WXYU3DNKIRP0BzoWPIhs/r4K4g1Yfe8OswZ8WOD1mjS773uiQrqIsLqp/XqwziR/XgD+czpWSkYnDY=
X-Received: by 2002:a2e:91cc:0:b0:2ac:7a39:9feb with SMTP id
 u12-20020a2e91cc000000b002ac7a399febmr11650322ljg.53.1684403692673; Thu, 18
 May 2023 02:54:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6022:499:b0:3b:c029:837b with HTTP; Thu, 18 May 2023
 02:54:52 -0700 (PDT)
Reply-To: contact.ninacoulibaly@inbox.eu
From:   nina coulibaly <ninacoulibaly021@gmail.com>
Date:   Thu, 18 May 2023 02:54:52 -0700
Message-ID: <CAJaQ5HtpeTohyomoRddLG5kd91X9XZVS1pk9_yv-Zk=i81JDwA@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Dear,

Please grant me the permission to share important discussion with
you.I am looking forward to hearing from you at your earliest
convenience.

Best Regards.

Mrs Nina Coulibaly
