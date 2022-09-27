Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 264975EBC09
	for <lists+reiserfs-devel@lfdr.de>; Tue, 27 Sep 2022 09:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbiI0Hya (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 27 Sep 2022 03:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiI0Hy3 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 27 Sep 2022 03:54:29 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFAE6AB41A
        for <reiserfs-devel@vger.kernel.org>; Tue, 27 Sep 2022 00:54:28 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id nb11so18944277ejc.5
        for <reiserfs-devel@vger.kernel.org>; Tue, 27 Sep 2022 00:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :reply-to:mime-version:from:to:cc:subject:date;
        bh=w30HluXpHfcST3nG/W/jMytzyNhGZuKynjdjh8l19bc=;
        b=Fl+qloyh+VPTIajG8f+4enyeip7M28bD5jBtRNRXGA/jFo+icUsXblSn6CH5VoNjf6
         1RLi0eWEJXE9a7IPf9UrioxaId/QUQjDDR4ypaDqhwmmgVGP5HfohmE3pKmpTlzso6rX
         LkZz4+7NwxyxssqB2i7g103UAAxjyFuyKji94rMH6O8Ustpl3A7vKmOmyGX14oJGoiO3
         ZYL1a78l8gcUETVt+0zjD+VOWOrK5SYXFOOvB1RIYWYcZJEOALzV1RtQNxqkR76jf0a2
         gzdOW9Ugmyzg9IDT2pORArHvh95c6VltCb/E5EcyzGo0eRnMkNUK8KhfKT9jNkc7x9ZV
         IdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=w30HluXpHfcST3nG/W/jMytzyNhGZuKynjdjh8l19bc=;
        b=V0sfGL1UWzBrAWRGbZ2vyUwzYQFHDCw4CjUXmeOb2CbXcYBm4iqqqT0TUIWKvXaOYS
         EqNinfahmjtCQpCEQky6JUIjPet8ViqqFr++0+9q3gOWcEU97XwaiWRFx/x5HHindFz4
         L67vcb+8j02CI6kDtP5MNAEShJnx1epmAlkTOFjbQt2JLLI9hW2CmzbS1NSvno69tjRl
         SLpfgkhSy7qabALZPhqkknN9RKcjrutxP7oumjGBBO57z2mEcEYu5dM532FwO69mlqMQ
         wgS4Ej4x+bHYEPAgu15rnUOERO4mHFyaQEufZzY/ngDtJZJoRHc6Z1Vaw4axOtJ+vmCN
         uWEg==
X-Gm-Message-State: ACrzQf1+l3rrVIYXe4kRJwS26G1O4vQWDZQDarj7zh0PBuMkMxXeRTr1
        EEBjJbHrZQBi1SyCBy5UHfOndbBSt+N4RLwcxg==
X-Google-Smtp-Source: AMsMyM5Sru4WcLgRr3oMNynm/RC/PLcVTlUnAYoSuItOB2/9Etf3fjx0890whhcTjYhYtk191zFJADcOr82yZsiE7AM=
X-Received: by 2002:a17:907:1c98:b0:783:267f:ff0e with SMTP id
 nb24-20020a1709071c9800b00783267fff0emr10709052ejc.564.1664265267513; Tue, 27
 Sep 2022 00:54:27 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sgtkalamanthey@gmail.com
Sender: aichabouraima47@gmail.com
Received: by 2002:a17:906:57cb:b0:782:9fb4:6a28 with HTTP; Tue, 27 Sep 2022
 00:54:26 -0700 (PDT)
From:   Kala Manthey <sgtkalamanthey@gmail.com>
Date:   Tue, 27 Sep 2022 00:54:26 -0700
X-Google-Sender-Auth: 7ZYED0ZD0UTEiUlWaywCyqXNlU0
Message-ID: <CAHJXY15OKF6QFqzXLGvChG+zztPZxzTgq3-+EecF5xofRtKPcg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Ahoj, dostali si moje dva predch=C3=A1dzaj=C3=BAce emaily? pros=C3=ADm daj =
mi vedie=C5=A5
