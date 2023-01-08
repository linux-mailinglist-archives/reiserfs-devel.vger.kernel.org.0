Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E84D661621
	for <lists+reiserfs-devel@lfdr.de>; Sun,  8 Jan 2023 16:20:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231272AbjAHPUp (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sun, 8 Jan 2023 10:20:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbjAHPUp (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 8 Jan 2023 10:20:45 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B20F55AD
        for <reiserfs-devel@vger.kernel.org>; Sun,  8 Jan 2023 07:20:44 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id vm8so14343607ejc.2
        for <reiserfs-devel@vger.kernel.org>; Sun, 08 Jan 2023 07:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HcpM41K3Tg/Gq2Sy2fOw39ukTQf5X/VzmfsS+yU67xU=;
        b=esjWSR9wpBGUJ4k9LqVdq64dk5gfUxlVBbY363Wy4HbKgnhQXp+acXbuHug04tFocZ
         ME3jdnFLhzUGOTBEIAQURweTEZlPhs19AeIUcJxiITk09Zoot10hL2wH5j0i+spaBoym
         o0bNwEh9h65Q4dVkQlnYvOmCBY0pFpGtkkNet8Q6aVdtkrOFFRd1KA08Ln9+5im6QcL8
         TFf9JGrE2HX3JSc9GDbdVMVkpytSOeM3VcVIiA/XGpAoNMkhgJg1tMPr0b2uVcS4YooH
         aSn8OX2HJbp5yMNRf62S7s729eUEi+70cW3xULbtAZT7f5TBYjkCWYBJkJOhCjecdFKH
         IBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HcpM41K3Tg/Gq2Sy2fOw39ukTQf5X/VzmfsS+yU67xU=;
        b=AnxtTi9/72uawyKnAzF3xzALEuiun4y4e1vQMiV3QwOAutvB76NRvhWD8NFo0LMgf+
         /X8RASxHpnlEW+ucucTp3/7kKBLHyVf4G8dNXP86xiezm38ojRzYcQv7bYzhvO17AoY8
         zdaP/3utYxSrgjjqD6eXfreDYXzu5nTDBHVQuL6MUeWDYaTXaYqMhp6crR7BKpGrkvQf
         JoGXLshKrUoG8h5oW0gSU16M88m3TqcsJV8GhEsHAcvZhQCpLytCGvM/fxP4W8H10zuP
         rWa0Lqz4jf9BUbJoqCH4qRXzlX8P4ZoTnQe1sPfZTh7vQtYNKYzFzjhMteGScfAe99ut
         3tzw==
X-Gm-Message-State: AFqh2krF5BrdH3fJkpycago9zN1PQRY+JIOAEykNxZ32T+Nbfz5CynbL
        JGRAhPgudLZY7dQu1XWC6DgZz5tD7UTltBvQRIU=
X-Google-Smtp-Source: AMrXdXuicgxXDzAKMVbxscxfTUytxu5AhPZt9mmug2KHfqwI3nxxWZcAA4CDhLYXVpL4k0T3aFuPSun9udIWzORRuzY=
X-Received: by 2002:a17:906:6801:b0:84d:390c:46fa with SMTP id
 k1-20020a170906680100b0084d390c46famr198470ejr.275.1673191242714; Sun, 08 Jan
 2023 07:20:42 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:640c:2a51:b0:186:b673:2e36 with HTTP; Sun, 8 Jan 2023
 07:20:42 -0800 (PST)
Reply-To: muhammadabdulrahma999@gmail.com
From:   muhammad <agnieszka66books@gmail.com>
Date:   Sun, 8 Jan 2023 07:20:42 -0800
Message-ID: <CAEbk9CwKJ3+qR2ikwYat8KPBaESgKVDjsmMnMvBf6e60XoCkzA@mail.gmail.com>
Subject: Re:Urgent supply to Qatar
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.5 required=5.0 tests=BAYES_50,DEAR_SOMETHING,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:642 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5004]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [agnieszka66books[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [muhammadabdulrahma999[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  2.0 DEAR_SOMETHING BODY: Contains 'Dear (something)'
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Dear Sir/Madam,

An open Tender for the supply of your company products to (Doha,
Qatar). Urgently furnish us in full details about the standard of your
product. We will appreciate it more if you give us with Details:
Specification and Catalogs or Price list via Email.To avoid making a
wrong choice of products before placing an order for it.

Terms of payment:An upfront payment of 80% (T/T) will be made to your
account for production,While 20% will be paid before shipment.

Thanks and Regards
