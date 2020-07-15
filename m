Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 037222206B9
	for <lists+reiserfs-devel@lfdr.de>; Wed, 15 Jul 2020 10:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729579AbgGOIEx (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 15 Jul 2020 04:04:53 -0400
Received: from [195.135.220.15] ([195.135.220.15]:42724 "EHLO mx2.suse.de"
        rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
        id S1729001AbgGOIEx (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 15 Jul 2020 04:04:53 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id A5443AE51;
        Wed, 15 Jul 2020 08:04:54 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
        id 5B05E1E12C9; Wed, 15 Jul 2020 10:04:51 +0200 (CEST)
Date:   Wed, 15 Jul 2020 10:04:51 +0200
From:   Jan Kara <jack@suse.cz>
To:     Tom Rix <trix@redhat.com>
Cc:     Matthew Wilcox <willy@infradead.org>, jack@suse.cz,
        william.kucharski@oracle.com, jeffm@suse.com,
        joseph.qi@linux.alibaba.com, liao.pingfang@zte.com.cn,
        reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] reiserfs : fix improper free in reiserfs_get_block
Message-ID: <20200715080451.GK23073@quack2.suse.cz>
References: <20200714130509.11791-1-trix@redhat.com>
 <20200714131043.GB12769@casper.infradead.org>
 <bc5a13bd-54c4-509d-7202-20c93f43e2f6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc5a13bd-54c4-509d-7202-20c93f43e2f6@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Tue 14-07-20 06:12:47, Tom Rix wrote:
> 
> On 7/14/20 6:10 AM, Matthew Wilcox wrote:
> > On Tue, Jul 14, 2020 at 06:05:09AM -0700, trix@redhat.com wrote:
> >> From: Tom Rix <trix@redhat.com>
> >>
> >> clang static analysis flags this error
> >>
> >> inode.c:1083:5: warning: Argument to kfree() is the address of the
> >>   local variable 'unf_single', which is not memory allocated by
> >>   malloc() [unix.Malloc]
> >>                                 kfree(un);
> >>                                 ^~~~~~~~~
> >> Assignment of 'un'
> >>
> >> 	/*
> >> 	 * We use this in case we need to allocate
> >> 	 * only one block which is a fastpath
> >> 	 */
> >> 	unp_t unf_single = 0;
> >>
> >> 	...
> >>
> >> 	if (blocks_needed == 1) {
> >> 		un = &unf_single;
> >> 	} else {
> >> 		un = kcalloc(min(blocks_needed, max_to_insert),
> >> 			     UNFM_P_SIZE, GFP_NOFS);
> >> 		if (!un) {
> >> 			un = &unf_single;
> >> 			blocks_needed = 1;
> >> 			max_to_insert = 0;
> >> 		}
> >> 	}
> >>
> >> The logic to free 'un'
> >>
> >> 	if (blocks_needed != 1)
> >> 		kfree(un);
> >>
> >> Because the kcalloc failure falls back to using unf_single,
> >> the if-check for the free is wrong.
> > I think you mean "Because clang's static analysis is limited, it
> > warns incorrectly about this".  There's no path to get to the
> > kfree with blocks_needed != 1 and un being equal to &unf_single.
> 
> Ok.

I agree with Matthew the patch will make the code more obviously correct so
it's a sensible cleanup. But the changelog needs to redone to reflect this
is just a cleanup before the patch can be merged.

									Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
