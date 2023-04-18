Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0665E6E5EC0
	for <lists+reiserfs-devel@lfdr.de>; Tue, 18 Apr 2023 12:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbjDRK3V (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 18 Apr 2023 06:29:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbjDRK3V (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 18 Apr 2023 06:29:21 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ACBD10E7
        for <reiserfs-devel@vger.kernel.org>; Tue, 18 Apr 2023 03:29:20 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id e8so11555135ljn.2
        for <reiserfs-devel@vger.kernel.org>; Tue, 18 Apr 2023 03:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681813758; x=1684405758;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4iLMYpmfb3z/2deYzUXPTLD8r7dOEl24VshhI2JWgLI=;
        b=QesTE5niCy2bZVPdcFwQjSZMFVsVJNFpiMK/5f8fszXz3U/SmMj/os929YX8B4QgkV
         7X+pPEKI3XjY4yV8NVTGDqq8zOf6u1xY6Qdx6TzV4eGuJmR6iDajZSsvDtQHxRv//Idn
         HUtrI6vicMRXkEc3SVLVXzzQqGPKmCUSV279D9DUVXw06HhNGdjRwvS58rjuKmnY8mh/
         /GwQuzWtAtWrdnBhP1hs99q7LDw1cLPSHvTjoGGhJe53JkiZaBhMa2Jo3phoJX8DGWCB
         sA31+r9KWA/UJ5fzKUw/aTXVKO0MwN4CGptatqtux/A5NfR8zPQCBUc4Iluoi/l08tXZ
         VUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681813758; x=1684405758;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4iLMYpmfb3z/2deYzUXPTLD8r7dOEl24VshhI2JWgLI=;
        b=THCYoWkMDQ4nEGQCgu5Q2ZRjiXSTE83M1wqh/aWWOfEYmptva2Uzf2LVzNtHYbMeUS
         wDFUlzGrUNbpP6YJ4qBqo3+4OCkQJ7F2VfuQQ7VCHtsSL9zMw8ADTBGSBqovD5CeZXJn
         uC1WNXvgzDEm+XkbRJkEMU/sg+II2WOYdaF7v6o2tJui2OB2S9KOb71p1K/OE4/0tXxM
         fCkXbzrbW1lu+tPvBxNr9nSufjUOUyuMGvoyfzygBlq8oE8cno+d/M6hzfmu/9YrOF4J
         3YncvUKvq0yH4gHOVJaODUMYb0/zTE8i/gV2Gicb/6oOWupT+j/ZBsdeWoGjV34lIrqm
         OfOw==
X-Gm-Message-State: AAQBX9cL1vGBI+0gGXMTczfw5h4Xfs5mpg/2p6rss1GnlAy28Vx1tYEL
        Kkf94npI4GYJv0j5ra3HmUKshaz9a9TLtlotG/g=
X-Google-Smtp-Source: AKy350YrNDCg19xOtKpcFeDSV+C3iyxA3z2RzCasVZhONeJBxoqdDfd1GkKKQKSpyVVvHYCVllyR9ArLGxv1ctHvlPM=
X-Received: by 2002:a2e:8655:0:b0:2a8:e430:34d9 with SMTP id
 i21-20020a2e8655000000b002a8e43034d9mr373485ljj.4.1681813758292; Tue, 18 Apr
 2023 03:29:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:919a:0:b0:2a7:69c7:4986 with HTTP; Tue, 18 Apr 2023
 03:29:17 -0700 (PDT)
Reply-To: contact.ninacoulibaly@inbox.eu
From:   nina coulibaly <ninacoulibaly021@gmail.com>
Date:   Tue, 18 Apr 2023 03:29:17 -0700
Message-ID: <CAJaQ5Huw4s7+RmhuCg3q-N8BZMsMMb-TBW58uoyq7kOqkSKqvw@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
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
