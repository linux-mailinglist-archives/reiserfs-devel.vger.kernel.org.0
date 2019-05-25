Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 643132A6E8
	for <lists+reiserfs-devel@lfdr.de>; Sat, 25 May 2019 22:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727347AbfEYUZZ (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sat, 25 May 2019 16:25:25 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37813 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727333AbfEYUZZ (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sat, 25 May 2019 16:25:25 -0400
Received: by mail-wm1-f68.google.com with SMTP id 7so12218679wmo.2
        for <reiserfs-devel@vger.kernel.org>; Sat, 25 May 2019 13:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=gZa2ZFnJcb16xMzNzAeVZlEvblhFm7CLAWni5rZgatc=;
        b=VFbbZRY8aizYuPi9VKfVfrfT+XIYV77ZXkBaS/qcB55o7ijD2gtZuTTa1BH1NiBSl3
         3Zqjy39PmOCPVw3nZUz31MXg2ylbJH8VtUp4993YFo2qABqoatP2g3xLSLweWLcbtOmf
         9+oFKqIxWlE4LCQvIFSr29xD/U0y4Egn+WEDKvCcA6QgqXSlC8Ck9n/2ogeRKpNB3KGg
         PWTlG1GXNOcPbdsdQhCHG3LTGb/fLbGJGsjCyGcVlcgrGpSDBT/MvDSQsrgw9iuBVRvh
         U9PoL3EU6ZfIj1hald5tyRAiNpTMXefcUH/tpK6NQaaCleyYiEo4QT3Cz3BtAYH/JKd+
         t3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=gZa2ZFnJcb16xMzNzAeVZlEvblhFm7CLAWni5rZgatc=;
        b=Rsrt9Cr9PqYeLZx38qM2ghmyqTac1G/3PpVyisuJl7IFwPT4PUCMluNNbQ6FrOGkDs
         POtoOAbL89rAveWO6b4Vzfhj+bYMf0BFN91G5btZcG7M+iuZdva1+xxWctni2aqiiM0b
         0QS4a6ECt+gqmKYCYEJTWc8FMqfGv/rJKhTcP7uSqNBNh6DL366WrDoSqwotW1hw4zGm
         8ih9y0S5XsWcI3Uzzwx/vCwQUK7QhCMmU9NJGc7hKrQA+8s+gBTYTb+MKtVEDP6KfFH3
         tOKSPDZtPATu9EWKErQm8mibKUUIAmjMzmkWScjecfJX+ZIpVmZhbndzMCgv4AxKG3Fc
         nSTA==
X-Gm-Message-State: APjAAAX0Peemrm6s19v1lw1OP+GMOZ4QrJDEqt2ms5b7B/PlrIO970wI
        0YSQsgRqr8c0eOZY+V96laI=
X-Google-Smtp-Source: APXvYqz0X9N4JfszJAUWz3IoWXtj0zv0B1gN3HRqc2IeOTRcX3VNWbp3bIs1ZZE9zlDIUJBUvfcl5A==
X-Received: by 2002:a1c:7303:: with SMTP id d3mr20174501wmb.119.1558815923132;
        Sat, 25 May 2019 13:25:23 -0700 (PDT)
Received: from [192.168.0.48] (ip5f5ac62d.dynamic.kabel-deutschland.de. [95.90.198.45])
        by smtp.gmail.com with ESMTPSA id s10sm5112287wrt.66.2019.05.25.13.25.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 May 2019 13:25:22 -0700 (PDT)
Subject: Re: PATCH: Updated Reiser4 probe enabled against GNU Parted
 git://git.sv.gnu.org/parted.git
To:     Metztli Information Technology <jose.r.r@metztli.com>,
        reiserfs-devel@vger.kernel.org, 22113@debbugs.gnu.org,
        bcl@redhat.com
References: <20190524220127.A6F013C59B12@huitzilopochtli.metztli-it.com>
From:   Edward Shishkin <edward.shishkin@gmail.com>
Message-ID: <d2e77dc5-87b5-fe58-ec1e-7df633d83620@gmail.com>
Date:   Sat, 25 May 2019 22:25:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20190524220127.A6F013C59B12@huitzilopochtli.metztli-it.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On 05/25/2019 12:01 AM, Metztli Information Technology wrote:
> On Fri, May 24, 2019 at 7:46 AM Edward Shishkin <edward.shishkin@gmail.com> wrote:
>> On 05/24/2019 01:05 AM, Metztli Information Technology wrote:
>>> Niltze [Hello]-
>>>
>>> Just updated Reiser for patch against GNU Parted
>>> git clone git://git.sv.gnu.org/parted.git
>> Uh, it is in upstream already?
> LOL, no.

Ah, no problems anyway..
I'll put the patch to Sourceforge.

Thanks,
Edward.

>
> I just followed Debian maintainer's original advice on updating patch against git branch of GNU Parted.
> < https://marc.info/?l=reiserfs-devel&m=155865303620491&w=2 >
>
>> Someone must have died ...
> Well, that's the reasoning behind GNU Parted gatekeeper
> < https://www.brianlane.com/about-brian-c-lane/ >
>
> for not merging reiser4 patch.
>
> I just wonder if now that 'Big Blue' acquired Red Hat, the GNU Parted gatekeeper will act in a consistent
> manner and quit his employer on 'ethical and moral' grounds in light of Watson's complicity tainting the company.
> < https://russia-insider.com/en/head-ibm-sympathized-hitler-conducted-census-jews-preparation-camps-russian-tv-news/ri26587 >
> < https://youtu.be/tCBT8H47sZ0 >
> (and/or "Democracy For The Few" by Michael Parenti).
>
> i.e., "...I have absolutely
> no desire to see [IBM]'s work or name do anything but disappear into
> obscurity."
> < http://lists.gnu.org/archive/html/bug-parted/2015-12/msg00008.html >
>
> Well, maybe I quoted him too soon. Unlike Reiser, who is down and dirt-poor and thus all the West 'morally and ethically righteous' developers kick and pile
> scorn onto, 'Big Blue's wealth quells USA technology ecosystem and their employees' ethical and moral sophistry, as is evidenced by, say no issues with JFS,
> for instance.
>
>> Thanks,
>> Edward.
>>
>>> apply patch
>>>
>>> ./bootstrap
>>>
>>> ./configure
>>>
>>> make
>>>
>>> make install
>>>
>>>
>>> Huelmati [Enjoy]!
>>>
>>>

