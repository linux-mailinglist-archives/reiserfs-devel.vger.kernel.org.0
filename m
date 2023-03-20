Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E96CA6C178C
	for <lists+reiserfs-devel@lfdr.de>; Mon, 20 Mar 2023 16:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232328AbjCTPO6 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 20 Mar 2023 11:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232469AbjCTPO2 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 20 Mar 2023 11:14:28 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1F0B32CCD
        for <reiserfs-devel@vger.kernel.org>; Mon, 20 Mar 2023 08:09:34 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id t5so11229933edd.7
        for <reiserfs-devel@vger.kernel.org>; Mon, 20 Mar 2023 08:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679324972;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=llbeAuUHISTuwC5B62tqq262QPcXfi1d+kjmNurHi7KlaGlfvbjs1mYbZzvd2w1FbS
         qQaLNVECYx06dx2NdHXkjMofkP124sY8pvB520ARYZVHlLq7a6DvFbKrx+XY3FZI9rJh
         o6Gkt6mDzyFFJ2KtP4/XZuNTNOjC2Ey3J06HlEskT5mD8F5bDH7JgRFDpdtS/31nPu5q
         CKvZkw2hPGMRng5kVXHmGC6XooztANkiJmkFV5cIpmLSs4frEDymTGBpI1Mg/QLqGpRB
         oDKujJHuqXgbZCWUFDiJ9h40JD86L1KXkYjcRnQlXfAEJ8npBhIeDwsLCe7F/ZqDtflX
         I5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679324972;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oDVdWICwavrWQ8UAVYhe8ynFXsBBW1vVQ7W08zgiq24=;
        b=8AWBrBmakZnOdc6Xc8JcANtcQDvh4yT7egWIA5AxUqnR9g8F03+EGEKw+ifDo/8v+T
         hZgLDZPZ9Ik562dZikP5OaSdy5+Nr7cGn4EiJRIxfsfHMsQfu8za/1jCmX5D0uYX+7lP
         rCnpD1K7eHFA271xrA/cSbdxqigPdlacFC2bI7uaivObR6oujNgvSwxKIXjNR0LcoUpS
         2AeXH3X/HygcI3yL+7l8/04rYTfqI/XTmBmeCv4udQaTNwdyVGZZtuPY2O0O3gdQ4VXr
         zWn0vkukb5OIVYkbBKDfDlMw5IKjV00KDtnoxo8TNoGdHHvxhuFUZ4QaDPs+y2N5BVS+
         odHw==
X-Gm-Message-State: AO0yUKVqWFThjWYdMjIp06QZgwnmSaoKw9uc5Xa1DiRLCwDG202EeNuO
        9DTTEneHskPC+nu+uOU6M36rvdjM9C3up6Wji/M=
X-Google-Smtp-Source: AK7set9pDGPsTM06FgyhZiWfKiEITCe+eQJ2qx/bssC/xepE5NEEdgi72eK5WPBu0KJvo9MVaxtcCvBXroz6UvUA0FM=
X-Received: by 2002:a50:ce0f:0:b0:4fa:6fdd:62dd with SMTP id
 y15-20020a50ce0f000000b004fa6fdd62ddmr6763167edi.7.1679324971943; Mon, 20 Mar
 2023 08:09:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:787:b0:928:3d6f:eb78 with HTTP; Mon, 20 Mar 2023
 08:09:31 -0700 (PDT)
Reply-To: ninacoulibaly03@hotmail.com
From:   nina coulibaly <ninacoulibaly331@gmail.com>
Date:   Mon, 20 Mar 2023 08:09:31 -0700
Message-ID: <CAOK+POLF_7RG=SfJ_5TBSJgVh5Eb=Q6Z=iAkEH-WFJAnbtwp8A@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:529 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ninacoulibaly331[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ninacoulibaly331[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [ninacoulibaly03[at]hotmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Dear,

I am interested to invest with you in your country with total trust
and i hope you will give me total support, sincerity and commitment.
Please get back to me as soon as possible so that i can give you my
proposed details of funding and others.

Best Regards.

Mrs Nina Coulibaly
