Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B34B729A3F
	for <lists+reiserfs-devel@lfdr.de>; Fri, 24 May 2019 16:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404159AbfEXOq6 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 24 May 2019 10:46:58 -0400
Received: from mail-wr1-f44.google.com ([209.85.221.44]:37600 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403927AbfEXOq5 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 24 May 2019 10:46:57 -0400
Received: by mail-wr1-f44.google.com with SMTP id e15so10326474wrs.4
        for <reiserfs-devel@vger.kernel.org>; Fri, 24 May 2019 07:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=7gAHVL9VfHfG8AuOuqTzrq4qQHdKJryhIvc7MA+TJVM=;
        b=uw+WmTR0mkxFro72PL8Dk4O1fheQE1bB8tN82Uhkc0LFPWedltL4PwmHB7O9ASH2OI
         lRlk10uJSaCo8B6yp5g8aqJkMx7M56GUz12XTC5bxUMNB9lfLJ0HAFWe6FoaSLMIJYqF
         GQR+JWra8eDOA8Eiiz9EODNZjb8KptPUr+PzY+KARnzD0IuMe9SJ4AG/YobgB1Lk/dcC
         /Uaz1EjTtYLn1yBVCIfkxN4ey68uMkwvPx7g71aJ2a15Qg0lA8H/Ej8GHa3VKwcksweq
         6b981Dfjg5Z3c38yxZbKWq/84meoS47PtmueITuRbtZEULR3dbZmrWSaejTv8Be8UG1l
         4aKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=7gAHVL9VfHfG8AuOuqTzrq4qQHdKJryhIvc7MA+TJVM=;
        b=YayxT4kyjt26lihb56BfrTAVd+N/lNmNMfFRiryNGqDPulV9rdKI2Ak13ESHztDKwd
         A+4XSPhN0DyPjrLnNRhv4Jjg1LmBiAXKe1IUfpaRHs+g132B6h8KTlxQI7oaZa4y7pf1
         pbamjvqQZjrcbtDSBVky3ocpoL1yKrKWHC1is7UlZKBIn/M6HlUhrD2uTtAwUT3VkzKK
         bLo6dNb86Qzql4mIrH78y1E75jUBXGE1QcIOGSkWV+4zRs4mc/r82NkyrVjxd2h+5S8S
         L9Lklb7sE0HjxFUgJfs2fXRcQlt8yUwvCN18/3bxOAxTbkY9SlVyOQdQH0G4u2c7g/AC
         1jHQ==
X-Gm-Message-State: APjAAAWuXIgUFYtDHUFzOavOHHsqO6ZpErYGYrjQMlv2n8tXgr5+v4Z6
        Rc1adHyCWMcCVEgaHfeC+xqx6OLS
X-Google-Smtp-Source: APXvYqziuqjHv0jGSiIKskl13++ZkvUqyZxYkU3bwnIwgP/IZZADaC88zr0qGoGraPMCi/HCobMrmA==
X-Received: by 2002:adf:cd11:: with SMTP id w17mr29984934wrm.83.1558709216122;
        Fri, 24 May 2019 07:46:56 -0700 (PDT)
Received: from [192.168.0.48] (ip5f5ac62d.dynamic.kabel-deutschland.de. [95.90.198.45])
        by smtp.gmail.com with ESMTPSA id v184sm4167582wma.6.2019.05.24.07.46.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 May 2019 07:46:55 -0700 (PDT)
Subject: Re: PATCH: Updated Reiser4 probe enabled against GNU Parted
 git://git.sv.gnu.org/parted.git
To:     jose.r.r@metztli.com, reiserfs-devel@vger.kernel.org
References: <20190523230502.12152-1-jose@metztli.it>
From:   Edward Shishkin <edward.shishkin@gmail.com>
Message-ID: <84b24297-6e20-eb8f-eab3-9ca1c19d6301@gmail.com>
Date:   Fri, 24 May 2019 16:46:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20190523230502.12152-1-jose@metztli.it>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On 05/24/2019 01:05 AM, Metztli Information Technology wrote:
> Niltze [Hello]-
>
> Just updated Reiser for patch against GNU Parted
> git clone git://git.sv.gnu.org/parted.git

Uh, it is in upstream already?
Someone must have died ...

Thanks,
Edward.

>
> apply patch
>
> ./bootstrap
>
> ./configure
>
> make
>
> make install
>
>
> Huelmati [Enjoy]!
>
>

