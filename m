Return-Path: <reiserfs-devel+bounces-118-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BB08BFFD1
	for <lists+reiserfs-devel@lfdr.de>; Wed,  8 May 2024 16:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7B541C21129
	for <lists+reiserfs-devel@lfdr.de>; Wed,  8 May 2024 14:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9AEE8529B;
	Wed,  8 May 2024 14:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sTgDFVpE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7eVYbT82"
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4134453389;
	Wed,  8 May 2024 14:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715178056; cv=none; b=Q+GjU1vsUAPdqPwpMMe3awsspjNGQuXHIDDkX0K/JAQz2gLBVvnKyba6hGyZsNRa2uGGDfhCap/cFe//at6QuS1ueoVM7ov5xzdIA6Rdl1s5yA6C5wwyGrcvYDPH/Kya+BkY0oBb6W6Gp9XeTqdSO+lfU9vv2NxcD/BWy7sHgDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715178056; c=relaxed/simple;
	bh=61y6P5AaAWfLeBCLoo/c8leQzADfKeBCFXDPTdvvqQ4=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=P3l0PyMtihu3N0gE9HbuuxBZ3BEmZYUhn4CD71zv+7ei59J5yTnVe7VIcwKndsbjclHtD47lTI1cOJ/Pf+TKH4/F8rse40iy6Y7iSwCJ6Zhzdj4ZeirHaROnNIaehY7GUMhSQq4BrqYfPWySPTXiHhxKO2Ws/NCz3QZGW76Y0Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sTgDFVpE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7eVYbT82; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1715178053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=YgetIJA3y5E8vFibh/hDlQ0S8ccwG3COG6nPX1e2n5M=;
	b=sTgDFVpE1AxvYWVFv+FivWZ1E2Bjrz0nknVF1iPAZhRh7NCgTNDLT2unU7Q1tSKIk8gl3X
	SJJ/NvMBmfa047vcx9Aos05W5WLr82ehJ07eMTr7EbpNEYQaCCPBJZtEsaStoFdpJd4rn9
	9iCATMmoSLZauJhbLgykuDwGc6NAk9bssmUUGGrcy3vlsWvSpX+8KN2c/Is3/aYlupJC34
	LeNwJNIRotG7Z788tdB8/Pf7MiBpDJFcNqbJN8RsF/pp4j/LWFdHWz0RdyDmcTdFVj2ZkN
	LJQBsXL0RYEHoc/rN5MvEcpT0LhStGRlcbq5HJO/nowlyZvKcAFc96cVJmQU+g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1715178053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=YgetIJA3y5E8vFibh/hDlQ0S8ccwG3COG6nPX1e2n5M=;
	b=7eVYbT82xWnol8KnX0+53N6N67hn+G3Nyh0onVr7SrmYBcKa5+u9t8xDx3pNVdMd7he1Ke
	jLZZ8xhE7ttHsvBA==
To: Sam Sun <samsun1006219@gmail.com>, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org
Cc: syzkaller-bugs@googlegroups.com, xrivendell7@gmail.com,
 reiserfs-devel@vger.kernel.org
Subject: Re: [Linux kernel bug] general protection fault in alloc_object
In-Reply-To: <CAEkJfYN_xh-zU-8ZgaSDdTgDejBv0uGHa_KW-Vi3CijZi5UZ+A@mail.gmail.com>
Date: Wed, 08 May 2024 16:20:53 +0200
Message-ID: <87pltwo056.ffs@tglx>
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, May 07 2024 at 14:32, Sam Sun wrote:
> ```
> general protection fault, probably for non-canonical address
> 0xdffffc0040000001: 0000 [#1] PREEMPT SMP KASAN NOPTI
> KASAN: probably user-memory-access in range
> [0x0000000200000008-0x000000020000000f]

This is a reiserfs issue. It crashes at random places:

[  348.634665][ T5992] REISERFS (device loop0): Using tea hash to sort names
[  348.780602][ T5993] (udev-worker)[5993]: segfault at 200000001 ip 0000000200000001 sp 00007fffca0e6190 error 14 in udevadm[5613a8f19000+1a000] likely on CPU 3 (core 0, socket 3)
[  348.796165][ T5993] Code: Unable to access opcode bytes at 0x1ffffffd7.
[  348.831600][ T5016] systemd-journald[5016]: /var/log/journal/a042c4e41bfd4c9697a628486ba7707d/system.journal: Journal file corrupted, rotating.
[  348.840565][ T6004] systemd-udevd[6004]: segfault at 100040048 ip 00007fde601b58a3 sp 00007fffca0e6250 error 4 in libc.so.6[7fde60108000+155000] likely on CPU 5 (core 0, socket 5)
[  348.844214][ T6004] Code: 89 10 49 8b b4 24 a8 10 00 00 eb 34 0f 1f 00 4c 8b 2d 69 f5 0f 00 64 45 8b 75 00 e8 27 42 fc ff e8 52 fe fa ff e9 01 fe ff ff <48> 8b 0a 48 8b 42 08 48 89 41 08 48 89 08 49 8b b4 24 a8 10 00 00
[  356.765557][ T5992] ==================================================================
[  356.767188][ T5992] BUG: unable to handle page fault for address: 0000000100040058
[  356.767204][ T5992] #PF: supervisor read access in kernel mode
[  356.767219][ T5992] #PF: error_code(0x0000) - not-present page
[  356.767233][ T5992] PGD 80000004ca01f067 P4D 80000004ca01f067 PUD 0 
[  356.767266][ T5992] Oops: 0000 [#1] PREEMPT SMP KASAN PTI
[  356.767294][ T5992] CPU: 4 PID: 5992 Comm: a Not tainted 6.9.0-rc7-00012-gdccb07f2914c-dirty #43
[  356.767325][ T5992] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[  356.767342][ T5992] RIP: 0010:stack_depot_save_flags+0x14b/0x8e0

Can we just get rid of this mess?

Thanks,

        tglx

