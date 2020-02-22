Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFEB81691F9
	for <lists+reiserfs-devel@lfdr.de>; Sat, 22 Feb 2020 22:57:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgBVV5r (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sat, 22 Feb 2020 16:57:47 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35467 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbgBVV5q (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sat, 22 Feb 2020 16:57:46 -0500
Received: by mail-wm1-f67.google.com with SMTP id b17so5536911wmb.0
        for <reiserfs-devel@vger.kernel.org>; Sat, 22 Feb 2020 13:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=fZIy+UG2ubKTI2ASXiVYeZiUBFSAAEqvhf/Qo/9NhdA=;
        b=OEu0acpjbdtPY+l47C9KRBJhukiCiA10qvLYCEXD64k6QEwZTWJEdL9Ck+H1tUKt6G
         qMekTwfLH9m0AfPmQhUo0tbUxQeWodU2WaAf8yTYI6ki+gkl49CsOvl39J+jjdea9XIF
         xOqArYRJ0mj4+HWwcmyL9fvyHxGCLbDKld+MnXI0GdrzefmgHHIDu+PO1V0L1WrbKddo
         RN/J0ICtoVhiyKmLHO6ENcPytGlGz4kvE0hKxd/NtUvlTy2r9TZgIlW41ohvclkekbQV
         5AzZljKghlqgjLFZZfng6vzoCgBVyApTIvXya/qnCbrPdoscMkruvKMr9SjkVMOUACCw
         5u8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=fZIy+UG2ubKTI2ASXiVYeZiUBFSAAEqvhf/Qo/9NhdA=;
        b=JJUb1hTX4TLw1Tc+6eE+gKiMcM0wssir7ZUfzxp82ONtxc8w3eTvPB4sTUjLe1Xb9x
         XGnk87XZxeEAMsNbiNgJ0BCYBVvieiO3f3/aQkBCxDXCahcQiXO6i7YzNCgQtiwUZknR
         tv1VjNVG1LYsm01XmI2j6cdhovcbSiCv5Vb9PvUXQsgZHt+3ZVjTLY6B9Ueuq+hvC6e3
         OyXDRjBi4Xwl3aSoouCUe5d9Hm443uhPhmOhVg+70fg8FG91dV7O2yBUl7ztyuXbjDM/
         EU6021Y25tZGuKxHJ6g8gggbImmRkUs5kMkElJ65GbWdTRpFguURub2mYIGRwqZZzRpN
         idWw==
X-Gm-Message-State: APjAAAWtW1VhHM1zMB1e5KWvXJKd+dKL9BKfvUGb3ckqislIFrPSrUcg
        zBNHr+HjJDxZtsh7LpM9UjFU1Tao
X-Google-Smtp-Source: APXvYqxZ8iyGJkk6HufvjFn0S2Fn5/qfNs6OCB9RmbYQtkSBYGMg9m/ieVuyj8J1SGj/6/hFeiy+lQ==
X-Received: by 2002:a1c:e388:: with SMTP id a130mr11802833wmh.176.1582408665101;
        Sat, 22 Feb 2020 13:57:45 -0800 (PST)
Received: from [192.168.0.48] (HSI-KBW-046-005-005-219.hsi8.kabel-badenwuerttemberg.de. [46.5.5.219])
        by smtp.gmail.com with ESMTPSA id h71sm11324982wme.26.2020.02.22.13.57.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 22 Feb 2020 13:57:44 -0800 (PST)
Subject: Re: reiser4 patch for 5.5.1 and fs/fs-writeback.c
To:     Metztli Information Technology <jose.r.r@metztli.com>,
        reiserfs-devel@vger.kernel.org
References: <20200222193446.C495950BFAD7@huitzilopochtli.metztli-it.com>
From:   Edward Shishkin <edward.shishkin@gmail.com>
Message-ID: <fb777d18-bcb6-9bd1-0b30-8e12b5643c21@gmail.com>
Date:   Sat, 22 Feb 2020 22:57:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20200222193446.C495950BFAD7@huitzilopochtli.metztli-it.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org



On 02/22/2020 08:34 PM, Metztli Information Technology wrote:
> On Sat, Feb 22, 2020 at 3:56 AM Edward Shishkin <edward.shishkin@gmail.com> wrote:
>> On 02/22/2020 05:51 AM, Metztli Information Technology wrote:
>>> Niltze, Ed-
>>>
>>> Starting with kernel 5.4.19, linux/fs/fs-writeback.c , at line 2066, changes
>>> from
>>> set_worker_desc("flush-%s", dev_name(wb->bdi->dev));
>>>
>>> to
>>> set_worker_desc("flush-%s", bdi_dev_name(wb->bdi));
>>>
>>> I realized that when I was hacking 5.4.19 and, subsequently, my currently running kernel --as there was no RC3:
>>>
>>> uname -a
>>> Linux huitzilopochtli 5.4.0-4+reiser4.0.2-amd64 #1 SMP Debian 5.4.20-1+reiser4.0.2 (2020-02-14) x86_64 GNU/Linux
>>>
>>> < https://sourceforge.net/projects/metztli-reiser4/files/Reiser4-SFRN-4.0.2_Linux-5.4.20-1-RC2_for-Debian_Buster/ >
>>>
>>>
>>> I have just built 5.5.5-1 and realized, upon applying reiser4-for-5.5.1.patch.gz, that your patch should be modified
>>> Â  accordingly; else, the patch will fail and will necessitate manual intervention, i.e., similar to 5.4.18 vs 5.4.19:
>>>
>>> < https://metztli.it/readOnlyEphemeral/fs-writeback_c.png >
>> so, everything works fine after that "manual intervention"?
> Indeed, Ed. No issues thus far. I upgraded my local dev environment to 5.4.20-1+reiser4 on February 15, 2020; in such environment I have built several PHP-7.3 iterations and I also built kernel 5.5.5-1+reiser4 yesterday. Additionally, replaced 5.4.20-1+reiser4 cloud flavour in a Google Compute Engine (GCE) customized Zstd transparent compression instance -- which hosts multiple PHP and Ruby applications and functions as a media / web server, as well -- without issues thus far.

All the problems comes from upstream. Specifically from VFS and the 
block layer. Not from Debian.
I'll try to prepare instructions on how to find problematic commit by 
bisecting.
The bad news is that the changes coming from there are clearly destructive.
Consider, for example, this "optimization":
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aa65c29ce1b6e1990cd2c7d8004bbea7ff3aff38

What an idiot one need to be in order to lock up a lot of pages at once 
at the VFS level? :((( Sigh..
