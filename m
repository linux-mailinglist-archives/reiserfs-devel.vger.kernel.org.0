Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABB0D53AD4F
	for <lists+reiserfs-devel@lfdr.de>; Wed,  1 Jun 2022 21:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbiFATbM (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 1 Jun 2022 15:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbiFATbK (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 1 Jun 2022 15:31:10 -0400
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A23B617CE40
        for <reiserfs-devel@vger.kernel.org>; Wed,  1 Jun 2022 12:28:46 -0700 (PDT)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-d39f741ba0so3973132fac.13
        for <reiserfs-devel@vger.kernel.org>; Wed, 01 Jun 2022 12:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=Gk4nfCem3ECRa7Gml0J0mN/3RZoOAdfGaQAqyHPKtiI=;
        b=HLFKV03IvnCnmYNulbqEkPjTK3riUL87h2wHAPtiQ15M9iY6Q8e992KMQxJwLdk6f+
         yc6asPWVRklcz8AY8oqwyi19SO9Z3FXfSKl8KIcHwdn2diZ16fcVN3Noj9XYHhxCnXOp
         L86c6aBumcYcai1ti0jT0anzEO5LqUJSpP7KiFxQXIe3O9qnWY7viJfSABa1ly9ubc5O
         7xqU4M/fQQEbpLLu8u6cCuAo0xRfp/5LoTJYIMP5ne/O4VXGwgI3hKlV02ue3fdzqvYA
         6IABKhDngCz8ZKTuipfv5GZ/7HEqJFbM8x/u/85qQFiKTPs+Mb3XRU84XoMrlsTu1Zr+
         PsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=Gk4nfCem3ECRa7Gml0J0mN/3RZoOAdfGaQAqyHPKtiI=;
        b=P1aJK1KBLyEipDh3Ug1whFB6Koyijx0kho+V4hZaRpTREL63y6yW5Cb25E1Hc5d91b
         TLn3jKpaZAlAt+REgeINivm2FjkX0pfptJEXpsN9rKaDIESJrT4nTFvT2axPucgSAmgi
         NVhBONLiNDolwSAAnci7UNH9Dc9fVT6t5sm5h/sbVeM2886IOKbAdT5nOSsrxObSy2nT
         F+i3V/MEEQochh9A+HRZn8peT8qoQP/JiRf5UlgvNJ73rJ7CnBWXqDetV4m5PAjlYskm
         hXUDH7h9g++AVlP4VpPBJOM8D0YZxlitRtizI4j/iExWnyRg4VWUOaBSCAfNm1eyfI7W
         ZgAw==
X-Gm-Message-State: AOAM532WfpUoSCH6zlQnPeC44ggJOEVVEvlWC1xJ74ywzJcWQTDfFSS7
        xqx48kQp2Vf/X9uL4gg8TgQqCt6eiYqDZJlvI8Y=
X-Google-Smtp-Source: ABdhPJzieEZsH3sz7p7h/CGCrygaKC3twss2VqEDgMRTw52PjXyF0yZxDsfC/Wcw+CTWK4gcBihtpQQBph7O0cnThRw=
X-Received: by 2002:a05:6870:308:b0:f1:ddfe:8ac5 with SMTP id
 m8-20020a056870030800b000f1ddfe8ac5mr16670934oaf.237.1654111051378; Wed, 01
 Jun 2022 12:17:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:3601:b0:a3:2139:251d with HTTP; Wed, 1 Jun 2022
 12:17:30 -0700 (PDT)
Reply-To: johnwinery@online.ee
From:   johnwinery <alicejohnson8974@gmail.com>
Date:   Wed, 1 Jun 2022 12:17:30 -0700
Message-ID: <CAFqHCSSUC0MpbjYK8d-GCxOG4b6Qbk2uH3+xQDZte6cPBsxLGA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Greeting ,I had written an earlier mail to you but without response
