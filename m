Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB19C3397BB
	for <lists+reiserfs-devel@lfdr.de>; Fri, 12 Mar 2021 20:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234456AbhCLTsM (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 12 Mar 2021 14:48:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234602AbhCLTsL (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 12 Mar 2021 14:48:11 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E320C061574
        for <reiserfs-devel@vger.kernel.org>; Fri, 12 Mar 2021 11:48:11 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id e7so9598297edu.10
        for <reiserfs-devel@vger.kernel.org>; Fri, 12 Mar 2021 11:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=UjgTZDCt/nya/cQ7aylmMB5pjkTaS49pBVx4Qv2R+T0=;
        b=rv7xqh4zRjQkRKuugnuafJfExHkO9kLVNi3lAwq4DhrfCnr2++emdk2VHHRgHq82+L
         zUoPx3KrOW82nTe6i3y7gR3bT9RHtRRwV0cUPNEinT09GBc4dQZyH3RL4C5/NgwJ6Au5
         AFVcUXcFWv5pbOYcuSOFQdzldKjSKXk9KP+TwG9iKYYC/pCO+EB6mDQIrELfeUxXEURa
         eDRFwtYKQNHs9vhSTMLKlfJC0LL3D0QqYc23HRVtiYC7Kqaj1pszrTDSbvEY/t1L/xt3
         2c/IEno0C1jdlauxpaILbqwALAkagn0lhrsNujyBNSmbN+qrCECS/VUYIohru3iKgIzJ
         9FJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UjgTZDCt/nya/cQ7aylmMB5pjkTaS49pBVx4Qv2R+T0=;
        b=rVV4BhcJpx8OPpa/9zGb3eAvpekdvxUuWSbmB/0Jv3aqpFCEq/VLZiwRTPbpvayjBP
         DgV8CiciI8+NdjKhv9B+a3d7LF215UJFpQffzlAeKNUai2Hf4YnSTL5+p5XG07u0PogO
         Udpxv4Ud6ML0higZASKAVUcWXZKKg7i21v4+M8uoJFlUbVT90MOeE+Efbb8tjcGfnLSZ
         SGgJ3U8X4nI2Ds5mYMrTH1lw89aPeu48/VUinUjxObcxC00fLXXswmsSl+aUZ+D2XaO+
         ffTcaoQV9dHCKVf/wWGg7Rc9kL40Ztr24QJzGZvJpQMpo2xqgG/aqLls47DcQBAk+1Tk
         cGMA==
X-Gm-Message-State: AOAM531QFl3ia5GOA9aAV5YuHC4D2ZpqJsQj08vSqDm8+YorCVkchjbK
        8LJIbZE2YFE0/uRsmCBmsZdFtwn/Um4=
X-Google-Smtp-Source: ABdhPJyZYcQOWykRY+Y+Pu0CK2HtNNS/7wK21iwwTTkTqzP0XanD11SGGrbDyXbZQIA/jlQqjSnlpA==
X-Received: by 2002:aa7:c916:: with SMTP id b22mr16553541edt.299.1615578490300;
        Fri, 12 Mar 2021 11:48:10 -0800 (PST)
Received: from [192.168.0.48] (HSI-KBW-046-005-005-226.hsi8.kabel-badenwuerttemberg.de. [46.5.5.226])
        by smtp.gmail.com with ESMTPSA id j25sm3558349edy.9.2021.03.12.11.48.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Mar 2021 11:48:09 -0800 (PST)
Subject: Re: Occasionally mkfs.reiser4 creates a file system without a UUID
To:     Mike Fleetwood <mike.fleetwood@googlemail.com>,
        reiserfs-devel@vger.kernel.org
References: <CAMU1PDjpaE0g=S5iVQFY1oC8=c1ru114wwrGMUqEDu5=9N9_ZA@mail.gmail.com>
From:   Edward Shishkin <edward.shishkin@gmail.com>
Message-ID: <ebb4b093-3141-c4ad-d99b-c310aa7dceb4@gmail.com>
Date:   Fri, 12 Mar 2021 20:48:08 +0100
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


Yeah, I know about this problem.
Unfortunately, haven't had a chance to find the root cause yet...
It shouldn't be a critical problem for 4.X.Y
For 5.X.Y - yes - it becomes sticky..

Thanks,
Edward.


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
> Thanks,
> Mike
> 
> [1] Sporadic failure of test case
> My/SupportedFileSystemsTest.CreateAndReadUUID/reiser4
>      https://gitlab.gnome.org/GNOME/gparted/-/issues/145
> 
