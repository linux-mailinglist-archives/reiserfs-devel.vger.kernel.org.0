Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F55023D0B6
	for <lists+reiserfs-devel@lfdr.de>; Wed,  5 Aug 2020 21:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728112AbgHETwW (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 5 Aug 2020 15:52:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728021AbgHETwC (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 5 Aug 2020 15:52:02 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 324BFC06174A
        for <reiserfs-devel@vger.kernel.org>; Wed,  5 Aug 2020 12:52:01 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id h8so24886572lfp.9
        for <reiserfs-devel@vger.kernel.org>; Wed, 05 Aug 2020 12:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ve0FhzqCgA+9QYmNyfddPNVbN293nU7Jwgp7NV82bPU=;
        b=cfHyS0DGB2cq5rPiD149Ll93B7yA7qPiySelNWAaUDOJtAyK3GXSHWgn7uDDGqCk1z
         Z1y9zWpOStGJHpYvR6PONBcDDxMmupVNiQEwvCghfd10X9FTZ347r/LGGFFeBCws4E9w
         mZpASVTSrMpzkz7myHqtqr20fcH5DMBwRTMOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ve0FhzqCgA+9QYmNyfddPNVbN293nU7Jwgp7NV82bPU=;
        b=Xsx5EU/N+26uWZRf7yvpjL9eEIvjXB24xctGM2fPqRMshQ9AtTaZmdJFTm9LQEqNpI
         AY0vu67yLeAavglpfTT/tPrmhBt0nnZPQC3ABDI3ho9Yw3dEIz8auZZqEfWD8gGiiAnB
         JoNumqgwpUIn6Eq5MyoNCyq52pqLpt3hmsmJkTpusWmVVdeRdy8ps+LCnM0yfvQpQdqS
         4XxNxtfbBSUj7/KnngrNzfvlW/JamICi2Kkf8o4rpYigjZCa+tOW2Mee2SiPfq/ta9NF
         QAijgI+30dEYahk4XV4EW6pZAbH7UhSK1U2QLF9EJ7zDy11cnEJK5VldwtAQhSKtfPwA
         wVPw==
X-Gm-Message-State: AOAM530w024wmbQSEvA2ALn82EUP/rWDNZ3rEE8p8OlvTvjLaKE4sLLD
        qD3buU1J4c90pkQOOQhn+vMo4M9qHQo=
X-Google-Smtp-Source: ABdhPJykTdskUmW7Cq3eJRZ49JYbBve2a35+2oWfx3+LWe5YMdVtlyMkLFTkk48xDmpbmXorMQ8AAA==
X-Received: by 2002:a19:7001:: with SMTP id h1mr2326008lfc.40.1596657119039;
        Wed, 05 Aug 2020 12:51:59 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id a2sm1295086ljp.26.2020.08.05.12.51.58
        for <reiserfs-devel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2020 12:51:58 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id m15so24232422lfp.7
        for <reiserfs-devel@vger.kernel.org>; Wed, 05 Aug 2020 12:51:58 -0700 (PDT)
X-Received: by 2002:ac2:522b:: with SMTP id i11mr2316741lfl.30.1596657117734;
 Wed, 05 Aug 2020 12:51:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200728222041.5d88b2e1@Phenom-II-x6.niklas.com>
 <20200728223440.0fd8681e@Phenom-II-x6.niklas.com> <20200805125317.10bf1d34@Phenom-II-x6.niklas.com>
In-Reply-To: <20200805125317.10bf1d34@Phenom-II-x6.niklas.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 5 Aug 2020 12:51:41 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiGsj_R7pspFegPgtT4on1iYk5MmBz8uZZ3338EH3HO+Q@mail.gmail.com>
Message-ID: <CAHk-=wiGsj_R7pspFegPgtT4on1iYk5MmBz8uZZ3338EH3HO+Q@mail.gmail.com>
Subject: Re: PROBLEM: IO lockup on reiserfs FS.
To:     Hgntkwis@vfemail.net
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        reiserfs-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Wed, Aug 5, 2020 at 9:53 AM <Hgntkwis@vfemail.net> wrote:
>
> It's been over 1 week since I sent this into the reiserfs-devel mailing
> list. I'm escalating this as the kernel docs recommend.
> I'm still willing to help debug and test a fix for this problem.

The thing is, you're using an ancient 4.14 kernel, and a filesystem
that isn't really maintained any more. You'll find very few people
interested in trying to debug that combination.

You *might* have more luck with a more modern kernel, but even then
... reiserfs?

              Linus
