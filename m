Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAFA829A1F1
	for <lists+reiserfs-devel@lfdr.de>; Tue, 27 Oct 2020 01:53:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439235AbgJ0Axf (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 26 Oct 2020 20:53:35 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:43275 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410206AbgJ0Axf (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 26 Oct 2020 20:53:35 -0400
Received: by mail-ej1-f67.google.com with SMTP id k3so16858204ejj.10;
        Mon, 26 Oct 2020 17:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ruMA5nzaXoeFAnvA+h4f1K52oHp0phNfZLmBzayTOIk=;
        b=JmthtUqp1yozHGA/fnwa9FuqdjTxxtkEpg3acmm0Il/MCXUebcZFpS9yE9absYSFcI
         Ojo2ceuQQoFSUcNXYphdioA3WhEtSO04LW6P/KjdqkpyizpUYQLsFm/Cgm6nevNY/UPi
         2QhtvSumIXJXZJuHeXApB5gFHC9PSe+Cnn+H6fuTYgng5Zd4pYh1HEDtsTEMfSa4qJwd
         G96YZY7KFqE7rCadfbNGPVc4esXIVv5BeZbWIWwk+USFxOmUnJ/qd5tDpuMHeewMJBO9
         aIcY8W1tsH5jYl2K8dQhx/rJ8KGC3TCRLzsgCpGklvMmxpP7h8226Yj6XHnuqOejhtJu
         fhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ruMA5nzaXoeFAnvA+h4f1K52oHp0phNfZLmBzayTOIk=;
        b=dZdp1m3t7SquNSxhGmDcVCy33dbFxNpCU/5Hip1G4jEJo/ksQ4a+d5FpnjLhZFjxQh
         ODbx8aL1aubx4A+2QPptnkc0fnJmvMEzO7PVLKvlr0WnZ47de+sEr5+jMcjFogAfYtis
         pNcL04Lz9C5N1hNTY6YhFt9QTHUpcsoKj0dJjiRyGCKN65DVINMzbt6ebdwkS7o/swao
         QV/LVG3UGqZyJjT19XSkANmkYhmLD1Q+SsCCBOtWjn4goTWc8DlWsTD6BT+u+de8Syeh
         lgAWuYFLN1GLbn4X8afqDh2X95zS8ZHbqUe3S2to2QJNOqZVs5zzTrRbYBROlleUbJ8/
         mZ8A==
X-Gm-Message-State: AOAM532q6uYb1adBfzgRBpYKcjJtA3HXblQ0hRlX0SLA59nyDiSTN5yP
        ljQ/ZohVUql2heBP7mTPlD85Pkm0ECk=
X-Google-Smtp-Source: ABdhPJx06IO2Eu2wL0vb2Whkfk7Zz17Tq0S+jdUCxUlEYnjtnSrdrKzV0Jt390n7wGEIc+tESycn3w==
X-Received: by 2002:a17:906:38d9:: with SMTP id r25mr18927925ejd.8.1603760013287;
        Mon, 26 Oct 2020 17:53:33 -0700 (PDT)
Received: from [192.168.0.48] (HSI-KBW-46-223-1-197.hsi.kabel-badenwuerttemberg.de. [46.223.1.197])
        by smtp.gmail.com with ESMTPSA id 11sm6695921ejy.19.2020.10.26.17.53.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2020 17:53:32 -0700 (PDT)
Subject: Re: PROBLEM: Reiser4 hard lockup
To:     David Niklas <Hgntkwis@vfemail.net>
Cc:     reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201025090422.D80F56FB40E1@huitzilopochtli.metztli-it.com>
 <20201025210758.034aa947@Phenom-II-x6.niklas.com>
From:   Edward Shishkin <edward.shishkin@gmail.com>
Message-ID: <2e2f8dc4-a48e-f09c-3f41-5dfa7f9a6387@gmail.com>
Date:   Tue, 27 Oct 2020 01:53:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20201025210758.034aa947@Phenom-II-x6.niklas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On 10/26/2020 02:07 AM, David Niklas wrote:
> I'll reply to both of you in this email.
> 
> On Sun, 25 Oct 2020 02:04:22 -0700 (PDT)
> Metztli Information Technology <jose.r.r@metztli.com> wrote:
>> Niltze, David-
>>
>> A few observations are in order below:
>>
>> On Sat, Oct 24, 2020 at 1:39 PM David Niklas <Hgntkwis@vfemail.net>
>> wrote:
>>>
>>> Hello,
>>>
> <snip>
>> reiser4progs 1.1.x Software Framework Release Number (SFRN) 4.0.1 file
>> system utilities should not be used to check/fix media formatted 'a
>> priori' in SFRN 4.0.2 and vice-versa.
> 
> Honestly, this is the first time I've heard about a Linux FS having
> versioning other than a major one


This is because, unlike other Linux file systems, reiser4 is a
framework.

In vanilla kernel having a filesystem-as-framework is discouraged for
ideological reasons. As they explained: "nobody's interested in
plugins". A huge monolithic mess without any internal structure -
welcome :)
