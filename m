Return-Path: <reiserfs-devel+bounces-80-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF67861F6E
	for <lists+reiserfs-devel@lfdr.de>; Fri, 23 Feb 2024 23:14:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 417181F24785
	for <lists+reiserfs-devel@lfdr.de>; Fri, 23 Feb 2024 22:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FDFF14CACC;
	Fri, 23 Feb 2024 22:14:06 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3022F14CAA3
	for <reiserfs-devel@vger.kernel.org>; Fri, 23 Feb 2024 22:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708726446; cv=none; b=b9u6xnJK8nvjx5fCjGaXOsYXk9WHy+z1UvR3lDsb2CfxmMMgIuPdSpI13m9qKgFoD2tZ5X4kxljWZ39OE/SI61rx70f0KE/+yQ8ibhYQa0DUuF0qsua+ERSBj7E8SsX5n4AKrdqro1mTT7WFrbDRzfo0z+dgqb+hOoVNu82jsKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708726446; c=relaxed/simple;
	bh=+Ctr0KrDwCeMkU+RQ454ERPkbKZTfFHQEeCdfQoA6YY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=QFwVCxHnYcHSurh+GmBLqk6+JJfqopgtAsz/hs2m9EVPlx1c+7zttGXUACCQ0aGGXH4lf0tpRoTwTSmJV9AsyBCLJXou+uvC1AVy2RnWregsmRVPYwr6BW5PcN0DRbvkWnW5xJAjK3oto7CVhuaQrNTsjCNcOYT8ihBPsyWapQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-7c4a0dc9f57so146048239f.0
        for <reiserfs-devel@vger.kernel.org>; Fri, 23 Feb 2024 14:14:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708726444; x=1709331244;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+yKIsiHPc5N6utt+zlCMndtWwFz/JR5HuS2RY9FPzik=;
        b=tkobCNyyLcXCnHeICa8nnY1VcPTsyyruXRwQdm2rFFvUJVwG4qrHaGxBtWnmVLmY3i
         QS2MUl912KH5TGbh6KCb8JoeIg1UdStvRNWEURN3S2wpvfLjZJzvND2h7n8dgd766cz/
         nAlk5bwkIaejdPneVXHr51Dm+sWnSVDvUtGo0RmSiT/SNBoOESs98Woprs7rdytGamC9
         Mgmlx86EJwRMpVrM12VEB2gTNnmEonRX+XFyPHj/9YlnVrCaPRSamyTGQarfmKYV5Y5V
         PvpRJ3r1PK3/g0XXHogztnQR5d6/e/+TKId3/+wg5Uh2B538mSvaJkwooHoWmX5qW53r
         2JzA==
X-Forwarded-Encrypted: i=1; AJvYcCXBVBEJVxjOc1fogDWRQkw4CLSjztoN7nDP0QmKC25CCdxW8LAmTQ4nnrmh0MAWukeg7wGuXXh5j69YFSExFIkfoE6xbomvKG8YXvsnO+o=
X-Gm-Message-State: AOJu0YzEKMX5gb3fQQPaWoucVSQvru2j493m3t0xdvZuixs6Cf7MD01h
	x6W8W/ZA3JCuuHX1xlYlJHBxcZxIwalcNgMLXEETKSVk3LJusoQZOp7+KgQxY1cS2Qj2jhneBWF
	Zl+Lvm+i9jpZzfeS3Y0nU3zyliWLivd38jL37II7PUHWuxkpaU7B9sPU=
X-Google-Smtp-Source: AGHT+IH9hsxeN8JWcRHnUAnRF2nUKmQ8AUA2BXRL7xlSUOURky4FyCkAe+nisCjnW4nN3TEdoItNoQFcFlvbBrsaaY6y7PJ7QRDd
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:20ee:b0:365:1c10:9cfa with SMTP id
 q14-20020a056e0220ee00b003651c109cfamr50005ilv.5.1708726444282; Fri, 23 Feb
 2024 14:14:04 -0800 (PST)
Date: Fri, 23 Feb 2024 14:14:04 -0800
In-Reply-To: <00000000000091ce6f06013df598@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000badb45061213e0c0@google.com>
Subject: Re: [syzbot] [kernfs?] [net?] [mm?] stack segment fault in __stack_depot_save
From: syzbot <syzbot+1f564413055af2023f17@syzkaller.appspotmail.com>
To: axboe@kernel.dk, bpf@vger.kernel.org, brauner@kernel.org, 
	davem@davemloft.net, edumazet@google.com, gregkh@linuxfoundation.org, 
	jack@suse.cz, kuba@kernel.org, linkinjeon@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	reiserfs-devel@vger.kernel.org, sj1557.seo@samsung.com, 
	syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14a58254180000
start commit:   815fb87b7530 Merge tag 'pm-6.7-rc4' of git://git.kernel.or..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=1101277e240af3b9
dashboard link: https://syzkaller.appspot.com/bug?extid=1f564413055af2023f17
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=166bcf64e80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=111a00d2e80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

