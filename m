Return-Path: <reiserfs-devel+bounces-44-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 980948357F3
	for <lists+reiserfs-devel@lfdr.de>; Sun, 21 Jan 2024 22:38:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B12261C20952
	for <lists+reiserfs-devel@lfdr.de>; Sun, 21 Jan 2024 21:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379E6381D8;
	Sun, 21 Jan 2024 21:38:06 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EC81E49E
	for <reiserfs-devel@vger.kernel.org>; Sun, 21 Jan 2024 21:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705873086; cv=none; b=XvuWCnkw1Z1ovq5wXT3IJ1Sp7oCYksXMqah9OJ9LOdMwPGnN7UQqCoHyGx8wfzKNV4M5hlI+7XF3b5t6j3Jc+6zvSUofNR2TA28+3uKklHPNszppGsaIBOLj6dyFCulUqgljsP8wC9T0RUbGlJtvmuskProNMh/twzmGodTpYe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705873086; c=relaxed/simple;
	bh=ADtN1ZtRhdvwA5SdPpt6av/OuYK6N5Bzl984h3cTbck=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=elgvSNyZFv6VvQhxfB57QxTtR20+0fTbhaSy3EnKx80BJdpEy/Hc5kDYo52nJtgvgROo+mYQdS9/G/jphSkP6LD9r1u3c2kaUUWMF0lkPqsLgHvNdXLISAWVEmxS8qGpVCFUoIDtH25Sbs5t12+B4u6FvPxBN29EI54vXEr/ljI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3619143da54so23390855ab.3
        for <reiserfs-devel@vger.kernel.org>; Sun, 21 Jan 2024 13:38:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705873084; x=1706477884;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HfXiDPxljx4DtQYUMkH1jn3pRTh3NiwPfhc+Si6O028=;
        b=rr2xqxwbp4FTx18lVbPHqEMLfm8EvJNiUyQalADU07tefJrcMw+G6QmqawNCAYM9bX
         s0QBHpOc9hvWeBnwyjvTtj1WA5p9cUsOU5N7JbmqnEW5A0qv0tcd5kqSPm/AVh60dPD/
         Os7li9+QVK0VF1MZm5+tyqydsxS5h0O+ly3xzegrdLnoQi9DvAiqoRzKgeCzPWv70Q1w
         hf5Us5NLt1rpU6AfmDSO+WbHW4mbjPJZZEM5qWRhvXOxxAg1sxXGGmmkQ7pmzinAMd+n
         uhAm7Ti1GEg+Ck4i+wF0Um0EbPY1jsCsfF4W/U9r+rtFf7/b84kRA2/j943VX9B8mBn+
         eQEQ==
X-Gm-Message-State: AOJu0YxPfOic7x2Cog14tmcnNg+6rJhC1BBJAM74rsc2uGGzT8y/YifL
	KFxEWCpY5mWCiuoOE5a1RRrbk8K/ww66ap17eVvA/8DoNuHkw2h0yt7lAPjo3Qa8vNofa0LDJK1
	MGCQnoknky/jMTrpgvMtEHYCRLrPju/Pt0q20jiEdiH+yZz+EhLCs4Eo=
X-Google-Smtp-Source: AGHT+IFtw+I9gj7qbGr9UFRCY4KkCPGRElTHhUML0jEx0K8voDN5+lX4C6oO2F04Gf6gZ94y/s6i4OtORoTdBF4fRcEQyrmv4KZc
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:194b:b0:361:9a35:48f5 with SMTP id
 x11-20020a056e02194b00b003619a3548f5mr235049ilu.0.1705873084079; Sun, 21 Jan
 2024 13:38:04 -0800 (PST)
Date: Sun, 21 Jan 2024 13:38:04 -0800
In-Reply-To: <0000000000005f0b2f05fdf309b3@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003567b1060f7b8724@google.com>
Subject: Re: [syzbot] [reiserfs?] kernel BUG in flush_journal_list
From: syzbot <syzbot+7cc52cbcdeb02a4b0828@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	paul@paul-moore.com, reiserfs-devel@vger.kernel.org, roberto.sassu@huawei.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1556b3dde80000
start commit:   4652b8e4f3ff Merge tag '6.7-rc-ksmbd-server-fixes' of git:..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=d855e3560c4c99c4
dashboard link: https://syzkaller.appspot.com/bug?extid=7cc52cbcdeb02a4b0828
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=103dee6f680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12883df7680000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

