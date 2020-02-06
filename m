Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7DC6154C9C
	for <lists+reiserfs-devel@lfdr.de>; Thu,  6 Feb 2020 21:04:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbgBFUEs (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 6 Feb 2020 15:04:48 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55872 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727773AbgBFUEr (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 6 Feb 2020 15:04:47 -0500
Received: by mail-wm1-f66.google.com with SMTP id q9so148294wmj.5
        for <reiserfs-devel@vger.kernel.org>; Thu, 06 Feb 2020 12:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=ssLOk1hJ8PWYpoMSkhRiq3ccs7pg/MrHErCZjZOPj+E=;
        b=LHvptJCEzpw+nZd4C2zdNZL1QsC0tYW/8AIApd/W+TE+G6YbEu5XLKcXkizLBtRknD
         b+OsGpvfugXz+2CJDS4TIJeydLZXo9Ta23DEio4md9YDTtodEk128cDSuQl0WlEsbMcq
         zXRlVqrL9jgLgYq0DHECDSd6WX/SrmgJqnW5zeUZj1UI1yxkPWbLMayzb5EkBLeZECQa
         Tou2XMctqszt390hrnRz22t6vBhcAHhd0i6ye+WDrkdlbCZuZvMjPAzO0IQMt0cwvdOG
         mXC3vnH0yNTgs7uDlzDn8IwP2Ddto24uqwgKFOADdnSTahftqma6PYYV7IwVE/Vd5N3V
         g5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ssLOk1hJ8PWYpoMSkhRiq3ccs7pg/MrHErCZjZOPj+E=;
        b=mPXhh1Y4lPHIrOYuzqMkDRQRYcTb8m84tpRsA71RrIm0jd6NYgCNjc5DJirWPCeAhF
         XPAyRAQfh9uJpD0z2vk/NwAc8cMZIxLJtGV/oGPN0iwt32B5LTDXAL+VRWzgSS3sDFw7
         tsktooq9LklnK3n9YWCqZMY08mOm6iBz+bMUYLcUdUD8zhb1dxkBnnwleTkAj9tHyYiR
         /WuGmHDQJo0RRnbuCEvXl8y8M+Stwvi4qjoq22AJTvN6ytAvoU6WLUvq59C2b6KgLb4W
         ZdpDO7ZhriynFNqOxQjose0MSB13wLyh3UAxMmdeC0zA8T9H1M2mL23bGxaPDhsuQb2f
         oLUA==
X-Gm-Message-State: APjAAAVL/sDeCnDlcUBMiEtdg0+f3hjxbBzJPJJRgM9LjUk8YOE2AmFy
        /u15d5IwgxgqRvD9u5M5J1wA69msor0=
X-Google-Smtp-Source: APXvYqwyA5YvolSp6xV+sHUd0zW8LbFQX/5zbuzS1o/Bt8CQLTIN3qXNijeGB6lZ1RnqTkLoL0hkzA==
X-Received: by 2002:a7b:cf39:: with SMTP id m25mr6338280wmg.146.1581019485213;
        Thu, 06 Feb 2020 12:04:45 -0800 (PST)
Received: from [192.168.0.48] (HSI-KBW-46-223-1-245.hsi.kabel-badenwuerttemberg.de. [46.223.1.245])
        by smtp.gmail.com with ESMTPSA id t10sm622921wmi.40.2020.02.06.12.04.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Feb 2020 12:04:44 -0800 (PST)
Subject: Re: [PATCH] reiser4: prevent system lockups
To:     Metztli Information Technology <jose.r.r@metztli.com>,
        reiserfs-devel@vger.kernel.org
References: <20200206141241.DE8584E43813@huitzilopochtli.metztli-it.com>
From:   Edward Shishkin <edward.shishkin@gmail.com>
Message-ID: <54056db9-4013-dad5-dbd0-d9d0e350c17c@gmail.com>
Date:   Thu, 6 Feb 2020 21:04:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20200206141241.DE8584E43813@huitzilopochtli.metztli-it.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On 02/06/2020 03:12 PM, Metztli Information Technology wrote:
> That is 'one hell of' a shrewd finding, Ed!
>> On Tue, Feb 4, 2020 at 4:24 PM Edward Shishkin <edward.shishkin@gmail.com> wrote:
>>
>> Hi all,
>>
>> Starting from Linux-4.15, VFS introduces optimizations, which
>> are incompatible with Reiser4 (as well as with any FS possessing
>> an advanced transaction manager). Here is the problematic commit:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aa65c29ce1b6e1990cd2c7d8004bbea7ff3aff38
> Indeed, I knew *something* had changed but I focused heavily on confirming the validity of my reiser4 hacks; additionally, I began
> examining attentively multiple Debian packaging for Linux major.minor changes, custom debian patches, as well as the packaging custom default .config
> --believing the Debian Kernel Team modifications might have had introduced the hanging issue, Sir.
>> The attached patch fixes the problem. This patch is against
>> Linux-5.4+reiser4. Please, apply.
> 5.4.6 [?]

Yes, against Linux-5.4.X+reiser4-for-5.4.6.

Also I've uploaded reiser4-for-5.4.17, which already contains that fixup:
https://sourceforge.net/projects/reiser4/files/reiser4-for-linux-5.x/

Edward.

>
>> Later I'll prepare backports for all the mentioned kernels and will
>> put them on Sourceforge.
> Cool! I was notified of your latest reiser4-for-5.4.17.patch.gz release.
>
>> If someone urgently needs a backport, then
>> let me know.
>>
>> Thanks,
>> Edward.
> Your dedication and outsized efforts toward maintaining and enhancing REISER4 are MUCH ADMIRED and APPRECIATED, Ed, THANK YOU!
>
>
> Best Professional Regards.

