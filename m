Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 979115BD5C2
	for <lists+reiserfs-devel@lfdr.de>; Mon, 19 Sep 2022 22:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbiISUiR (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 19 Sep 2022 16:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiISUiQ (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 19 Sep 2022 16:38:16 -0400
Received: from mail-yw1-x1143.google.com (mail-yw1-x1143.google.com [IPv6:2607:f8b0:4864:20::1143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13F8C4A830
        for <reiserfs-devel@vger.kernel.org>; Mon, 19 Sep 2022 13:38:13 -0700 (PDT)
Received: by mail-yw1-x1143.google.com with SMTP id 00721157ae682-324ec5a9e97so3875997b3.7
        for <reiserfs-devel@vger.kernel.org>; Mon, 19 Sep 2022 13:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=YeEFrOpnueqp49lpSsCtkyhW66cD5QzqZPU5hyS5TkM=;
        b=mP1IcGQUDZYYwCza1AGG+sBwijt15HEvP7STaR0pR4jQWK5VTUNaP3oRdRnCC1ONyz
         gt3vvkhX1x92NUQBRBzq0BoJUKCn4WtdndYqxnvM5St5r1DpP4EXJX3tnyOZk/6M7Q+n
         h/b9sAEP48Wz/8IgADeffg3u24v3yK1Mz8E7Ymfn703bVkzjH6hRXQCLOhmJ9gC+2vo4
         p1Ctes97zo47JPMlESrFW9YwSopQl9KmSpwCxRRrVLj5HDBX164qd0gN1fFiydzT2I7a
         qe4R3HZbqMacEITMmh/xzcP0GNW0EVU5FkSw4gNfmUw6l0e0EGvRrENBzalOPclTKUAN
         h1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=YeEFrOpnueqp49lpSsCtkyhW66cD5QzqZPU5hyS5TkM=;
        b=OIcuayuvAm0Kmdeco6cP1+LJd65KVbNRy/vD/3EoH9UiWqe1e332x5oEQg8FsKvK1l
         JvGrKS0htCCXgxbafyUIlpd+qCsZ0bV+CFxXAVrDEeCydaDbLrNDx8qzC/q/QFSb/rsE
         eT1fGZYjoGwcMg9Gw+nvnj/Ii7hiCBBNFhm9oTrX8eH92vnwgN01yZxhZ5ez0lH8sBS9
         NvRgklpsROuW+vCeEhHBJIaW6zQJ9+Q62VwwKyC6idPQyAEaHiB98r3gQ7GxLYtwfNph
         Rlh/Y7kHCeH0iUkGETPMCPPE/6SiYVwfIOonDpsFpeobKYxsh6xeRKsZ3WlU8ZDuW6t0
         JYiw==
X-Gm-Message-State: ACrzQf1Tl5FrybbPRgOn0OnPxMdy3jbDVwuRrSATVDdEIsbLPEhabvgB
        1q6Cqdsm0nESlsBBF4fR1n7uUM68Ae0hQ9giPhQ=
X-Google-Smtp-Source: AMsMyM7Gnz+WDAvjkpLQVLjdj//fg/00BAx2B6bHfUcQCBoFE7MOmp0glw0lh31SqSKoiPZpFhF0XzdW5VQjNHDK4uA=
X-Received: by 2002:a81:67c4:0:b0:345:1086:d295 with SMTP id
 b187-20020a8167c4000000b003451086d295mr16027952ywc.305.1663619892062; Mon, 19
 Sep 2022 13:38:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:289:b0:2f0:1279:d56 with HTTP; Mon, 19 Sep 2022
 13:38:11 -0700 (PDT)
Reply-To: lisawilliams46655@yahoo.com
From:   Dr Lisa Williams <daouda76104963@gmail.com>
Date:   Mon, 19 Sep 2022 13:38:11 -0700
Message-ID: <CACGepZV-_BzaeVCgzq+ky9TepJtE0Z33SXSpfASXcmsGFsZaMQ@mail.gmail.com>
Subject: Hi Dear
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1143 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5001]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [daouda76104963[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [lisawilliams46655[at]yahoo.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [daouda76104963[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hi Dear,

My name is Dr Lisa Williams from the United States.I am a French and
American nationality (dual) living in the U.S and sometimes in France
for Work Purpose.

I hope you consider my friend request. I will share some of my pics
and more details about myself when I get your response.

Thanks

With love
Lisa
