Return-Path: <reiserfs-devel+bounces-94-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 102148701A7
	for <lists+reiserfs-devel@lfdr.de>; Mon,  4 Mar 2024 13:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 424E71C20859
	for <lists+reiserfs-devel@lfdr.de>; Mon,  4 Mar 2024 12:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75AB3BB46;
	Mon,  4 Mar 2024 12:37:04 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB8722606
	for <reiserfs-devel@vger.kernel.org>; Mon,  4 Mar 2024 12:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709555824; cv=none; b=oN2v3yRYqcAxlEmE15z6uiW2H7QV29/Fr3Womyf7cPyHqor+WXLrhAgph4uXp0sKSuz1AY1rpCOOyB1G7sUGWb6+bzK/k8aOFyG6kBtrjGrTh+bN71J9ImkS3atDfBkd1XmQk5hO6SlzcWmgM7hj9CjNjA27MKfj8VJSRA7nb+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709555824; c=relaxed/simple;
	bh=eylvi3XlKAQDcDq2lF5jwYNjHDysndBP8IqQugOeCVA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=hopZHbBVZ0Gg65eyh6d03aTSPCq28A3qB7+dK96ERrG8dtjO+0P8kVfYBgAZXyIfbTG7lRMMbOraFt7yQ2OyibNwkmcwKOvIFGlojkubXrvBfBGzGOuRjFEFQWPLL8YHt3S+2PSb31qVU9L26WOequiYMcvkJZg15iw5bKx+0Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-7c846da7ad2so119953139f.3
        for <reiserfs-devel@vger.kernel.org>; Mon, 04 Mar 2024 04:37:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709555822; x=1710160622;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3NbNnyhd/B5XCppDwpIFPOlZsSIrkjocsr4QA1pmJsU=;
        b=jFNe+cQx1NVyWvH/TOlf8MoziJD2QJ1ZhFqvRlOmI/AwZILAIQaxQ5NFusBiljiWer
         uQO78PPh+iXWp7kmfDxTcBl/2XUfaVwMbg5lwRXEd5rGHuN5tYZdQLWmJ6YErfC6cHg4
         qXr7goUhPMj8fqinhELi0v9zOzbN/rX+kXMG3ryMYVTSY593f8BZQGZHINa7fAkLEv1I
         r/CDSlhRqpjtgpLZFaYNgGjEnT3UzVyML1zMtrCZLJXGSDkIy8NAzgiEm3sw/bHM27Ty
         ubWHhi5eoneEOkTi++O7B24BtIYOYxocvhIMXn8L5NA+YQPFy7Ff+1MzPtZnlFvJFLY6
         eSfg==
X-Forwarded-Encrypted: i=1; AJvYcCXzMqFmXDWKp8uSS/mI9RiO7jMd/0G/fCp/0L28Y0fYHBcUnflWx4HpgoqUEdMZ4caZJuW9D6iv+pcDndZsELBOuV3YG8IMXKIb4Zq3Ucs=
X-Gm-Message-State: AOJu0Yx+gLCV6GQvfh2mJbF0nPJ+WSYXtrSWHjfFgG0HPMmLgi/WglCT
	UuLqOuAF2GltXmcUOInSENZdGA4RAXPl9/ZgMM8co+gCxSA6q8eYFnOaMwydFA56WnflIExoGFK
	x/1iY/GyfEhU6bVxTetJieRW5d/IqyUnEfi/pamAC1NpXOWmiZMJkdiU=
X-Google-Smtp-Source: AGHT+IFU4f03ZjvncZbdrXzXkVo0rpMKA/5FLqVUEdHywCy6BHCHtXYsDtg0Q9xCSX48Dp1C+/EwiWItU9BDpYG49ks9cOYOlbX2
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:40a3:b0:474:ecf8:1f55 with SMTP id
 m35-20020a05663840a300b00474ecf81f55mr190193jam.4.1709555821881; Mon, 04 Mar
 2024 04:37:01 -0800 (PST)
Date: Mon, 04 Mar 2024 04:37:01 -0800
In-Reply-To: <0000000000009dc57505fd85ceb9@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007cb7130612d4fb95@google.com>
Subject: Re: [syzbot] [reiserfs?] general protection fault in rcu_core (2)
From: syzbot <syzbot+b23c4c9d3d228ba328d7@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, dvyukov@google.com, jack@suse.cz, 
	lenb@kernel.org, linux-acpi@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, luto@kernel.org, peterz@infradead.org, 
	rafael@kernel.org, reiserfs-devel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de, yukuai1@huaweicloud.com, 
	yukuai3@huawei.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14e58b32180000
start commit:   e8f75c0270d9 Merge tag 'x86_sgx_for_v6.5' of git://git.ker..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=a98ec7f738e43bd4
dashboard link: https://syzkaller.appspot.com/bug?extid=b23c4c9d3d228ba328d7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12d6dfc0a80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=161de580a80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

