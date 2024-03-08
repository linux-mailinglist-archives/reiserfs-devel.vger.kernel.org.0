Return-Path: <reiserfs-devel+bounces-100-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E2D876715
	for <lists+reiserfs-devel@lfdr.de>; Fri,  8 Mar 2024 16:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BF7E1C21504
	for <lists+reiserfs-devel@lfdr.de>; Fri,  8 Mar 2024 15:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9E01DDF5;
	Fri,  8 Mar 2024 15:12:06 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9414A1D554
	for <reiserfs-devel@vger.kernel.org>; Fri,  8 Mar 2024 15:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709910726; cv=none; b=Q1RESpuPFQgZ5PYeR5pAom/LA9vlHyTlqMTxMjGIkzVFOHeCLhVV/PKqaiATlfh2BqHT6C273bimR+AckSB6JpkeWDzHnhcRyeWH/llXgqE6ls1CBFsLhkhn5Aab3e+zLldnlDZsxwriNXddPjUgbjEBfypCvgkMieduYJg/Eq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709910726; c=relaxed/simple;
	bh=DYAoAYTOqZYFMlCTKHIXEKT7ltBnivpJ4fyeB7NO654=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=EwctI9oCFduv6Ww5ehqYZgV34WuwTMaBNllbdnOmY7krkY9/8NW63mip4vfMK4ajEXqrrPUmEN8hFUIQTHYpEi766PbVJB4esoItFPghJ7hzXlCAI1fU0iN2NdHhHCpy2vUpKDMj66Ybx5mAOK2dH6t6XSFWjeBJez3Usi0lBbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7c8440b33b6so237210939f.1
        for <reiserfs-devel@vger.kernel.org>; Fri, 08 Mar 2024 07:12:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709910724; x=1710515524;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Taovf/w69oNFiPGLpF9FT70ngJrHA3KTAKar3z8sSg0=;
        b=hmASZZ9g/HOZApv/zDfPeNq6nlSzAhiOkbLFnAwEZIklRoTIKioDUXhjB/SazMjE9P
         hUZ6SgUfWVnfDsj8DMUjj7HljWCjxLxuOG2VmI+CcMcjUmdaIk6gzRWoUxGMqxjGWi/k
         UrqtCHHR2RQe4irjrzLCG4pTFlaS/cSfSf1BRgZG1tMMozKVRncnU0J4tbAtdNUWn9dx
         9eJYGS+LmUYbtGT2+85LPhnMHfe2CdU28x82G5mphoVlQx12AqoFI8fjUf4WLqlghRpI
         tBp/bUBZkFVMyCROuKC3uHJmQjJoWEWHsjEBkFbUnKLMY+gGjVNGPOYjS5Fsb11Bf/Nd
         LxDA==
X-Forwarded-Encrypted: i=1; AJvYcCUSbyoM0P/zj4uttAPv5JDDY7TqiXsJ6iOI5TvFTaBblvcyWyk+kGwWvAZAo7MEteGeMggZGwm5JjTju9HPeP2B+T049VQDnUDDNces0WY=
X-Gm-Message-State: AOJu0YxDDBulL00BAMjtexDUamvJMVISiNPIi+DltIzQZJO1O9/hDxTZ
	qLCFkPxLKErWe/FxQh5dT/K085jcZCi/ZCkNRRL4nHgLQnsGEnJAyCKMYTU3GY3wBuHv5wevOoh
	dKGhEHXa4hLhhll9tzvEhSuJHE8SDFjiKepzCUoBk1fwNhhvLoaXQ/xU=
X-Google-Smtp-Source: AGHT+IG73ul8oOb0FFH3FS2TkTIFxExRvyqFpcYXqkv30X1WbTe3AL+1s0Ho0RuJAAYn6qomXwemT5tcLG7lhpG7Y627Eu6puH8V
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:15c9:b0:7c8:38af:c0de with SMTP id
 f9-20020a05660215c900b007c838afc0demr884589iow.2.1709910723885; Fri, 08 Mar
 2024 07:12:03 -0800 (PST)
Date: Fri, 08 Mar 2024 07:12:03 -0800
In-Reply-To: <0000000000009fea9505f134bf4d@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004b90e20613279d9d@google.com>
Subject: Re: [syzbot] [reiserfs?] general protection fault in direct2indirect
From: syzbot <syzbot+e69a9406662c63f12e24@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=103df92e180000
start commit:   3b517966c561 Merge tag 'dma-mapping-6.6-2023-09-30' of git..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=12da82ece7bf46f9
dashboard link: https://syzkaller.appspot.com/bug?extid=e69a9406662c63f12e24
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14250026680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11b792d6680000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

