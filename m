Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDF2F43C785
	for <lists+reiserfs-devel@lfdr.de>; Wed, 27 Oct 2021 12:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241394AbhJ0KWA (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 27 Oct 2021 06:22:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241374AbhJ0KVx (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 27 Oct 2021 06:21:53 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89544C061570;
        Wed, 27 Oct 2021 03:19:28 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id r12so8502445edt.6;
        Wed, 27 Oct 2021 03:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+MBYUw2LCYdJgQSO4IIftsLZmWxQDGxMV7ore9xHzcU=;
        b=qfqCn8fapA7itXpZwM2OcOoqMp47AjxptJyG5bWkxa14z6uAAGXNf/T7BkR8ec2h+H
         4Lzh6B/GGCRy3uyrpUl9y6le9pPich1WklwGJdr660cyizw5Dsgkg2nZi8mBpBARz7Ow
         ZD1ajIqyG0GwJOmLjoDzwSyOAst03PWwVdQVwSV2YmQ0izDnmAXnuX6hUnBE6fzux92t
         drAesQwqAWfqHIRR2ujP0cUSwedBytWdx2drhhRfemoJ2lzAl71kDDCmoFKOO1dMrcNZ
         sQGV0Ycl/K89z/ImB/4A5pZf/b7hZH9TAHzi8yxa2UUmGrP6ellC9mHhg+p1bdEwS3kE
         BeYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+MBYUw2LCYdJgQSO4IIftsLZmWxQDGxMV7ore9xHzcU=;
        b=RfQaV/e2QZSaB3adbnprdqTzOktecefONnwQ8gvhm8N+auarvYjyCvncdLZQZgrmGa
         ebV1rPqvESzKct9msBfaItu8WPudCHA7NVT6qWuKZgghWFHKsfKDxoYHoTG3YTda4hjV
         TlHedSH3sM3kcATm/7WXDvbmMjeMROMyF416OOdtZbSTkQwz/eU6seZbFzvgXzkW3Yjg
         t5wWgYLaDSzMg/KvZmaGqnmheoOD0uXEolHfvWb8zZ3LMitqIB8wvSFq8gZsf1eYUs4n
         fJ0HBzdZSr0UwFz1MgW6r9QGMCwfv5U1eoh66PjMxf+2X4i8xJPnzTONWNlyMeEsjP2H
         vpuQ==
X-Gm-Message-State: AOAM5305BV0tvsGZ/lSX9Mo4coTJoMqP6etrcr58dslFWfZ/c9YabVSj
        enEYqqF1fRkibJs3LgVlkOQmIRv5sG32oCLbfvjmK3D2zMcjnw==
X-Google-Smtp-Source: ABdhPJzs9lk6InNAgsoiESIxVaUNiVxTsTkcwzDcp1ti28SZo5PQNulP2bxDk4mMSAX8pNbSFX6HQYkfZRZFyFkyOzc=
X-Received: by 2002:a17:906:1b46:: with SMTP id p6mr37201484ejg.468.1635329966937;
 Wed, 27 Oct 2021 03:19:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211027033947.3992059-1-mudongliangabcd@gmail.com> <20211027094644.GA28650@quack2.suse.cz>
In-Reply-To: <20211027094644.GA28650@quack2.suse.cz>
From:   Dongliang Mu <mudongliangabcd@gmail.com>
Date:   Wed, 27 Oct 2021 18:19:00 +0800
Message-ID: <CAD-N9QW48LDX7++chFjeZwr0Q1HX+D0+e=6BcXKxPx=i+DgmUA@mail.gmail.com>
Subject: Re: [PATCH] fs: reiserfs: free new_opts in reiserfs_remount
To:     Jan Kara <jack@suse.cz>
Cc:     Yu Kuai <yukuai3@huawei.com>, Miklos Szeredi <mszeredi@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        David Howells <dhowells@redhat.com>,
        reiserfs-devel@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Wed, Oct 27, 2021 at 5:46 PM Jan Kara <jack@suse.cz> wrote:
>
> On Wed 27-10-21 11:39:25, Dongliang Mu wrote:
> > Since the commit c3d98ea08291 ("VFS: Don't use save/replace_mount_options
> > if not using generic_show_options") eliminates replace_mount_options
> > in reiserfs, but did not handle the allocated new_opts,
> > it will cause memory leak in the reiserfs_remount.
> >
> > Fix this by freeing new_opts in the reiserfs_remount temporarily.
> >
> > Fixes: c3d98ea08291 ("VFS: Don't use save/replace_mount_options if not using generic_show_options")
> > Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
>
> Thanks for the patch but I can see that new_opts is not actually used at
> all in reiserfs_remount() so we should perhaps just remove them (including
> kstrdup() et al).

That's also a plan. Since I am not sure if maintainers will use
new_opts anymore, So I propose a temporary patch to fix this memory
leak.

If you think new_opts is not used anymore, let's remove all the code
related to new_opts.

>
>                                                                 Honza
>
> > ---
> >  fs/reiserfs/super.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
> > index 58481f8d63d5..b36865c8b66a 100644
> > --- a/fs/reiserfs/super.c
> > +++ b/fs/reiserfs/super.c
> > @@ -1594,6 +1594,7 @@ static int reiserfs_remount(struct super_block *s, int *mount_flags, char *arg)
> >       }
> >
> >  out_ok_unlocked:
> > +     kfree(new_opts);
> >       return 0;
> >
> >  out_err_unlock:
> > --
> > 2.25.1
> >
> --
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
