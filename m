Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED2C22829FF
	for <lists+reiserfs-devel@lfdr.de>; Sun,  4 Oct 2020 11:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbgJDJ71 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sun, 4 Oct 2020 05:59:27 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:49862 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgJDJ71 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 4 Oct 2020 05:59:27 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 61A041C0B76; Sun,  4 Oct 2020 11:59:24 +0200 (CEST)
Date:   Sun, 4 Oct 2020 11:59:23 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Metztli Information Technology <jose.r.r@metztli.com>
Cc:     edward.shishkin@gmail.com, reiserfs-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [ANNOUNCE] Reiser5: Selective File Migration - User Interface
Message-ID: <20201004095922.GC1104@bug>
References: <20200826205216.07BC868EF679@huitzilopochtli.metztli-it.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20200826205216.07BC868EF679@huitzilopochtli.metztli-it.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hi!

> > In particular, using this functionality, user is able to push out
> > "hot" files on any high-performance device (e.g. proxy device) and pin
> > them there.

What permissions are normally required for file migration?

> > COMMENT. After ioctl successful completion the file is not necessarily
> > written to the target device! To make sure of it, call fsync(2) after
> > successful ioctl completion, or open the file with O_SYNC flag before
> > migration.

Ok.

> > COMMENT. File migration is a volume operation (like adding, removing a device to/from 
> > a logical volumes), and all volume operations are serialized. So, any attempt to 
> > migrate a file, while performing other operation on that volume will fail. If some 
> > file migration procedure fails (with EBUSY, or other errors), or was interrupted by 
> > user, then it should be repeated in the current mount session. File migration 
> > procedures interrupted by system crash, hared reset, etc) should be repeated in the 
> > next mount sessions.

Dunno. Returning -EBUSY is kind of "interesting" there. I'd expect kernel to queue
the callers, because userland can't really do that easily.

Best regards,
									Pavel


-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
