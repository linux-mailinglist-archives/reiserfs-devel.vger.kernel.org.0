Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A855168EA0
	for <lists+reiserfs-devel@lfdr.de>; Sat, 22 Feb 2020 12:56:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgBVL4U (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sat, 22 Feb 2020 06:56:20 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45837 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726763AbgBVL4U (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sat, 22 Feb 2020 06:56:20 -0500
Received: by mail-wr1-f68.google.com with SMTP id g3so4960944wrs.12
        for <reiserfs-devel@vger.kernel.org>; Sat, 22 Feb 2020 03:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=8gItbl0BmsMbkpCCr7qxktK9zEPjbUusLMVAYrKVXZc=;
        b=gtd24RcCI7Y4eWjwbKgdSmRNHJJHsNQeA/89/Svj02Q9i1I9CmcUxA2xeBtMEv7ZBP
         Y7x/yd7+NZdJo1CYFE/slofaI6APGNN+WVoLr2QJr7qKUOsIhcRG6hGlKUBYsr1+t1mr
         a6alVC6UczsGc5W8msMneA5NOmDGJ2SdnOCqCPkudMWuTxg2ANLCPWxPgHP6A9rOJTFY
         HaQT0UC1snmYUb23stXb0aLfZSOWNFEiWd3AdFhHEB8zprMDVkrPk9Y3cvIA67od/gse
         fxDajWFhiEbIBL+LfZQG2fDYpdtEEhlGshvZS6IJj2vX4iqe6rNbNBdtMPzjPlTb6fiQ
         mgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=8gItbl0BmsMbkpCCr7qxktK9zEPjbUusLMVAYrKVXZc=;
        b=sWDib1fKu1kv0jF7Ee8tX87+ecFSDx84L1kAOf9LlW/Oy+IlUsTcjU9SzbxG4mYLrg
         yHg5BooCdzq0JRDWV65KcGt+XqCcvz0dBv7FzCdNeeCJJJDBCnyBv8C3VRV50MUDN3JF
         gOvYjCvD15uYrGLWS2luYRZjpD0Rz39TfjXN6/EiIJjZNJ7+Ly9cpxA+ZEVbDtnCtgI6
         AIzCrkOHjeY2SpEokgZ0z74KRFNaOtdNKBec6LMPqmgcu1PNl2AbAqYFkuGxDH+Vgapq
         pBJeHG0FQz0qqHa6tR6hM3ZIw2qLXAxDhIEZthRWFLNYHWuUF1WvuZICGsXQ630EjC0Q
         DHxw==
X-Gm-Message-State: APjAAAUEM3Ki/QEe87Ac88ZWySH7G5e84V5lQiPoU/23aUwt+NmAmMGN
        SeY965WwRXXcivTvlI3Jsw50/OAP
X-Google-Smtp-Source: APXvYqyQHsAWnyrWU80bbaI1auiIA16MPAzpunPNxjEECtsrzP7kqzohHSLYycsQ18tgZYpMrW4CFg==
X-Received: by 2002:adf:e6d2:: with SMTP id y18mr1788563wrm.270.1582372579035;
        Sat, 22 Feb 2020 03:56:19 -0800 (PST)
Received: from [192.168.0.48] (HSI-KBW-046-005-005-219.hsi8.kabel-badenwuerttemberg.de. [46.5.5.219])
        by smtp.gmail.com with ESMTPSA id b10sm8103548wrt.90.2020.02.22.03.56.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 22 Feb 2020 03:56:17 -0800 (PST)
Subject: Re: reiser4 patch for 5.5.1 and fs/fs-writeback.c
To:     Metztli Information Technology <jose.r.r@metztli.com>,
        reiserfs-devel@vger.kernel.org
References: <20200222045124.740D350BE086@huitzilopochtli.metztli-it.com>
From:   Edward Shishkin <edward.shishkin@gmail.com>
Message-ID: <6e90d853-593c-223a-c529-1f8724907bbe@gmail.com>
Date:   Sat, 22 Feb 2020 12:56:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20200222045124.740D350BE086@huitzilopochtli.metztli-it.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On 02/22/2020 05:51 AM, Metztli Information Technology wrote:
> Niltze, Ed-
>
> Starting with kernel 5.4.19, linux/fs/fs-writeback.c , at line 2066, changes
> from
> set_worker_desc("flush-%s", dev_name(wb->bdi->dev));
>
> to
> set_worker_desc("flush-%s", bdi_dev_name(wb->bdi));
>
> I realized that when I was hacking 5.4.19 and, subsequently, my currently running kernel --as there was no RC3:
>
> uname -a
> Linux huitzilopochtli 5.4.0-4+reiser4.0.2-amd64 #1 SMP Debian 5.4.20-1+reiser4.0.2 (2020-02-14) x86_64 GNU/Linux
>
> < https://sourceforge.net/projects/metztli-reiser4/files/Reiser4-SFRN-4.0.2_Linux-5.4.20-1-RC2_for-Debian_Buster/ >
>
>
> I have just built 5.5.5-1 and realized, upon applying reiser4-for-5.5.1.patch.gz, that your patch should be modified
>   accordingly; else, the patch will fail and will necessitate manual intervention, i.e., similar to 5.4.18 vs 5.4.19:
>
> < https://metztli.it/readOnlyEphemeral/fs-writeback_c.png >

so, everything works fine after that "manual intervention"?
