Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2D8B770DC3
	for <lists+reiserfs-devel@lfdr.de>; Sat,  5 Aug 2023 06:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbjHEEpE (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sat, 5 Aug 2023 00:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjHEEpD (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sat, 5 Aug 2023 00:45:03 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 924F0468C
        for <reiserfs-devel@vger.kernel.org>; Fri,  4 Aug 2023 21:45:01 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-56cb1e602e7so1907091eaf.1
        for <reiserfs-devel@vger.kernel.org>; Fri, 04 Aug 2023 21:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691210701; x=1691815501;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fyaf0OHfvWgaqfRiwRufcy49gz6rXRNyNLf1qH0Ffk0=;
        b=T/aXOIq/utrSiOElnlFlr7Qkeq5SBNHaVkxIBfEkJ85HXZCclusc1IVAJkmoVv7V3Q
         +ef4HAf20c3PaBe5UIruZ8CIfQqri+rtpiqRnpwRYk8QPPeqlIi7OmyujoH9pZw0SJEp
         ly6zJepLO5i9WRimG1Hyj1MGfDTNoKTAf/xfQzWzr0u+5wGzgeBCjBK+gINv7xfZ1PB5
         rOPRqVIhDjBiRPePLaOThCGi5xW3GqYqImoI92iVWpwCUrx/cBakeRndtdksSvg8e5lQ
         cdu/3BSyxjBh06ROdWnWETsLHcSRUBOJ3J5IA+BpwUvX53XEtCiq1sOdiBFeqUWsx/AY
         Iteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691210701; x=1691815501;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fyaf0OHfvWgaqfRiwRufcy49gz6rXRNyNLf1qH0Ffk0=;
        b=Ogk8z9huyJEWsrYvb9DGCQmWUwug6kzol97HgcFQPhMDQCVmSR5Qdts1tWD+KR3zUz
         37xP1tVyorSjbiqbX7A1So+nxjH9DsW1ic8UxbXiZ0rL2/iQZfcwVMaLC5kg2G+8bBTm
         Zd/xO4h4A0Ohw6Uz/ECVP7OUr2i0ECIyhGXEYPmNoN+OGF0EDqFeMZBWC8L6iWLJZAYM
         XI7bv+gffeP2L6KjPAVAeJgxs6whgci937loqlBrpLJrZ5nOJ04LbKkVxl4Co1wVnJol
         oqKiM2zoz9IlS3mPRZtvO5FzOsOGSWBrH6A5qrdeI5X36euOPPW7ap4tWRjbn0Spsycg
         pzOA==
X-Gm-Message-State: AOJu0Yweb1p0pRPDlbU3rrmdc3l2q3QYKNnDUaioWROH5C/DjQUpv+36
        ml8tQNkQsoM8fpgI++m+VChQzNLZQqFGrmpQvRo=
X-Google-Smtp-Source: AGHT+IG/T1nSaX6nNUzQnnNr6fNWK5MoHT0BG5kftpEnDGISWV3IJuMM7KqoUXFPgZgP3AUdgoKgx/DAU1TqE41lsjI=
X-Received: by 2002:a4a:341e:0:b0:56c:d297:164c with SMTP id
 b30-20020a4a341e000000b0056cd297164cmr3893453ooa.4.1691210700789; Fri, 04 Aug
 2023 21:45:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a8a:1054:0:b0:4ea:3880:2f10 with HTTP; Fri, 4 Aug 2023
 21:45:00 -0700 (PDT)
Reply-To: bintu37999@gmail.com
From:   BINTU FELICIA <gsselinawilliams@gmail.com>
Date:   Sat, 5 Aug 2023 05:45:00 +0100
Message-ID: <CAE4dffDkejb2abE=otrVZdtCskK2APHmYg-VaRG3Z94zDZLP8g@mail.gmail.com>
Subject: HELLO...,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

How are you today? I hope you are fine. My name is Miss
Bintu Felicia . l am single looking for honest and nice
person whom i can partner with . I don't care about
your color, ethnicity, Status or Sex. Upon your reply to
this mail I will tell you more about myself and send you
more of my picture .I am sending you this beautiful mail
with a wish for much happiness
