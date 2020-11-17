Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E79C2B70B8
	for <lists+reiserfs-devel@lfdr.de>; Tue, 17 Nov 2020 22:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727977AbgKQVLO (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 17 Nov 2020 16:11:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727976AbgKQVLN (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 17 Nov 2020 16:11:13 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9102DC0613CF
        for <reiserfs-devel@vger.kernel.org>; Tue, 17 Nov 2020 13:11:13 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id e18so24018097edy.6
        for <reiserfs-devel@vger.kernel.org>; Tue, 17 Nov 2020 13:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=j4IcoXzUqFMWpCk5Z9AvsqglYcjkhrwOQqL8wGeKYrM=;
        b=T4GhzaQDElLPI+g0KtwxS2vwaYLmN60vHbq7Qf4MaCvC7fHtqKDu3PdIpc/8GUGrFT
         VoiT6qCy/j7CPzFc8LbAFIF5FUyZ4ZBYqdZWGiEzCbyaW1D2nwvSbWdng2bcFdHnlmCI
         98VEFlZZF3k7tKbrACgqWr0CVNsbrVT1iZNr2HQzLHloNIm7HRXnMo5HCebsGtUjzkwF
         RxleEJj5FsDxGz+mO+oJpTw/LvYn1RSMuudVJARPFqx04QD3R0wAd5/Q31bb5dOojV2r
         sqYguLeJ4zgrFsof/NiD1UgC1GORArh90iECeElOqJjOQPbjgLisHb6EAtJF6ssmRK34
         mYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:cc:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=j4IcoXzUqFMWpCk5Z9AvsqglYcjkhrwOQqL8wGeKYrM=;
        b=Qh/piRu26fVWTX9BIdO9tfVZ2yoZwwtORYL63vA6nstai02A/3y/BNehrYO61cDcV6
         urt5A88xENAq1mhTSJTIN7WqzbPAjQHOqgxxghhMpsvoI/3nO1zxDufq9pkktTHIwlFM
         UEosl0lw4XVxuncpBVsXMCBX0q2DJDmJoOl2Rqi3pU4QCwoaPTgnzK+CamAJBqb9Cw90
         STqMhV/IYQISjJOulFM+q957YsHVe3CLc+EXfb0WndwtsEjLb6uCx75t0GfQF+Mg9YVq
         n+hIDibdjDkuDh791OVPO9lkehiHUyEyCdGmE+rtYuddUjCbJYWdvdb7HyKMnNkJsgXQ
         8CUA==
X-Gm-Message-State: AOAM530yy2URt857iH3vuGGI+Be3mKvfFGm4enU3JsLBHchf/vSP9ENH
        E0IXSaLYGI6AUiwKgV5+i3xrP9FxmVM=
X-Google-Smtp-Source: ABdhPJxBU/v5pGVB3wR+i54vmPIvU5QlBJXApLuaD5Ix+vrYXtMHn0clJXnJIUXYb7to6CZTMUspQw==
X-Received: by 2002:aa7:db8a:: with SMTP id u10mr23193977edt.204.1605647471909;
        Tue, 17 Nov 2020 13:11:11 -0800 (PST)
Received: from [192.168.0.48] (HSI-KBW-046-005-005-114.hsi8.kabel-badenwuerttemberg.de. [46.5.5.114])
        by smtp.gmail.com with ESMTPSA id by8sm12603064edb.49.2020.11.17.13.11.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2020 13:11:11 -0800 (PST)
From:   Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4progs - linking to libreiser4 gives "undefined reference
 to misc_str2long"
To:     Matthew White <mehw.is.me@inventati.org>
References: <20201116161230.7be6dcf0@pineapple>
Cc:     ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>
Message-ID: <66031259-74b7-74a7-9ec9-c57651942214@gmail.com>
Date:   Tue, 17 Nov 2020 22:11:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20201116161230.7be6dcf0@pineapple>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On 11/16/2020 04:15 PM, Matthew White wrote:
> Hello,

Hi Matthew,

> 
> I was having problems linking to libreiser4 once it is installed into my
> system, even compiling a dumb program fails (see test-libreiser4.c).


Ummm, indeed, it doesn't work. The next surprise for me is that it
also doesn't work if we build/install reiser4progs rolled back to the
old commits. Whereas reiser4 support in grub also includes libreiser4.h
header:

https://github.com/edward6/reiser4progs/blob/master/grub-0.97-reiser4-20060227.diff

It could happen that I missed something though..

> 
> Compiler: gcc (Gentoo 9.3.0-r1 p3) 9.3.0
> OS: Gentoo GNU/Linux
> reiser4progs versions tested: v1.2.1, v2.0.2, v2.0.3, v2.0.4 (github)
> 
> $ /usr/bin/ld: /lib64/libreiser4-1.2.so.1: undefined reference to `misc_str2long'
> $ collect2: error: ld returned 1 exit status
> 
> I attach the dumb program used for testing 'test-libreiser4.c' and also
> patches to https://github.com/edward6/reiser4progs [master (v1.2.1) and
> format41 (v2.0.4) branches].
> 
> Details are in the patches and also here: https://bugs.gentoo.org/754924
> 
> The solution I adopted is to compile libreiser4 (libreiser4/Makefile.am)
> linking it also to the libmisc convenience library (static libtool).
> 
> Is there a specific reason to not making libmisc an installable library?


I don't know such reasons. I'll merge your patches.
Double thanks for the "format41" branch :)

Edward.


> Or, instead, why not linking libreiser4 to a static libmisc, and then to
> use just libreiser4 when lining demo/* and progs/* (Makefile.am files)?
> 
> Thanks.
> - Matthew
> 
> --
> 
> Matthew White <mehw.is.me@inventati.org>
> 
