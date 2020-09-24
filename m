Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9739E277889
	for <lists+reiserfs-devel@lfdr.de>; Thu, 24 Sep 2020 20:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728725AbgIXSeX (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 24 Sep 2020 14:34:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728696AbgIXSeX (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 24 Sep 2020 14:34:23 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C3AFC0613CE;
        Thu, 24 Sep 2020 11:34:23 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id t16so4362664edw.7;
        Thu, 24 Sep 2020 11:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7Edzs7KfQpjr+XIKPMKA2WjNrXyAz2LAzufBwtX3x8M=;
        b=cKEMiCs0WomV4/xV4B0+gLHm3U1+FwdE9YcfmloN/ox1tUpsDEkjTt6vz5QoJjLxN0
         szDVrEVDEfVrDnmm7NJ1k9pI3gJHHhnA1sn0cqNSCNsBOrd7R4TcvVTgLNmfBmNSpdxJ
         aJbc4Xlc+i6zZHVGOwlnwalw7Oq//ZDjP33bLCFWbSRfdsTUEJsiNtrkme/AF8YDZXfG
         XxaUqihhVomVV+e0LUw4NXACy/NOZ2+0WJKeUUqDSBgZpbKRjsiiZzIdeLF5Z5Pes5pu
         VYs2ZVWVVEFJF7ifODvVPpC8ao4GaG7g5yfragoti+Q6YuusP1y/ULP8BB0bdam80nVb
         YCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7Edzs7KfQpjr+XIKPMKA2WjNrXyAz2LAzufBwtX3x8M=;
        b=r9DP4jKUSNWPEL2UAK6/AoBFERKvQPXWv+cEh7MUngWxKksv9hd3Cnw7c+VkJy8XUr
         mQBB8fkU4Odd2FDAfrZB/WKQMaGuTSLCGFtUWxIZbQ/j7uQagYCdRxZzCAwDTPoJp+F1
         M7yaqVlZGBG15zMHiOIjZ1XhXo2V5StiJHFNn9E6KrKiu2ZRRyxEKvYaXsQlIV/rKK2h
         jzFWCWOaGlkPF843MI0bYItFKHvSJupQtTcxa0igKRVGZ7iKGjHJbMxl3bj1BCgsBFTv
         reIWBjJA/AC8nwnNtvZ0Lns/dDCe5fYAlx7qc1jTWBnWqYNg5C9mSEJdxuippFIfBHkf
         eXPw==
X-Gm-Message-State: AOAM531ZT/YkfM6dWzS0aRD0MxWzUgNaF2GSGA63AYc94h8KlOpjGTO8
        JSRD391BWAg7O9Y5+2BoNUhFtwE1hsY=
X-Google-Smtp-Source: ABdhPJyKwzEy+y+B9Q0jwkyUJk1rOpdJ0dfjD2y/PT2FrJuN+v8PxilZgDLI8SMS5MXCt9vfMNP/rw==
X-Received: by 2002:a50:ce09:: with SMTP id y9mr119151edi.91.1600972461685;
        Thu, 24 Sep 2020 11:34:21 -0700 (PDT)
Received: from [192.168.0.48] (HSI-KBW-046-005-005-048.hsi8.kabel-badenwuerttemberg.de. [46.5.5.48])
        by smtp.gmail.com with ESMTPSA id i26sm11546edq.47.2020.09.24.11.34.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Sep 2020 11:34:20 -0700 (PDT)
Subject: Re: PATCH reiser4 support for Linux 5.8.10
To:     David Niklas <Hgntkwis@vfemail.net>, reiserfs-devel@vger.kernel.org
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200728222041.5d88b2e1@Phenom-II-x6.niklas.com>
 <20200728223440.0fd8681e@Phenom-II-x6.niklas.com>
 <20200805125317.10bf1d34@Phenom-II-x6.niklas.com>
 <CAHk-=wiGsj_R7pspFegPgtT4on1iYk5MmBz8uZZ3338EH3HO+Q@mail.gmail.com>
 <20200817105604.454981dd@Phenom-II-x6.niklas.com>
 <20200924132158.38fa279f@Phenom-II-x6.niklas.com>
From:   Edward Shishkin <edward.shishkin@gmail.com>
Message-ID: <8c0f0263-1da0-11e9-c7b0-98a0aad9a888@gmail.com>
Date:   Thu, 24 Sep 2020 20:34:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20200924132158.38fa279f@Phenom-II-x6.niklas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On 09/24/2020 07:21 PM, David Niklas wrote:
> I'm a kernel dev newbie. Please double check my work if in doubt.
> 
> The patch for reiser4 support for Linux 5.8.1 didn't apply to 5.8.10. It
> needed only a one line change, but because of all the fuzzy matching and
> offset matching I thought I'd make a new one.
> The file that failed to patch is fs/fs-writeback.c. A struct got one of
> it's members removed. As the entire struct was removed by the patch

Hi David,

Precisely speaking, it is not removed, but moved to a header file.

Anyway, I guess that the missing member wasn't used by reiser4, so feel
free to ignore it.

Thanks,
Edward.


  I
> thought it good to ignore the missing member instead of trying to dig up
> what it was used for and why it was removed.
> 
> Thanks,
> David
> 
