Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBBB2434B4A
	for <lists+reiserfs-devel@lfdr.de>; Wed, 20 Oct 2021 14:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbhJTMlL (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 20 Oct 2021 08:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbhJTMlI (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 20 Oct 2021 08:41:08 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC4D6C06161C
        for <reiserfs-devel@vger.kernel.org>; Wed, 20 Oct 2021 05:38:54 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id b12so2844679qtq.3
        for <reiserfs-devel@vger.kernel.org>; Wed, 20 Oct 2021 05:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Djpr1AS9BhRB0i84aUYk51L5QfT0/KDcZHhY+64EDVg=;
        b=D+cHjhxoQwEc+O6ST42y+JkXXagJhfkKWB1ooUEmzhSlbhPkL4IGtXgLdyaz/N4WeD
         AQEzpLAdABdA9oXHib5xrJxV7qOEyZEWSE1I5m/44X/0yr6hrxtRxofdQ2tlicY8jsYF
         aTSCBLI+jZ5UwReFOZ3jg4fC4bpLdZPA/Aj/d65DTnzbwbtTgazrKi/bHN0x6uRiRIBN
         IWO5gzRyZ4MNNyxzIfRIQKtCQ9/gUFUd+2SqjwHxLsUa4AT6c+xv0im1VG19WSPL5SnN
         6t7rCdL6trsLoSqDm+uvT+8oceNQpCyePBtkh7woIjRvX6PO0Cta1KaSNjQ4vEODfk9l
         j2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=Djpr1AS9BhRB0i84aUYk51L5QfT0/KDcZHhY+64EDVg=;
        b=OkLnRAU6sabiTge81MS921pxosxCPZ3WiKYRbGC5zlN8y5u+5V/YfzKJSt7izqLAod
         lnGG3VYaYI5uDa+UWcWB90ijLRQMBxE1U5UsAJgty0fS2IkWLqyNoii3FjlDGhDaedPm
         Y9PkOX0pONb8nejBes/30viX012QsdlmHytubaxyI5SL6l9yK0LBI81gH87SnPV7syUs
         c4m0Ng6igjki+jUzxiK972O2AqxzAAIg2lLiVR56GEAedZl+Y7RK/wIQhUuSh2hCXP/l
         uwcathdJxzQiI0uoJrKCMzNwVnEdWq0kjgSWb0Qnj4SP7QyUAakNX975Wpt+MSz2Hxj7
         ixlA==
X-Gm-Message-State: AOAM533KLH3aTMMLsFZhRfGyIqetXm8E6U9HM7vGqsu6Js9WNu5IFcGg
        7/5sR9XBeFg3dZ5OnRx7gpcIyTiPvbed+ay8NkE=
X-Google-Smtp-Source: ABdhPJyGAyBxAhGjUkowe8U4wsKvpw9RBo9iWuQWeGst3qP2vEIKG/Iqd+wxZXeLr58ELzjDhpZ53fkGWjFmzUCuefk=
X-Received: by 2002:ac8:7c46:: with SMTP id o6mr6549788qtv.197.1634733533955;
 Wed, 20 Oct 2021 05:38:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6214:c87:0:0:0:0 with HTTP; Wed, 20 Oct 2021 05:38:53
 -0700 (PDT)
Reply-To: lerynne_west51@zohomail.eu
From:   Lerynne West <elvismorgan005@gmail.com>
Date:   Wed, 20 Oct 2021 05:38:53 -0700
Message-ID: <CAENfNMD0NwLwaciDvDFa7wBFih53ZgyDvntccmm-zOsH5MBgsA@mail.gmail.com>
Subject: =?UTF-8?Q?Ich_spende_Ihnen_diesen_Betrag=2C_um_den_von_COVID_19_?=
        =?UTF-8?Q?betroffenen_H=C3=A4usern_zu_helfen?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

--=20




*Beachtung,Sie wurden autorisiert, eine Gesamtspende von 500.000,00 USD aus
dem Covid-19-Unterst=C3=BCtzungsprogramm des Lerynne West Emergency Fund zu
erhalten. Um diese Spende einzufordern, kontaktieren Sie sie mit Ihrer
EMF-ID: COV-0043034. Ihre Spende in H=C3=B6he von 500.000 USD wird Ihnen ge=
m=C3=A4=C3=9F
unserer Richtlinie und Mission innerhalb von 78 Stunden von einer
akkreditierten Gesch=C3=A4ftsbank zugestellt. Siehe den Link unten:*
https://www.youtube.com/watch?v=3DhtEHuyOHUsc

*Antworten Sie mit EMF-ID: (COV-0043034) auf diese E-Mail*:
lerynne_west51@zohomail.eu



*Peggy Rock,CEOEMF-UNTERST=C3=9CTZUNGSPROGRAMM*
