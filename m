Return-Path: <reiserfs-devel+bounces-72-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF33859A26
	for <lists+reiserfs-devel@lfdr.de>; Mon, 19 Feb 2024 00:02:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABD3E2814E5
	for <lists+reiserfs-devel@lfdr.de>; Sun, 18 Feb 2024 23:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26BF6BFD1;
	Sun, 18 Feb 2024 23:02:05 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74885EAD3
	for <reiserfs-devel@vger.kernel.org>; Sun, 18 Feb 2024 23:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708297325; cv=none; b=itN7Ijg2BqedQci7/ec4CXmnKeErbahPOwXqwtrolQLlE/IX7FBgFG8OryEzcPxzurvwFf8YxvkCLtj/c24EC4VoczGjuf5GgOPLVp1DkARfxw6kyvJusekYTy+FPF1PwJepms59JCXkCNsANWI0S5b2YKspy36AIYkP6BG2caA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708297325; c=relaxed/simple;
	bh=gx08vrFga24mpJKJ6CkD8XwWwRlSzoVynbkz6tjlUdU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=NFYu411FtI7UBLI46PLXVF221aFzrbIbAX5lqjMt7fS/3Da9a28i33HTZU2sp1yI4RbtsPbc8Trzonzby78urGgdjdxROd6hpBHqyRlAwLECMFnKwroJT12euAcezlrbI5vT6QLDPtlqDY24IaNEggEF4X7kdtm2wCplo+a98gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-7c74d3ab389so38616939f.1
        for <reiserfs-devel@vger.kernel.org>; Sun, 18 Feb 2024 15:02:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708297323; x=1708902123;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jbqMO01/H/iqr4yf8kLtqB/zmeOqiP/DRUeUMAwyX08=;
        b=uWbhboy7gakefTS11za1TJ1x1BObeH73IQ27LrPMukITLxXtG0NFK+3tSsknt9+Ibn
         Zht3LR5BjtFQ9WQnZadXBTNQoNj2Y8dkXECCGqLlNeZQPxHUPaHGKkQx0KfcdmusdikJ
         5bFL/GOMXmUd/zCNMO+PB3SBGK7tEy2c2kwGidokJZ9cL10Ebrzu/hTntlJp9PwqRVN9
         dcvmYobjMwtBmN3BEqWLe8pQF2SLvVyYtjBFVE4CwKZw+9CQCJpJgqdDc8kPP0VFU3np
         uABHzAbrJ/dEuaB5Hvq3VoNl9XM2nV5MUzCQrdyom8q2iaFZGfzyx61HOE902On4+XLD
         R+CA==
X-Forwarded-Encrypted: i=1; AJvYcCX6uehj6bmLq2YLOK7UpdDfycDMrPuHhzzbjylYHYaJmZIVEUk0en7DykDUWZYY6BVgjmhBGie93ZwwdXOWKyNAnQol/5gul5/pPA6oVMc=
X-Gm-Message-State: AOJu0YwO5s3ONnd3RbniZBomnBukFacg2LrTsFAfgYg2WgwrFEJZ+PGg
	YWPfMRvziHZWz27RKzMTBI2PrjUv0Jf/nIH//rHbrlrr3gDCHMgoGBdJFkD0vy2BdFPVPNtizEO
	5sVGDeyasvErcssntv6AVRoBdyswqlH3GqpDZojPq9AbO9g42tYVR8+E=
X-Google-Smtp-Source: AGHT+IESg5nnX2NxCKLcT/j7td4ev2NPLuE2YZ2CwDqs2gyjCZhR5rLABe2T5nq7AHEkvwhfpPGVVoAbHx10tudQ9hnZVE8Tt9ji
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d92:b0:365:21f4:701a with SMTP id
 h18-20020a056e021d9200b0036521f4701amr328766ila.4.1708297323738; Sun, 18 Feb
 2024 15:02:03 -0800 (PST)
Date: Sun, 18 Feb 2024 15:02:03 -0800
In-Reply-To: <00000000000081dba605f19d42dd@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000026ff9b0611aff742@google.com>
Subject: Re: [syzbot] [reiserfs?] kernel BUG in reiserfs_cut_from_item
From: syzbot <syzbot+b2c969f18c4ab30419f9@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	yijiangshan@kylinos.cn
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1272f362180000
start commit:   88603b6dc419 Linux 6.2-rc2
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=9babfdc3dd4772d0
dashboard link: https://syzkaller.appspot.com/bug?extid=b2c969f18c4ab30419f9
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14edd048480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13a5c50c480000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

