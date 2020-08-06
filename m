Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E92C23D454
	for <lists+reiserfs-devel@lfdr.de>; Thu,  6 Aug 2020 02:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgHFABl (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 5 Aug 2020 20:01:41 -0400
Received: from nl101-3.vfemail.net ([149.210.219.33]:38007 "EHLO
        nl101-3.vfemail.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725998AbgHFABk (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 5 Aug 2020 20:01:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=vfemail.net; h=date:from
        :to:cc:subject:message-id:in-reply-to:references:mime-version
        :content-type:content-transfer-encoding; s=2018; bh=cBlIM0iIpgAS
        X6jPln2dXnKmSot3xYQw5rrzWqdwnv0=; b=pOFgYIUDmYq69NxF5liShlVHkkmJ
        9VKnD/ITItMtUMg8ZrgAaI428h29oPUGJ6vOjpU7qupJ2l4UcbiXgb5Hhy5z9kl+
        qIHXF3/Bt4v2qq0lXjE7zKY0oysJsJzuyCPxxd0aYew9v4UtGWq2hazMN9t3Z5P1
        ceIdwo7XYnsA4BI=
Received: (qmail 59456 invoked from network); 6 Aug 2020 00:01:40 -0000
Received: by simscan 1.4.0 ppid: 59351, pid: 59450, t: 0.1964s
         scanners:none
Received: from unknown (HELO d3d3MTkyLnZmZW1haWwubmV0) (aGdudGt3aXNAdmZlbWFpbC5uZXQ=@MTkyLjE2OC4xLjE5Mg==)
  by nl101.vfemail.net with ESMTPA; 6 Aug 2020 00:01:40 -0000
Date:   Wed, 5 Aug 2020 20:01:29 -0400
From:   Hgntkwis@vfemail.net
To:     torvalds@linux-foundation.org
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        reiserfs-devel@vger.kernel.org
Subject: Re: PROBLEM: IO lockup on reiserfs FS.
Message-ID: <20200805200129.0ce62f36@Phenom-II-x6.niklas.com>
In-Reply-To: <CAHk-=wiGsj_R7pspFegPgtT4on1iYk5MmBz8uZZ3338EH3HO+Q@mail.gmail.com>
References: <20200728222041.5d88b2e1@Phenom-II-x6.niklas.com>
 <20200728223440.0fd8681e@Phenom-II-x6.niklas.com>
 <20200805125317.10bf1d34@Phenom-II-x6.niklas.com>
 <CAHk-=wiGsj_R7pspFegPgtT4on1iYk5MmBz8uZZ3338EH3HO+Q@mail.gmail.com>
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Wed, 5 Aug 2020 12:51:41 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:
> On Wed, Aug 5, 2020 at 9:53 AM <Hgntkwis@vfemail.net> wrote:
> >
> > It's been over 1 week since I sent this into the reiserfs-devel
> > mailing list. I'm escalating this as the kernel docs recommend.
> > I'm still willing to help debug and test a fix for this problem.  
> 
> The thing is, you're using an ancient 4.14 kernel, 

Sorry, I didn't realize kernel development went that fast.
I did try to go to the 5.X series, but the AMDGPU drivers don't work on
my SI card anymore (I need to bisect which takes time and many re-boots
to find the problematic commit).
I'll try the Radeon-SI driver and see if I can reproduce this reliably.

> and a filesystem
> that isn't really maintained any more. You'll find very few people
> interested in trying to debug that combination.
> 
> You *might* have more luck with a more modern kernel, but even then
> ... reiserfs?
> 
>               Linus
> 

Why does no one (I've met others who share a similar sentiment), like
reiserfs? I'm not looking for fight, I'm incredulous. It's a great FS
that survives oops-es, power failures, and random crashes very very well.
It's the only FLOSS FS with tail packing.

Thanks,
David
