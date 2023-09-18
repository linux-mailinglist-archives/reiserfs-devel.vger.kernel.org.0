Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43A597A4C12
	for <lists+reiserfs-devel@lfdr.de>; Mon, 18 Sep 2023 17:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234623AbjIRPZu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 18 Sep 2023 11:25:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbjIRPZp (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 18 Sep 2023 11:25:45 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 385E6129
        for <reiserfs-devel@vger.kernel.org>; Mon, 18 Sep 2023 08:23:00 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-412195b1e9aso31821011cf.2
        for <reiserfs-devel@vger.kernel.org>; Mon, 18 Sep 2023 08:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695050455; x=1695655255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HL0rujHXVlNw13Fb7ZtkGEh5b6OFxFiF646QN9UA4CU=;
        b=EZbKkI3K2PtgfUZD4EbxZKR0cwXHFXsrcorfeiBpXVQcUdXGExzabfUZ/cmNtlNZ9W
         7Xr63D8T4N+tbrTkFBtXtsZMXcG5MR+YobYh0r0BcuOb5it4ORO8XmFMGlnzchOb92tj
         GCxmQaPIC52PuT5Sqz3xfeALUIKJZbKaCOvVYBQNg1G1sHQCeKpjDsVYSEyCbGak42Fw
         3i+9I9B8Tm0qJFRZG3dIcAEizUb444iMAVnJyAqspJNTx2kMtlscUqNu33kylILfrRfD
         UCzKwdL1quybpoi7tpLoLSLiehjq65rQf7FEAB4ldEIzK3g3I9dJMJKQrsJ2KSjNzr00
         cmlA==
X-Gm-Message-State: AOJu0YyN6VS+4eIthwP7d83u1nxJItyCEwozSAhNuRp5YFPMuZ25kdnB
        XM7Rdfecg+piPZZMsoJl83RybAgCF1EZBQ==
X-Google-Smtp-Source: AGHT+IHlgHyonkVIbN2RLxl7EfujJT1KaNIw8KxqmhRh2Igx22EQgGBI3aCtTLvwg6KZKqIkON+Blg==
X-Received: by 2002:a05:6358:91a6:b0:141:3a1:1877 with SMTP id j38-20020a05635891a600b0014103a11877mr6410575rwa.14.1695049097829;
        Mon, 18 Sep 2023 07:58:17 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id r82-20020a815d55000000b0059b2be24f88sm2581362ywb.143.2023.09.18.07.58.17
        for <reiserfs-devel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 07:58:17 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-59be6bcf408so45703287b3.2
        for <reiserfs-devel@vger.kernel.org>; Mon, 18 Sep 2023 07:58:17 -0700 (PDT)
X-Received: by 2002:a0d:ee83:0:b0:573:bb84:737c with SMTP id
 x125-20020a0dee83000000b00573bb84737cmr9358141ywe.26.1695049097356; Mon, 18
 Sep 2023 07:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230910232640.113938-1-peter@n8pjl.ca> <20230918125744.4342-1-peter@n8pjl.ca>
 <20230918132614.zmmuc72purc2psik@quack3>
In-Reply-To: <20230918132614.zmmuc72purc2psik@quack3>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 Sep 2023 16:58:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWzN0Gs2FTQDFeBLz2498dv3ZYCBL2xOvL5YdHAveaH9g@mail.gmail.com>
Message-ID: <CAMuHMdWzN0Gs2FTQDFeBLz2498dv3ZYCBL2xOvL5YdHAveaH9g@mail.gmail.com>
Subject: Re: [PATCH RESEND] um: Remove CONFIG_REISERFS_FS from defconfig
To:     Jan Kara <jack@suse.cz>
Cc:     Peter Lafreniere <peter@n8pjl.ca>, linux-um@lists.infradead.org,
        richard@nod.at, anton.ivanov@cambridgegreys.com,
        johannes@sipsolutions.net, reiserfs-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hi Jan,

On Mon, Sep 18, 2023 at 3:26 PM Jan Kara <jack@suse.cz> wrote:
> On Mon 18-09-23 12:58:26, Peter Lafreniere wrote:
> > ReiserFS has been deprecated for a year and a half, yet is still built
> > as part of a defconfig UML kernel.
> >
> > According to commit eb103a51640e ("reiserfs: Deprecate reiserfs"), the
> > filesystem is slated to be removed in 2025. Remove it from the defconfig
> > profile now, as part of its deprecation process.
> >
> > Signed-off-by: Peter Lafreniere <peter@n8pjl.ca>
>
> Makes sense but I've noticed there are many more architectures that define
> CONFIG_REISERFS_FS in their defconfig (sh, powerpc, mips, m68k, ia64, arm,
> alpha). So perhaps we should do this for all of them when we are at it?

The policy for the m68k defconfigs is to enable all available exotic
file systems as modules, so support for them is available when needed.

Please let me know why this should be changed, as long as ReiserFS is
still available in the upstream kernel.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
