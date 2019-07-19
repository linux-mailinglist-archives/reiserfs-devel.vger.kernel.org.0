Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B14F16E133
	for <lists+reiserfs-devel@lfdr.de>; Fri, 19 Jul 2019 08:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725616AbfGSGvv (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 19 Jul 2019 02:51:51 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:40148 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726709AbfGSGvv (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 19 Jul 2019 02:51:51 -0400
Received: by mail-qt1-f195.google.com with SMTP id a15so29893604qtn.7;
        Thu, 18 Jul 2019 23:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B6pVkHoM9zYOJWO3sG9HTZxpM7QAoYB/MD0csvlC6pM=;
        b=T7JAkSM39gH68585/3qWmn++25iUFXk9chPbH/jc3Vrpdx1nWcemi5z89RC5LVBBSu
         ES2qVsobDwCR8ABAf0+XcqlBaABI1QnyHILgVh/z9HLW/uy+30jeyFus0xvJNhGZwpNh
         PsFkoSZy53JHnjdaHUhAGutcraF+iiODuYpl77ePYyOrUWMjK9rqwbRV9B6zcwmWB+qQ
         2ctWTiFYvVy+pOHp185FmqzeYIwcAA4/EIXBCsb04O/cJS8/29IpMEcD9/UaM30VogZl
         fttHqH86JlmvrGfqdtf9V02PAYPu6dVPWyzjMZIbaJSpuvdOG/BK3VtHLsocKoOsrsDm
         isNw==
X-Gm-Message-State: APjAAAXV82AjnCQ4dJ2AICNgh7Dz3f2VLBE2fEgIuqp+PCrmx3Ee3+u/
        8sI47ULzkJ1vIo0Z8DfqkbcUpojjpI6kwON8ksmKEbOh
X-Google-Smtp-Source: APXvYqw0TyPKAz3bnZYB03kiIZxHNAdt0cNgEJ4uL/TFU4FLHUfRsbCjK0Jy4aD5N6o27WowLlF5susEFCyyHEVpttw=
X-Received: by 2002:a0c:dd86:: with SMTP id v6mr36463964qvk.176.1563519109822;
 Thu, 18 Jul 2019 23:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190718134928.2472465-1-arnd@arndb.de> <cedfd2fb31d943564e19c1652bc8983a18de45d4.camel@perches.com>
In-Reply-To: <cedfd2fb31d943564e19c1652bc8983a18de45d4.camel@perches.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 19 Jul 2019 08:51:33 +0200
Message-ID: <CAK8P3a2nL0Ji2NmDvVcqyO4Rp_N9FN0OSZHRnUb+BpTdneuVMQ@mail.gmail.com>
Subject: Re: [PATCH] reiserfs: fix code unwinding with clang
To:     Joe Perches <joe@perches.com>
Cc:     Jan Kara <jack@suse.cz>, Andrew Morton <akpm@linux-foundation.org>,
        reiserfs-devel@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Thu, Jul 18, 2019 at 5:20 PM Joe Perches <joe@perches.com> wrote:
> On Thu, 2019-07-18 at 15:49 +0200, Arnd Bergmann wrote:
> > This will likely get fixed in a future clang release, but in the meantime
> > the workaround helps us build cleanly with existing releases.
>
> The original code read better.
>
> This is kinda a gross solution that should probably be
> commented on in the code rather than just the commit message.

I'll just wait for the fix in llvm then and filter out the objtool warnings
from my build logs.

      Arnd
