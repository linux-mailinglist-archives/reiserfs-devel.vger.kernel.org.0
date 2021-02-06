Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17D1B311DFA
	for <lists+reiserfs-devel@lfdr.de>; Sat,  6 Feb 2021 15:52:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbhBFOwM (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sat, 6 Feb 2021 09:52:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbhBFOwJ (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sat, 6 Feb 2021 09:52:09 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B3BDC0617A7
        for <reiserfs-devel@vger.kernel.org>; Sat,  6 Feb 2021 06:51:12 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id l12so12928541edt.3
        for <reiserfs-devel@vger.kernel.org>; Sat, 06 Feb 2021 06:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=sY4fgq/DSyThalwU7QX+pWYKs/8sGH7ZznMUn5qQ1EY=;
        b=WrtGTUT0AMDNaEpiMi3AfBgka/5v06W3cfoaRsnLtLYBJLZRhOLKU9JrG4fk7ClicM
         HKD4gTKEhM8Zufj/2V9b/ScABk1fFAFmA3pqM2EQADSRAeil1W/Ac5hwNB/U1+2+ULh9
         ZKP8hPsfcc8D33ql2VVT4T4A1I/GZ8fVEh8KiOHvZSMQpdwubdLk2CtuduMyiUWgcib4
         kq87fCf0bOHPqY5WlrrdIfO965UjVZ8vQVSCaNDDdIxYV7OrBXREw333V4a2I2hleYCG
         MddbUX+BmhLhLP010TkcJR23STW+g5gP7cRajKtYgRYYXGcAa3rJ4KU3/xxRu59sj9vL
         x/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=sY4fgq/DSyThalwU7QX+pWYKs/8sGH7ZznMUn5qQ1EY=;
        b=VWAb8gsQW6NbSXvICerdLkiHUKDwjG4KwB94JYXFhhH2RF3PtN6eeubxtfAkR1fBSI
         x0HScKvs3c/Oda+UP8Vl1+YNy8SoYeZsjzD3brqoTIZHb7ZzE+YeWCQSrOlTDx6pyhnN
         HRAUHgYv7dN9j/V8OW0NQWXmEnL7+ABYJPEPtP0MUun9hMhN6gjxnW9+WvR47xquDJL8
         rfIVPCWRhft9ydZIkECGvPexMLSBhozDT8SQ3TMDODYua5RuS/4RY9C8EBI3tKrO4auy
         vYCkXTEDQEM6gjuF8LSWKOS19irWEXf2wy+RoMBSCBmAIvNLMTmmnCJNtnmCZTqaAx0/
         vgWw==
X-Gm-Message-State: AOAM531gROaHwFSBXilz109wi1dR8/WIWg16YySWgKIafNEVnQTR+Lc/
        MFbStopRZtYECzmh7TSrzutQHvYerBXAaQukDQI=
X-Google-Smtp-Source: ABdhPJwCJU3xmGNfIdrdk4AuLRfQKDsVIFJookscTN8wqEBKij959yzOJwV8TNvAk+gLbIiWMW+aP6D0WqBV8ojtk50=
X-Received: by 2002:a05:6402:149:: with SMTP id s9mr8649014edu.247.1612623071178;
 Sat, 06 Feb 2021 06:51:11 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:906:25d0:0:0:0:0 with HTTP; Sat, 6 Feb 2021 06:51:10
 -0800 (PST)
Reply-To: lawyer.nba@gmail.com
From:   Barrister Daven Bango <stephennbada9@gmail.com>
Date:   Sat, 6 Feb 2021 15:51:10 +0100
Message-ID: <CAGSHw-AO+Xa_koG5i0-JjSgLnhK_AGLnUpJ4Pmo9++psOxZVXw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

--=20
Korisnik fonda =C4=8Destitanja, Va=C5=A1a sredstva za naknadu od 850.000,00
ameri=C4=8Dkih dolara odobrila je Me=C4=91unarodna monetarna organizacija (=
MMF)
u suradnji s (FBI) nakon mnogo istraga. =C4=8Cekamo da se obratimo za
dodatne informacije

Advokat: Daven Bango
Telefon: +22891667276
(URED MMF-a LOME TOGO)
