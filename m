Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0C9A2F10ED
	for <lists+reiserfs-devel@lfdr.de>; Mon, 11 Jan 2021 12:17:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729313AbhAKLQY (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 11 Jan 2021 06:16:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728299AbhAKLQY (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 11 Jan 2021 06:16:24 -0500
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2AC6C0617A3
        for <reiserfs-devel@vger.kernel.org>; Mon, 11 Jan 2021 03:15:43 -0800 (PST)
Received: by mail-qk1-x72e.google.com with SMTP id p14so14214012qke.6
        for <reiserfs-devel@vger.kernel.org>; Mon, 11 Jan 2021 03:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=07jVVaRVyq5aozxWNXLFWFjmN6KjLrqrOzqL/0QRu9w=;
        b=W+q+OmcQ/0EhY8lol5ozzXnDL4vttxLXTvCiOGZ0RVIXgIsKazQ9nb1lH7pg6A9Kys
         cPbKquKsKFllOelUMfGU4wjWjlXfj30uqaR72Y8MXxNQ5cokRc9HBPhpV8TUXQh/wD3+
         BqzFQPDhv0jcjaBngCg7gF9hR/snQp64NDE1XMoqrwgmZf/UudK3XZNFFb6csUAL+g+h
         uaY6/mlwpItvCmpbaC6lBySHizGAzlBSUczX4rQ7wyL81V6zxxL0yo8fmqIKvkQR1o3x
         s3O4vmgYChOGKxaMI/Mh1HcW1H7S/HdNJaO6qyw1sFoav8uOv2pVU+cau2IMAL/5X7Al
         ln7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=07jVVaRVyq5aozxWNXLFWFjmN6KjLrqrOzqL/0QRu9w=;
        b=YrQAqNFWacPlLJXGMiyacXORjZJ/vs3lHK+L3wkMRj4h+Reh5+sHEVryJ+XwJqtVs9
         Lij83P4TPYYm8dQk8/Rhak0E7IHXCZo6wdr+3tvLUKxVCbGBPM/INGe/Y46J59RxzxvO
         DbSijz2JVl54ZMUXVGdvHVp3fsLMfSH/4j/J4VsQII++ql6WgwxubAY9t10ZgSihMZz0
         P0ng+lFjc4PHuCjp/gDr3e+JxJd3cu+/Zijd6XVAvOf4sZmYiDKif1YFGzLDtzVehaKV
         rUEvzjwty0cS36mzX8gbQrZAkPT5QAh1LMfZUw98W5VJmqMtCw9McNZ5cegRlzIhd2/x
         EuAQ==
X-Gm-Message-State: AOAM533xPhPYfZTUyI6Yz7pVAueoN8jTD1dyAk/95L2zPLElc9tbfIp4
        g3pPSNIVQmUJHLCzHmrfgmQgHEppPQPrGRUrfoNg3Q==
X-Google-Smtp-Source: ABdhPJzFH7Ffg54k/2Bp9Tqeq4wAtDMmwzROOvlcJmb4ErqZLcrCQxWkeWhUID9OcWMoXH7vKJw3x4b8eTtWu+JeJeY=
X-Received: by 2002:a37:9a97:: with SMTP id c145mr15628129qke.350.1610363742672;
 Mon, 11 Jan 2021 03:15:42 -0800 (PST)
MIME-Version: 1.0
References: <000000000000eba11705afd3d759@google.com> <000000000000ac50ae05b862040d@google.com>
In-Reply-To: <000000000000ac50ae05b862040d@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 11 Jan 2021 12:15:31 +0100
Message-ID: <CACT4Y+b0ZwjFXBe5woU+eNzkbuWNgE37i3vU2vFk0PGNjVHiZw@mail.gmail.com>
Subject: Re: kernel BUG at fs/reiserfs/prints.c:LINE!
To:     syzbot <syzbot+1541a3226994c0781b29@syzkaller.appspotmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>, Jan Kara <jack@suse.cz>,
        LKML <linux-kernel@vger.kernel.org>,
        reiserfs-devel@vger.kernel.org, rkovhaev@gmail.com,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        zhengbin13@huawei.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Fri, Jan 8, 2021 at 12:40 PM syzbot
<syzbot+1541a3226994c0781b29@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit d24396c5290ba8ab04ba505176874c4e04a2d53c
> Author: Rustam Kovhaev <rkovhaev@gmail.com>
> Date:   Sun Nov 1 14:09:58 2020 +0000
>
>     reiserfs: add check for an invalid ih_entry_count
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1731e8f7500000
> start commit:   521b619a Merge tag 'linux-kselftest-kunit-fixes-5.10-rc3' ..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=4e93228e2f17fb12
> dashboard link: https://syzkaller.appspot.com/bug?extid=1541a3226994c0781b29
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1446e7a8500000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15c56f5c500000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: reiserfs: add check for an invalid ih_entry_count
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

Looks realistic

#syz fix: reiserfs: add check for an invalid ih_entry_count
