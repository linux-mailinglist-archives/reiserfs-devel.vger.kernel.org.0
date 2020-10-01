Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D82727FD98
	for <lists+reiserfs-devel@lfdr.de>; Thu,  1 Oct 2020 12:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731647AbgJAKog (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 1 Oct 2020 06:44:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731131AbgJAKog (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 1 Oct 2020 06:44:36 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B65CC0613D0;
        Thu,  1 Oct 2020 03:44:36 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id 77so5986878lfj.0;
        Thu, 01 Oct 2020 03:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ojmg4WxYD/u18qmdAKGCYKINcMzngT6q+rwCL5H7AIA=;
        b=Zel4NcLndJxlVu5gZq0rvS6Lri7uxWFQHZISu27OPtLhr4fNy6LeTZuxVcHzKRBX/o
         BmvlatspfJ4HJ2ZZdGxCn/peD1t3+ERxfHFBRxNsi0nYmTuug/LOp06nC42qWno8+llS
         pI0IcHpBzrIS6BBHbqOBNiGMS+PqNvIV/MeRzLLHYxilEWWFHj5/KA8hxV84o8lRI+jd
         a+H9egeEfQIk9a3bn7p4EBm2qBUePtCg4F4oBrFJ0GyZHiIbMcUpwFpYLoLJYrqCrTkh
         5AkNlSFQfP5Fgx9svC34sUjkU3Cze2LDcP2BE2SyO9r8dhU12xqdvGJu4bwlamJBO1tz
         UZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ojmg4WxYD/u18qmdAKGCYKINcMzngT6q+rwCL5H7AIA=;
        b=dYO66G5Y8GAk3coBJTFAQpM0KNPKaOstsIKf2OBHcGzYbQVy99713aHt41A8c85oqu
         7sdVbuNFtX9LWZayVqfZ22rGoaIw30xfxhz8JNAPUT3mMhLsMt1tQPDHytKrP0o0ppk8
         MSzQdjOPmryWFj/vz/5ZJeVTIVRG7HMmY6mi7UkW6oA+VUnYiMTiMN+JU7YSg6oHxIs2
         AhZU6gXEj3mvRS0C4UmiYSscJc/OSI0MHJBeOlxHUlSikKQX8nRDS0Mg+O58N4ClEP87
         T2S/+P02U0xjRoUBZb0shrJMi/wUzmQPdNOrzkfX2STb4KNrwa0+uo/CkUphoe+RYHFD
         DxFQ==
X-Gm-Message-State: AOAM530RqoaUVYJD2jTd10V4fVoNG1zsf1NBN8kp79IfwNxFtH4uFnwM
        MKXB1jVyZqmbIXI5X1ydRLOHaXBN4X0sEcxKgSg=
X-Google-Smtp-Source: ABdhPJyN0JHy6HerNFRjD8OA1RcXWM76t50UzX/rH7avvgEp2rRkGMk2X9lU2RcF2qv/GWxloy3XG0Je7kPajHqem48=
X-Received: by 2002:ac2:5de3:: with SMTP id z3mr2646855lfq.327.1601549074313;
 Thu, 01 Oct 2020 03:44:34 -0700 (PDT)
MIME-Version: 1.0
References: <20201001090547.431840-1-anmol.karan123@gmail.com> <20201001092841.GC17860@quack2.suse.cz>
In-Reply-To: <20201001092841.GC17860@quack2.suse.cz>
From:   Anmol karn <anmol.karan123@gmail.com>
Date:   Thu, 1 Oct 2020 16:14:23 +0530
Message-ID: <CAC+yH-Z3243vRB6Nr7Y1FrfsQcmyjM0qH8D1FKSzSPEi=xa0uw@mail.gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] fs: reiserfs: xattr: Fix null
 pointer derefernce in open_xa_root()
To:     Jan Kara <jack@suse.cz>
Cc:     jeffm@suse.com, open list <linux-kernel@vger.kernel.org>,
        reiserfs-devel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        syzkaller-bugs@googlegroups.com,
        syzbot+9b33c9b118d77ff59b6f@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Thu, Oct 1, 2020 at 2:58 PM Jan Kara <jack@suse.cz> wrote:
>
> On Thu 01-10-20 14:35:47, Anmol Karn wrote:
> > d_really_is_negative() checks for the dentry->d_inode whether it's NULL
> > or not, but in open_xa_root(), when it checks 'privroot->d_inode', it
> > doesn't check whether privroot is NULL or not, this leads to a null
> > pointer dereference while calling it from open_xa_dir() while
> > initializing xaroot.
> >
> > - fs/reiserfs/xattr.c
> > The bug seems to get triggered at this line:
> >
> > if (d_really_is_negative(privroot))
> >               return ERR_PTR(-EOPNOTSUPP);
> >
> > Fix it by adding a NULL check for privroot.
> >
> > Reported-and-tested-by: syzbot+9b33c9b118d77ff59b6f@syzkaller.appspotmail.com
> > Link: https://syzkaller.appspot.com/bug?extid=9b33c9b118d77ff59b6f
> > Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
>
> Thanks for the patch! I've already fixed the problem myself (slightly
> differently) but I'll comment about your patch below for educational
> purposes :). See
> https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git/commit/?h=for_next&id=c2bb80b8bdd04dfe32364b78b61b6a47f717af52

Ah, no worries, I am glad that, the bug is fixed :).
I will mark this as fixed on syzbot.

>
> > diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
> > index 28b241cd6987..a75480d0ee7e 100644
> > --- a/fs/reiserfs/xattr.c
> > +++ b/fs/reiserfs/xattr.c
> > @@ -121,8 +121,9 @@ static struct dentry *open_xa_root(struct super_block *sb, int flags)
> >       struct dentry *privroot = REISERFS_SB(sb)->priv_root;
> >       struct dentry *xaroot;
> >
> > -     if (d_really_is_negative(privroot))
> > +     if (!privroot || d_really_is_negative(privroot)) {
> >               return ERR_PTR(-EOPNOTSUPP);
>
> I don't think EOPNOTSUPP is correct return code for !privroot case. AFAICS
> it would propagate out of reiserfs xattr code and would result in denying
> access to lookup_one_len() so xattr dir could never be initialized for such
> filesystem. So we need to return 0 (success, no xattrs present) in this
> case and because this is just a special case when we are initializing xattr
> dir and recurse back into xattr code, I've decided to perform this check
> directly in reiserfs_xattr_get().

Thanks for the review and information, sir.

>
> > +     }
>
> There's no need for additional braces in this 'if'.
> >
> >       inode_lock_nested(d_inode(privroot), I_MUTEX_XATTR);
>
>                                                                 Honza
> --
> Jan Kara <jack@suse.com>
> SUSE Labs, CR

Anmol
