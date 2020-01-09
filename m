Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 743BC1358EC
	for <lists+reiserfs-devel@lfdr.de>; Thu,  9 Jan 2020 13:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730834AbgAIMMZ (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 9 Jan 2020 07:12:25 -0500
Received: from mx2.suse.de ([195.135.220.15]:60518 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730167AbgAIMMY (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 9 Jan 2020 07:12:24 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 0E321B1FD5;
        Thu,  9 Jan 2020 12:12:17 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
        id 4BA421E0798; Thu,  9 Jan 2020 13:12:16 +0100 (CET)
Date:   Thu, 9 Jan 2020 13:12:16 +0100
From:   Jan Kara <jack@suse.cz>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Michael Brunnbauer <brunni@netestate.de>,
        linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org,
        Jan Kara <jack@suse.cz>, jeffm@suse.com
Subject: Re: reiserfs broke between 4.9.205 and 4.9.208
Message-ID: <20200109121216.GC22232@quack2.suse.cz>
References: <20200108193634.GA17390@netestate.de>
 <481c595b-46c9-0b4d-c618-a998ab6247c6@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <481c595b-46c9-0b4d-c618-a998ab6247c6@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org


Hello,

On Wed 08-01-20 15:42:58, Randy Dunlap wrote:
> On 1/8/20 11:36 AM, Michael Brunnbauer wrote:
> > after upgrading from 4.9.205 to 4.9.208, I get errors on two different
> > reiserfs filesystems when doing cp -a (the chown part seems to fail) and
> > on other occasions:
> > 
> >  kernel: REISERFS warning (device sda1): jdm-20004 reiserfs_delete_xattrs: Couldn't delete all xattrs (-95)
> > 
> >  kernel: REISERFS warning (device sdc1): jdm-20004 reiserfs_delete_xattrs: Couldn't delete all xattrs (-95)
> > 
> > This behaviour disappeared after a downgrade to 4.9.205.
> > 
> > I understand there have been changes to the file system code but I'm not
> > sure they affect reiserfs, e.g.
> > 
> >  https://bugzilla.kernel.org/show_bug.cgi?id=205433
> > 
> > Any Idea?
> > 
> > Regards,
> > 
> > Michael Brunnbauer
> > 
> 
> Looks to me like 4.9.207 contains reiserfs changes.
> 
> Adding CC's.

Looks like a regression from commit 60e4cf67a582 "reiserfs: fix extended
attributes on the root directory". We are getting -EOPNOTSUPP from
reiserfs_for_each_xattr() likely originally from open_xa_root(). Previously
we were returning -ENODATA from there which error reiserfs_for_each_xattr()
converted to 0. I don't understand reiserfs xattrs enough to quickly tell
what should actually be happening after the Jeff's change - naively I'd
think we should just silence the bogus warning in case of EOPNOTSUPP. Jeff,
can you have a look?

Also Michael, I'd like to clarify: Does 'cp -a' return any error or is it
just that the kernel is spewing these annoying warnings?  Because from the
code reading I'd think that it is only the kernel spewing errors but
userspace should be fine...

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
