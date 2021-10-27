Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BED7943C9B4
	for <lists+reiserfs-devel@lfdr.de>; Wed, 27 Oct 2021 14:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241855AbhJ0McM (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 27 Oct 2021 08:32:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232724AbhJ0McL (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 27 Oct 2021 08:32:11 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80EBFC061570;
        Wed, 27 Oct 2021 05:29:46 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id u13so9805224edy.10;
        Wed, 27 Oct 2021 05:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RmJV7y4H0T7dh+JR8cakBOomZHH6oytwp4hKK/hZKRg=;
        b=f2bAYZi8bkhaxUekZ1UbLZCe0hFL7njRAVf+CnNlFRWOTum5/g5Jhqo8NhlA6rByT5
         kKZj+3QeFARk+aLW4mS5X1H623yUQ4o1mcUt2CSXuyohGpe4Lds+tU1wutcHqgNjwWnf
         20tEFdjfi12LKf41bJJyu3ZmMp/FjT4EPBnNKPa4Ouu4BHhfpxKPk7jvylp3hiXVt5hN
         kRFIPtatIRWxiOKgtJ5rq5UCFQpjKf9RUpgIk9H/7l359gQi1RmfTAI1VRAiKN33VnNm
         UpJgpQcOfNEsQJrNvpCt8+/EVqMFKtHVIOp4a8kbp/vPb5AfctTBq5rKVxaxo1/TLd7C
         eXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RmJV7y4H0T7dh+JR8cakBOomZHH6oytwp4hKK/hZKRg=;
        b=yMqnWSVyjfOkhgl0XOc0UgdajK8OMY7tdt8APAiI1DhfF/igxaz7GxH/mGCrRlbC70
         gbpyXjMPPFpdH0Q5fobZYa8FN6Z9Dp/EIGYecGXILt0SjuZ2Tb0bZ+sD4BgJAlPUz6g4
         z3rgy6A1Vn8YF5LaC3ifoAvieeA982dkU++ta64+6dmuZqNtW3QAw1Cn2BUFRkWZcBpL
         gKNPmCdEfSAZD4oP+RVCzX9ZowSdXFoD6B8SF4tDQ0wvw96Ak53P5Uy7AiqPL9rP/i7z
         lMx0eH7/Vg7KbICNWMJo3UxysvEAQRjr6FEFCF1pWbiFVymNVocbwxgL1VCufr6di6my
         SSNg==
X-Gm-Message-State: AOAM532BioHsmtsfzzt+GmydtFl30a8TBEanPCZcRQeCiIqed3xGiiyw
        8b4t2LQkI4N0rVCKiuXZstKMhMNg5ZJUtbDpBoI=
X-Google-Smtp-Source: ABdhPJzqRMyOpZTPUEieR41Q4H1jW4DWILafBAkotuKIi4c3vdeUwE3OYrbqa4G8OasQ9JkxHme+QcKC5fnZ507Jr6Q=
X-Received: by 2002:a17:906:248b:: with SMTP id e11mr89432ejb.172.1635337785025;
 Wed, 27 Oct 2021 05:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211027033947.3992059-1-mudongliangabcd@gmail.com>
 <20211027094644.GA28650@quack2.suse.cz> <CAD-N9QW48LDX7++chFjeZwr0Q1HX+D0+e=6BcXKxPx=i+DgmUA@mail.gmail.com>
 <20211027111527.GD28650@quack2.suse.cz>
In-Reply-To: <20211027111527.GD28650@quack2.suse.cz>
From:   Dongliang Mu <mudongliangabcd@gmail.com>
Date:   Wed, 27 Oct 2021 20:29:19 +0800
Message-ID: <CAD-N9QX01gVnRdntN=pcTgAW7wCXtZj5o_9YctvOSHaf694cxQ@mail.gmail.com>
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

On Wed, Oct 27, 2021 at 7:15 PM Jan Kara <jack@suse.cz> wrote:
>
> On Wed 27-10-21 18:19:00, Dongliang Mu wrote:
> > On Wed, Oct 27, 2021 at 5:46 PM Jan Kara <jack@suse.cz> wrote:
> > >
> > > On Wed 27-10-21 11:39:25, Dongliang Mu wrote:
> > > > Since the commit c3d98ea08291 ("VFS: Don't use save/replace_mount_options
> > > > if not using generic_show_options") eliminates replace_mount_options
> > > > in reiserfs, but did not handle the allocated new_opts,
> > > > it will cause memory leak in the reiserfs_remount.
> > > >
> > > > Fix this by freeing new_opts in the reiserfs_remount temporarily.
> > > >
> > > > Fixes: c3d98ea08291 ("VFS: Don't use save/replace_mount_options if not using generic_show_options")
> > > > Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > >
> > > Thanks for the patch but I can see that new_opts is not actually used at
> > > all in reiserfs_remount() so we should perhaps just remove them (including
> > > kstrdup() et al).
> >
> > That's also a plan. Since I am not sure if maintainers will use
> > new_opts anymore, So I propose a temporary patch to fix this memory
> > leak.
> >
> > If you think new_opts is not used anymore, let's remove all the code
> > related to new_opts.
>
> If it is ever needed again, we can always add it. Please just remove it.

Sure. I will send a patch v2.

> Thanks!
>
>                                                                 Honza
> --
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
