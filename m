Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD7C4FE89F
	for <lists+reiserfs-devel@lfdr.de>; Tue, 12 Apr 2022 21:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353426AbiDLTaS (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 12 Apr 2022 15:30:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242059AbiDLTaR (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 12 Apr 2022 15:30:17 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E90F649914
        for <reiserfs-devel@vger.kernel.org>; Tue, 12 Apr 2022 12:27:57 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id c6so8442967edn.8
        for <reiserfs-devel@vger.kernel.org>; Tue, 12 Apr 2022 12:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uFb+8fd6oKI+PamDxoqjGB/pr5KXwRCQXKN0fGxEF3Q=;
        b=YSj9dm5+k0ooYhu7+DRAzTvwPjPSrBXJwtbmezGGOrvG227pEWn60SGtuGVbv4ZP3g
         /DMIKho3T8hbBSPVMSwvD1lczCJIykX37znKQcWHbLuRp55LcK5a6VT1KUI7X0SYrzA9
         Gh+sft2WbnoM+U6E/USJBIbsvffpoNWplNoZQyhcO7+n21xZ/lG2/I2nnrBIcUDd8sUv
         PTJk/s/CiwnFhF4Rhfslurbq7v68c2yY4H5HSiGlhXAIwdDdFQ6NMFBlvQY74y9lee3Z
         gwbTCPRkwrtC9OgfLPpx9s8Q9QTUU20VGoaRtr8v3v5R/H6uBkIzo3qVkUuwdy9PxZ2s
         BJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uFb+8fd6oKI+PamDxoqjGB/pr5KXwRCQXKN0fGxEF3Q=;
        b=8RZGmnESgazUX8NeDnB7HG+0hoPNYRIE0hqoU5+dtSI/NU83798nnkkRvYT4VRAy+E
         h0JVlUmyYpSBa9EhyamsrhY8qzOwFeED/pUfjJbB6p94+13Cn0gvnqIdK4Ss+5asIclF
         h+l91fIv48tgSchLb7FGUTuFuyj/hht7U39mDrLvCs31jLra6wYvc0xSgBRm0+NJKpgW
         CAlhDwu53kPTx199LlC2BKMqdSueRA/lPEKOCcmcUmDkJKd0OH9S/Uoo3IP9k5LGKxd9
         HO4Tb1s1y+iTen2TK8TtoUkcwT01VrKGsngMwD6+PBiSDYpUowkKWchTbBQOo6bkkabh
         QNyw==
X-Gm-Message-State: AOAM5329cDO9atSqN+EnEVWHs6zUb7GkyNNp1CIMRmDUYSaB0TOZ9XDx
        Hi5Zu99AjK7i1igCc/RBFxk=
X-Google-Smtp-Source: ABdhPJxPfCKdIRzfemeDLCxZhEcvFMz9JalewPHRrGt60PERTVaqmgaCBQbM4V1IuI6K0j04hZIA6A==
X-Received: by 2002:a50:9eaa:0:b0:418:f708:f59c with SMTP id a39-20020a509eaa000000b00418f708f59cmr39698603edf.333.1649791676453;
        Tue, 12 Apr 2022 12:27:56 -0700 (PDT)
Received: from [192.168.0.48] (ip-046-005-230-076.um12.pools.vodafone-ip.de. [46.5.230.76])
        by smtp.gmail.com with ESMTPSA id cb7-20020a170906a44700b006e879b4ba2dsm3999916ejb.56.2022.04.12.12.27.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Apr 2022 12:27:55 -0700 (PDT)
To:     Paul Whittaker <pawhitt69@gmail.com>,
        reiserfs-devel@vger.kernel.org
Cc:     John Nicholls <john@thinlinx.com>
References: <c80ff400-479f-0730-506b-5a1e8edf9e82@thinlinx.com>
From:   Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 on an inherently read-only block device
Message-ID: <879c3df3-e369-797f-a412-022621d738be@gmail.com>
Date:   Tue, 12 Apr 2022 21:27:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <c80ff400-479f-0730-506b-5a1e8edf9e82@thinlinx.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org


On 04/12/2022 01:42 AM, Paul Whittaker wrote:
> Hi Reiser developers,


Hi Paul,


> 
> Reiser4 is almost perfect for our (thinlinx.com's) needs except for one 
> problem: it wants to write to the block device even when mounted 
> read-only,


After issuing a "mount -o ro" command, reiser4 can potentially issue
write IO requests in the following cases:

1) Upgrading Format Version (it happens when you mount a reiser4 volume
    of format 4.X.A in the system with reiser4 module of software version
    4.X.B, where B > A).
2) Your volume has uncommitted transactions, that should be replayed.
3) Other possible mount-time cases that I don't remember.
4) Possible bugs in reiser4 code (e.g. ignoring the read-only flag in
    the write(2) context, etc).

 From your message it is not clear, which one takes place in your case.


> and handles errors ungracefully (read as: crashes and burns) 
> when it can't - specifically, when performing the umount operation.  I 


So what exactly happens at umount?


> haven't been able to devise a simple reproducer for this, e.g. using a 
> tiny ISO9660 filesystem, so there must be some subtleties that I am 
> unaware of, but it happens 100% of the time when using our real data.
> 


Yeah, some "non-enterprise bits" still take place in reiser4, mostly
because of restricted development resources. Right now I can help only
with 100% reproducible scenarios provided..


> We have a couple of use cases that necessarily involve inherently 
> read-only block devices:
> 
> 1) We want to provide an ISO9660-based installer for our O/S that 
> contains a Reiser4 (kinda-sorta-)root filesystem image that the 
> installer would mount read-only via loopback to inspect certain files 
> prior to dd'ing it to a target disk.
> 
> 2) We want to share a copy of the Reiser4 (kinda-sorta-)root filesystem, 
> which is mounted read-only on a writeable medium, read-only via the 
> ATA-over-Ethernet protocol for use by network-booted instances of our 
> O/S (this is feasible because the *real* root filesystem is AUFS with a 
> couple of additional writeable layers).  The resulting /dev/etherd/eX.Y 
> block device is inherently read-only - if it isn't, we risk write 
> contention and Bad Things.
> 
> Unless I'm missing something, Reiser4 doesn't provide any mount option 
> that would permit safe operation in the above use cases. Btrfs provides 
> a "norecovery" a.k.a. "nologreplay" option that allows suppression of 
> transaction log replay in situations in which the integrity of the 
> filesystem is already guaranteed.


What are you going to do in cases when the integrity is not guaranteed
without log replay?


> Is it possible to add a comparable 
> mount option in Reiser4?  It seems to me that read-only should mean 
> **read only**!


Yeah, it is possible. Reiser4 does not distinguish between critical and
non-critical logs though. However, it is possible to use a 
"write-anywhere" transaction mode (mount option "txmod=wa"), in which only
system blocks are logged. So that *all* logs are critical and you can
not simply ignore them without breaking consistency. Again, here is an
interesting question: what to do with not cleanly unmounted volumes,
specifically, if there are logs to replay? Refuse to mount? Are such
failures acceptable for you?

Thanks,
Edward,
