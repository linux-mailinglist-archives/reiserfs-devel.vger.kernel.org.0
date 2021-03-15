Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F13CC33C942
	for <lists+reiserfs-devel@lfdr.de>; Mon, 15 Mar 2021 23:21:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbhCOWVV (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 15 Mar 2021 18:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232016AbhCOWVC (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 15 Mar 2021 18:21:02 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B0CCC06174A
        for <reiserfs-devel@vger.kernel.org>; Mon, 15 Mar 2021 15:21:02 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id m9so34828671ybk.8
        for <reiserfs-devel@vger.kernel.org>; Mon, 15 Mar 2021 15:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/SCDa6s3KFnsSO3ILE5+J7pLWN8uCXC4/pT1yFfl9p8=;
        b=fYAzIl/KEwYxU5jVHGWZHdgM5w+YQRcwo56gi9JOeyp7cob5iGrltjQZ4M/aSuH9Gc
         Q2khjkW0MAbNLrMgZBpMFJ1tD+I0w4s7G7rf0C6kkpa5sWOnWp5iMKcF0ZnNTNJv0UBA
         NtrDz2u32gs97yWWQ+h1YW0U8luQaMmjhFPds11QhcQn2Zc7HYtkF3urbYTjnEoJBICp
         xUvawto7rJlg3lxVP3X7ypeZKo6uRnQunMvG3RtmOIK7ewKIo5ird5JWErs9Kk362+Vn
         sAiPAbAcIFGTtlK3IZG9lq+5ABFnhjRjfOeL/UDAvo51+l4sSXobML5k52d+UeDLT3od
         F2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/SCDa6s3KFnsSO3ILE5+J7pLWN8uCXC4/pT1yFfl9p8=;
        b=VSqoTpGw8Mwk0atfhypNCFjjTNOf4OiHNc+jTtD/I+llT2jloxRawNOiMJjv1wd20U
         AHZ5qxBDUJCNUs3L0hiSjakaPP/3G6vieCSv1ZTgzpPvXfrcQG/wknOKsmzR+B7RXfMn
         MFpc0J2MbwWIf1XH86q+Za65NsTFuotSazYP/MpsyFhkGTkjMQLMnUXBNh2CYk11bVl7
         8JXTYGAFf7ylcpI0qkOJ2H+pgzXcZUKNU4C6AtdcJOI+jfnB4ETisNFwFxORxkeiQjDD
         NirmG1W0j5465IqziEP5vJOJbnYrK7emrguFIDx4YHp3a6ecQ93o8OwXuA/or4uypNww
         81jQ==
X-Gm-Message-State: AOAM5313RpQW0rigeoSyYgRCc+sZ8Ko8fXFwUDnQLG1SQ/xN2HNmrV8Z
        FKcaVfMskNxZRyYkA/yQQFGe3oWvqA54LC7XMI4=
X-Google-Smtp-Source: ABdhPJzsVVrZR7rgpfXTboG7OUiTD7XLJG9xIWlPWmyjgmFXD+5tZkYzY+BZGD/a7+uIkNOo17rbz8AzVP1mdm6CxGg=
X-Received: by 2002:a25:99c1:: with SMTP id q1mr1236621ybo.489.1615846861570;
 Mon, 15 Mar 2021 15:21:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAMU1PDjpaE0g=S5iVQFY1oC8=c1ru114wwrGMUqEDu5=9N9_ZA@mail.gmail.com>
 <af8ab3fa-4ba1-5e62-993f-96e8d711297d@gmail.com> <04e926a4-dcbc-7e89-19d6-3815a572d2d0@gmail.com>
In-Reply-To: <04e926a4-dcbc-7e89-19d6-3815a572d2d0@gmail.com>
From:   Mike Fleetwood <mike.fleetwood@googlemail.com>
Date:   Mon, 15 Mar 2021 22:20:49 +0000
Message-ID: <CAMU1PDi9xiePgzDpd1cznGaBEGoSJjKafvBxQStaYM=8HLKtSQ@mail.gmail.com>
Subject: Re: Occasionally mkfs.reiser4 creates a file system without a UUID
To:     Edward Shishkin <edward.shishkin@gmail.com>
Cc:     reiserfs-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Sat, 13 Mar 2021 at 14:28, Edward Shishkin <edward.shishkin@gmail.com> wrote:
>
> On 03/13/2021 12:37 PM, Edward Shishkin wrote:
> > On 03/12/2021 08:36 PM, Mike Fleetwood wrote:
> >> Hi,
> >>
> >> Occasionally mkfs.reiser4 creates a file system without a UUID,
> >> debugfs.reiser4 reports UUID as '<none>'.  This is being detected in
> >> GParted's file system interface CI tests [1] which exercises the resier4
> >> commands.
> >>
> >> In a Ubuntu 20.04 LTS VM with both resier4progs-1.2.1-1 package and
> >> current code from GIT, the fault can easily be replicated like this:
> >>
> >> truncate -s 256M test.img
> >> i=1
> >> while :
> >> do
> >>    mkfs.reiser4 --force --yes --label '' test.img
> >>    line=`debugfs.reiser4 test.img 2> /dev/null | egrep '^uuid:'`
> >>    echo "[$i] $line"
> >>    ((i++))
> >>    echo "$line" | grep -q '<none>' && break
> >> done
> >>
> >> Output fragment:
> >> [1] uuid:        17073919-e41d-4892-9b22-4294d1544c4a
> >> [2] uuid:        af2821de-ea85-4f20-9621-4fbd128b3fb8
> >> [3] uuid:        c0fb805b-e224-4695-a504-d87460d158ae
> >> ...
> >> [35] uuid:        d604794d-097f-4810-bbb3-01a1518f3ef1
> >> [36] uuid:        9634100c-1f98-42b3-a684-c9df77ab54e2
> >> [37] uuid:        <none>
> >>
> >> Performing the same test with resierfs and ext4 runs for many hours
> >> doing 100,000s of iterations without issue.
> >>
> >
> >
> > It seems that debugfs.reiser4 prints uuid incorrectly: it assumes that
> > binary uuid can't contain '\0' symbols, which apparently is wrong.
> > Thus, if the first uuid's symbol is '\0', debugfs thinks that uuid is
> > not set and prints "none" ;)
> >
> > I'll try to prepare a fixup a bit later.
> > Special thanks for the nice testing script!
> >
>
>
> Here is the fixup:
> https://github.com/edward6/reiser4progs/commit/4802cdb18ae03031d0e51a58b6655f3b99021ec2

Your fix to debugfs.reiser4 allows for printing of UUIDs correctly.
Here's my pull request to fix mkfs.reiser4 for not writing UUIDs
correctly in the first place.
https://github.com/edward6/reiser4progs/pull/1

Thanks,
Mike
