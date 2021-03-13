Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09884339E86
	for <lists+reiserfs-devel@lfdr.de>; Sat, 13 Mar 2021 15:30:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbhCMO32 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sat, 13 Mar 2021 09:29:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbhCMO2y (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sat, 13 Mar 2021 09:28:54 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08E47C061574
        for <reiserfs-devel@vger.kernel.org>; Sat, 13 Mar 2021 06:28:53 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id jt13so58903147ejb.0
        for <reiserfs-devel@vger.kernel.org>; Sat, 13 Mar 2021 06:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=KHzk9sOROUxF+iH0v9rfcgZod9ZJBglwqNQF6B8m6KY=;
        b=bEDZEJs2dD4CgUr7VXqWDK48E8wu45BL1jzV4mGqdXk3wXm12lzLgC7gL9jqIx+hp/
         MV1X98EM+z91B9KACKxYhCnzjUi2TlQ5LrN+22IMrno2ZJhYO0pA0LzBAJ9nOfU/AX02
         jzJL3pFz5YGkpvRe8NLP3ZnQvepYkj4Hi73Y3D7VBTnN50dkmIU6f15HwsZABGcbBT2O
         lX7aXtvRUzYQe1N8JX1SrAT7SLmRIMosR7r6SjW2Qjd1SN5N+gqLnvue5tDmN2lQ+/XO
         cG6GUhg5Jmp89ewCj2A9DDUn5VRqmRo2foW0IJUYpO7XBCW+Uku/bvEq/rZlVLXhnZT0
         YrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KHzk9sOROUxF+iH0v9rfcgZod9ZJBglwqNQF6B8m6KY=;
        b=NxIR/2T0jCybxT4sJK4wVyKO9xtOW0xbY9/JW4BfDUesXHQvfPVmSEIKDHCA+5S8hl
         XvnJDZmULFEYvdWyFQ53wxzAcelh+CP6fHEGz76USNgCaAwROPJr4QD+R9Dx683UJwqz
         sJMlpN873XTmeEVqcQ6Nz5NhYX/dKJUhAD8v9EazzZlht0lAc/oywj6FuwPJGq0kFaJ+
         I85eo+kMBwXl1xNjL1yCO9GXl8SlS4STawlMSNMOT2I9xbtlJwvB/DsJmYzvTc+HVtp0
         JRXDSXGrRAwBKk474dtGKsyrYz8uK9pThqRwlflcNyZW/2/YJuak1JtXxOnNkPKSqYO9
         ju3g==
X-Gm-Message-State: AOAM531HgxV0MMmY3ChUV9DzskAv/6IZuUhINrLZLiKTR4Vr37bVYQ88
        5t8qVctd6/U/Zli1lbO8P3hNOkC8pQk=
X-Google-Smtp-Source: ABdhPJxtLlidULiKw6k/je4TZznqadXIConMIueq7iNQlUnRSonmklrg8nUtQV78aoGsjrmCa4dnxg==
X-Received: by 2002:a17:906:73cd:: with SMTP id n13mr13879276ejl.535.1615645732683;
        Sat, 13 Mar 2021 06:28:52 -0800 (PST)
Received: from [192.168.0.48] (HSI-KBW-046-005-005-226.hsi8.kabel-badenwuerttemberg.de. [46.5.5.226])
        by smtp.gmail.com with ESMTPSA id 90sm94477edf.31.2021.03.13.06.28.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Mar 2021 06:28:51 -0800 (PST)
Subject: Re: Occasionally mkfs.reiser4 creates a file system without a UUID
From:   Edward Shishkin <edward.shishkin@gmail.com>
To:     Mike Fleetwood <mike.fleetwood@googlemail.com>,
        reiserfs-devel@vger.kernel.org
References: <CAMU1PDjpaE0g=S5iVQFY1oC8=c1ru114wwrGMUqEDu5=9N9_ZA@mail.gmail.com>
 <af8ab3fa-4ba1-5e62-993f-96e8d711297d@gmail.com>
Message-ID: <04e926a4-dcbc-7e89-19d6-3815a572d2d0@gmail.com>
Date:   Sat, 13 Mar 2021 15:28:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <af8ab3fa-4ba1-5e62-993f-96e8d711297d@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org



On 03/13/2021 12:37 PM, Edward Shishkin wrote:
> On 03/12/2021 08:36 PM, Mike Fleetwood wrote:
>> Hi,
>>
>> Occasionally mkfs.reiser4 creates a file system without a UUID,
>> debugfs.reiser4 reports UUID as '<none>'.  This is being detected in
>> GParted's file system interface CI tests [1] which exercises the resier4
>> commands.
>>
>> In a Ubuntu 20.04 LTS VM with both resier4progs-1.2.1-1 package and
>> current code from GIT, the fault can easily be replicated like this:
>>
>> truncate -s 256M test.img
>> i=1
>> while :
>> do
>>    mkfs.reiser4 --force --yes --label '' test.img
>>    line=`debugfs.reiser4 test.img 2> /dev/null | egrep '^uuid:'`
>>    echo "[$i] $line"
>>    ((i++))
>>    echo "$line" | grep -q '<none>' && break
>> done
>>
>> Output fragment:
>> [1] uuid:        17073919-e41d-4892-9b22-4294d1544c4a
>> [2] uuid:        af2821de-ea85-4f20-9621-4fbd128b3fb8
>> [3] uuid:        c0fb805b-e224-4695-a504-d87460d158ae
>> ...
>> [35] uuid:        d604794d-097f-4810-bbb3-01a1518f3ef1
>> [36] uuid:        9634100c-1f98-42b3-a684-c9df77ab54e2
>> [37] uuid:        <none>
>>
>> Performing the same test with resierfs and ext4 runs for many hours
>> doing 100,000s of iterations without issue.
>>
> 
> 
> It seems that debugfs.reiser4 prints uuid incorrectly: it assumes that
> binary uuid can't contain '\0' symbols, which apparently is wrong.
> Thus, if the first uuid's symbol is '\0', debugfs thinks that uuid is
> not set and prints "none" ;)
> 
> I'll try to prepare a fixup a bit later.
> Special thanks for the nice testing script!
> 


Here is the fixup:
https://github.com/edward6/reiser4progs/commit/4802cdb18ae03031d0e51a58b6655f3b99021ec2

Thanks,
Edward.
