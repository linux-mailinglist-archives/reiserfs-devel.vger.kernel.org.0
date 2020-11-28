Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4E62C724B
	for <lists+reiserfs-devel@lfdr.de>; Sat, 28 Nov 2020 23:06:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387757AbgK1VuV (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sat, 28 Nov 2020 16:50:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733310AbgK1SSS (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sat, 28 Nov 2020 13:18:18 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0532C02A186
        for <reiserfs-devel@vger.kernel.org>; Sat, 28 Nov 2020 04:21:31 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id m16so8512300edr.3
        for <reiserfs-devel@vger.kernel.org>; Sat, 28 Nov 2020 04:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=KVhhWQype0NBKYxoEjuYHRsU1J5QRlkGsbFrqhs2oTc=;
        b=MtpWM3I1Ng38YqQ5ke7JQDGUGdBITPYMoj0vufmy0CYvLhRbTEuzEGKo93H1gGo06A
         7hCgnSdJl3hv3KGmaen9Faq2EmuQY58BShG2AFi1ZLEPxXxD2GXMR1BrU/nevASF4rHp
         8njHtOcb/zCEJsrHe+qYJb60zYTGaaXKeChxxX80Z/f0+2Z0Z+mRGjpsWjAIXWGKxUfw
         Ls/B+cwUjmr49GxUeiUDf1uVgpfvKynWoWVIGb+mVzT0Ink9yltMGUoR+QhIFOAGiRQV
         a/7oCBHjoxERiIBxh2PiPFSvHVeWK3m1IdGa39lRKFlP0WopYqHTP3wH8IIY6hZDgqqv
         53hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KVhhWQype0NBKYxoEjuYHRsU1J5QRlkGsbFrqhs2oTc=;
        b=EYX2zeqkgqPXeFzwmM7Maegi13r+mC2caIOp7giB1QF2sBZ5DHlO9sJpiRUZIDIp00
         YELHY06MxMbZjeqvg3rYTbOebomqBh8BYMbqxNXa/ntZmmkYYo4d4n1Sv55Fi/WmPHVF
         D+jvCymcx4jJQNeyg11bmAtEAYQA3l+v/0u2gLdogchqoSwgOEtBbniub9OrXhx78cmR
         v2dS5EHVkkzKo8VRsUwSSrJ972lhhwishNT4ccjKYwMuVnmlKqQTFONoYPjSwkJhDGfu
         ghRrSMOwoZsY7Pn43h+klJ5RAQGMvaWoofJSgr6mhKiNXOS2PZ4kToz4GpICnsDYmUOm
         KFKA==
X-Gm-Message-State: AOAM533Y93zuLeUkSlqmGCX2HZcXki9qVdpnlKC6LQqi4nR/14Jt9PrX
        5bOjghc9lx+1rHmQINu1TM2cfh9UleM=
X-Google-Smtp-Source: ABdhPJy8dgvO5fiMfU/m1+q2JsJyEZ0yTr9R2pjKPVPxMpHBUTvVtyD8R44rzizlObiikKTQvdnmsQ==
X-Received: by 2002:a50:8f64:: with SMTP id 91mr12762965edy.310.1606566089744;
        Sat, 28 Nov 2020 04:21:29 -0800 (PST)
Received: from [192.168.0.48] (HSI-KBW-46-223-1-182.hsi.kabel-badenwuerttemberg.de. [46.223.1.182])
        by smtp.gmail.com with ESMTPSA id i7sm699203edr.61.2020.11.28.04.21.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 28 Nov 2020 04:21:29 -0800 (PST)
Subject: Re: reiser4progs 2.0.4 SFRN5 warnings during Debian Buster AMD64
 builds
To:     Metztli Information Technology <jose.r.r@metztli.com>,
        reiserfs-devel@vger.kernel.org
References: <20201128073904.28F7E71BAB5B@huitzilopochtli.metztli-it.com>
From:   Edward Shishkin <edward.shishkin@gmail.com>
Message-ID: <58236ce8-d824-4d59-6fdd-1d14a393dda5@gmail.com>
Date:   Sat, 28 Nov 2020 13:21:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20201128073904.28F7E71BAB5B@huitzilopochtli.metztli-it.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On 11/28/2020 08:39 AM, Metztli Information Technology wrote:
> Niltze [Hello] Ed-

Hello.

> 
> This afternoon/evening I built reiser4progs 2.0.4 SFRN 5.1.3 DEB/UDEB packages for Debian Buster backports AMD64.
> 
> I was somewhat concerned about the copious warnings -- which can be located using grep on the log attached below.

It's all cosmetic.
Some fixups should be ported from the master branch.

> 
> And simply wanted to confirm with you those will not introduce unintended results in the utilities built:
> 
> mkfs.reiser4
> fsck.reiser4
> volume.reiser4
> measurefs.reiser4
> debugfs.reiser4 >
> Best Professional Regards.
> 
> P.S. There is a typo in
> 
> 
> ---
>   doc/volume.reiser4.8 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/doc/volume.reiser4.8 b/doc/volume.reiser4.8
> index f2a3485..874b7c5 100644
> --- a/doc/volume.reiser4.8
> +++ b/doc/volume.reiser4.8
> @@ -63,7 +63,7 @@ Print information about a brick of serial number N in the volume mounted at MNT.
>   Run a balancing procedure on a volume mounted at MNT.
>   .TP
>   .B -z, --resize DEV
> -Change data capacity of a brick accociated with device DEV in the
> +Change data capacity of a brick associated with device DEV in the

Thanks,
Edward.
