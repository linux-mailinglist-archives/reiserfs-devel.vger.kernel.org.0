Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 612546A2085
	for <lists+reiserfs-devel@lfdr.de>; Fri, 24 Feb 2023 18:37:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbjBXRhG (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 24 Feb 2023 12:37:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjBXRhF (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 24 Feb 2023 12:37:05 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1D356A794
        for <reiserfs-devel@vger.kernel.org>; Fri, 24 Feb 2023 09:37:04 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id cp7-20020a17090afb8700b0023756229427so3615046pjb.1
        for <reiserfs-devel@vger.kernel.org>; Fri, 24 Feb 2023 09:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=O0HJaUjEDadeep5F0ZYXzkrW1rTemjkBi2G9EEEgeakDIhVCkII1urowXNyiCwxf49
         ta5itajMV5t21NUkGpjoslOkyPCrcaPbBGLRKhrVzmHH5PbjdfFnUIHO1IWMJrTe7Y/w
         fHXQlEVXMcu15rYzSk8Tkh8rnV32C9hNioS0AfIHoHJaG250UvI7cUzP5GFHauXo/mbt
         yY3aL53b11B8JvvSTEYbTLK1C9zJDMEO72jicsYyOC7Yqs3eKzkkJM86bn02/VK5TFtN
         wi2rT7BdWvBiP57jmIqJaU5bfJjRQu2rX9gXtym1BKJ+W8xJdJ48N0Q8D6rzXEZRnxYN
         K5zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=KlOPGT7SYV2tTxDvxkt9P44RyL/d1dlhd5ucFzttERns2f4tsqx1OtqL+fIzDqo+Xr
         YoYFbvF+3/WWagjhRQAXMajB6oPnzUkpoO3ZGWhQDo7PNxAO+mnNH8NldgzZQcAixNqk
         8EBZVWUoprGokstKFgdNXAi8lGX5bpBIcvmg1y+Gp+H1lvQnOU6MXuw+NokqThj4ab2x
         XjVqxnzVUvaB7ZfmOHn3ihKBovvLMT8UCMo9BRNfVMxmCevJtQsfaLI50Otrvv46gBYU
         WqfK7UNVPtdURkIvgrARDhgAUKUvyyoDG+QjLWzprTDwCBENCWkKTcx6LEhNgSCUQRH2
         lDDQ==
X-Gm-Message-State: AO0yUKXBzhnrbMB399xQ1lXdVUDHVsS0DJlw81QO9AyfNzFnG2K6tRsx
        Kdz8WHQ8mDTpGWdLuc0T6BCTopUkmEBs481dld4=
X-Google-Smtp-Source: AK7set//6mfoHL1JKpX3IIp9vG8fYCgGQw8Fblr/C9YkOaGAZnCVl4u71ogho6QoFL5cJ04ORi8MJIzDfVEvkif9EOM=
X-Received: by 2002:a17:90a:f2c5:b0:234:13d8:ed5b with SMTP id
 gt5-20020a17090af2c500b0023413d8ed5bmr2005213pjb.3.1677260223802; Fri, 24 Feb
 2023 09:37:03 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6a10:3e48:b0:40a:b399:66c6 with HTTP; Fri, 24 Feb 2023
 09:37:03 -0800 (PST)
Reply-To: dravasmith27@gmail.com
From:   Dr Ava Smith <avasmt002@gmail.com>
Date:   Fri, 24 Feb 2023 09:37:03 -0800
Message-ID: <CAGJq2vtZEbb3KW6cQS7bmSRbYoYUsibN9sLv6Q6Zc7Os3eyUKA@mail.gmail.com>
Subject: GREETINGS FROM DR AVA SMITH
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,UNDISC_FREEM
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1034 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5079]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [avasmt002[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [dravasmith27[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [avasmt002[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

-- 
Hello Dear,
how are you today?hope you are fine
My name is Dr Ava Smith ,Am an English and French nationalities.
I will give you pictures and more details about me as soon as i hear from you
Thanks
Ava
