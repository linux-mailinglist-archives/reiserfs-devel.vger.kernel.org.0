Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B898F3ADFA0
	for <lists+reiserfs-devel@lfdr.de>; Sun, 20 Jun 2021 19:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbhFTRrn (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sun, 20 Jun 2021 13:47:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbhFTRrm (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 20 Jun 2021 13:47:42 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E75DC061574
        for <reiserfs-devel@vger.kernel.org>; Sun, 20 Jun 2021 10:45:28 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id z12so15844513edc.1
        for <reiserfs-devel@vger.kernel.org>; Sun, 20 Jun 2021 10:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=/0JkYZFOFTiVQwfdqrwqNFO1ekacGZPU/6iRM/c6W0g=;
        b=L+q4GdHoMfaZdklCBgtr/Pk3a2ZNn9QlLuvtvmjM9NY3NSUV8Aawdjqblxy0jqGNzc
         2/e76SARJroXZXgA3rSWNiVxAwrWffBY7yEwjTgI5A/lyR2W0IsEtB1BT99IM37hRpa8
         lt+KmryfnlrSP6k9LOAXhMXxSClxrpVRwdoJAC5ImRtBNuXZuqlnrEVgEEnrSU2fRMx0
         oEJ6OrALB2NSwyPgKo2AEPbClUJ7FdZEJnn43yUqIkMRf69rawYSW9emzGUWZtJ0ed8r
         OxH6U6DLZHBI/HaDz8/lo7VQmnCAvNCQ39KivjSNPhYInKeT8CVtxhOgezS0n8NmH5Ui
         xLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/0JkYZFOFTiVQwfdqrwqNFO1ekacGZPU/6iRM/c6W0g=;
        b=M/6k7yH5s7gUp1T2HW95bAj4jhGbqkJWCpqar9rubwtaeeDidXQhIwF69V5S8CfjDm
         ZDBw/Dtj5akKnLVSNsw0cNw3nydzvWCXTD3dgRDNukNfDCZPca5qoQzt1USSNQ26eQM4
         3JsFdZsG7QMkQ+Pes8lInyfuD5VCjJePctd0P3uoBE1Ecg2FscdrGMbda6+nFNMy8DIz
         Lc22E+BssuqwYVJNRz8hax4L551MP6ywV1gA83QHW65/11pYMLq5BLveqJDwyXIKIGht
         jptpacAQEHAnWOJ+MgNb0l4BEZ21oep7ZKIHWMjuUnkUHSf6EpFLhFDYI5nDOas1FzFP
         OzTQ==
X-Gm-Message-State: AOAM532I9qY/+tla4t3Shy8cf5Z1y0PBSGzt9FLkkl8jI2o1xs/Ne/wE
        qXId+5bOBkr3MZrHDzTPjy4p3Zr6xRU=
X-Google-Smtp-Source: ABdhPJx7+Pj9tMZegrKEGYSKdo5j/8B+ILRD4KKaEIhj/sqNt0uGajbsg7maN1jX74Fnlw7HeyA89Q==
X-Received: by 2002:aa7:d801:: with SMTP id v1mr17083053edq.349.1624211126033;
        Sun, 20 Jun 2021 10:45:26 -0700 (PDT)
Received: from [192.168.0.48] (HSI-KBW-046-005-005-132.hsi8.kabel-badenwuerttemberg.de. [46.5.5.132])
        by smtp.gmail.com with ESMTPSA id d17sm3749311ejp.90.2021.06.20.10.45.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 20 Jun 2021 10:45:24 -0700 (PDT)
From:   Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [reiser4 SFRN 5.1.3] kernel [5.10.x] read not supported for file
 /test-exec \(pid: 10094 comm: debootstrap\)
To:     Metztli Information Technology <jose.r.r@metztli.com>,
        reiserfs-devel@vger.kernel.org
References: <20210208125427.CFC7C75EED90@huitzilopochtli.metztli-it.com>
 <e37d5585-318e-3130-82c9-7a740b9af8af@gmail.com>
Message-ID: <1f342fdd-0c30-06df-012c-4425d94d942f@gmail.com>
Date:   Sun, 20 Jun 2021 19:45:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <e37d5585-318e-3130-82c9-7a740b9af8af@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On 02/08/2021 05:03 PM, Edward Shishkin wrote:
> On 02/08/2021 01:54 PM, Metztli Information Technology wrote:
>> On Wed, Dec 23, 2020 at 3:40 PM Edward Shishkin 
[...]

>>>
>>>
>>> Hello.
>>>
>>> This is because of VFS changes in Linux-5.10.X.
>>> Specifically, because of the following patch:
>>> https://lkml.org/lkml/2020/8/17/174
>>> In the upstream git repository it is commit 4d03e3cc59828c82ee89ea6e2
>>>
>>> So, Christoph, what to do now for file systems which implement
>>> ->read() method of file operations?
>>
>> *deafening silence* it appears that -- in the best of cases -- 
>> Christoph engaged in an act of _iter masturbation [1];
>> and in the worst of cases, the gentleman was aiming straight at reiser4.
>>
>>> ... It seems that chroot doesn't work
>>> for them. And people are not able to release distros with upgraded
>>> kernels..
>>
>> Not only 'chroot doesn't work' for us, but even after replacing the 
>> kernel in a reiser4 (proper SFRN ;) instance and
>>   upon an initial Linux 5.10.x kernel boot:
>> ...
>> kernel read not supported for file usr/lib/systemd/systemd (pid: 1 
>> comm: run-init)
>> kernel panic -- not syncing: Attempted to kill init! exitcod=0x00000100
>> ...
>>
>> Fact is some of us have commercial interests when deploying reiser4, 
>> both in cloud instances, baremetal, and on-premises.
>>
>> In the future if -- and only if -- our reiser4 efforts come to 
>> successful fruition, quite likely in due time we will be
>>   able to financially commit to the Penguin's Linux Foundation temple, 
>> just like large corporations do
>>   in exchange for indulgences[2] which virtue-wash their past and/or 
>> current corp. officers' *substantially darker deeds*;
>>   heck, 'indulgence trafficking' seems to assuage->numb->arg(STFU) 
>> that 'virtuous' cult of GNU/Linux
>>   developers/gatekeepers/maintainers' frivolous, *narcissist*, ethics 
>> and/or moralities so often piled up against
>>   Reiser's work --which, paradoxically(!?), actually was largely 
>> implemented by Russian developers ;)
>>
>> In the meantime, I hacked a reverse patch that undoes some(all) of the 
>> surreptitious lethal attack on reiser4 fs
>>   -- at least on AMD64 architectures (I did away with other 
>> arch/Kconfigs).
>> And no, I am not a git pro-, undoing what I could of commit 
>> 4d03e3cc59828c82ee89ea6e27a2f3cdf95aaadf (as your hinted, Ed)
>>   does not fix the 'kernel read' issue.
>>
>> Notwithstanding, I would appreciate if you can take a look at the 
>> attached patch. Probably it can be streamlined and/or improved
>>   further to minimize pain on subsequent Linux kernel upgrades.
> 
> 
> That patch is an attempt to swim against the current ;)
> 
> I no longer remember, why they want to get rid of set_fs for already 15
> years, but ->read() and ->write() methods seem to be deprecated, and the
> correct way would be to implement the new ->read_iter() and write_iter()
> methods, where reiser4 works with "chunked" streams, represented by
> iov_iter structure, rather than with "continuous" streams, represented
> by char __user *buf. The task is not that difficult, but rather time
> consuming - I don't have a time for this right now..


So, I have implemented ->read_iter() for all plugins (*). It is included
to reiser4-for-5.12 stuff. Not sure if it is enough to make distro with
root over reiser4 though: ->write_iter() is not yet implemented (not so
trivial because of transactions).

(*)
https://github.com/edward6/reiser4/commit/ac72aba7e8bb16a28755c1b2b762971927d17c3c

https://github.com/edward6/reiser4/commit/4d3200fbcb2003c680cdb822e3f616d3fa83c391

Edward.
