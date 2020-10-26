Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 038A7299A6B
	for <lists+reiserfs-devel@lfdr.de>; Tue, 27 Oct 2020 00:28:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406111AbgJZX2Y (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 26 Oct 2020 19:28:24 -0400
Received: from nl101-3.vfemail.net ([149.210.219.33]:40878 "EHLO
        nl101-3.vfemail.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406106AbgJZX2Y (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 26 Oct 2020 19:28:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=vfemail.net; h=date:from
        :to:cc:subject:message-id:in-reply-to:references:mime-version
        :content-type:content-transfer-encoding; s=2018; bh=pBsEmg8XKnZN
        gBFO/90Iwov+OO11Y9S6DxLksRJBfqw=; b=dsQs/Mph0v8hDGsMdYN/gm5kPSUX
        M+/mn5SiQYvgsrrh+dtEx4k+Mmf1jF6zHA3mAHw+f5D1BVSh79u1lJKW8G8ibMj8
        jnMZ7wQWyGE+msyo3juJPJtn6H0VGoghZIqqmQLqukhCxru+buuHgfjAQc5o5+22
        nkdp1ZNioZaw6k8=
Received: (qmail 27609 invoked from network); 26 Oct 2020 23:28:22 -0000
Received: by simscan 1.4.0 ppid: 27590, pid: 27603, t: 0.3029s
         scanners:none
Received: from unknown (HELO d3d3MTkyLnZmZW1haWwubmV0) (aGdudGt3aXNAdmZlbWFpbC5uZXQ=@MTkyLjE2OC4xLjE5Mg==)
  by nl101.vfemail.net with ESMTPA; 26 Oct 2020 23:28:21 -0000
Date:   Mon, 26 Oct 2020 19:22:34 -0400
From:   David Niklas <Hgntkwis@vfemail.net>
To:     Metztli Information Technology <jose.r.r@metztli.com>
Cc:     <reiserfs-devel@vger.kernel.org>
Subject: Re: PROBLEM: Reiser4 hard lockup
Message-ID: <20201026192234.640d0346@Phenom-II-x6.niklas.com>
In-Reply-To: <20201026104213.199566FB9182@huitzilopochtli.metztli-it.com>
References: <20201026104213.199566FB9182@huitzilopochtli.metztli-it.com>
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Mon, 26 Oct 2020 03:42:12 -0700 (PDT)
Metztli Information Technology <jose.r.r@metztli.com> wrote:
> I suggest you use this list for further communication as pretending to
> wear an 'invisibility cloak' under cryptic email name/domains elsewhere
> is essentially pointless: 'Murica's Stasi...er, NSA, is being fed data
> 24/7 from her fascist Five Eyes vassals, thus anyone's pretensions at
> privacy are largely 'child's play' for them, eh Google? ;-)
> 
> Best Professional Regards.
> 

I am using this list.
In regards to my "cryptic" email name/domains. When I first signed up for
the LKML, I didn't receive any emails. I sent one and was told that the
domain I was on (mail.com) was a domain that spams people so I couldn't
send messages to the LKML. Oddly, gmail messages seem to get through and
they send more spam than any domain I've ever seen.
So, I set out to find a domain that the LKML would accept. I needed to
mass create email addresses across these domains as fast as possible and
then to subscribe as fast as possible because it's a huge waste of time
to blindly try to find a domain that the LKML likes. That's why I have a
cryptic email address.
This was the 3rd of the first 20 or so domains I signed up to their email
service for. I ended up having to speak to the admin about getting the
LKML unbanned for sending too much spam (how ironic), to his
server.

Sincerely,
David
