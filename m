Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C93F5339DE3
	for <lists+reiserfs-devel@lfdr.de>; Sat, 13 Mar 2021 12:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233787AbhCMLiH (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sat, 13 Mar 2021 06:38:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233715AbhCMLhs (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sat, 13 Mar 2021 06:37:48 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 989C7C061574
        for <reiserfs-devel@vger.kernel.org>; Sat, 13 Mar 2021 03:37:47 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id z1so11616704edb.8
        for <reiserfs-devel@vger.kernel.org>; Sat, 13 Mar 2021 03:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=8rI7FDuJts1MIljIxgtcS1T4PDaXvLXXm5I/06Ee08I=;
        b=QB8u/jRYufCfiSK/yTnajBdqntl0sr/kORCpcniXvhbK8NwoP60ZFsc1PVu2m41Y0d
         yuHYRrCQfvZy+E8qhI8ZflEVd6XoWEjAxWrS9sCFcE9GW+Acs9gTSGn7pIIulS0YwVbL
         YNlKomRBoKUd1inGBCSaGpq1c0HQKei0Zdnu/uzpraOEb50zejdZ8Z8ftP8x3rpFoTM/
         7HNeace/99C+RAqVkoQPIS6ubvDmTOnOFWor4JuA0YvXO6RmmzUhjrRVmKtwnx4cua6m
         PIsyEe/5xwS0BpmyRj2/gsvIOEt75qdj7knXa4lApXeh1h7G57kv64SMgHTaIKUTicwC
         SIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8rI7FDuJts1MIljIxgtcS1T4PDaXvLXXm5I/06Ee08I=;
        b=b3bBR4R573x35+dBJY6q7feFZhXaiM5n9W2HlvPnZLB6409G9wxuhqKOmrZEN5On8n
         qotAjVvvUvmFlBktbPwuvd0/MKBQ1T/bqCePZfpQSQIXJ41P0iLOn3oT/korok+sRIZX
         iFiomNlyB7ZHf6t5iO8/SIy4/P803p9ByydxdXoCm60VwHQprsjCRHa8AVsThTt1cV95
         lR9+6PpDe6YqwhZ81aGFx0urHx43y4jMRRPAkhO6tpUh/TnhW8/G8qBzvv6KzbDkMfHg
         Ag7WuzLNmBynZyJ8JNxVZNZi/kq7CtnqaIUJUbP2bE0TF/trxj01l51UrGrd9qVTyDGV
         NGFA==
X-Gm-Message-State: AOAM5306WIFE/30yfXFAjhZG+DQRGo61pmrSE/JhrYNTYQB08a9/lnZF
        uG/gIUkEn5fBXdk4IJiLc7Ma4ef8HXw=
X-Google-Smtp-Source: ABdhPJwdsTvc71McSN2+qBybzWcdwmVVNWjuuSjgrvbZIU4QiS7Vmc5vx7GKf0KNVGSPOzwPUXfuPw==
X-Received: by 2002:aa7:d416:: with SMTP id z22mr19299780edq.239.1615635466159;
        Sat, 13 Mar 2021 03:37:46 -0800 (PST)
Received: from [192.168.0.48] (HSI-KBW-046-005-005-226.hsi8.kabel-badenwuerttemberg.de. [46.5.5.226])
        by smtp.gmail.com with ESMTPSA id h24sm611560ejl.9.2021.03.13.03.37.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Mar 2021 03:37:45 -0800 (PST)
Subject: Re: Occasionally mkfs.reiser4 creates a file system without a UUID
To:     Mike Fleetwood <mike.fleetwood@googlemail.com>,
        reiserfs-devel@vger.kernel.org
References: <CAMU1PDjpaE0g=S5iVQFY1oC8=c1ru114wwrGMUqEDu5=9N9_ZA@mail.gmail.com>
From:   Edward Shishkin <edward.shishkin@gmail.com>
Message-ID: <af8ab3fa-4ba1-5e62-993f-96e8d711297d@gmail.com>
Date:   Sat, 13 Mar 2021 12:37:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAMU1PDjpaE0g=S5iVQFY1oC8=c1ru114wwrGMUqEDu5=9N9_ZA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On 03/12/2021 08:36 PM, Mike Fleetwood wrote:
> Hi,
> 
> Occasionally mkfs.reiser4 creates a file system without a UUID,
> debugfs.reiser4 reports UUID as '<none>'.  This is being detected in
> GParted's file system interface CI tests [1] which exercises the resier4
> commands.
> 
> In a Ubuntu 20.04 LTS VM with both resier4progs-1.2.1-1 package and
> current code from GIT, the fault can easily be replicated like this:
> 
> truncate -s 256M test.img
> i=1
> while :
> do
>    mkfs.reiser4 --force --yes --label '' test.img
>    line=`debugfs.reiser4 test.img 2> /dev/null | egrep '^uuid:'`
>    echo "[$i] $line"
>    ((i++))
>    echo "$line" | grep -q '<none>' && break
> done
> 
> Output fragment:
> [1] uuid:        17073919-e41d-4892-9b22-4294d1544c4a
> [2] uuid:        af2821de-ea85-4f20-9621-4fbd128b3fb8
> [3] uuid:        c0fb805b-e224-4695-a504-d87460d158ae
> ...
> [35] uuid:        d604794d-097f-4810-bbb3-01a1518f3ef1
> [36] uuid:        9634100c-1f98-42b3-a684-c9df77ab54e2
> [37] uuid:        <none>
> 
> Performing the same test with resierfs and ext4 runs for many hours
> doing 100,000s of iterations without issue.
> 


It seems that debugfs.reiser4 prints uuid incorrectly: it assumes that
binary uuid can't contain '\0' symbols, which apparently is wrong.
Thus, if the first uuid's symbol is '\0', debugfs thinks that uuid is
not set and prints "none" ;)

I'll try to prepare a fixup a bit later.
Special thanks for the nice testing script!

Edward.


> Thanks,
> Mike
> 
> [1] Sporadic failure of test case
> My/SupportedFileSystemsTest.CreateAndReadUUID/reiser4
>      https://gitlab.gnome.org/GNOME/gparted/-/issues/145
> 
