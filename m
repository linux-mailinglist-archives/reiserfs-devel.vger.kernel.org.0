Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3344391ED
	for <lists+reiserfs-devel@lfdr.de>; Mon, 25 Oct 2021 11:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbhJYJHZ (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 25 Oct 2021 05:07:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbhJYJHY (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 25 Oct 2021 05:07:24 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE421C061745
        for <reiserfs-devel@vger.kernel.org>; Mon, 25 Oct 2021 02:05:02 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id x27-20020a9d459b000000b0055303520cc4so13953139ote.13
        for <reiserfs-devel@vger.kernel.org>; Mon, 25 Oct 2021 02:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=aSggL9zSx0ZM1dzLT5bonr4VkDI90dNyLYDXM7nhOpw=;
        b=fCksRQDPX9GKYzjyX86HjcxJojTVCf+f+omyEqnRhpJlPqnNSqr3lX2y3rQqM0zEi1
         ULF+LZU2oAsD5wVFrbH9gZQ8CbG54vQkhpnqWcDWU4ieQ8V+QODyEKQx6gGtm37Xv72j
         2CEQpFYFCUPHciXkFRQIdISoSLieBhfHkYVWliANt94N+1FBc2gJ07Wqh2qc/azjUT75
         XINMcSFvs2gOMgGqsLQyAti8FNZ3tiKUOvkySMCIsuYZPHpOLy5rMxTWAj6TMoJdwtX2
         w19gRAZmVeyHWFVJSP8BF14/Xgpo9SQfzidCo3DvVT8rGPj947YTdt89CMAjugD++fy+
         ahqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=aSggL9zSx0ZM1dzLT5bonr4VkDI90dNyLYDXM7nhOpw=;
        b=hzzKS4tfUSMX5Jd1vCqBYSjvayFB581Gb/tmqXrr5Xg4RuX/64QBcTKYnDqyWS1X2W
         W67LcyEHMTOdGY3K7cgK/jArBwdly7XRalkhxuhttZSKoZgwbLB5WbrYRhotL24FEAQO
         vyEYPXV9Igpq8LpQDRUhq/C6eLSngo08RIuvQRztO6+IXkAFU+jAc6ex1ad5pqtnHS+q
         9P2HjrRZcfH4L/zMXaJMq8k23wCF7h9YOWPx9WvtMH7wk9rQjv/ibwbsrmJGqRw7yxSQ
         GoUuCvlkJO/yPUVeCXzBEvTa3tfRe1EbEAI5L9nRsdjUyG6Y3btJSALdrcEf1PKglEQ2
         /qpQ==
X-Gm-Message-State: AOAM530fvm74m9zAKxy/jTmL/68Zyx8MjWToEPrcMvSjPtCPqjWPdomX
        4rsJzcwwo5aP/fBC0J6N4jaP0ME3pIrrCGU+fBk=
X-Google-Smtp-Source: ABdhPJxRXOLKZgtTo3SsPV2V2tMhcn8EV7w3GEr0M5WoPSVXccQQpXt+OdfqPBptdFNWUK+QYfwVxNWwZNVVVkmTyfI=
X-Received: by 2002:a9d:220c:: with SMTP id o12mr13045550ota.250.1635152702379;
 Mon, 25 Oct 2021 02:05:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6838:25d8:0:0:0:0 with HTTP; Mon, 25 Oct 2021 02:05:02
 -0700 (PDT)
Reply-To: xiauchanyu@gmail.com
From:   Mrs Xiau Chan Yu <rw9251392@gmail.com>
Date:   Mon, 25 Oct 2021 02:05:02 -0700
Message-ID: <CAHL0NO+rcZHv5ZUZZwZamrRiYpSVpn4ss-t5Lc+q5NF2tEz4ag@mail.gmail.com>
Subject: =?UTF-8?Q?Sch=C3=B6nen_Tag=2E?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

--=20
Sch=C3=B6ner Tag,

Ich bin Xiu Chan Yu, Kredit- und Marketingdirektor von Chong Hin
Bank, Hongkong, Chong Hing Bank Center, 24 Des Voeux Road Central,
Hongkong. Ich habe einen Gesch=C3=A4ftsvorschlag f=C3=BCr 13.991.674 EURO

Alle best=C3=A4tigbaren Dokumente zur Sicherung der Anspr=C3=BCche werden I=
hnen
ausgeh=C3=A4ndigt
vor Ihrer Annahme und sobald ich Ihre R=C3=BCcksendung erhalten habe
Unter der Voraussetzung.

Gr=C3=BC=C3=9Fe
Xiau Chan Yu
