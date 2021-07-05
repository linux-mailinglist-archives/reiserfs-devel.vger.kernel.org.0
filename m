Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D20603BBC3B
	for <lists+reiserfs-devel@lfdr.de>; Mon,  5 Jul 2021 13:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231222AbhGELgH (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 5 Jul 2021 07:36:07 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:56158 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbhGELgH (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 5 Jul 2021 07:36:07 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 4F8EC21CAE;
        Mon,  5 Jul 2021 11:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1625484809; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6J7FT459w1mR+ClPDnP6dAqMfQqmMt7HkiwXcKAL8XI=;
        b=SoLAuhDilZO3LZtpt4jux0RYpV8oPebH+RX8X18PzGZv5kY1MJPsmYI5qgSSVgI/o6P8Ww
        2zDNZ+tEgEasyx2UslzKa+2A72QjB5mDbsbz5cVliVnZWxzWlZk5GccbhseeWUHc3C7H1X
        Jnn3qQe7LBsdeNq7ifY8aZuaigMbyNM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1625484809;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6J7FT459w1mR+ClPDnP6dAqMfQqmMt7HkiwXcKAL8XI=;
        b=FCGD4j/JA9AbbAcGHJZJIvK176cGAglcunPYzX8aqLIV8Yi6FnFew7rQ10B3CHdyUeFhuI
        EHHnJseAY3sdGGAA==
Received: from quack2.suse.cz (unknown [10.163.43.118])
        by relay2.suse.de (Postfix) with ESMTP id 4142CA3B8A;
        Mon,  5 Jul 2021 11:33:29 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
        id 1C1911E1139; Mon,  5 Jul 2021 13:33:29 +0200 (CEST)
Date:   Mon, 5 Jul 2021 13:33:29 +0200
From:   Jan Kara <jack@suse.cz>
To:     Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
Cc:     jack@suse.cz, rkovhaev@gmail.com, reiserfs-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: Verify the items that we read from blocks
Message-ID: <20210705113329.GE15373@quack2.suse.cz>
References: <YN8rRYxhZvAa+VxU@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YN8rRYxhZvAa+VxU@fedora>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hello!

On Fri 02-07-21 20:35:41, Shreyansh Chouhan wrote:
> I was trying to work on this[1] bug. After a lot of reading the code and
> running it under gdb, I found out that the error happens because
> syzkaller creates a segment with raw binary data in the reproducer[2],
> that has the wrong deh_location for the `..` directory item. (The value
> is 0x5d (93), where as it should have been 0x20 (32).)

First, I'd like to note that reiserfs is a legacy filesystem which gets
little maintenance and I think distributions are close to disabling it in
their default kernels if they didn't do it already. So I'm not sure how
much is it worth it to do any larger fixes to it. But if you have a
personal passion for reiserfs feel free to go ahead and try to fix these
issues.

> I think that the solution would involve checking the items that we read,
> and verify that they are actually valid. But this check could actually
> happen in two places:
> 
> - First idea would be to check as soon as we read a
>   block, and one way of doing that would be adding a wrapper around
>   ll_rw_block that validates the leaf node blocks that we read. The
>   benifits to this would be that since we're solving the problem at it's
>   root, very few functions would have to be changed. But I don't know
>   how much of a performance hit would it be.

It depends on how heavy the checks are going to be but generally checking
when loading from the disk is the way how most filesystems handle this.

> - Second idea would be to do these validation checks lazily. This should
>   be faster than the first idea, but this would involve changing the
>   code at more places than in the first idea.
> 
> For how the validation happens, the first idea that comes to mind is
> reading the item headers from the block that we read and verifying if
> the header is valid, and if the items themselves are valid according to
> the header.

Looks sound.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
