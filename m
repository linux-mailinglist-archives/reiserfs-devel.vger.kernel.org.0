Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 899BD33C9DB
	for <lists+reiserfs-devel@lfdr.de>; Tue, 16 Mar 2021 00:23:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232133AbhCOXXS (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 15 Mar 2021 19:23:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231236AbhCOXXI (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 15 Mar 2021 19:23:08 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CD6CC06174A
        for <reiserfs-devel@vger.kernel.org>; Mon, 15 Mar 2021 16:23:08 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id mm21so69057791ejb.12
        for <reiserfs-devel@vger.kernel.org>; Mon, 15 Mar 2021 16:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zHq7+H1J5YH0TYBHqlo0AJBD87AInoV+uynySVAdcLU=;
        b=tH+PwpnfM1r0fhJnePs78IZFrPA+Ya0cz7ZEJq6NX79n0fbwItoZTiZn2EsyW5344e
         EtJRKyRbqZXVv/noPD7TtGtp01ymcHDiCP1hRmW/RrVwUkyQpD4g9++jH0GNBASCIFXr
         jJjYI0l0ixy3XeXqq73VhyhYewB3VF3PEcodepvGCGItv3BBlhBTD9sl0Tje9qLpxPGs
         NQkh4wFzYt3ABfY3AmD3psmq1xsg1Vi80lyZQ5kgP9YniLVG3eZoqQJwH7zPbji6UBst
         yR/J+20qZcz1P5Lu0UMpVkZ4td8GV5sDW6r+M2xCcS199t4CsTQ60IkzV0bADPCAnbo4
         5Ydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zHq7+H1J5YH0TYBHqlo0AJBD87AInoV+uynySVAdcLU=;
        b=LhMr3J0jmLRD6s+oQKLRgvUcUhBjc0Lqnfgi+jfAWUjr0bjmecWP52D9xKoxA+E2lE
         4Y2N5mzXV5LPhtIre8xZNH0ddBV98L3sXpCDhgZcvkoUYQ9LOZvOTOiOZp5e3QKkgQtP
         +ke3yUikBciHy3SPzpR4UlLDzVtWhLZyczPALPIGb6ZLFRG1hsJB9oubg5aLocXxWWqK
         9PHeO3GC/pyHLOwJN5D3PWdfNHqlwCEAKmSNyf1TVpS8SzYwgLFJNSL1Ihj+XyBJxw6v
         +y+ryZ8DVTzva1QA4Y6Rl/aenqLYiZemoXrmLHWCN2wyYQt6/AuVdqbxwbgfgrWqevdq
         0ksw==
X-Gm-Message-State: AOAM5319E5zDsT3tYSgWZlnLK6mbelmcu0J4EcNgUSlRIbqxj88q253U
        WeVaIzmgErCMI3IUsUT4ku6DpBxlFyc=
X-Google-Smtp-Source: ABdhPJxE7kd7WMG5J3nMtyL5eY3osyeDubB1V/lsvY31hrA/pYkWvbb1jlQHn/Dbv4GCzzwlrxr5DA==
X-Received: by 2002:a17:906:4407:: with SMTP id x7mr677645ejo.546.1615850586930;
        Mon, 15 Mar 2021 16:23:06 -0700 (PDT)
Received: from [192.168.0.48] (HSI-KBW-046-005-005-226.hsi8.kabel-badenwuerttemberg.de. [46.5.5.226])
        by smtp.gmail.com with ESMTPSA id m9sm92585ejo.65.2021.03.15.16.23.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Mar 2021 16:23:06 -0700 (PDT)
Subject: Re: Occasionally mkfs.reiser4 creates a file system without a UUID
To:     Mike Fleetwood <mike.fleetwood@googlemail.com>
Cc:     reiserfs-devel@vger.kernel.org
References: <CAMU1PDjpaE0g=S5iVQFY1oC8=c1ru114wwrGMUqEDu5=9N9_ZA@mail.gmail.com>
 <af8ab3fa-4ba1-5e62-993f-96e8d711297d@gmail.com>
 <04e926a4-dcbc-7e89-19d6-3815a572d2d0@gmail.com>
 <CAMU1PDi9xiePgzDpd1cznGaBEGoSJjKafvBxQStaYM=8HLKtSQ@mail.gmail.com>
From:   Edward Shishkin <edward.shishkin@gmail.com>
Message-ID: <dd354e65-84ed-02e3-9800-04ff65937de5@gmail.com>
Date:   Tue, 16 Mar 2021 00:23:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAMU1PDi9xiePgzDpd1cznGaBEGoSJjKafvBxQStaYM=8HLKtSQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org



On 03/15/2021 11:20 PM, Mike Fleetwood wrote:
> On Sat, 13 Mar 2021 at 14:28, Edward Shishkin <edward.shishkin@gmail.com> wrote:
>>
>> On 03/13/2021 12:37 PM, Edward Shishkin wrote:
>>> On 03/12/2021 08:36 PM, Mike Fleetwood wrote:
>>>> Hi,
>>>>
>>>> Occasionally mkfs.reiser4 creates a file system without a UUID,
>>>> debugfs.reiser4 reports UUID as '<none>'.  This is being detected in
>>>> GParted's file system interface CI tests [1] which exercises the resier4
>>>> commands.
>>>>
>>>> In a Ubuntu 20.04 LTS VM with both resier4progs-1.2.1-1 package and
>>>> current code from GIT, the fault can easily be replicated like this:
>>>>
>>>> truncate -s 256M test.img
>>>> i=1
>>>> while :
>>>> do
>>>>     mkfs.reiser4 --force --yes --label '' test.img
>>>>     line=`debugfs.reiser4 test.img 2> /dev/null | egrep '^uuid:'`
>>>>     echo "[$i] $line"
>>>>     ((i++))
>>>>     echo "$line" | grep -q '<none>' && break
>>>> done
>>>>
>>>> Output fragment:
>>>> [1] uuid:        17073919-e41d-4892-9b22-4294d1544c4a
>>>> [2] uuid:        af2821de-ea85-4f20-9621-4fbd128b3fb8
>>>> [3] uuid:        c0fb805b-e224-4695-a504-d87460d158ae
>>>> ...
>>>> [35] uuid:        d604794d-097f-4810-bbb3-01a1518f3ef1
>>>> [36] uuid:        9634100c-1f98-42b3-a684-c9df77ab54e2
>>>> [37] uuid:        <none>
>>>>
>>>> Performing the same test with resierfs and ext4 runs for many hours
>>>> doing 100,000s of iterations without issue.
>>>>
>>>
>>>
>>> It seems that debugfs.reiser4 prints uuid incorrectly: it assumes that
>>> binary uuid can't contain '\0' symbols, which apparently is wrong.
>>> Thus, if the first uuid's symbol is '\0', debugfs thinks that uuid is
>>> not set and prints "none" ;)
>>>
>>> I'll try to prepare a fixup a bit later.
>>> Special thanks for the nice testing script!
>>>
>>
>>
>> Here is the fixup:
>> https://github.com/edward6/reiser4progs/commit/4802cdb18ae03031d0e51a58b6655f3b99021ec2
> 
> Your fix to debugfs.reiser4 allows for printing of UUIDs correctly.
> Here's my pull request to fix mkfs.reiser4 for not writing UUIDs
> correctly in the first place.
> https://github.com/edward6/reiser4progs/pull/1


Mike, thanks a lot!

For me personally, this is the worst kind of bugs (hardly fishable by
code reviews plus not always reproducible).

I cherry pick-ed your commit also for the parallel branch "format41":
https://github.com/edward6/reiser4progs/commit/01a5e0e41ec8d5147091d44e902d60f61c336f30

Edward.
