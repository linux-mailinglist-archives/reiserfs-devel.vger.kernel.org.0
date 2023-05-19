Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16A3C709742
	for <lists+reiserfs-devel@lfdr.de>; Fri, 19 May 2023 14:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbjESMeS (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 19 May 2023 08:34:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjESMeR (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 19 May 2023 08:34:17 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D59CCC4
        for <reiserfs-devel@vger.kernel.org>; Fri, 19 May 2023 05:34:16 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3942cd86697so1784170b6e.0
        for <reiserfs-devel@vger.kernel.org>; Fri, 19 May 2023 05:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684499656; x=1687091656;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNVI/u+vlE2iSYnBudk/aivP1bgPbzvxDOvNGrnVEw8=;
        b=PLMpo/zG7fLO9eyYUP//H/rjkert7+HU4G4k67zn9vn268T6cHFuInV8bfMHyGQvbj
         JQ5Njwc3D8+j16cwYn99vcEkySpDo5unUJXGAAki59dtsnx9KowIcZij9q9scmuASBw3
         59ma859LiPTMUVnQJczuYuNwp1UjMImb+u15fk9AwlJk5Zro1QRUvZn2KSsTkZQfO6e7
         HIAfxOUCGmmwNpyBul3yOYho93M471lOZ8rOO1WRIPVfkUE4rPMFkyUNy7Ftz/6OFegS
         PF8pmJkA69gKAEIetUrHrtnDVWiyiGj8642V1B3DUTfpXjqdFfwfYh11pW0zaqAgOjTq
         nRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684499656; x=1687091656;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qNVI/u+vlE2iSYnBudk/aivP1bgPbzvxDOvNGrnVEw8=;
        b=fFpyabU2TrVK9N0K3cRqSsmruA60oP4MXrjpT+LZmpCbNMaJ/EzIb6Woupopl/vFXJ
         CtcHNVJqTZkJgqM4zzv9BPwMFZkqARTQLW55BeJJYO7/WvCNkXmxDO9GGWRqpS3VW7LA
         djZQ2mkPrN0WxbTwFxda/K8ZeHkBOinoBNAmKq/jR4kESCqjBjuChvs8HfB9q9dDFxIw
         IVmPmkhtYWGgF3Ggc0soLDhaSgrPEoY3qCu9+jBEtHEY0SxuzCdw8WUx9re2y92L/Ps9
         dddnR1k0HEb0dphDeDBYUZObxNxkdHXCAhlwUt28Z9Nw+AehSbpDVaZo/fFO0JjQNwZK
         T15Q==
X-Gm-Message-State: AC+VfDxlgLhSkdg8jpg1HW/7MxdEuINN4Pe5duB/OF4onbW0bSEH1iSO
        H6Uxg7aE/Ja7VvK7SED/+2k20f0g1JcOilCSowU=
X-Google-Smtp-Source: ACHHUZ4yZ/8e7njh5L1cmy3K3+IvmD55xT/PFEgymslFoVdan3m8pWd0twyTiKBpfyAM8mEVGYe+LndCtTnOR0FHKn4=
X-Received: by 2002:aca:2b16:0:b0:394:67a1:3e29 with SMTP id
 i22-20020aca2b16000000b0039467a13e29mr913806oik.8.1684499656124; Fri, 19 May
 2023 05:34:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:70cd:b0:122:db4b:7f79 with HTTP; Fri, 19 May 2023
 05:34:15 -0700 (PDT)
Reply-To: ninacoulibaly03@hotmail.com
From:   nina coulibaly <ninacoulibaly.info@gmail.com>
Date:   Fri, 19 May 2023 05:34:15 -0700
Message-ID: <CABAHEt5=G3HJa6trGASbK9U=2df3fGkRetkzXpNPzBGycHAsiA@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Dear,

I am interested to invest with you in your  country with total trust
and I hope you will give me total support, sincerity and commitment.
Please get back to me as soon as possible so that I can give you my
proposed details of funding and others.

Best Regards.

Mrs Nina Coulibaly
