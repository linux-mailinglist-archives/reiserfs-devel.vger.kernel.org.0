Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D139E17AF6E
	for <lists+reiserfs-devel@lfdr.de>; Thu,  5 Mar 2020 21:12:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726049AbgCEUMd (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 5 Mar 2020 15:12:33 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42535 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726007AbgCEUMd (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 5 Mar 2020 15:12:33 -0500
Received: by mail-wr1-f67.google.com with SMTP id v11so6632121wrm.9
        for <reiserfs-devel@vger.kernel.org>; Thu, 05 Mar 2020 12:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=TfORstvWEDWmQQGbs2W2lNu3LlP5Ost0vfMQYHh5VKc=;
        b=NiqQHXWQE/Qw+EdLefr0j7kG9B95EO40PPO/w/JR7z60lN/e1n9hsQOBEfIA8XieW2
         EL+EExo4AdUEdXVBK9/zGNY+QcNo57QNirbQp8AF9tlpq8xwIcUEXxSgcd12ps81TTna
         hNY4EM2HVnAzAKnCSCVVR13jETKq56SyxrE33xBCZe8GxCScTq2sn/7GPpBLqxHEWw2o
         6tzY7x3DmqUpBf3eGlesBfYBirXzhm25quCk+ncDQeB7SlJMnmvOhVmRMoppIrQDXMZC
         eoPFX+n/cxlB8X1b0KR208WaamMJi+lXSRynUGEnFkCdb/PDRzR60RcCFUJJ0Bs8VDab
         KPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TfORstvWEDWmQQGbs2W2lNu3LlP5Ost0vfMQYHh5VKc=;
        b=SrAXJSrH3BqIqdsIVNHKdvJuyGeB5+ulW6Q8m19y9VQkW1xS3I2uJo5XQVtZW/dhsH
         6nQS7qLID/XxXKotVI/jrDyms+txc/ZnToxUblMeEU8B2DmkhqHbqVXhxtzxCHxOGSCs
         75WZ8OHCQ6fUpZf+Nk9Ho/X6nLAkfmJf6qhg5EMfrbaSjSiTCxxncc+y5fkNFxJLylNa
         gZ2kFfapi6TqXaAuC/Wtl2s/5w8wGhpIyszgFYCjjJ6x0RbC+7qpV1xOBKyMpOY0tdeA
         vyuOuu5aFTSy9QjFzAPGr06FbpxM5oOMFOds6zUxKVxf6p06GOrIrSuYq6uIUTm+kqob
         IZWQ==
X-Gm-Message-State: ANhLgQ1NvZs9ZXSSAknhCu70IRikLaQsCHvSspoflr3yY9HBjq9PVCYM
        8SNvQcjzH7UImZfkff2O/a1Ybs7TlCU=
X-Google-Smtp-Source: ADFU+vvbRxxccRD4cSLs3dAZVodDv5hSy2w6jRuVHqWqJgRO/sb9Lkuju9oXa7CxbX9J8vmzcqxhmg==
X-Received: by 2002:a05:6000:1046:: with SMTP id c6mr553214wrx.411.1583439150553;
        Thu, 05 Mar 2020 12:12:30 -0800 (PST)
Received: from [192.168.0.48] (HSI-KBW-046-005-005-199.hsi8.kabel-badenwuerttemberg.de. [46.5.5.199])
        by smtp.gmail.com with ESMTPSA id v8sm11362909wma.28.2020.03.05.12.12.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2020 12:12:29 -0800 (PST)
Subject: Re: Reiser4, SFRN 5.1.3 formatting root fs to install linux
 distribution
To:     Metztli Information Technology <jose.r.r@metztli.com>,
        reiserfs-devel@vger.kernel.org
References: <20200305154933.031CA525B567@huitzilopochtli.metztli-it.com>
From:   Edward Shishkin <edward.shishkin@gmail.com>
Message-ID: <5b2e3459-3790-2f4a-84da-273a6863d79b@gmail.com>
Date:   Thu, 5 Mar 2020 21:12:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20200305154933.031CA525B567@huitzilopochtli.metztli-it.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hello.

On 03/05/2020 04:49 PM, Metztli Information Technology wrote:
> Niltze Ed-
> 
> Regarding reiser4, software framework release number (SFRN) 5.1.3, version of reiser4progs-2.0.0 utilities, is
>   mkfs.reiser4 -yo "create=reg40"

It will work, but it will be suboptimal configuration.

By default reiser4progs-2.0.0 create asymmetric volume (with scaling-out 
abilities), but reg40 doesn't support scaling-out. That is, you will be 
able to add a device to you logical volume, but data of all files will 
go to only one (meta-data) brick :)

Scaling out is supported by a new reg42 file plugin (default in 
reiser4progs-2.0.0). That is, data of files managed by reg42 will be 
distributed to multiple devices.

So, what do you really want? To work with reg40 files on the kernel with 
reiser4 module of SFRN 5.1.3? If so, then you might want to

1) build and install kernel with reiser4 of SFRN 5.1.3 - don't forget to 
turn on "Plan-A key allocation scheme" in menuconfig.
2) format a partition by old reiser4progs-1.2.1 (SFRN 4.0.2) with the 
option "-o create=reg40" and mount it.

In theory you will be able to prepare such partition by new 
reiser4progs-2.X.Y (SFRN-5.Y.Z). The equivalent formatting option is

"-o vol=simple,dist=trivial,keyalloc=plana,create=reg40"

But it doesn't work for now (mkfs segfaults when specifying that option)
- I'll fix it later..

Thanks,
Edward.
P.S. As usual, list of default plugins is available by option "-p" of 
mkfs. List of all possible plugins - by option "-l".
reiser4progs-2.0.0 (5.1.3) has default settings, which are optimal for
new scaling-out features. Unfortunately old file plugins ("classic" 
reg40, as well as cryptcompress "ccreg40", which provide the most 
compact storage, don't make a friendship with scaling-out - use them 
only in conjunction with simple volumes. Well, it is possible to use 
them on asymmetric volume (vol=asym), but, as I said, it will be 
suboptimal - that volume plugin spends more resources, which is not 
justified when using only one device.


>   still appropriate to formatting a rootfs (/) media and/or a partition prior to
> installation of a GNU/Linux distribution, i.e., Debian Buster for AMD64?
> 
> I have already built/embedded the SFRN5 kernel into preliminary metztli-reiser4-sfrn5.iso, minimal netboot installation media
> < https://metztli.it/buster-reiser5/metztli-reiser4-sfrn5.iso >
> < https://metztli.it/buster-reiser5/metztli-reiser4-sfrn5.iso.SHA256SUM >
> and, using the formatting command above, installed onto ~2TB and ~200GB VirtualBox instances with Reiser5 rootfs, i.e.,
> < https://metztli.systems/system/media_attachments/files/000/000/161/original/ca7acd7030d7565b.png?1583319334 >
> < https://metztli.systems/system/media_attachments/files/000/000/162/original/e3e043e640d5ee97.png?1583319358 >
> as well as into a ~100GB physical partition with Reise5 rootfs. But I wanted to ascertain
> the default format command for the hacked SFRN5 Debian installer (d-i) for Buster (stable) distribution prior to making the image public.
> 
> 
> Best Professional Regards.
> 
