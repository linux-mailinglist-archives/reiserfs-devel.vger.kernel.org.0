Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 144F4439DA9
	for <lists+reiserfs-devel@lfdr.de>; Mon, 25 Oct 2021 19:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232657AbhJYRgq (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 25 Oct 2021 13:36:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231171AbhJYRgq (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 25 Oct 2021 13:36:46 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96BC3C061745
        for <reiserfs-devel@vger.kernel.org>; Mon, 25 Oct 2021 10:34:23 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id bp7so12383474qkb.12
        for <reiserfs-devel@vger.kernel.org>; Mon, 25 Oct 2021 10:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=F26I+cBcpyIkdxRfcHLvmvj+TTSmfbBclURHJNpWXCA=;
        b=Ptp2NusB5HJcfaDA6tHLXJ1eah2aYTDzP/9fFsUCan1lq3IQAne5dcjHE3mTG6DKMf
         B91xhGgBWpv+FK1gGeAh1mkhMdqYSepIUKzTgGCf9//P4VrfdzgeCwDrNcxYY424HKNR
         2+TMv9BVweCi1SZcZw01HrnAjRS0lq8M8TEilDTQZ6kJSaFZtvezbO0v+BF/rhuUkFr0
         rSG4DdK7eLwG/lkXBqZnEm2Ce7pnhc98YCEX3ZXvRLrCAnXsjZw7+d7lBAZjoimI16vL
         ukBYzxC7n7q8TbnOZ/RPSx70PlQRfMJKdXwLxn/x3/jkhVysGuScPd779O8UDGC6gjAx
         1l+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=F26I+cBcpyIkdxRfcHLvmvj+TTSmfbBclURHJNpWXCA=;
        b=PrNR6b2EM+sbBqrNTqt/MYAKf4o9BAq44zQ/FBf32Q9hlvfk6J+GdnxtSx3lBdRuhE
         KoUVCwtg6AYbojk2ZGudFi+JwX5p+gtfnjpz3mrlXfL3OYR31/I9WflDyqLrJ/tADEsE
         O1LwxdDYexQOeON8zrvztqf349V7satxaAH1afpBp0RsVsArczL4PpF8Ec0ZVrY3TTFx
         fqfao7fxlllm18efiFknlUXFaXT3ILIGt1GAG/qtB1B4VM5ilDzmkUErajGz5Csbt7Tv
         lrqd57UtAPgsBKEO5J0Gfgc1J0UuHa3qfwc7QSufh0nk5yCOdJYYD7mMLv5JFeau9mia
         VMng==
X-Gm-Message-State: AOAM530TAlrwnYFJMwJLy8CR6pkdBqBN4FeJskPpGoAlBliFCEMHiFLb
        nfc8x94HOQn+Za5VKuq0bajM7cZG486D8CA1hdM=
X-Google-Smtp-Source: ABdhPJyxo6g71e1H41wdc64S7Yix080cMjMYsH04VxgkemubjDliRv/c4X9WA2C0iPmYVpBkJfrywTbw1zXjL/pvyKo=
X-Received: by 2002:a05:620a:454f:: with SMTP id u15mr14389436qkp.283.1635183262313;
 Mon, 25 Oct 2021 10:34:22 -0700 (PDT)
MIME-Version: 1.0
Reply-To: martinafrancis01@gmail.com
Sender: sandrine.lafond75@gmail.com
Received: by 2002:ad4:5008:0:0:0:0:0 with HTTP; Mon, 25 Oct 2021 10:34:21
 -0700 (PDT)
From:   Martina Francis <martinafrancis655@gmail.com>
Date:   Mon, 25 Oct 2021 10:34:21 -0700
X-Google-Sender-Auth: CtLcnoHpetFEQz8wFcKCFbtWbDo
Message-ID: <CA+S7B5n5o6ms_ijKYCJnO6BxSmUee_eFWc0Zqkgo_W5Zaw2YFA@mail.gmail.com>
Subject: =?UTF-8?Q?Dobry_dzie=C5=84_moja_droga?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

--=20
Dobry dzie=C5=84 moja droga
Jak si=C4=99 masz i twoja rodzina.
Jestem pani Martina Francis, chora wdowa pisz=C4=85ca ze szpitalnego =C5=82=
=C3=B3=C5=BCka
bez dziecka. Kontaktuj=C4=99 si=C4=99 z Pa=C5=84stwem, aby=C5=9Bcie dowiedz=
ieli si=C4=99 o moim
pragnieniu przekazania sumy (2 700 000,00 USD MILION=C3=93W USD), kt=C3=B3r=
=C4=85
odziedziczy=C5=82am po moim zmar=C5=82ym m=C4=99=C5=BCu na cele charytatywn=
e, obecnie
fundusz jest nadal w banku. Niedawno m=C3=B3j lekarz powiedzia=C5=82 mi, =
=C5=BCe mam
powa=C5=BCn=C4=85 chorob=C4=99 nowotworow=C4=85 i moje =C5=BCycie nie jest =
ju=C5=BC gwarantowane,
dlatego podejmuj=C4=99 t=C4=99 decyzj=C4=99..

Chc=C4=99, aby=C5=9Bcie skorzystali z tego funduszu dla ludzi ubogich,
maltretowanych dzieci, mniej uprzywilejowanych, ko=C5=9Bcio=C5=82=C3=B3w, s=
ieroci=C5=84c=C3=B3w
i cierpi=C4=85cych wd=C3=B3w w spo=C5=82ecze=C5=84stwie.

Prosz=C4=99, wr=C3=B3=C4=87 do mnie natychmiast po przeczytaniu tej wiadomo=
=C5=9Bci, aby
uzyska=C4=87 wi=C4=99cej szczeg=C3=B3=C5=82=C3=B3w dotycz=C4=85cych tej age=
ndy humanitarnej.

Niech B=C3=B3g ci=C4=99 b=C5=82ogos=C5=82awi, kiedy czekam na twoj=C4=85 od=
powied=C5=BA.

Twoja siostra.
Pani Martina Francis.
