Return-Path: <reiserfs-devel+bounces-88-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9507E86BC06
	for <lists+reiserfs-devel@lfdr.de>; Thu, 29 Feb 2024 00:16:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCDED1C21D16
	for <lists+reiserfs-devel@lfdr.de>; Wed, 28 Feb 2024 23:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D48713D302;
	Wed, 28 Feb 2024 23:16:07 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821E613D2F2
	for <reiserfs-devel@vger.kernel.org>; Wed, 28 Feb 2024 23:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709162166; cv=none; b=cg7VDGsNOwijVAtZP6EIgYQx31WpICv8K/8FyY5KLpo4XKeXlvCb3z9Eawl6zsHGxn2y4+YS/zB/GsNieBPHmflLAqPBbHXNTh5qipFgfIA0xNKAhFTwiHxiynDorj6Gri+BL4HYh1ZCbPPiOGQazgJcZ3nsihbod+vDV9gazCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709162166; c=relaxed/simple;
	bh=AQUahNxliBRnxzbiLyFJhAv8zSnsPgpBvtR8vmHjVTI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=S6rX7OVXVn4sjv37rgDh9nCDaOg2AjXUbpqm2QGjpJMpOLim/56174K7r/17WCW/d4MdF+yiz6fHI3kHM/WGE/X/Q3clBNfpQu7K5fejcugCX2ysBIHDEZC9b1ixw5QwY1IO1Daku5EVI0+XhxJ/Yebh4eA7AR4yPBj/HGi/cI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-7c7c4065282so32180939f.1
        for <reiserfs-devel@vger.kernel.org>; Wed, 28 Feb 2024 15:16:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709162165; x=1709766965;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b0RlstvxprlM4gkYbdJ5NUP8ntmVKrjAxjshVbrRXSc=;
        b=FfM8Q9B26sImsIJs9UMpSkFaUF3lC6k5oAX2Y0Ez9ilcJDtQyp9EnzmiquY0iUueSc
         6c+gcnS7hRrUpk5DotP6w3+PXwPLlh6I3yfAuUBk2TMuHX7gon6WUlsyWLgMI2dUxS+O
         8Pp0TABAFwc3Ji/Gy7/YuMabzuPBiKTGUO2n1og5oa8pvLrD+FVJnTsKQycMP9cn50Zg
         FqjbizirxH/O6altyDA40A+D5kKat+Jx5srcqmB2ut7roQSp4guQWCEIA19YNuAbkaz0
         0XmLwQtCmME/fTbPSxEQdnkrc833WOF3vOMIDj6cu1hqN1pozNC007lXbZ4b9nl0e6EZ
         Hdhg==
X-Forwarded-Encrypted: i=1; AJvYcCXkbeQQ0H3omYoBXA8gGbDkcTmr+1WKDErQEuJVBjq5T/t6+pqDCDdj244YcwZW3oxkNQCmHRkEP5hKl2r9L0FHDqZuJhry24Otzz5JDIk=
X-Gm-Message-State: AOJu0Ywp7HBJaLizKzX5e4rXVeMqy9rBwVJhxuaSePiVrfz2rWW3oH3X
	a40YkCLjBmpAfWM095EfbXhyOQDRWuQSc0wsS3H3XW6dYkp33mq1tWpg3AZsNiiFZWpjaQkODnd
	L6h0Vp/FYZRLbBmmDOp0HzgZikACloThrrLJhUnyuBRDcuDq1jprxmlo=
X-Google-Smtp-Source: AGHT+IFji+gWg2pA+eUmcqqi3S63tv894XUzwmU+L6rl/SIS/OebR1zkMrOwnEALjAYt6aL4+TwLBuzpQRHW46MxBHfiWMdCbk8l
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:20eb:b0:365:25a2:18ab with SMTP id
 q11-20020a056e0220eb00b0036525a218abmr36292ilv.3.1709162164779; Wed, 28 Feb
 2024 15:16:04 -0800 (PST)
Date: Wed, 28 Feb 2024 15:16:04 -0800
In-Reply-To: <00000000000095141106008bf0b5@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b2059906127953c9@google.com>
Subject: Re: [syzbot] [ext4?] [reiserfs?] kernel BUG in __phys_addr (2)
From: syzbot <syzbot+daa1128e28d3c3961cb2@syzkaller.appspotmail.com>
To: adilger.kernel@dilger.ca, axboe@kernel.dk, bp@alien8.de, 
	brauner@kernel.org, dave.hansen@linux.intel.com, hpa@zytor.com, jack@suse.com, 
	jack@suse.cz, linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, luto@kernel.org, mingo@redhat.com, 
	peterz@infradead.org, reiserfs-devel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de, tytso@mit.edu, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1010d154180000
start commit:   95c8a35f1c01 Merge tag 'mm-hotfixes-stable-2024-01-05-11-3..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=247b5a935d307ee5
dashboard link: https://syzkaller.appspot.com/bug?extid=daa1128e28d3c3961cb2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14562761e80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1089280ee80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

