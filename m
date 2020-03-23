Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D33618FDBC
	for <lists+reiserfs-devel@lfdr.de>; Mon, 23 Mar 2020 20:32:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727966AbgCWTck (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 23 Mar 2020 15:32:40 -0400
Received: from mail-pj1-f47.google.com ([209.85.216.47]:52923 "EHLO
        mail-pj1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727958AbgCWTcj (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 23 Mar 2020 15:32:39 -0400
Received: by mail-pj1-f47.google.com with SMTP id ng8so318906pjb.2
        for <reiserfs-devel@vger.kernel.org>; Mon, 23 Mar 2020 12:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Hi3EuG/Ev6bXmXxwMF/V1jsHh5EuhVttPWLzFdZA0IQ=;
        b=vLeGSpfsq1jVhwKe7kGlbB3RuNa6YAmDElpxlsUF/kzrtyDfdHxqgJmZhPcbrjBWan
         3ke0mbmoeY48ITd+sWsO2NK8NTXadJ9C2p1cRWDCrTJbWuix/ztHPjE0ypAwPWHqei4j
         bUDV8mfhgCuj/z+owEpyzoSHJ3BTyZw1QIPeJhf4uH6j6z4CH03XVYXZ6Tgc9+oVTnrX
         Te/k7QqG0OWh1N8xOM73p9dGJAqP1o6IXkqwDd09VrtfkgLUtpn9588R95kvdAwEpmkt
         KNzPv5G58gPwwTWCsdJxucJ6dyjkCBCs6inICd5eyY6UV6sRPx5QHu+z+fneH0XFQDzj
         t3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Hi3EuG/Ev6bXmXxwMF/V1jsHh5EuhVttPWLzFdZA0IQ=;
        b=W5NNLJg8EiBUipEcZYWgRnSIV112XL8pNAAhRI45Ru2nNB09h638erLIXpIdTPELDu
         Q1LtbgFYyyhJicmHkLwXYqun2/XhgplfUQeguWRtutJ1aOvg3iVAcEPTH/Lp7eyZj2uJ
         fYJXPIVUi0EhLFVIt6KifWZbTXdEodWgD7hhbVKM+r5yA8l7U/94pC1dqxqFA00OETJI
         00K+Jg3GCmm0oLDsGF8By4AYcDa7bNAIuR4wcrBjTL6N6TQZe2wQFbJzHm69brKSea0H
         aeUkMRdWlzUQ6t3gioY63/Ds5oPtQxxYJHiL+mP6vHmq5p/+XHJV9CuxhmdwRPowaTNz
         J5ow==
X-Gm-Message-State: ANhLgQ2eb5dO2MhLFTBEUbeXdo6c7Shfo4nFtrPrPhAqOESeEqHu7If2
        bCtwvdE6396X4RdVWaPgjA8cqWYWc2JYfQ==
X-Google-Smtp-Source: ADFU+vtkqgNro5u5VRLne/XHXMrhbxd9k9mxWS33Rv36JKSAlNgx3sQ2qJJ63NNjZmKfOTLKstadBg==
X-Received: by 2002:a17:90a:9f96:: with SMTP id o22mr1013390pjp.88.1584991956664;
        Mon, 23 Mar 2020 12:32:36 -0700 (PDT)
Received: from [192.168.1.188] ([66.219.217.145])
        by smtp.gmail.com with ESMTPSA id r17sm2127140pgl.80.2020.03.23.12.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2020 12:32:35 -0700 (PDT)
Subject: Re: cleanup the partitioning code
From:   Jens Axboe <axboe@kernel.dk>
To:     Christoph Hellwig <hch@lst.de>
Cc:     linux-block@vger.kernel.org, linux-raid@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-ext4@vger.kernel.org,
        reiserfs-devel@vger.kernel.org
References: <20200312151939.645254-1-hch@lst.de>
 <20200323165234.GA29925@lst.de>
 <7b7eb188-441a-b503-d526-f5bc029891fc@kernel.dk>
Message-ID: <5144a76e-1d99-c5a0-3e16-e031e12d93ec@kernel.dk>
Date:   Mon, 23 Mar 2020 13:32:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <7b7eb188-441a-b503-d526-f5bc029891fc@kernel.dk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On 3/23/20 10:55 AM, Jens Axboe wrote:
> On 3/23/20 10:52 AM, Christoph Hellwig wrote:
>> ping?
>>
>> On Thu, Mar 12, 2020 at 04:19:18PM +0100, Christoph Hellwig wrote:
>>> Hi Jens,
>>>
>>> this series cleans up the partitioning code.
>> ---end quoted text---
> 
> I did take a look, looks fine to me. Doesn't apply to the 5.7/block
> branch though, I'll take a look in a bit, probably an easy reject.

OK, so it also assumes that the PAGE_SHIFT -> PAGE_SECTORS_SHIFT patch
is in, which I dropped.

Can you resend?


-- 
Jens Axboe

