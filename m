Return-Path: <reiserfs-devel+bounces-76-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4BE85F63E
	for <lists+reiserfs-devel@lfdr.de>; Thu, 22 Feb 2024 11:56:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7D6B1F2653A
	for <lists+reiserfs-devel@lfdr.de>; Thu, 22 Feb 2024 10:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893B647784;
	Thu, 22 Feb 2024 10:55:05 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C473EA7B
	for <reiserfs-devel@vger.kernel.org>; Thu, 22 Feb 2024 10:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708599305; cv=none; b=u/jEUC0zTFVpebvuQEIEQYL7hZgOn4kVGKIrbChx+aBgJMpJ4IYE4dXOEGL2gbc5s/rlqIhQKx19/okz+nsfYgPPKCI5Ya/Tmo9/hRrXIPzHNuN1+aCAbxdRAasRjsMYYu7ZLB4ekJ8h9STPGrmh7aqQUHa+/9+g35MR49qTvuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708599305; c=relaxed/simple;
	bh=ha1O4iLT6AxSqj0DgzjOIHcjSM59rIa3crgUCBSCn8s=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=jnnmTzTecuLOjSlLuahmcXoKULEBGc0IdkPyCIroFir6aGdKy6l9Rt6sMsdIb//JqXF5k86VoKLI8tVok1bbqiUOFvuNlOt+AOqrQVNkmxHNdt+xb8X7ZjawEftDQoFc3LS7WCxowmwJ/Ztp8QLZSILZoixChr4FrmaOd4kcWTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-36525729ea3so48777005ab.2
        for <reiserfs-devel@vger.kernel.org>; Thu, 22 Feb 2024 02:55:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708599302; x=1709204102;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sBV1Xfaxmpo/itADc9WYkcmWfCaWC4fUkR16tOejUkw=;
        b=K/y0eE7BTYv0SHuEJohSvWmaJaFgpuFl6P36zgB0qR93Yfjj0h2WkVuDmJnQq/5qNY
         SGXyPUUiDVjsG94Giwr5PjPCUF1tDq4yO/8xEqDCtgDnGkoR9f9iD+622RQm9pXMWWhk
         +zEQspjMmwwTEB2/WKdojPGT9wEnMPnrowmOroGk9fd3ztpXyahmN5QbkuOXkjgCp6zl
         B0Hdh2Xrh8ktYd8uIHit0l6Gh8SkMXSv++cR7q7T9nKdM8DZ642l+mTkOVIc8ngFtN/U
         5Px+9VULI3eD+w+0sKh5xmdP8yDqLplJ0XpfNoGKWvm5IHNWpwm51z6LyLeyqM3BlkkG
         X26w==
X-Forwarded-Encrypted: i=1; AJvYcCVZGuutnAzEcy98uq4z6A1JEv1QZ8x7x/8ubgQNb7iMftEL1dSqj7ThmMcYBcIfPHoTWvFK86edOFTYbE/mWRh0gd+KfvaVFREZ6p8vlxA=
X-Gm-Message-State: AOJu0YydBWJkweo4dAuLDqQcmk4Qqr2vb2As1CmEJLYVD8jzHaRjso8O
	9lPQ90PIlghfdnES5AywEbJEvxcatb0u190SvBplHKUWRUNOIM+VqLoKuTuLklGUh+hCOozjAza
	xKitfm+V2rnTJYomi4OGBAnORWBBtm1dmNPx1kb8S3J9Eu9Ui75iSgmY=
X-Google-Smtp-Source: AGHT+IEF/xyqLKklQw0sVER+TM5iYp/KdEmM9KqeMBTj0TPm8rLS7OaKIU7QbZcgAMu73ys+aigHWAjlhsnpk9/4AoID+Kmj+kTX
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:154f:b0:363:9d58:8052 with SMTP id
 j15-20020a056e02154f00b003639d588052mr1623135ilu.2.1708599302546; Thu, 22 Feb
 2024 02:55:02 -0800 (PST)
Date: Thu, 22 Feb 2024 02:55:02 -0800
In-Reply-To: <000000000000779efd05ed36086d@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007def780611f64694@google.com>
Subject: Re: [syzbot] [reiserfs?] possible deadlock in reiserfs_ioctl
From: syzbot <syzbot+79c303ad05f4041e0dad@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14c4cf52180000
start commit:   1f874787ed9a Merge tag 'net-6.7-rc9' of git://git.kernel.o..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=247b5a935d307ee5
dashboard link: https://syzkaller.appspot.com/bug?extid=79c303ad05f4041e0dad
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=125c3ca9e80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1558b19de80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

