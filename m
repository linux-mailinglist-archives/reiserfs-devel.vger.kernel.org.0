Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B112229D8A4
	for <lists+reiserfs-devel@lfdr.de>; Wed, 28 Oct 2020 23:35:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388173AbgJ1Wf0 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 28 Oct 2020 18:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388039AbgJ1Wf0 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 28 Oct 2020 18:35:26 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9628C0613CF;
        Wed, 28 Oct 2020 15:35:25 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id b8so775863wrn.0;
        Wed, 28 Oct 2020 15:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=h23wKbfgYL9kDvhwDDhfkzOxIVFwm98tx6PSZ7ZaPyc=;
        b=d5nxb9PQWiSrB05t/y0VzcAfef9CvGlc7T+yTsKRuP8Lx9+o0VgUozdtP383IzsurZ
         VVfwVtj3gPgmPP269Mz3dmwe7fAuv2rwGzy0dhLMK8iBcKbtaqDz0oY6PIcfsr/WA4Eg
         LCbNnQN3kHdLPRwWjz/FjGxxMZCVA9Fwxug5O3mrPiPsBB9nwEzxokoMkkJFqM+9fYpu
         GxWz5WAR8Gitn6kxf8NXOMcT0PqR2sjrtrOwfXmFfN64yJFdmVE9wvlJ7/Ht4U56h2B5
         7GVBfeMsG27rLvWfmQL4G6w5rXLD3zsJ9rhJPCRV1T9uUYKJyU2TnWWlUu6ltwJFhE9Y
         qajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h23wKbfgYL9kDvhwDDhfkzOxIVFwm98tx6PSZ7ZaPyc=;
        b=GMVWankEpoFuAArjeI2Hva6YKQssnoN0thYNLFek7WWxtE6yuY62BdMDTLqr/FHydH
         Wmu3v6Shiu6hZvH2XkqgCv6+Mu+RfPW4EUX29Z6gVzQIGOdUFalwNIZFYQ+bYuTYDcPb
         ZiqAJze41TstWV4xx4C0NURPwXjNVyrVgYiDVrkZjd8/omLCXn0BYfU5GO5BuwlaqjNc
         xEHwM9RXbhnmDn51sF21dfhbdcGZyUTjh5z+T2sQ/z6L/xylU2tp1t9gsnZnAOhxpDl5
         OCVrsqbUbE10cddwXTCv08msGqf+Zn+UqnkQADbcgQbWLcppU4BWN84Wuubqj75/Pe9r
         aFfA==
X-Gm-Message-State: AOAM531LnefOJfJHOOcrxrHaQ0Sk6onHH1bKwosVRON25dMayaY/XE4d
        4LaJvHD84q9ey/SRJRL1gMhLl7/PcV0=
X-Google-Smtp-Source: ABdhPJzbfpPYavOCxjd2FrFrmJsnTEocICNJpvYVcYHQLVRW+ntIG5czUe7iNPFQ6EOxLuoizI/hig==
X-Received: by 2002:a17:906:3150:: with SMTP id e16mr5084215eje.266.1603847049718;
        Tue, 27 Oct 2020 18:04:09 -0700 (PDT)
Received: from [192.168.0.48] (HSI-KBW-46-223-1-197.hsi.kabel-badenwuerttemberg.de. [46.223.1.197])
        by smtp.gmail.com with ESMTPSA id ck19sm1886941ejb.99.2020.10.27.18.04.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 18:04:08 -0700 (PDT)
Subject: Re: PROBLEM: Reiser4 hard lockup
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     David Niklas <Hgntkwis@vfemail.net>,
        reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201025090422.D80F56FB40E1@huitzilopochtli.metztli-it.com>
 <20201025210758.034aa947@Phenom-II-x6.niklas.com>
 <2e2f8dc4-a48e-f09c-3f41-5dfa7f9a6387@gmail.com>
 <20201027193633.GE5691@mit.edu>
From:   Edward Shishkin <edward.shishkin@gmail.com>
Message-ID: <b46d25c0-9f4a-5483-05f8-c104da20767e@gmail.com>
Date:   Wed, 28 Oct 2020 02:04:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20201027193633.GE5691@mit.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On 10/27/2020 08:36 PM, Theodore Y. Ts'o wrote:
> On Tue, Oct 27, 2020 at 01:53:31AM +0100, Edward Shishkin wrote:
>>>> reiser4progs 1.1.x Software Framework Release Number (SFRN) 4.0.1 file
>>>> system utilities should not be used to check/fix media formatted 'a
>>>> priori' in SFRN 4.0.2 and vice-versa.
>>>
>>> Honestly, this is the first time I've heard about a Linux FS having
>>> versioning other than a major one
>>
>> This is because, unlike other Linux file systems, reiser4 is a
>> framework.
>>
>> In vanilla kernel having a filesystem-as-framework is discouraged for
>> ideological reasons. As they explained: "nobody's interested in
>> plugins". A huge monolithic mess without any internal structure -
>> welcome :)
> 
> I wouldn't call it an ideological problem, but more about wanting to
> assure interoperability issues and wanting to reduce confusion on the
> part of users, especially if images get moved between systems.  There
> is also plenty of way of introducing internal structure and code
> cleanliness without going completely undisciplined with respect to
> on-disk format extensions.  :-)


Have you made this up right now?
I remember very well all the requests for merging reiser4 to upstream
(in 2004, 2005 and 2006 years) - compatibility claims had never been
raised. Especially, it is not a problem to add mechanisms for keeping
track of compatibility at any time.


> 
> Finally, I'll note that ext 2/3/4 does have a rather fine-grained set
> of feature flags, with specific rules about what the kernel --- and
> e2fsck --- should do if it finds a feature bit it doesn't understand
> in the incompat, ro_compat, and compat feature flags set.  This is
> especially helpful since we have multiple implementations of ext 2/3/4
> out there (in FreeBSD, the GRUB bootloader, GNU HURD, Fuchsia, etc.)
> and so using feature bits allow for safe and reliable interoperability
> with the user being warned if they can safely only mount the file
> system read-only, or not at all, if the file system has some new
> feature that their current OS version does not support.  We can also
> give appropriate warnings if they are using an insufficiently recent
> version of the userspace tools.


"Fine-grained" means per-volume decisions mount/not mount/read-only
mount? It is even not yesterday technique. It is an ice age...

Edward.
