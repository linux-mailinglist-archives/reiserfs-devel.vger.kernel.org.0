Return-Path: <reiserfs-devel+bounces-98-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BFD875D02
	for <lists+reiserfs-devel@lfdr.de>; Fri,  8 Mar 2024 05:02:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E4F81C20D8D
	for <lists+reiserfs-devel@lfdr.de>; Fri,  8 Mar 2024 04:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 258CF2C6A3;
	Fri,  8 Mar 2024 04:02:04 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9BE28DD1
	for <reiserfs-devel@vger.kernel.org>; Fri,  8 Mar 2024 04:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709870524; cv=none; b=e9mhAO5SPGCIKSuagSt0377fSViW6fMaZdLA+qN0Y4CDs1jlN05qzMzk8xNdDZmeHcsglGnAENrnQeG4zhLNDNvKAhdfOfglgum/vIGssitatU/xMrf0qFOcfKqdJ6B6QxEGM1TvW+hcxYxGZCp5S9Q+ftZXSw9jsgEJxZcMR3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709870524; c=relaxed/simple;
	bh=G6Djrr2MxRBhWPFd/9J6IONYLwzSuiPfqPYSZd2yTsM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=sYX1ExJku4CkSywaQfDE4sqloktMO0rZd33HXs9MGfhvTh6wwjqTJFnbBPwrJPaQhwgD2ghGuptioyJHaivBFSAkjiaH66CP7+RSGWsgWPzJ2c09yRbviF/Pdr0UU2HhA8JmQDX3u8xAFYEs10BUvnVkUvLfgM4xAWN0mbNzdKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7c7c9831579so189840139f.0
        for <reiserfs-devel@vger.kernel.org>; Thu, 07 Mar 2024 20:02:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709870522; x=1710475322;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QCiyG4o54TrjDfLD0ps7QesGLXWPOUDgDBMKldRTYPg=;
        b=hP0S1uF5YLklXa4y+VmUBrutUWG5Hi9jEEjwVuYIHxSJjZbFJNoe3y1ZrM5PTrjTUx
         qPaHFjLy02xBUi70GTB/1ZG8VrhH2vkf+zM+hqvqACJNAuQaQuGJVa/LHTZdBh34zG3F
         tJWJympzYajwcp1dETP8gXmG+llIhXzFk7Fx77v1kI0qjxk0VfW0xJofAYKxuX70BDra
         8130jKup16tC5QvIg/e6slzgra54Gon4Bnk+smffgMdyz/aqjmiHOulfSxja0MlFfLT/
         qi/Wo2Dgs07f/rl2U5LdjwT6Jm+FMqwYvBxUvvNwiqGYtQpZ3c19Db5UjfpggianxVdS
         uc9A==
X-Forwarded-Encrypted: i=1; AJvYcCW7TtqtdhJn7lPS+Wo/9cqwrtpDhn5Un7Q+B+HWVIhXoy00RXfULNKmqO0irxuKSDOlQTHiIryYJ6iQnELIlKhoj1L1LVBBW3M+3+m8AiA=
X-Gm-Message-State: AOJu0Yz1DPRk3HxiYNDFmbrsj1pD3yJ8lVQ6bvzZhZc5QnjSLoXlOCo6
	mqUQpYzMp3acLAaUpBZpgwI7IPXgE50eQ0YMaAv2snaiZRhiA6cfD3x0qFxNLKLnyRZtU4xwdZL
	g370lwemLfZQvhrh7AtdFXehp1zv+N0W8QUte5aKUSTiGFa1/qabrjiY=
X-Google-Smtp-Source: AGHT+IELur/qUvDjoOhOme4OZH1E9SVj/n5Qat2+FmIjlDtybLlgcVORnoYjLEk46wzNl3bCWeS6tLYD/IcJzmQxUF/5ah1d8gn7
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:144e:b0:474:ebfd:1749 with SMTP id
 l14-20020a056638144e00b00474ebfd1749mr720212jad.0.1709870521959; Thu, 07 Mar
 2024 20:02:01 -0800 (PST)
Date: Thu, 07 Mar 2024 20:02:01 -0800
In-Reply-To: <0000000000009d4b80060df41cf8@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000012d93d06131e4140@google.com>
Subject: Re: [syzbot] [reiserfs?] general protection fault in reiserfs_xattr_set
From: syzbot <syzbot+74dce9511a59ad67a492@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, eadavis@qq.com, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16fc31de180000
start commit:   453f5db0619e Merge tag 'trace-v6.7-rc7' of git://git.kerne..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=c7bcb8f62f1e2c3e
dashboard link: https://syzkaller.appspot.com/bug?extid=74dce9511a59ad67a492
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1534af31e80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1512b9a1e80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

