Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09D84191249
	for <lists+reiserfs-devel@lfdr.de>; Tue, 24 Mar 2020 14:59:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727161AbgCXN6e (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 24 Mar 2020 09:58:34 -0400
Received: from mail-pj1-f50.google.com ([209.85.216.50]:53501 "EHLO
        mail-pj1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727642AbgCXN6d (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 24 Mar 2020 09:58:33 -0400
Received: by mail-pj1-f50.google.com with SMTP id l36so1521455pjb.3
        for <reiserfs-devel@vger.kernel.org>; Tue, 24 Mar 2020 06:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x5fXAGIMuTapier1gsbREHE5uidSK9jkxwBjZYaSvro=;
        b=GuHVyfLtEaQS6ua0IdE6tBWddbpDehK1t8pnI71T5sIFDkffsobUKQ4A4ckdACJlzi
         PerQQX9Qo6BJLQXl5vXmyumu2j+Oo/6WJgUeRrWlcScm6FdOlDNkXyueSmJJW7WrQY7X
         ZgkNC/Ym/lLm264Jbgd1w3jrXs/Sjbv+FeVrpPu8GQziZ+l2HH/bAuwdBIMts78UKzu2
         PgLG8T99SXdT7U7Ea6n9HF/10Yfbcw3mSga8g2/gdmzOcr5YJs5Rw/kHSGUnPGIm0M3i
         0Ft6bu+IiOn2ReSIc1tPlou6GSLa/FdCbHTrWDNLhJMPg2455K1qJihwbRXTKnklQn4e
         Njqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x5fXAGIMuTapier1gsbREHE5uidSK9jkxwBjZYaSvro=;
        b=pg+el3fdvUe36WCyuTo4hWEOi9pa5w2AFamrAvixalTyZAhB/v8bBYyI+CcG/xT0o8
         OXsQHEQU40TfC2As2V7Vp/gOOiCAZe7pz1IS6YBUN4TwlKaqx86yY2jzgvGCNmUPb6eO
         NPxtnMu1X30z90Qwf1sD3tx3qiR3SdUzalogbm6vNCFfcAAGopKuusbB1UocZIX6nBHl
         0y7wTXs3ZgQoj8S5LIgCuX4leKU6JUd/LfRG1uDSvPQ5z9gPG13UZhN+kRdo5juuBSNU
         GG+m8BTKkpohMzxrj6fIDu4Lz6UWxBcDymxsyHfZE2aEcrDaS9nvMAPKMuX/cREWXIPa
         lMHw==
X-Gm-Message-State: ANhLgQ3oYKA5GxvM1Rm9hPgdweNhwZOVJqPCEIk+GgQqKpAlDEB0ToVE
        RewJ/XZBmhwhH5SV94oWIVSpdkUZZ2pVQw==
X-Google-Smtp-Source: ADFU+vsaJGMoiCAPmnmgto+goF4pP8bLqDaR5wU/oSKkxBsKicj5W2+zA/ckcACIUVr+G6j5uxGbPQ==
X-Received: by 2002:a17:90a:e7c8:: with SMTP id kb8mr5523042pjb.79.1585058311952;
        Tue, 24 Mar 2020 06:58:31 -0700 (PDT)
Received: from [192.168.1.188] ([66.219.217.145])
        by smtp.gmail.com with ESMTPSA id 141sm761887pfu.174.2020.03.24.06.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2020 06:58:31 -0700 (PDT)
Subject: Re: cleanup the partitioning code v2
To:     Christoph Hellwig <hch@lst.de>
Cc:     linux-block@vger.kernel.org, linux-raid@vger.kernel.org,
        linux-scsi@vger.kernel.org, reiserfs-devel@vger.kernel.org
References: <20200324072530.544483-1-hch@lst.de>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <bafcc626-16bc-baeb-a0fe-2c2fe4cda14b@kernel.dk>
Date:   Tue, 24 Mar 2020 07:58:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200324072530.544483-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On 3/24/20 1:25 AM, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series cleans up the partitioning code.
> 
> Changes sinve v1:
>  - rebased to for-5.7/block

Applied, thanks.

-- 
Jens Axboe

