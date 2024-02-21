Return-Path: <reiserfs-devel+bounces-75-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3675585E560
	for <lists+reiserfs-devel@lfdr.de>; Wed, 21 Feb 2024 19:18:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67BD61C21EB5
	for <lists+reiserfs-devel@lfdr.de>; Wed, 21 Feb 2024 18:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29ED85281;
	Wed, 21 Feb 2024 18:18:06 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4183D7BB00
	for <reiserfs-devel@vger.kernel.org>; Wed, 21 Feb 2024 18:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708539486; cv=none; b=j725MKr1fWeKUvbVgrLXdKp90lDlxcbN7SN/QhqnepG/H1NE1tYOh7PfZ51eXrtJWU9QCgg8W3ZPuzl13AwSo1UUVsSV+3f/6Ci6TU5AYtdoC86WNM80A7eVvUJ+5I8PXN4ketHsjdEPirUc1/dUHUONaSf8JwYyDFwosm+AmfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708539486; c=relaxed/simple;
	bh=Aim7Qpie5ii7CQT/cjFzRoVNO7qGkO73CWE8Fvg1iLk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=pSrEpzdmmJveo/MMl8z7ny2cekWKp5Kux4EF32xMKQs7WfNjTwdxZNhu6xHTNXBB0nXWTYwg6bYw9hvM0sSa2EmD6pUoX5LF1LxE9itEL3iayORXPuUmuV+jPNnQGbm4MSaNkfFQPwjKB6kX0BQDksxrd8SzMo8fgJMhy/cvG9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7c74d3ab389so298518739f.1
        for <reiserfs-devel@vger.kernel.org>; Wed, 21 Feb 2024 10:18:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708539484; x=1709144284;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MJd9Mq9bf/RBjIYNar7qNvmrsOG2DCgFiKzOfjcbWYE=;
        b=InvzcBTYyZga5mTsK999MMGk03R7rDqWrO0B0EbsR/2vMnBFmhYk+VA5KD+P19WnKF
         I1zlluN2Aa6Zt5XUOB5l5xg8vfcjA6xdoPnfMGk1x1MLktHCDUqPg56qqOktUzQPsB8u
         9sLk6ZTi23e7ptvm+fo81xG54nYg/4XGVHwuA65FwIWwCIlmOuLai/lwWUIdfLbSkkxw
         0nK0ilgAlj304w1OH3NJh535+BvcW6YK3sBZ+rqNkgDHgrPe/muk/huzcPR6y2sXf4pu
         CxXJNI53+IhhsEoWXtTL62TrBRp7oFL1Jks75Sbz94ijHSvSvKXE7UaflbTtacm7lUXc
         qAXg==
X-Forwarded-Encrypted: i=1; AJvYcCUCA6XrZ41D5X2KFK+1yizmZUQjenBdS9ua6uW8RG4iwu8sk1bpe1tl7lnyYK5mp4HuzT4lZPFNqSLu0YwUxdiLh6NmZXxFqYLquYsjC9g=
X-Gm-Message-State: AOJu0Yz/IT6F/pYU/GS26HbQmQYIyp2sz9aCyVLpylK71f9FvJtaeoci
	Q3dg+dptjGJ7PSzCpbgooxHLlpvNsdzsoaNfdhT7WnJpfsk1R8xdvmLRkQBBfhyQbheuX2IbPqj
	dJttZlqTZhtgvk3FTjS7fYtzk6I3hKQS4PMvgm2ztSg8KWbNZZ7K/atQ=
X-Google-Smtp-Source: AGHT+IGLjTi1I4UnSLykK1KGsO3JplFSALaCXnxdpBvFruTsaOMe8XAVmVMcSAgBRngvxmFZPL1x1S8GHu+QOv7QW+ugTVfQa3ve
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:154f:b0:363:de50:f7bb with SMTP id
 j15-20020a056e02154f00b00363de50f7bbmr1446503ilu.2.1708539483081; Wed, 21 Feb
 2024 10:18:03 -0800 (PST)
Date: Wed, 21 Feb 2024 10:18:03 -0800
In-Reply-To: <00000000000010719b05fed5d82f@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f95a7a0611e85807@google.com>
Subject: Re: [syzbot] [reiserfs] BUG: corrupted list in __mark_inode_dirty
From: syzbot <syzbot+4a16683f5520de8e47c4@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, jack@suse.cz, linkinjeon@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	reiserfs-devel@vger.kernel.org, sj1557.seo@samsung.com, 
	syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1410e3d0180000
start commit:   45a3e24f65e9 Linux 6.4-rc7
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=24ce1b2abaee24cc
dashboard link: https://syzkaller.appspot.com/bug?extid=4a16683f5520de8e47c4
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16bd1013280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=101d4adf280000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

