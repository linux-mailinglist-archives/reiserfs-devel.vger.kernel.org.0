Return-Path: <reiserfs-devel+bounces-102-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8989876E14
	for <lists+reiserfs-devel@lfdr.de>; Sat,  9 Mar 2024 01:24:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48BA71F23169
	for <lists+reiserfs-devel@lfdr.de>; Sat,  9 Mar 2024 00:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF77B627;
	Sat,  9 Mar 2024 00:24:03 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCDB37A
	for <reiserfs-devel@vger.kernel.org>; Sat,  9 Mar 2024 00:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709943843; cv=none; b=BkWb2L4FabniKp7psVYy+LhR2ooJP3P/+FU60ktPUfeYu7zcNhBpwRUWF1f1qFerSHQdOal6s6GBcrCIsv/AfK5dX9bJAxecVxjxjmoCjg6O5mCPeXCwQxRbJ5cFPkp3LlZ0c854NUC0JhDTTeuEsrbOAWD+9PVacfdLfREKWao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709943843; c=relaxed/simple;
	bh=m48oX7+m5s24ipjjo9BK6u8a/BIBnZVyTJXi0+/oIwA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Lr/6PGyNa40SpbhhAi4tgwCf3anVjbVykr/JYvQm4zzMUxmEEPYZChNWOjF3XB5wvw3IsSyJO8Ld4FhcnB1Hjh7Sdd7KXvirFRrdA84j9wXXjcpW37Aomz+D5na92Ob6CXfa6M95vPSlKXmWXsIzamyRdqPJGzuLxAYMSGBT+zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7c846da7ad2so282316139f.3
        for <reiserfs-devel@vger.kernel.org>; Fri, 08 Mar 2024 16:24:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709943841; x=1710548641;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NFNzruI9+38j8zOzO++Z/K6VHh74kFYEU9XlGrBzFlM=;
        b=EgWq42HyZqzlF3WCW+qlY9TlnXvF0pCp79CNQFxXLhJ6QH2o1osKc/+ZmJNvujEXA4
         ILuIU32eC5NVuxNGO59fQhszBlFKVK5BVG/cypxYT0Rx4tGoiM9HtTnXARvhaJyVEO4J
         YSTFBynLEPYSHLBxj9qmI2s2Lp3TzLENBZBBcyEDTb+t9hTIafDh+vWWF+r/ShjXGNbu
         nZVyMiQ/xbSrRMQ80X8dItt641IV7E966RQPZZ/Y2vfKzs6qmKwbaLJ4WO7lmuZxMuUL
         RsXwBENf0cluRiISVE+ZDpowymdS2KhcVqWd7HMfAoNzp9VUCCDYi0XLJ5TPob+t04Px
         WKJg==
X-Forwarded-Encrypted: i=1; AJvYcCX7rKzwWrm/7JRMC9LEesDslArwtE246kx891CoiNPvh8MasvCoeqYve41qUQcZlow1q0Es4EoLF+mYNm68296Bp42L/9WJck3DAzw2gq0=
X-Gm-Message-State: AOJu0YwXbhj2B5w8DhuB6ppMi1XYV78h5fL+7TQifuAqrBTfYNByYc0T
	Q22RCK86b5gjGODccpV7E47QspVKQyMxg1rhPRdjIvpYEVN32SH5BI3iub0GP4Eva2aENuPE+Qh
	jdxPRWSZQfIeFXS87A8jVyAczcyKlymorKjvqB15t3EQTtXVVg9/QTKc=
X-Google-Smtp-Source: AGHT+IGQ2kpooODmF4kkxScY8szh+qR+NzKFr2lUr1iJjnYIaUmmEvvNNVihFwPmIP47F6j1+hUi+3mhJP0tYWh3pwyBUtOD1ivH
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:24d0:b0:474:e855:df7a with SMTP id
 y16-20020a05663824d000b00474e855df7amr27018jat.5.1709943841659; Fri, 08 Mar
 2024 16:24:01 -0800 (PST)
Date: Fri, 08 Mar 2024 16:24:01 -0800
In-Reply-To: <00000000000032654605ef9c1846@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000044ad2b06132f53c2@google.com>
Subject: Re: [syzbot] [reiserfs?] possible deadlock in do_page_mkwrite
From: syzbot <syzbot+ff866d16791d4984b3c7@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, hdanton@sina.com, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11595c8e180000
start commit:   33cc938e65a9 Linux 6.7-rc4
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=b45dfd882e46ec91
dashboard link: https://syzkaller.appspot.com/bug?extid=ff866d16791d4984b3c7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1048c7c2e80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=161fa8ace80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

