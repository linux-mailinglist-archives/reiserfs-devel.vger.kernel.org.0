Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D44E54FC8EF
	for <lists+reiserfs-devel@lfdr.de>; Tue, 12 Apr 2022 01:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240461AbiDKXr2 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 11 Apr 2022 19:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241505AbiDKXqy (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 11 Apr 2022 19:46:54 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF70230F75
        for <reiserfs-devel@vger.kernel.org>; Mon, 11 Apr 2022 16:42:26 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id h15-20020a17090a054f00b001cb7cd2b11dso913994pjf.5
        for <reiserfs-devel@vger.kernel.org>; Mon, 11 Apr 2022 16:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:message-id:date:mime-version:user-agent:content-language:to
         :subject:organization:cc:content-transfer-encoding;
        bh=N2D3bUjPflxxpum2YkcEWYPJj6FANBRbgMO3fHoQVCI=;
        b=CkGPDTYBhrQqtAaQVUOra+9ne0yroCLW/+vAREvKm/N1cI1J9haC2OUmXyEbM+FOKJ
         46B4QI5b4XdBT04HzJL+YqsuqiC/EhMiHGx6Xwh/rUJOnl40NEOLQ4EMwKOqANisvHxG
         kCCAIU8A6xCV2fYZzbT8oHkLivsrA0T5O/tOJ/JzIV56atzcScxktLo/yiPA9HJGAkXc
         vg3bjUb5Giy2C8Yo7QJfI9KcQDrp5TQrEUE0vWPAvnLDWdVi5pF+6/RUm1Ywr/uyTaGz
         bOF7VtJQhDpu2+BZHSFOtPmIZnWM2bjJB86XQigkCa/j70fG/swF31WXZh8St3OcWODC
         8bVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:date:mime-version:user-agent
         :content-language:to:subject:organization:cc
         :content-transfer-encoding;
        bh=N2D3bUjPflxxpum2YkcEWYPJj6FANBRbgMO3fHoQVCI=;
        b=jeDYb1oXvFQvGT0B8/7cZsx0ElZngzCdBaoDjtKmiRWc2UGElRjIs8VqtdnLlWYP6X
         D93XB15g3NK8NSo/mesTWP5ytO2DlepxWjWxkLRFPxSAei8eULwM6rmBJhe352VKg0X4
         tw1Rrt0Lrm1/ITd6TcnzAHRKGCHyuNboAkgUXnVOIgZbE5cO04OxPQXKrWVgsvj280YG
         8zdHsmMSSJer5keQGUXSQdGajO2yqgp7DFF8SX4Gt8tMThFMYUiqx0KTDTLuMPO8H2OK
         Sqh3+o8XzTwWIUxsNXfviytghc2VYCTO4MGO+AQRYuLw4+CFPy3RmSWj84w6rBkrqiTu
         V2OQ==
X-Gm-Message-State: AOAM530wUySxGYRp2JGgB1yRRZf1uX0xnFY88Y5EP2iIAZyKxiW+hPWr
        pKUBjDYAj5UjUV4PRnTMCGv2coYPHNQ=
X-Google-Smtp-Source: ABdhPJxjgheqzsFEOQQtz1sI57UHBBOyE/ACcksipx9KVRo51c4YU8aGkRDh+GKhPiTZ5n4SVwWyqQ==
X-Received: by 2002:a17:903:1104:b0:154:c628:e7c2 with SMTP id n4-20020a170903110400b00154c628e7c2mr35397296plh.54.1649720545751;
        Mon, 11 Apr 2022 16:42:25 -0700 (PDT)
Received: from [192.168.1.100] ([147.10.197.145])
        by smtp.gmail.com with ESMTPSA id o1-20020a637e41000000b003804d0e2c9esm728708pgn.35.2022.04.11.16.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 16:42:25 -0700 (PDT)
From:   Paul Whittaker <pawhitt69@gmail.com>
X-Google-Original-From: Paul Whittaker <paul@thinlinx.com>
Message-ID: <c80ff400-479f-0730-506b-5a1e8edf9e82@thinlinx.com>
Date:   Tue, 12 Apr 2022 09:42:21 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To:     reiserfs-devel@vger.kernel.org
Subject: Reiser4 on an inherently read-only block device
Organization: ThinLinX Pty Ltd
Cc:     John Nicholls <john@thinlinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hi Reiser developers,

Reiser4 is almost perfect for our (thinlinx.com's) needs except for one 
problem: it wants to write to the block device even when mounted 
read-only, and handles errors ungracefully (read as: crashes and burns) 
when it can't - specifically, when performing the umount operation.  I 
haven't been able to devise a simple reproducer for this, e.g. using a 
tiny ISO9660 filesystem, so there must be some subtleties that I am 
unaware of, but it happens 100% of the time when using our real data.

We have a couple of use cases that necessarily involve inherently 
read-only block devices:

1) We want to provide an ISO9660-based installer for our O/S that 
contains a Reiser4 (kinda-sorta-)root filesystem image that the 
installer would mount read-only via loopback to inspect certain files 
prior to dd'ing it to a target disk.

2) We want to share a copy of the Reiser4 (kinda-sorta-)root filesystem, 
which is mounted read-only on a writeable medium, read-only via the 
ATA-over-Ethernet protocol for use by network-booted instances of our 
O/S (this is feasible because the *real* root filesystem is AUFS with a 
couple of additional writeable layers).  The resulting /dev/etherd/eX.Y 
block device is inherently read-only - if it isn't, we risk write 
contention and Bad Things.

Unless I'm missing something, Reiser4 doesn't provide any mount option 
that would permit safe operation in the above use cases. Btrfs provides 
a "norecovery" a.k.a. "nologreplay" option that allows suppression of 
transaction log replay in situations in which the integrity of the 
filesystem is already guaranteed.  Is it possible to add a comparable 
mount option in Reiser4?  It seems to me that read-only should mean 
**read only**!

FYI we are using the latest Git state of 
https://github.com/edward6/reiser4 that compiles cleanly on a Linux 5.4 
kernel (commit 1a55b8ed6e0ac4de20135146d77bac4607d59fbe).

Regards,

Paul Whittaker (<paul@thinlinx.com> or <pawhitt69@gmail.com>),
ThinLinX Pty Ltd
