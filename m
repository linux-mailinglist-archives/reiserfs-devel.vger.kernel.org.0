Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86E8F568F0B
	for <lists+reiserfs-devel@lfdr.de>; Wed,  6 Jul 2022 18:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233541AbiGFQZm (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 6 Jul 2022 12:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232849AbiGFQZl (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 6 Jul 2022 12:25:41 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8719C255A9
        for <reiserfs-devel@vger.kernel.org>; Wed,  6 Jul 2022 09:25:40 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id q18-20020a9d7c92000000b00616b27cda7cso12153435otn.9
        for <reiserfs-devel@vger.kernel.org>; Wed, 06 Jul 2022 09:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Uk0kx353H+gGEfDDNFmV1k9XciWZTV5g6S3ovbgNaYc=;
        b=gQqyK8e6UjlfcdDaTwuapyo5u6WCZfyOyUo3o+rhjn0y6o6twgaREpXrfDzmOzwGI4
         Xf5d+/XrpNxcXy2P+S6Arj4mikQrOs7tn8Zi0G2PfPlx9DQA87CxYpyOLLtznadJxTdi
         YU7sooZaHsJFupUvH9P8JYZr92v53Ewf8CO0k3ftFj8+aClkoUt3Yeir2cznint1XJiZ
         4cnnfCCVb7Hw+AuxNnLfsLhkSiPepj+3DXTkepicubsvvsJ96h6vgKMiBtxHx7xscJfy
         hYzHaxW5ZBme1j+WHTF16ek8bjQKD3UIMwwyTBOCWbSiEqVVtQB8nsIb5WVv5H9A4LNz
         CKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=Uk0kx353H+gGEfDDNFmV1k9XciWZTV5g6S3ovbgNaYc=;
        b=npgOrYBnwvAMfojXZI50XNQ1Sl/lrF0rcT6OIJwP8kstdi8LtCWVrapKN1E9/3u+KA
         jP3jLfObEE7Ncsf3PnOW1gUKQQei70YMIWQVdad2R4QLUifxNImbF5mxok8isuY9updN
         ZQDg9y/VkjJVDed1JGhiZHuIlRzHi0dO5yBx58bd8kVoLGhePIIPzZPhRDmAp7joFa2u
         Gmfw9KenbZbPDE+LzLcwhJYjAUU4jn68fq8vy0xOdUL+f6Lwn2v6ifBagznTzAy1WuYy
         JiHaYjjVvG7oInCx5BbhGHhtF6RD/oLa3ICggYYqN+MeZ0v8vSNzf09YtMZsdDpllwgZ
         MZZQ==
X-Gm-Message-State: AJIora87RWAzk3bBkC9cjNH0hLEoNvvAp3tID9RSEmBRiIOo7HDtwDOq
        xr4T9FFmXU9Fvv0feHQnw4DDUaeo6dUGJhQZMus=
X-Google-Smtp-Source: AGRyM1uBbeke8wh9mfu4ZJ+5+4KGZ7yZiqEh677cojeZ6bpzgdiE8hjHgHdURg0ZRw4xgz6IWLD+HWiH2GsizApoY9E=
X-Received: by 2002:a05:6830:1d5b:b0:616:de98:2556 with SMTP id
 p27-20020a0568301d5b00b00616de982556mr18845241oth.367.1657124739940; Wed, 06
 Jul 2022 09:25:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:4545:0:0:0:0:0 with HTTP; Wed, 6 Jul 2022 09:25:39 -0700 (PDT)
Reply-To: sgtkaylla202@gmail.com
From:   Kayla Manthey <avrielharry73@gmail.com>
Date:   Wed, 6 Jul 2022 16:25:39 +0000
Message-ID: <CAFSKFDY94cW50tP6DDz2oHbhf0ni4DDv1hxhbaqXPu50CZ_Xug@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=4.2 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

LS0gDQrQl9C00YDQsNCy0L4g0LTRgNCw0LPQsA0K0JLQtSDQvNC+0LvQsNC8LCDQtNCw0LvQuCDR
mNCwINC00L7QsdC40LLRgtC1INC80L7RmNCw0YLQsCDQv9GA0LXRgtGF0L7QtNC90LAg0L/QvtGA
0LDQutCwLCDQstC4INCx0LvQsNCz0L7QtNCw0YDQsNC8Lg0K
