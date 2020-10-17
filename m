Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A7042912C3
	for <lists+reiserfs-devel@lfdr.de>; Sat, 17 Oct 2020 17:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436594AbgJQPxJ (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sat, 17 Oct 2020 11:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2411860AbgJQPxJ (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sat, 17 Oct 2020 11:53:09 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAA7AC061755;
        Sat, 17 Oct 2020 08:53:08 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id dn5so5789595edb.10;
        Sat, 17 Oct 2020 08:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=amQ8vE2LZX99CSwDilFQzQGa2tS1RKAkSyt0DblJjS0=;
        b=nFh7YdVPyOxKq3XLhVvFb1RnshslJoRjTDc88GUgak545GOgEoF0VcY/BDU8i3nJWw
         djnT2wjUheeZ1dJgrX2eNGrVuYtpJmKJ0zx4aZVnCCAwKkZhCjyhi+Jw57u+NmLOFFiz
         v/v+dztf5LAakbuBn7Pt+gkhgDxiTDW5GcFKNqOVmG/8IwDaUi19g59yzEmNm4PrP6NH
         AVHg0RjdGPuPyda5pDEAYX+948wj0Vs1dbHGQDS7d/wLsAmd5kB2z+bVjTg9MijhdcZl
         rT5c9p5uaxHiwgsRIhqjKUbPpnMfFxFT0h58MHxx7merc2esz2JeZ7n++P0Ws5dDtab2
         D0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=amQ8vE2LZX99CSwDilFQzQGa2tS1RKAkSyt0DblJjS0=;
        b=IOQNNURklu7gpbHmcI1SqOJtNRs7+k2NrqM69OqDsLXRRCd7v7xbMk9C/URHOt7usn
         1UtDopoJW7bwtZMxQSoCMDCe8drucpCCduVtFvEqT+SjKvNXLBZDYXjudMzZK3F956lT
         tjNN8T5kB0lTDi3k9s0oR1Pq7SnIrG1TG1oVebVbRWIK2OJmrvxDq5ShhxyA+/+yeuOR
         VzVCP0uHtndcgwtvdoc44mVD37NzMox6AlPE0CmTnano5WpNISta/qAdITayY/WcJNqS
         3aUpmMsDgtWN301W9B3SfHQ8CkJ+LZo62RJV86051CaeTWVKvz1yrtqOFbFoUTZ7n3KF
         iB7g==
X-Gm-Message-State: AOAM532GsJSwniO+HjoZ4RCtZKV/K8Jej9YajjY2fEjhEh4k0eJ793Mp
        3sLW3KyJm0EjWy2KKUVTzxQRemyxE9E=
X-Google-Smtp-Source: ABdhPJyvS+u5v2bU9b+uQiiefByN2yRUZNSMb2/zWLBf8SkbS1CBwSv6tegLjUcgCBtYonEAwQxa7Q==
X-Received: by 2002:aa7:dc50:: with SMTP id g16mr9674813edu.95.1602949987054;
        Sat, 17 Oct 2020 08:53:07 -0700 (PDT)
Received: from [192.168.0.48] (HSI-KBW-046-005-005-004.hsi8.kabel-badenwuerttemberg.de. [46.5.5.4])
        by smtp.gmail.com with ESMTPSA id x2sm5434615edr.65.2020.10.17.08.53.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 17 Oct 2020 08:53:06 -0700 (PDT)
Subject: Re: [ANNOUNCE] Reiser5: Selective File Migration - User Interface
To:     Pavel Machek <pavel@ucw.cz>,
        Metztli Information Technology <jose.r.r@metztli.com>
Cc:     reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200826205216.07BC868EF679@huitzilopochtli.metztli-it.com>
 <20201004095922.GC1104@bug>
From:   Edward Shishkin <edward.shishkin@gmail.com>
Message-ID: <fe9dafa8-0fef-7046-fea7-f2344adc2ee1@gmail.com>
Date:   Sat, 17 Oct 2020 17:53:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20201004095922.GC1104@bug>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org


On 10/04/2020 11:59 AM, Pavel Machek wrote:
> Hi!
> 
>>> In particular, using this functionality, user is able to push out
>>> "hot" files on any high-performance device (e.g. proxy device) and pin
>>> them there.
> 
> What permissions are normally required for file migration?

Hi Pavel,
I guess, admin ones.
With such operation it is possible to organize an attack on a
collectively shared volume by clogging some its brick. So that other
users, who rely on regular distribution (provided by per-volume
distribution table) will get "no space left on device", while other
bricks contain a lot of free space..

> 
>>> COMMENT. After ioctl successful completion the file is not necessarily
>>> written to the target device! To make sure of it, call fsync(2) after
>>> successful ioctl completion, or open the file with O_SYNC flag before
>>> migration.
> 
> Ok.
> 
>>> COMMENT. File migration is a volume operation (like adding, removing a device to/from
>>> a logical volumes), and all volume operations are serialized. So, any attempt to
>>> migrate a file, while performing other operation on that volume will fail. If some
>>> file migration procedure fails (with EBUSY, or other errors), or was interrupted by
>>> user, then it should be repeated in the current mount session. File migration
>>> procedures interrupted by system crash, hared reset, etc) should be repeated in the
>>> next mount sessions.
> 
> Dunno. Returning -EBUSY is kind of "interesting" there. I'd expect kernel to queue
> the callers, because userland can't really do that easily.
> 

You are right. The current solution is temporary. Actually, we don't
need to lock the whole volume in order to migrate a file (anyway, the
file migration procedure takes an exclusive access to the file).

User-defined migration of individual files should be serialized with
brick removal. So it will be even per-brick lock rather than per-volume
lock.. I think, that it should be a rw-semaphore. Brick removal
procedure will take a write lock (with possible waiting) and
user-defined migration will try to take a read lock. If busy, then
return error (brick is under removal == doesn't exist for user).

Thanks,
Edward.
