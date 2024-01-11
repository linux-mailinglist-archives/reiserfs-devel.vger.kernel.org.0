Return-Path: <reiserfs-devel+bounces-36-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 795B282B30E
	for <lists+reiserfs-devel@lfdr.de>; Thu, 11 Jan 2024 17:35:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8614DB25ADE
	for <lists+reiserfs-devel@lfdr.de>; Thu, 11 Jan 2024 16:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94B6D51028;
	Thu, 11 Jan 2024 16:35:07 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0515650276
	for <reiserfs-devel@vger.kernel.org>; Thu, 11 Jan 2024 16:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7bedda4c4dfso227958339f.0
        for <reiserfs-devel@vger.kernel.org>; Thu, 11 Jan 2024 08:35:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704990905; x=1705595705;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dRdbg5bSi7lKyoJs10oddtkV1hHDIPE09w+ZHa9TK2o=;
        b=eZksqryApF5J8OXttXeMAPe4U75X4DrdhEPmuGmCtJSc2mzuX4oYRgVJSWv20Vferj
         TAYlFHc6dMV6tXhNz6kM8VP4p0TCbt1JaKINUGIKidGVc4Rd33X3H02xits9t1J0HtsN
         9EJXvTfezEX7w9/DAIvliEDeKMtZPmA5wttVXy+7qgWa2ZtJpSREI61jK91JhhB63aQQ
         Kzc2xcbfNG/mC3YDXjMFY44HgcxRQ+E0kDf26FiqMzNGb57O04LAvUZtlIr4YJvGv9q/
         ObWw3chtCDjpBinm3hNpku/4tg6QMPCRGDJztykbST0KnUmOrZWWnBd+bLWq+baW34/z
         wkng==
X-Gm-Message-State: AOJu0YyugEJr7RriLX3UN3T/jBYM0PyujipHdwAPC1o1sc6vaIOPaW6i
	MnkBT8O8a9ZihfZmEEYwnSaN6qz3AQ5vvEByCvle6S7IjvWw
X-Google-Smtp-Source: AGHT+IGwHN3+9mhxqEczRA6+EUJO9zR3XYbmE69dyD0qqqrQxkSeSFNA5XswVXDEJOVLzjxw2f035QHlP7vp+LF1ntwpbkf1mErY
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:4117:b0:46e:5d08:e499 with SMTP id
 ay23-20020a056638411700b0046e5d08e499mr3756jab.0.1704990904159; Thu, 11 Jan
 2024 08:35:04 -0800 (PST)
Date: Thu, 11 Jan 2024 08:35:04 -0800
In-Reply-To: <000000000000a4a46106002c5e42@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000301d7e060eae2133@google.com>
Subject: Re: [syzbot] [bpf?] [reiserfs?] WARNING: locking bug in corrupted (2)
From: syzbot <syzbot+3779764ddb7a3e19437f@syzkaller.appspotmail.com>
To: andrii@kernel.org, ast@kernel.org, axboe@kernel.dk, bpf@vger.kernel.org, 
	brauner@kernel.org, daniel@iogearbox.net, davem@davemloft.net, 
	haoluo@google.com, hawk@kernel.org, jack@suse.cz, john.fastabend@gmail.com, 
	jolsa@kernel.org, kpsingh@kernel.org, kuba@kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, luto@kernel.org, 
	martin.lau@linux.dev, netdev@vger.kernel.org, peterz@infradead.org, 
	reiserfs-devel@vger.kernel.org, sdf@google.com, song@kernel.org, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de, tintinm2017@gmail.com, 
	yhs@fb.com, yukuai3@huawei.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=120430a5e80000
start commit:   c17414a273b8 Merge tag 'sh-for-v6.5-tag1' of git://git.ker..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=7ad417033279f15a
dashboard link: https://syzkaller.appspot.com/bug?extid=3779764ddb7a3e19437f
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12bbd544a80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13fd50b0a80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

