Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08D447455D1
	for <lists+reiserfs-devel@lfdr.de>; Mon,  3 Jul 2023 09:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230160AbjGCHRf (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 3 Jul 2023 03:17:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbjGCHRd (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 3 Jul 2023 03:17:33 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66486E47
        for <reiserfs-devel@vger.kernel.org>; Mon,  3 Jul 2023 00:17:28 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fbca6a9ae4so112815e9.0
        for <reiserfs-devel@vger.kernel.org>; Mon, 03 Jul 2023 00:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688368647; x=1690960647;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0hnHpIHP0MmQmToWJQ8RUHzi1Z6asIXxH+8Z3t+Oc5Y=;
        b=f+vC2qqRJ4L/52WXXcA1asyIc04MjD5qn+Y65UadnaS1mXhEJuE3SirfDdtwJ+fBN+
         y60N8wlB5pmmdjfySRhx9tKirmmVcYs89SIYvZ6PtYf4Zy3F503B5G1Yf6qLo2TCFI0x
         R6Vd7D9buMyp4XpyZdI/bqsFX2MFmNYEc5ppvWpZrHVLawn3LuC+ivzOCQRgpzIszm2d
         0H9y8fMzRmLTyjVrfF+0jBApzlB906WMzvwxLbSemYbDot7BBu755/9VkT7hpqJITMBp
         /z+MHdkDKdL4Azu3x/DXV6k9QXGJrg+FfJVUC+CTOIf4cL8bh3CHWAjNnXjsR9ZgiErT
         kKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688368647; x=1690960647;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0hnHpIHP0MmQmToWJQ8RUHzi1Z6asIXxH+8Z3t+Oc5Y=;
        b=McZ4il2ko7ITfVa8C/AXvD+vZTQNPA4u89giWxPRwz7fpyKpY9tg0aTu8EYaAon+xj
         XntYKNL0jIA9nh7fYBWzFze4aoa6OlKNO/qkHquvU/H7K2wEMiiQeOvTTsrkzwrceS9t
         fJamjASUEooybofsC+2i5pGLcvZhO9rcBUjxAIp32N6gWsakHHXuYZL9Bt23pwc09ikU
         4jl0CWRr2f3lJwUEZeFNUJCok42nxBepJXU8b6qu/DQJHW8DJ9WhJthXgFk6hFK2jP5a
         aG/f3l98XbnsYXIDOyOt+lX1thS4w+iq2F2h0SpOiQOAGgMMcgjTyU9WGQNN7jK//iDT
         Crrw==
X-Gm-Message-State: ABy/qLaC6VtGMiPQ2kfVnGX4KisaWngIgmzKo5MDeFGCt1ZAsO9z5I5d
        dHXUDNQyKwK3BM11btAaGU7uNGK5Z/RLxYTlAO8VNA==
X-Google-Smtp-Source: APBJJlEe0MMNIljnBBhTRv0r9bOqt1AjvoM9bTpWOot0Iink8OeixsF6Dur+PsQx8Zz7AKZwBHUumOblvvNlLVruqcc=
X-Received: by 2002:a05:600c:34c2:b0:3f7:e4d8:2569 with SMTP id
 d2-20020a05600c34c200b003f7e4d82569mr110181wmq.5.1688368646788; Mon, 03 Jul
 2023 00:17:26 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000002373f005ff843b58@google.com> <1bb83e9d-6d7e-3c80-12f6-847bf2dc865e@google.com>
In-Reply-To: <1bb83e9d-6d7e-3c80-12f6-847bf2dc865e@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 3 Jul 2023 09:17:11 +0200
Message-ID: <CACT4Y+akPvTGG0WdPdSuUFU6ZuQkRbVZByiROzqwyPVd8Pz8fQ@mail.gmail.com>
Subject: Re: [syzbot] [mm?] [reiserfs?] kernel panic: stack is corrupted in ___slab_alloc
To:     David Rientjes <rientjes@google.com>
Cc:     syzbot <syzbot+cf0693aee9ea61dda749@syzkaller.appspotmail.com>,
        42.hyeyoo@gmail.com, Andrew Morton <akpm@linux-foundation.org>,
        cl@linux.com, iamjoonsoo.kim@lge.com, keescook@chromium.org,
        linux-fsdevel@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        penberg@kernel.org, reiserfs-devel@vger.kernel.org,
        roman.gushchin@linux.dev, syzkaller-bugs@googlegroups.com,
        Vlastimil Babka <vbabka@suse.cz>, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Mon, 3 Jul 2023 at 09:14, 'David Rientjes' via syzkaller-bugs
<syzkaller-bugs@googlegroups.com> wrote:
>
> On Sun, 2 Jul 2023, syzbot wrote:
>
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    e8f75c0270d9 Merge tag 'x86_sgx_for_v6.5' of git://git.ker..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=168b84fb280000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=a98ec7f738e43bd4
> > dashboard link: https://syzkaller.appspot.com/bug?extid=cf0693aee9ea61dda749
> > compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10310670a80000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1220c777280000
> >
> > Downloadable assets:
> > disk image: https://storage.googleapis.com/syzbot-assets/f27c1d41217a/disk-e8f75c02.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/843ae5d5c810/vmlinux-e8f75c02.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/da48bc4c0ec1/bzImage-e8f75c02.xz
> > mounted in repro: https://storage.googleapis.com/syzbot-assets/658601e354e4/mount_0.gz
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+cf0693aee9ea61dda749@syzkaller.appspotmail.com
> >
> > Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: ___slab_alloc+0x12c3/0x1400 mm/slub.c:3270
> > CPU: 0 PID: 5009 Comm: syz-executor248 Not tainted 6.4.0-syzkaller-01406-ge8f75c0270d9 #0
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/27/2023
> > Call Trace:
> >  <TASK>
> >  __dump_stack lib/dump_stack.c:88 [inline]
> >  dump_stack_lvl+0xd9/0x150 lib/dump_stack.c:106
> >  panic+0x686/0x730 kernel/panic.c:340
> >  __stack_chk_fail+0x19/0x20 kernel/panic.c:759
> >  ___slab_alloc+0x12c3/0x1400 mm/slub.c:3270
> >
>
> This is happening during while mounting reiserfs, so I'm inclined to think
> it's more of a reisterfs issue than a slab allocator issue :/


Now we can make it official :)

#syz set subsystems: reiserfs

To remove from open mm issues:

https://syzkaller.appspot.com/upstream/s/mm

to reiserfs issues:

https://syzkaller.appspot.com/upstream/s/reiserfs
