Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00E0458B50E
	for <lists+reiserfs-devel@lfdr.de>; Sat,  6 Aug 2022 12:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbiHFKe5 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sat, 6 Aug 2022 06:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbiHFKe5 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sat, 6 Aug 2022 06:34:57 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5311413DFD
        for <reiserfs-devel@vger.kernel.org>; Sat,  6 Aug 2022 03:34:56 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id x21so6112221edd.3
        for <reiserfs-devel@vger.kernel.org>; Sat, 06 Aug 2022 03:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:cc:in-reply-to:content-transfer-encoding;
        bh=akdRVEUH241zFUlARmehFKlEyxn9+IeT+nWUi+XvxtQ=;
        b=bqCG/Pwu8G8evXcnUycSUPkGYR8n/IBYr89vfi/2s7d1QgbQYOK6FqjV8jRajoIp1h
         Gr/h0q6QB97YFJzsnEDocfI0JydFkr3QzxX5FKlhGSXvGVBlt16uP7PAPPQ2hU8bK0hu
         sKogleec1UnPj8gOPa5HfMQOxATYGz2wmwJPQD/7PH2KygXaK+YiaigOinuNHFZIfufH
         GqkQNKDuc69zjYeO+ESgoc/RmgLLykjeK0i7IqezHwLY9wIPDGCV9EWdoynAbA2sfYEr
         H3EVGEbShLt8axUFLjcJuSs/5tFkRK2jSAUyW43YLiYQdZqn7BPEbUlTMKy5DF6W70i4
         Yi+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:cc:in-reply-to
         :content-transfer-encoding;
        bh=akdRVEUH241zFUlARmehFKlEyxn9+IeT+nWUi+XvxtQ=;
        b=M1VmZZXH3+wYsJsWqw3ItlnCwEjHS/f85gei6EvxGCnKMgSF2A1+5AdlLBrVeUIqY3
         Cu1rGpCZS3SEVhSAWIngfrS7uArvOY6VNbEOsa7MqSA+aVK3XB3Q6Zy3wb3E/5iZDul2
         xgRW8TtG/NRDyrvwnyG0dotjCwQ3N0YA9ZhLrpQRC7VZQ4vgiqeN38lqxP/whV94LY72
         YGWzOjrCSHNPWAGFMCyyhimk3ul1cryd3JqJp8imyYgnKxZd0qTtd8fCY5om2QHrNuwA
         ehoFClOgdVdMa11G7SDSwSl/LFeg8wOIURsqKwaVyUDepO/r+DHzRqTWt+oW01yDiIsC
         Zebw==
X-Gm-Message-State: ACgBeo0d5upAQ5vhrL7cpK9SSYod8EInfwFS1mTCfWM6i7k4bAcUjJhN
        buOKvpwHwOqNT1kEcb3Oi4IqIX6CkqxDRQ==
X-Google-Smtp-Source: AA6agR6pDVE9VMG/qGZCsszRvTHUMzzHL6jNA/qUEdk4mZeUQ13dJXan0JwV5wZ+scO+TjYvzFNR1w==
X-Received: by 2002:a50:ee92:0:b0:43d:ffb:2258 with SMTP id f18-20020a50ee92000000b0043d0ffb2258mr10146957edr.416.1659782094950;
        Sat, 06 Aug 2022 03:34:54 -0700 (PDT)
Received: from ?IPV6:2a02:8070:a181:6100:edfc:7362:8f5e:f8e8? ([2a02:8070:a181:6100:edfc:7362:8f5e:f8e8])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906211100b0072af92fa086sm2581765ejt.32.2022.08.06.03.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Aug 2022 03:34:54 -0700 (PDT)
Message-ID: <2689ffc5-b0a8-6199-4df5-55b462792d8a@gmail.com>
Date:   Sat, 6 Aug 2022 12:34:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: 5.17.0-3+reiser4.0.2-amd64 SFRN 4.0.2 crash in local development
 machine part.
Content-Language: en-US
To:     Metztli Information Technology <jose.r.r@metztli.com>
References: <20220805043523.E6E96A86C50@tezcatlipoca.metztli.it>
From:   Edward Shishkin <edward.shishkin@gmail.com>
Cc:     reiserfs-devel@vger.kernel.org
In-Reply-To: <20220805043523.E6E96A86C50@tezcatlipoca.metztli.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLACK autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hello.

This flood of warnings is because of no memory to perform compression
at transaction commit time, when the file system can not fail.
A possible solution is to fall back and commit uncompressed data.
Still in todo (AKA never-do :) list.

Edward.

On 8/5/22 06:35, Metztli Information Technology wrote:
> Niltze [Hello], Ed-
>
> Linux tezcatlipoca 5.17.0-3+reiser4.0.2-amd64 #1 SMP PREEMPT Debian 5.17.12-2+reiser4.0.2 (2022-06-10) x86_64 GNU/Linux
>
> Another (ugly) failure with the modified reiser4 SFRN 4.0.2 dealt with in my last email
> < https://marc.info/?l=reiserfs-devel&m=165861866731480&w=2 > to the list. I am just recovering from an local umount op which left
> another reiser4 SFRN 4.0.2 partition in an inconsistent state and while the recovery operation is ongoing I get this
> via dmesg:
> ...
>
> [355209.443969] reiser4[DOMCacheThread(23260)]: checkout_logical_cluster (fs/reiser4/plugin/file/cryptcompress.c:1992)[edward-1430]:
>                  WARNING: alloc stream failed with ret=-12
> [355209.443975] reiser4[DOMCacheThread(23260)]: assign_conversion_mode (fs/reiser4/plugin/item/ctail.c:1577)[edward-1021]:
>                  WARNING: convert_ctail: nothing to attach
> [355209.444008] reiser4[DOMCacheThread(23260)]: checkout_logical_cluster (fs/reiser4/plugin/file/cryptcompress.c:1992)[edward-1430]:
>                  WARNING: alloc stream failed with ret=-12


