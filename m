Return-Path: <reiserfs-devel+bounces-77-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1003C85FE38
	for <lists+reiserfs-devel@lfdr.de>; Thu, 22 Feb 2024 17:41:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94438B22A45
	for <lists+reiserfs-devel@lfdr.de>; Thu, 22 Feb 2024 16:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2CD14F9FF;
	Thu, 22 Feb 2024 16:41:04 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673461474B6
	for <reiserfs-devel@vger.kernel.org>; Thu, 22 Feb 2024 16:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708620064; cv=none; b=DUhAzU+yb/U+gSUmOmbPj7QxGeI6fHuzl/695QI6Ju0smen//0rbr1wF5vSZ/TC4owWcJPYAPNmxjwYfseJHMQOBHvSgbRkpd0eTdYOh2wne2VllMMY1dVVcji0PZ9HLRMqUsmhZhSAdOI0KTHwee8AfGdD26i9Cuv2ZG6RR034=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708620064; c=relaxed/simple;
	bh=h0qkg4ybl7Go+iMCC/iSGyWd+Gh2Kh3DWutLW4fCA1U=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gqnwPV7tAidNLJK8V9gBpeQqcNcYYMbro30DLskr3nOHD6wCPL4TwQVEqD1sKGszGDKyDZonHDAga8PY5xNMZC/pKDFlSDxp/hi7hONk5rKTCbUSd5Yz0pJru5sPNCbg3zSA7WK9mEPWxlbdulyGuXdBLLBrw64KtN/HKl4nq8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-364ff869140so21771815ab.2
        for <reiserfs-devel@vger.kernel.org>; Thu, 22 Feb 2024 08:41:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708620062; x=1709224862;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IJ5aqp9fdqY7o36k7fIAo7ucu2og5S19dbPdW4xD16g=;
        b=AEIJXQSv8HHTsdvxl0aUIUezZjoo2Y3+Q9eGfYkbrinwDSWYTjU9H7daq+Q9zy2mqS
         MwmelnyhHjKcJ1jqtgOOr9T9o9sBSWi52PqcSEvIaaojiPuQSdIaDb1HmnzIQQbdwUQa
         saLZM2oVKnESZLIizwGNZJeNfM229auOWMNVecAQY/NhAClpXbkfzkvoSZg6YNAqXCFN
         ChNNizv1MArX0ZTiX1b493leJayTXGv0Jo3meojKGkkUOK2eTTWR0S/nUBcbP+pMZU+I
         cVzG4Svbym1cUpl7fjKMBhTYwCfhRDGPN+eIoff0HTrrnw1xFK67+TaqmogQ/HS8pWRI
         0iKA==
X-Forwarded-Encrypted: i=1; AJvYcCXA5as3UJVJjc4vVNqMDWzNsIORdYT7qKFpzT0a7dnShYEuppbt48ZhIYTFKNshE/HiiNB9rQGEeV7xZX5R/qmhKh/rtIYe7hfOx3++dFQ=
X-Gm-Message-State: AOJu0YzrYHByqb005N7NeUoFZq1cMvsQ4ggjuHOfMyEIQEWUtZ3leDqt
	q7K3aiHNXxCCbuhRbQNXsiwtB4BOk/CFOgVMHoLNcxueJ/46boLTxbt/OWnNOP/wYO/Yps6Lqsq
	0tt7t63pIc/6y+sS2VEcequyqxXEkhoAViaT0PZinLUxyJTGnnM0fKHw=
X-Google-Smtp-Source: AGHT+IERfkQLLE1RjmqYWtZVQ/b0Z/t1fbVmJvDFARmZmYdz08jGgp/RbcQ9MJCC4ZNoa86l5tdCtIZkeRqBGdknpyso18exPKPE
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:154f:b0:363:9252:ed47 with SMTP id
 j15-20020a056e02154f00b003639252ed47mr1821068ilu.1.1708620062699; Thu, 22 Feb
 2024 08:41:02 -0800 (PST)
Date: Thu, 22 Feb 2024 08:41:02 -0800
In-Reply-To: <00000000000034d16305e50acc8d@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e4b9c60611fb1be8@google.com>
Subject: Re: [syzbot] [reiserfs?] KASAN: null-ptr-deref Read in do_journal_end (2)
From: syzbot <syzbot+845cd8e5c47f2a125683@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, axboe@kernel.dk, brauner@kernel.org, 
	bvanassche@acm.org, damien.lemoal@opensource.wdc.com, ghandatmanas@gmail.com, 
	jack@suse.cz, jlayton@kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neilb@suse.de, reiserfs-devel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, syzkaller@googlegroups.com, 
	willy@infradead.org, yi.zhang@huawei.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10f6c4b4180000
start commit:   69b41ac87e4a Merge tag 'for-6.2-rc2-tag' of git://git.kern..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=9babfdc3dd4772d0
dashboard link: https://syzkaller.appspot.com/bug?extid=845cd8e5c47f2a125683
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14f68684480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=142a1eaa480000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

