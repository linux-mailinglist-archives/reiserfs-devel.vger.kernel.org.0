Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F31F578AF0
	for <lists+reiserfs-devel@lfdr.de>; Mon, 18 Jul 2022 21:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234944AbiGRTdo (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 18 Jul 2022 15:33:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236341AbiGRTdH (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 18 Jul 2022 15:33:07 -0400
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FB44EE03
        for <reiserfs-devel@vger.kernel.org>; Mon, 18 Jul 2022 12:32:01 -0700 (PDT)
Received: by mail-ua1-x936.google.com with SMTP id 94so178024uau.8
        for <reiserfs-devel@vger.kernel.org>; Mon, 18 Jul 2022 12:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=h0ZslgqQ94UM3iGDYCZGEx8ZwvbYHY5ZrQARiO/Kpbc=;
        b=mMH1Wu/pDmcE1As+sf8LdzGbE87ru3MuL8MfFXMmNwYWv9nvH4ql3xlEjOmlEBC/nX
         68TJegTmBWQ2omr08X7uFCLjTSSaSsV9A1cWSVa7CuENCeUJkPinuODC3Jurof2Vc2M4
         zkc6+hyKiCJqX+bdkVKiABxX42pEzEFOjWzp95EgxPi8LhL9LUIHyeuAQq3xdTF1rpnS
         rIAp/fsXx9aJ55BZ6B5TviBQVBvfCBJzOo+GRK0hJ+rwiHWK4M3tVAIctKki0CM0g2S8
         ibBbx0uGtkSClX4s7tR2WrrRLGsIzb4i58TftFw+8H2Tbee1YVrfZdDhRleUd8x3fdmE
         tWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=h0ZslgqQ94UM3iGDYCZGEx8ZwvbYHY5ZrQARiO/Kpbc=;
        b=l3BGV5sEHsjYktGNCEf3ajhXk6vuSv7TnIhuvJ8UZZSelxHve7bFXxeZDTbYRGhtxs
         e9q1qRAhnuhfoyKq5AssgdCAVjSt2iIwdcBoeGli7QPUl+m3utPRdOLfARS1lAQqfJEm
         /67hUmbOCLN7gANHrXB7690T1+W5Pdi4dl25Sy9LYfhBLV54xxakwCyb1ysYJh8HU69G
         D0tJj+XaliT4MCupZpdb4pDiJITdYL4Q+uQENxEhrFPDuhYAHwDwKWNJBDgHUsuND4no
         dZ+/j9deCNgIOz0P0DMk1MX4n+9pJqLjDC98b2ERqQFV7veHQgb4fp+QQApmu003woJi
         dk6w==
X-Gm-Message-State: AJIora9C14l6/H8/H6xvgQFvkTO4HJFovV40mXmP9BahhXCqoczs1fao
        vjvFKDUKJrayRCWUxbIij0+QCQuSTAkx2D49zik=
X-Google-Smtp-Source: AGRyM1vRHKXSv0RNrmTCXS/t8bw6KVlPh8/yP4CFhy0y2HJ3XhOngHWxmO7ICeL/1eBpb+mPOh7f5oChWqtWm+HpnUE=
X-Received: by 2002:ab0:6397:0:b0:383:eeaf:7c4b with SMTP id
 y23-20020ab06397000000b00383eeaf7c4bmr3207133uao.47.1658172720182; Mon, 18
 Jul 2022 12:32:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:b12a:0:b0:2d3:5030:bb10 with HTTP; Mon, 18 Jul 2022
 12:31:59 -0700 (PDT)
Reply-To: lilywilliam989@gmail.com
From:   Lily William <blessingiyore3@gmail.com>
Date:   Mon, 18 Jul 2022 11:31:59 -0800
Message-ID: <CAKQJGJaedvwW2W9iPa9HCxKD+tg-F5m0hDN13aFJu2TLQRONcw@mail.gmail.com>
Subject: Hi Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:936 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [lilywilliam989[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [blessingiyore3[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [blessingiyore3[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hi Dear,

My name is Dr Lily William from the United States.I am a French and
American nationality (dual) living in the U.S and sometimes in France
for Work Purpose.

I hope you consider my friend request. I will share some of my pics
and more details about myself when I get your response.

Thanks

With love
Lily
