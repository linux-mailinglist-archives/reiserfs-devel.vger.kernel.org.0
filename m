Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03C5A39F5CE
	for <lists+reiserfs-devel@lfdr.de>; Tue,  8 Jun 2021 13:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232114AbhFHL6j (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 8 Jun 2021 07:58:39 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:39514 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232054AbhFHL6j (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 8 Jun 2021 07:58:39 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id A43881FD33;
        Tue,  8 Jun 2021 11:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1623153405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7xXEUocRRGzbJc6AQnosFuFOSvUKYrP5dCZOSCs+Os0=;
        b=V59/5IhYgS6/90gbYpUSlQg8HWHFgy1g55grpMukNAYGWV+YaOhOBud6XqtYyCHpiPHRJx
        Kadj7aGOZoqOhbaECTR7XCI/fDKNMqKOmj48irLVO9rRqgiXHEKWlXeQXNU1ZrlrPiD5np
        md0ho8NW2zpZgmmU/b7+sOfNIrdMIes=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1623153405;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7xXEUocRRGzbJc6AQnosFuFOSvUKYrP5dCZOSCs+Os0=;
        b=LSN7RPTWVxHJextwBIrmGiiiGJClId6zX3wz8m4eLK91Wdt1f8b17gIs8M9D4/3Khs7PYL
        EVScBT8mEJZltVDQ==
Received: from quack2.suse.cz (unknown [10.100.200.198])
        by relay2.suse.de (Postfix) with ESMTP id 88E98A3B83;
        Tue,  8 Jun 2021 11:56:45 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
        id 7701D1F2C94; Tue,  8 Jun 2021 13:56:45 +0200 (CEST)
Date:   Tue, 8 Jun 2021 13:56:45 +0200
From:   Jan Kara <jack@suse.cz>
To:     Pavel Skripkin <paskripkin@gmail.com>
Cc:     Jan Kara <jack@suse.cz>, tiantao6@hisilicon.com,
        rdunlap@infradead.org, reiserfs-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        syzbot+0ba9909df31c6a36974d@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] reiserfs: add check for invalid 1st journal block
Message-ID: <20210608115645.GF5562@quack2.suse.cz>
References: <20210517101523.GB31755@quack2.suse.cz>
 <20210517121545.29645-1-paskripkin@gmail.com>
 <20210517130818.GB25760@quack2.suse.cz>
 <20210608134443.022b3389@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608134443.022b3389@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Tue 08-06-21 13:44:43, Pavel Skripkin wrote:
> On Mon, 17 May 2021 15:08:18 +0200
> Jan Kara <jack@suse.cz> wrote:
> 
> > On Mon 17-05-21 15:15:45, Pavel Skripkin wrote:
> > > syzbot reported divide error in reiserfs.
> > > The problem was in incorrect journal 1st block.
> > > 
> > > Syzbot's reproducer manualy generated wrong superblock
> > > with incorrect 1st block. In journal_init() wasn't
> > > any checks about this particular case.
> > > 
> > > For example, if 1st journal block is before superblock
> > > 1st block, it can cause zeroing important superblock members
> > > in do_journal_end().
> > > 
> > > Reported-by: syzbot+0ba9909df31c6a36974d@syzkaller.appspotmail.com
> > > Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> > 
> > Thanks! I've added the patch to my tree.
> > 
> > 								Honza
> > 
> 
> Hi, Jan!
> 
> Is this patched got lost somehow? I did't find it in your tree here
> https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git/.
> 
> Sorry to bother you, maybe Im missing something :)

It's sitting in my for_next branch as commit a149127be52f. I'll push it to
Linus in the coming merge window.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
