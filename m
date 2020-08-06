Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C49823D4BC
	for <lists+reiserfs-devel@lfdr.de>; Thu,  6 Aug 2020 02:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbgHFAh1 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 5 Aug 2020 20:37:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbgHFAh0 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 5 Aug 2020 20:37:26 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BF64C061574;
        Wed,  5 Aug 2020 17:37:26 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id k8so8037072wma.2;
        Wed, 05 Aug 2020 17:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=q437G4wSOATln/xMsM+PNrrp8wCttyK7eIPhtP2hGbI=;
        b=CSXrsdzjMinZODnr1IBV+RwU9sqtKNnURzpmlqNyJ57hjWKkdUlGuacNZWYr8hzfGw
         WaHcmEaeusY/CjIupTqLFqVAntNpms4xbZgDNQiyM5BscyEbmTh6Bl5tL6nmmvJbi7jP
         AE+aRpKO/aAwfudat47CZrUNNpE9cJI/ZKpGpooHq3ZcItpCGKPm8IclQadvCFJmgnvQ
         shrVQeQ3fjrTkxUN5mg+T9JqgUEeEXRwQjuj7yITMxVihRnfXIPu93MN7yC0O8v4tjtE
         TIrZmEjetLcJmLHxfBrYw5rdD4SmJm1UAIIMWVNkKIo+h1DHiX3BAVyPG8nwoL87BZp4
         cCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q437G4wSOATln/xMsM+PNrrp8wCttyK7eIPhtP2hGbI=;
        b=fP1HVOGudkOKewDfSiob6vQ9tfvEsJKsJaK76BXErfV4ee9eX4yRKPvR03AYScrHP6
         F4jyHSHSsk2LscJJOMqOk4l4wTwuyUTum/auoFUKhXWZ86zXaTfKOJGxdgIZzWXnYawz
         bzsNkCKmnuL0z5HbFrjCPiEux5e+t9qO92NKLSw83sm4XptDnURwTLMcet+3zb9NUVW9
         kbHyLkH1suJ5V76kkKvyhC1TvEsKplTKNpYWK7g3nzKxWf5i+61pkVMPZgrnqp4+pVaQ
         jfDfdYJbQaXbea9hiTv/GrBHfyzTSq/FfeIlV3LZMlSo5hqBuSmW3dGNANsLFKfdWwVU
         dUig==
X-Gm-Message-State: AOAM531TvatJIzjfHq+a6VWhfgnJ6gBmSHT+9Tdpyh/wKKnIdudfWE7/
        0etpDjEN0QCYeVX64Mc1RdRJHn2Z
X-Google-Smtp-Source: ABdhPJzAvjPRa0UqX9emAYM8XrmH230ZtS84QH6wVliA/qlkOAY4iuUSJtR7GKkI8JcpFAHTYxCAZg==
X-Received: by 2002:a1c:9616:: with SMTP id y22mr5398202wmd.100.1596674244469;
        Wed, 05 Aug 2020 17:37:24 -0700 (PDT)
Received: from [192.168.0.48] (HSI-KBW-046-005-005-186.hsi8.kabel-badenwuerttemberg.de. [46.5.5.186])
        by smtp.gmail.com with ESMTPSA id i14sm5328166wrc.19.2020.08.05.17.37.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Aug 2020 17:37:23 -0700 (PDT)
From:   Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: PROBLEM: IO lockup on reiserfs FS.
To:     Hgntkwis@vfemail.net, torvalds@linux-foundation.org
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        reiserfs-devel@vger.kernel.org
References: <20200728222041.5d88b2e1@Phenom-II-x6.niklas.com>
 <20200728223440.0fd8681e@Phenom-II-x6.niklas.com>
 <20200805125317.10bf1d34@Phenom-II-x6.niklas.com>
 <CAHk-=wiGsj_R7pspFegPgtT4on1iYk5MmBz8uZZ3338EH3HO+Q@mail.gmail.com>
 <20200805200129.0ce62f36@Phenom-II-x6.niklas.com>
Message-ID: <3dbeff43-0905-3421-4652-41b7a935f3c1@gmail.com>
Date:   Thu, 6 Aug 2020 02:37:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20200805200129.0ce62f36@Phenom-II-x6.niklas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On 08/06/2020 02:01 AM, Hgntkwis@vfemail.net wrote:
> On Wed, 5 Aug 2020 12:51:41 -0700
> Linus Torvalds <torvalds@linux-foundation.org> wrote:
>> On Wed, Aug 5, 2020 at 9:53 AM <Hgntkwis@vfemail.net> wrote:
>>>
>>> It's been over 1 week since I sent this into the reiserfs-devel
>>> mailing list. I'm escalating this as the kernel docs recommend.
>>> I'm still willing to help debug and test a fix for this problem.
>>
>> The thing is, you're using an ancient 4.14 kernel,
> 
> Sorry, I didn't realize kernel development went that fast.
> I did try to go to the 5.X series, but the AMDGPU drivers don't work on
> my SI card anymore (I need to bisect which takes time and many re-boots
> to find the problematic commit).
> I'll try the Radeon-SI driver and see if I can reproduce this reliably.
> 
>> and a filesystem
>> that isn't really maintained any more. You'll find very few people
>> interested in trying to debug that combination.
>>
>> You *might* have more luck with a more modern kernel, but even then
>> ... reiserfs?
>>
>>                Linus
>>
> 
> Why does no one (I've met others who share a similar sentiment), like
> reiserfs? I'm not looking for fight, I'm incredulous. It's a great FS
> that survives oops-es, power failures, and random crashes very very well.
> It's the only FLOSS FS with tail packing.
> 
> Thanks,
> David
> 

Hi David,

The feature of "tail packing", that you need, is brought to perfection
in Reiser4 file system. Other file systems either don't provide tight
packing of records in the storage tree, or they are read-only. You just
need to manually patch (*) the kernel and install a pair of user-space
packages (**).

The latest stuff (against Linux-5.7) is stable. For older kernels you
will need a backport for some fixups (***). We can prepare it for you.

Reiser4 is fully supported. If any problems (including partition
check/repair) - send a message to reiserfs-devel mailing list.

(*)   https://reiser4.wiki.kernel.org/index.php/Reiser4_Howto
       https://sourceforge.net/projects/reiser4/files/
(**)  https://sourceforge.net/projects/reiser4/files/reiser4-utils/
(***) https://marc.info/?l=reiserfs-devel&m=158086248927420&w=2

Thanks,
Edward.
