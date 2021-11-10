Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE2F744BBC9
	for <lists+reiserfs-devel@lfdr.de>; Wed, 10 Nov 2021 07:39:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbhKJGmh (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 10 Nov 2021 01:42:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbhKJGm2 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 10 Nov 2021 01:42:28 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 664FDC061764
        for <reiserfs-devel@vger.kernel.org>; Tue,  9 Nov 2021 22:39:40 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 77-20020a1c0450000000b0033123de3425so3748576wme.0
        for <reiserfs-devel@vger.kernel.org>; Tue, 09 Nov 2021 22:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=45MiAqcvKNHcyGst44Dl8W3sNjujU4xPnGcGIM2COgY=;
        b=ax0OenhjG/t7SENlgcOyYT9a4nIQ5miQW8uu//ZPOM0TsYpV6QZPfYZ/BkS+NZK7EZ
         NEOiCfNvtMBpvD5xlTs8pKXMP+aD2+BmlLPwi2rlSuLAmnFt82gyWEiXV+40ajGKzBZF
         jEJRTfzAC+e7ZeA5DLgO3i3fvYfYyUipXFXpGh6CeXBDbp8bPuBRf0SHDAJDBD84sYsm
         PyNe3WZYBkc/jmYcn0kQBanOr4N17782gPFC1uL8P0IWouGOunjEIFFZX0nfvXLsv3XN
         fBlnzz7MHWMY3UZ4TIXw+FWqFb/iuWZU+9htOiR+GXcmFKt4DXokhW7yzdNNlVG00IPC
         TYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=45MiAqcvKNHcyGst44Dl8W3sNjujU4xPnGcGIM2COgY=;
        b=Qdga0XfddtqtAJ7TVZr7Z5PE4TW4wc5xVhgb74JTIUMeGV5v7lpP0jKAw1t13ICFOR
         Niv+SGu8wSBJF7VuH/QWCNOnmqL0dTdv2FQb1Mh1K4/JDHpQUbMPRxQb4yJZw98/KDmr
         38LgUO9A1LpBfj5rzUwXbFqdwchqkvEMzwprFzy11bqdrawtPT4FntM5f/cBdDgalLNq
         RIh2ffgie8SWcvKxAxvZDVRWM23ZLxtaVjht7tGRTIt9vfwTSPHgKDv8uVDdW2D97SWt
         0ZBTO1EOddyrlx+1Rx7wV06tyHn4f9Jt2vg4LzZRov2UwOYjvTL3kTyiHtfnogUcCwYY
         zT7Q==
X-Gm-Message-State: AOAM531s7P2slVUPdqZMyvMLMb1dWGvBJw4mhU6kL3pltnftyotXh8x9
        4ohg361E8XKsUR4Qr1wrpf310PRs0aadk6frBrQ=
X-Google-Smtp-Source: ABdhPJxzD5H7IgKe0xG4nEvyh1tkxPWoara3bptcmA0FSD1HL6HH+B2R7ylc6MqcrtzK9ZWjpcTB8+iXpHeI6qM4nkM=
X-Received: by 2002:a05:600c:3ba5:: with SMTP id n37mr13886506wms.168.1636526378984;
 Tue, 09 Nov 2021 22:39:38 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:600c:b52:0:0:0:0 with HTTP; Tue, 9 Nov 2021 22:39:38
 -0800 (PST)
Reply-To: stefaniekoren50@gmail.com
From:   STEFANIE KOREN <smithmark32374939@gmail.com>
Date:   Wed, 10 Nov 2021 07:39:38 +0100
Message-ID: <CAEkfBsHGDPdSi_fHM5WiGgue7D4ywra60egd+k2OffqCrM_N7Q@mail.gmail.com>
Subject: Donation From Koren!!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

--=20
Lieber E-Mail-Besitzer

  Ihre E-Mail-Adresse wurde am 22.09.2021 mit einem Computer-Spinball
zuf=C3=A4llig ausgew=C3=A4hlt, um eine Geldspende (900.000,00 USD) vom Kore=
n
Charitable Trust zu erhalten. Kontaktieren Sie
stefaniekoren50@gmail.com f=C3=BCr weitere Informationen.

Koren Trust
_______________________________________________________________________
Dear Email Owner

 Your email address was randomly selected with a computer spinball on
22/09/2021 to receive a monetary donation ($900,000.00 USD) from Koren
Charitable Trust. contact stefaniekoren50@gmail.com for more
information.

Koren Trust
