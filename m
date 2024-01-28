Return-Path: <reiserfs-devel+bounces-52-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B604583F482
	for <lists+reiserfs-devel@lfdr.de>; Sun, 28 Jan 2024 08:18:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8B0C1C21CCD
	for <lists+reiserfs-devel@lfdr.de>; Sun, 28 Jan 2024 07:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3365D2F7;
	Sun, 28 Jan 2024 07:18:05 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38815C15B
	for <reiserfs-devel@vger.kernel.org>; Sun, 28 Jan 2024 07:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706426285; cv=none; b=loxfLGSg2d9/i+BnVhmY0r5jUSLJ1KmHvtfPRqcaPN3baxDFNeAABDKB9uPipYAU/kYnd+qTHNDOWAvawRC8JyZr+1JZdE8EEUzupMXLLCk+xt2oDD4xPaNyHXRsgWkHME3QdKwJgOSHmAjweaelkLhVWXtYIRivjsJQO8sxgWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706426285; c=relaxed/simple;
	bh=D6ZyoKTF6L3wn7H4QjFvGhyvGvKbYTYFoHnQj51K7pA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=eHdH5n94EWoB0DFQ6OtSN60mUdZmbQpzitFILhicYhYQhutKHckZ8hAtdMwEZa7jiZF5V/8McRW48KOd0Wc1DJZe8vDSYT3NlbIOf/pRTJFPxYAM2kT2NHno97XXRafnxPP4UViOs45C6HzxyPxRMvaXL3AUnkG5rxGFjEtDEz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3637778d9feso3821515ab.2
        for <reiserfs-devel@vger.kernel.org>; Sat, 27 Jan 2024 23:18:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706426283; x=1707031083;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ul8wmNFSCMVhgffO/ITwaHvUKPduHDAXYkg9gcF38LQ=;
        b=AX1SL3JvpKLYc6KS7APalqkKkoh/YIfTJoiZPp6MocCkEKMlxKcrZIDSAoLDsIE863
         I1MbvAWQPVfJrXErqhN3tv4YT5CO3zh6kLX0zGfk2ZLd4qLHsbtShwdJuI7zj4FAVIz8
         pg4tGr9eAkk24PcBnAxQXCMfq5gZM80tnUMAzm7Je8F+8bTDGOC7aU24TzQovptKJ/z8
         48QpQY+IlrsDsWfn/PjRH/KNizamuqRKaxp8cmqH1Er/cIx3KEYoiLRloYh2jobsvckN
         KFGHDtCTEsGXMpunpum45zgRH9hIdEGpqf7tJY0eDjPk4Kb0zTmPAvKEmtlJgD2ADvHi
         ZDRA==
X-Gm-Message-State: AOJu0YzASIKcZioneoQo2g3EmX2JE42gO34B043Tu1+EE4NZp80aD8Kj
	p/iwGvR8s+hUH2Q11yM1DYjtnq8rd7JSGuN4elXmgCvU2WqnDIBXw+W4FT0y7aObAOTrsQXNty2
	Dci0BV2B3zicRlpyB0SmWcDOBYVN09BY6Ddk88ioxWzabhRJ7srFegO8=
X-Google-Smtp-Source: AGHT+IE87ax8hL/iicqYU4HAN2acMDSk8ljjHL8DXHbMp3/VT5KWOCFtGyYxsWaFr43s1p6HNGKprBlfxx1Usk9EN270xb77Heb0
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1808:b0:361:9a68:4891 with SMTP id
 a8-20020a056e02180800b003619a684891mr353817ilv.3.1706426283208; Sat, 27 Jan
 2024 23:18:03 -0800 (PST)
Date: Sat, 27 Jan 2024 23:18:03 -0800
In-Reply-To: <000000000000c6ec640601d95e6c@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000072355b060ffc546e@google.com>
Subject: Re: [syzbot] [kernel?] general protection fault in timerqueue_del (2)
From: syzbot <syzbot+500a5eabc2495aaeb60e@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, luto@kernel.org, 
	peterz@infradead.org, reiserfs-devel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de, yukuai3@huawei.com, 
	yuran.pereira@hotmail.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=172204dfe80000
start commit:   4b954598a47b Merge tag 'exfat-for-6.5-rc5' of git://git.ke..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=fa5bd4cd5ab6259d
dashboard link: https://syzkaller.appspot.com/bug?extid=500a5eabc2495aaeb60e
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=169efdf6a80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13733f31a80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

