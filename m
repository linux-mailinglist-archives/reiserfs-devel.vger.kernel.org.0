Return-Path: <reiserfs-devel+bounces-90-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 477AC86EDF7
	for <lists+reiserfs-devel@lfdr.de>; Sat,  2 Mar 2024 02:51:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 744FF1C214BE
	for <lists+reiserfs-devel@lfdr.de>; Sat,  2 Mar 2024 01:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61BC36FCC;
	Sat,  2 Mar 2024 01:51:05 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEE66FB5
	for <reiserfs-devel@vger.kernel.org>; Sat,  2 Mar 2024 01:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709344265; cv=none; b=i7vbgsLHMNRzdhX2jEb1VKereO6ZXFTk9nkH16/aE4i5mnYk/kIOT5t3uR6F+oU+JoegXZZcF+pzaTUvS2lrdsxGDwrhf7+upKFLgEKhqC+RhwmfBok5hKLOnV0OcfgmRQAeZJfXpIX0FNF+2mPOsrTgWjLY8+FCOaBnsx8dIR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709344265; c=relaxed/simple;
	bh=j/JB2jyENDKPMzsPZBblzk98S3i8gV/N1pLSReCqPhY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Y09nSqkQs3fzMXdljVLIdVsfbvPsYB2SSFmRqQoZKN+HrRD2eibphMvn2LPO9Zw6uwXkWMBEXDxKwO6mcruHGiygWdeBUeU5HlkVnbn29+L26A9r+NacibErS0Jwxszf+GkI6WxuXMKATwZL6PyZ6suZgcg9a1sfKD2BAXIXN6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-7c7ee7fa1caso307200539f.0
        for <reiserfs-devel@vger.kernel.org>; Fri, 01 Mar 2024 17:51:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709344263; x=1709949063;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LvJsx84GDRR3sGeQWUlw8maTlVsrsS8sB6uzDnbyywA=;
        b=a/KH/RF+Ak+QhQFmU1NIBAVY7eyFw171D58//WJx5kmJbYhdIPeQTl2yNKAthgEtE5
         +5BoXx++bZ4TJWj0IwM2snawF+08aVBTAfxxAAoidx6kVgRL9PE2wkkdq8sELxKHTIPv
         iHvKfFvLuZQPP9Xqm3BGws4xqnw/gt8mIVsuli1xzqbqHspp9ouBbv/1GIkheDfMF/p8
         aLHWN5owkHksOSa0kAz5myLz1of3koHaM2U2ch7RmHA/8UMhnWqn+QZk8D7z3Cad/5fh
         53Fz748lr6G7OgW4QHx6kyhVQ5t31C6d86i/ADRZtf4MRuzuJ2Bc3tftGmUlGJ+caUb8
         VDbw==
X-Forwarded-Encrypted: i=1; AJvYcCWLjkpEBNHDIHvriszUboOaPfTpI9pprvkXzrHN6+TInblNZDLGMrZGALmCbHBYuZ/pEYWBHIRGud4xFzc9d0vQLZk1DZHKzezetROylkw=
X-Gm-Message-State: AOJu0YxNAhZRHnRAFLeOP5UtYLnSlas3ZL9LWKQnneZfMnmMwWV6XDpy
	XlrnTilydWjLghD/esjgt82CrZnENXkL2vkJvgF/0sJ5OzHJs6pXmDXKMnoJJ9bkImHK/Tv2giV
	qL+CfrTGRew/BHUJd1l605aDqLvRETwgGYp554V7gGT0Hj13uT+m42U8=
X-Google-Smtp-Source: AGHT+IHuZLEai30Vbe4B0f25cUi3TWUjAJVlZiXgrG7JjlW0Eoir/37IyGI70zz2FHDwFteKbxHcLXnIYeVoRrWtAVl2bbv76tjQ
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:629a:b0:474:8177:31c9 with SMTP id
 fh26-20020a056638629a00b00474817731c9mr111536jab.5.1709344263133; Fri, 01 Mar
 2024 17:51:03 -0800 (PST)
Date: Fri, 01 Mar 2024 17:51:03 -0800
In-Reply-To: <00000000000094d9bd05eb190572@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009a64380612a3b99e@google.com>
Subject: Re: [syzbot] [reiserfs?] kernel BUG in reiserfs_in_journal
From: syzbot <syzbot+79bf80830388272ba2f9@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, axboe@kernel.dk, brauner@kernel.org, 
	bvanassche@acm.org, jack@suse.cz, jlayton@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, neilb@suse.de, 
	reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	willy@infradead.org, yi.zhang@huawei.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16e80bba180000
start commit:   611da07b89fd Merge tag 'acpi-6.6-rc8' of git://git.kernel...
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=174a257c5ae6b4fd
dashboard link: https://syzkaller.appspot.com/bug?extid=79bf80830388272ba2f9
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13ca8c63680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16dae351680000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

