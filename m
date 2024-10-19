Return-Path: <reiserfs-devel+bounces-161-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A24109A4FD2
	for <lists+reiserfs-devel@lfdr.de>; Sat, 19 Oct 2024 18:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1E701C25354
	for <lists+reiserfs-devel@lfdr.de>; Sat, 19 Oct 2024 16:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931C518E356;
	Sat, 19 Oct 2024 16:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bo8de2Ev"
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6408B16F0E8;
	Sat, 19 Oct 2024 16:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729355316; cv=none; b=qE6b3rct3xYXl3D4pqIe6NPRSEBbB6zdgdmfVrKbZ3axr9ES70SEE640CWDTeO9CUIqT2/DvQeqbXIRitai8kbcX48aqpcimiu5B/OzSWaKS5DSmFnYDSGkxNy3HUsgfvsRzvzFJiNYQQO4RYtaqE3V17krKeTRVHmwGYN/sYKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729355316; c=relaxed/simple;
	bh=54Gnr66n5gVaJnbpVaLgsfurd/gC/FOQV5cusI94Oc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sFQ3qZcTiiNnpInfqDBs2zv7w48rcU7PvaDoCkIs0Ey8dJCy56/VQMFWY2mT0rnDaajRfze9E1/FjW4JLAIeHPq4dDaG1fsysGdQ6I/zSuFlzNoF2EN59C6EIiw2BUYrdS+76oKLDgzDT2CZEftIGsaHhzDXwJBHiw8PZU8KJrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bo8de2Ev; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B4F4C4CEC5;
	Sat, 19 Oct 2024 16:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729355316;
	bh=54Gnr66n5gVaJnbpVaLgsfurd/gC/FOQV5cusI94Oc8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bo8de2EvrUHokpRh38ZzEhJgcE3l6x0QONHQjVVshTRjJcldULnQx8MffvXTE6T+9
	 7XVjh7fGerXfTUk7UJlFxuL8IbQ2ykwumgH0JVnKQIULaN+FxdYMPTs0AIpp0o2A+U
	 XPtWqTsJNyxts02RGk6ebQOLZ4eRqhS4aSMi3sMMMgFhF8yBa/il1Hxc9H9/TfK6TZ
	 Uf6rWyoZBie8/c1UanbldcWH+BAX1+5wT+fMB7WJgsO77/NX+XQceSD/s002ym9eht
	 XTWhQx2KImWZI1QSGzqRdUV7lFWVOSwCa0w2pgR7oyOWveeP8/f5Xpf2nEpqqIHFmX
	 mJRBamEgfnHMg==
Date: Sat, 19 Oct 2024 09:28:35 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>, reiserfs-devel@vger.kernel.org
Subject: Re: Dropping of reiserfs
Message-ID: <20241019162835.GK21836@frogsfrogsfrogs>
References: <20241017105927.qdyztpmo5zfoy7fd@quack3>
 <20241018091800.5nwytgasfpfnucej@quack3>
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018091800.5nwytgasfpfnucej@quack3>

On Fri, Oct 18, 2024 at 11:18:00AM +0200, Jan Kara wrote:
> Forgot to CC reiserfs-devel so adding it now to keep people in the loop.
> Thanks for noticing Al!

+1 from me for reducing maintenance costs!
Acked-by: Darrick J. Wong <djwong@kernel.org>

--D

> 
> 								Honza
> 
> On Thu 17-10-24 12:59:27, Jan Kara wrote:
> > Hello,
> > 
> > Since reiserfs deprecation period is ending, it is time to prepare a patch
> > to remove it from the kernel. I guess there's no point in spamming this
> > list with huge removal patch but it's now sitting in my tree [1] if anybody
> > wants to have a look. Unless I hear some well founded complaints I'll send
> > it to Linus during the next merge window in mid-November.
> > 
> > 								Honza
> > 
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git/log/?h=reiserfs_drop
> > 
> > -- 
> > Jan Kara <jack@suse.com>
> > SUSE Labs, CR
> -- 
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
> 

