Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2AF343C85D
	for <lists+reiserfs-devel@lfdr.de>; Wed, 27 Oct 2021 13:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239601AbhJ0LRy (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 27 Oct 2021 07:17:54 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:50582 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237402AbhJ0LRy (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 27 Oct 2021 07:17:54 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 4C114218ED;
        Wed, 27 Oct 2021 11:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1635333327; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZkxJPQN9liKoaICizGCBGi8W3K8sU2vxUXZo9t/rlgg=;
        b=oBdLTDqTh8rLJ32djlyxuwri6hdSouIAD1FOFvKp/KH1J0xXOpIvQslk2qgpyiBq9I+MX0
        5vguduZMMvjudda7RTHit5bUHY/0/tbJQZH3x7bc/hNKOcQrMZyszpXsT4FKoUZhtcGUB8
        MBNSdRfLj90KHU5Ip7s6In/CdyBWCxI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1635333327;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZkxJPQN9liKoaICizGCBGi8W3K8sU2vxUXZo9t/rlgg=;
        b=lYXZL+DalL8MYbrH1mJXZN1j6xevEn6Qk9KcXbxXj8eTQhwTkrYl4BiMWLuyxuZyfHIpd2
        irJhEz5VkAXHYBDg==
Received: from quack2.suse.cz (unknown [10.100.224.230])
        by relay2.suse.de (Postfix) with ESMTP id 384EBA3B81;
        Wed, 27 Oct 2021 11:15:27 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
        id 1607A1F2C66; Wed, 27 Oct 2021 13:15:27 +0200 (CEST)
Date:   Wed, 27 Oct 2021 13:15:27 +0200
From:   Jan Kara <jack@suse.cz>
To:     Dongliang Mu <mudongliangabcd@gmail.com>
Cc:     Jan Kara <jack@suse.cz>, Yu Kuai <yukuai3@huawei.com>,
        Miklos Szeredi <mszeredi@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        David Howells <dhowells@redhat.com>,
        reiserfs-devel@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] fs: reiserfs: free new_opts in reiserfs_remount
Message-ID: <20211027111527.GD28650@quack2.suse.cz>
References: <20211027033947.3992059-1-mudongliangabcd@gmail.com>
 <20211027094644.GA28650@quack2.suse.cz>
 <CAD-N9QW48LDX7++chFjeZwr0Q1HX+D0+e=6BcXKxPx=i+DgmUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD-N9QW48LDX7++chFjeZwr0Q1HX+D0+e=6BcXKxPx=i+DgmUA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Wed 27-10-21 18:19:00, Dongliang Mu wrote:
> On Wed, Oct 27, 2021 at 5:46 PM Jan Kara <jack@suse.cz> wrote:
> >
> > On Wed 27-10-21 11:39:25, Dongliang Mu wrote:
> > > Since the commit c3d98ea08291 ("VFS: Don't use save/replace_mount_options
> > > if not using generic_show_options") eliminates replace_mount_options
> > > in reiserfs, but did not handle the allocated new_opts,
> > > it will cause memory leak in the reiserfs_remount.
> > >
> > > Fix this by freeing new_opts in the reiserfs_remount temporarily.
> > >
> > > Fixes: c3d98ea08291 ("VFS: Don't use save/replace_mount_options if not using generic_show_options")
> > > Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> >
> > Thanks for the patch but I can see that new_opts is not actually used at
> > all in reiserfs_remount() so we should perhaps just remove them (including
> > kstrdup() et al).
> 
> That's also a plan. Since I am not sure if maintainers will use
> new_opts anymore, So I propose a temporary patch to fix this memory
> leak.
> 
> If you think new_opts is not used anymore, let's remove all the code
> related to new_opts.

If it is ever needed again, we can always add it. Please just remove it.
Thanks!

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
