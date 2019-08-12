Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAADB8952A
	for <lists+reiserfs-devel@lfdr.de>; Mon, 12 Aug 2019 03:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbfHLB1A (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sun, 11 Aug 2019 21:27:00 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:47101 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726164AbfHLB07 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 11 Aug 2019 21:26:59 -0400
Received: by mail-ed1-f66.google.com with SMTP id z51so14894257edz.13
        for <reiserfs-devel@vger.kernel.org>; Sun, 11 Aug 2019 18:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C9E2BsNbGou7zXfpLT1Dq2CTwoTImcJYNV94MzxTKEU=;
        b=Vxhzb4Ii73wvtbApQI1vpiiYERslXMBU7tWtc5FONFgRaSqTCA7cyCGF4Jc7bQJRA2
         9j+oXXfrHv/6EGrx/+nRVQPRKmcTsyEyvnkaqS4EEKuwmdr3DnAGqTXFUyG33m9F0WKs
         chn0OIjdF+hhsSQS2CMgS79YV6kWkLB7XlOBVxrxODyN7awVMPVzTtvlLilYC5ZRVJvA
         bZvYnR88REZ2linL97C5Ty9ozj8xa233OqCQF0UDzcdoEVZpyyMkIYKcKAON/qhzRabm
         fB5SeL3tr7f5BssgHxGT9k0/Nqmy4/GMPulzr9hzWUCmt6+wHg2Vt815bv/ridR/9/d2
         uOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C9E2BsNbGou7zXfpLT1Dq2CTwoTImcJYNV94MzxTKEU=;
        b=pwcSZR8kbEOPnHWjrxoCGgIv/ynzXEmrjGwS1aXWLKNvkSbOhcGU9vEPkbNvrhJ7c+
         UGTZMpuP7k56D3zRZ68VJDmqRSPVyS+QraURHrHOJ3qHd2gnJ82u0zjDbLqIQmfkbdgk
         aTuTh9SsHk/YNer0k7qiRbjuJ5+taXROzF9oDkvC/PXqI/JAOhnFbKpvxlsl4w0GIrUd
         EtODrQrHg7j5gpm7y9UtwnttlSOtGUOYjMjR//9m6cipaUwgNmTegKyF50uhnT7VQk/j
         UjR06pHm4ckcFCr9QzcIaYZ+HUmM9TdNH/GORN8SJ9Bt+qCgsT9nyQe6nyeLrzpXHebn
         MwkA==
X-Gm-Message-State: APjAAAX7aIwu8V8PkftCmUw7wuYfz3pW3QsZizRwg03zpCl3rthdeepl
        13V9u/N6EN6/ZPCShsCCdhGfKbnL3tx17w6a+e69bQ==
X-Google-Smtp-Source: APXvYqzGfPIkNfBCFlShvb8xgcD9my72JWy9UCHPgoqauz/uig0GJx87K1ChCBuNApB0k4xtLlutzHI7vAkIl0zHoEw=
X-Received: by 2002:a05:6402:1456:: with SMTP id d22mr34098460edx.57.1565573218198;
 Sun, 11 Aug 2019 18:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190801131902.204EE40E5EB3@huitzilopochtli.metztli-it.com> <a6c9aa89-a9fb-c913-a9d2-570ac17c3b36@gmail.com>
In-Reply-To: <a6c9aa89-a9fb-c913-a9d2-570ac17c3b36@gmail.com>
From:   Jose R R <jose.r.r@metztli.com>
Date:   Sun, 11 Aug 2019 18:26:46 -0700
Message-ID: <CAM12Q5SjwTuJuL-jWLtjaw3TMiXqWBACiDm++MG++QcuhXVdPw@mail.gmail.com>
Subject: Re: Reiser4 -enabled Linux kernels 5.0.xy do not hang in HP ProLiant
 Epyc -based bare hardware unit.
To:     Edward Shishkin <edward.shishkin@gmail.com>
Cc:     ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

... it has occurred at least twice when addressing Mr. Edward Shishkin
in email to reiserfs-devel@vger.kernel.org the email is dropped. Why!?

Thanks.

On Fri, Aug 2, 2019 at 1:48 PM Edward Shishkin
<edward.shishkin@gmail.com> wrote:
>
> Hi all,
> The port to new kernels is postponed till Reiser5 release (may be in
> August).
>
> Thanks,
> Edward.
>
-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Stretch w/ Linux 5.0.21 EOL AMD64
---------------------------------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-------------------------------------------------------------------------------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/
