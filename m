Return-Path: <reiserfs-devel+bounces-158-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D03BD96E7EA
	for <lists+reiserfs-devel@lfdr.de>; Fri,  6 Sep 2024 04:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D80EB2324B
	for <lists+reiserfs-devel@lfdr.de>; Fri,  6 Sep 2024 02:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150063A8F7;
	Fri,  6 Sep 2024 02:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tHBXgEgW"
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1EF3398E;
	Fri,  6 Sep 2024 02:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725591197; cv=none; b=iirF4UlilE2fDLl9lv43WptC8PpV0RGnopZODAkTuVjGUwpKq9GLQSWb8VU+2ltw2QSfxhBN35xBa+9Ty7UmDPJpYn6N/8eiQW1G9yr3Ytlc7jh7xYcZ0b1LzomhEXsNfENFyczLFB3kdPjZn8430ZAqjdohqN33y4LylyIaFQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725591197; c=relaxed/simple;
	bh=hy/7yuKesZKIgpJtLl44wd71KjA5hcfynPA4cAqNpcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cnh0HX4Gg3iaIwn6c25g3adMFFI/rQfQm3+bkzBA2ASIB3Ap2z+LebWO9sEfVolbr1fr7d4fjlLOy5AiHEl1AsyQIYMthsjzVoSfn5A8PA5rLq7Xg5qAk6yV+v7tXBMgyFDg364yKbYGvcV9mpd9OIghzdP1b0IjNX3j08pIUYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=tHBXgEgW; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=R3yitP7rIZah4D+LGgszj519jFATzuXRw+5pj8t1oM4=; b=tHBXgEgWM0tgNgMx27xqaVknYk
	hr0AkeAc4bg4WYQGvqWnHQGWjXM4ixMiNVPNok760reZAf8xDo8p6Y6CtSWj9UWZqpIEW9gLwuJ3t
	abiwghx+lJ63SU0lzIm/f1yzri6DyQ3WjaGQG5Ntb0HFitnmLN/ZckT4ZJIWGqxP6VVbLuxGLHk03
	xW7aQGU7NOd9WxVCNiuzGGo1VBrQG2Sal9KQxN9v63VXZH19N2ilMH7J3RL3d9Afg/j33plNKKe5p
	fni+VQyMWAgK1tSx73V7Xu52KqoAubzjXeBhmZrfSUUN9e6vEcBUQ0pRlbs6tEBrfBpsfiYalA/t3
	DdUKyx7w==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1smP5y-00000003IVd-2BzR;
	Fri, 06 Sep 2024 02:53:10 +0000
Date: Fri, 6 Sep 2024 03:53:10 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hui Guo <guohui.study@gmail.com>
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Jeff Layton <jlayton@kernel.org>,
	Chengming Zhou <zhouchengming@bytedance.com>,
	syzkaller-bugs@googlegroups.com
Subject: Re: kernel BUG in reiserfs_update_sd_size
Message-ID: <ZtpulsSN09aMn48N@casper.infradead.org>
References: <CAHOo4gL8UJnY=zZOHVioLsemBfA7eZSK+utxWLd7TBCz89X=3w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHOo4gL8UJnY=zZOHVioLsemBfA7eZSK+utxWLd7TBCz89X=3w@mail.gmail.com>

On Fri, Sep 06, 2024 at 10:30:58AM +0800, Hui Guo wrote:
> Hi Kernel Maintainers,
> we found a crash "kernel BUG in reiserfs_update_sd_size" in upstream,
> and reproduced it successfully:
> by this report "https://groups.google.com/g/syzkaller-bugs/c/3HUP6xnzjo0/m/bP0j4x9rBAAJ",
> this bug have been triggered before and fixed, but it can still be
> triggered now, .

Nobody cares.  It's a reiserfs bug on a corrupted filesystem.  Don't
waste anybody's time with reiserfs.

