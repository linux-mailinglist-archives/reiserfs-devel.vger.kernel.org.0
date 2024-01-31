Return-Path: <reiserfs-devel+bounces-56-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E66844535
	for <lists+reiserfs-devel@lfdr.de>; Wed, 31 Jan 2024 17:55:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C1C41F23590
	for <lists+reiserfs-devel@lfdr.de>; Wed, 31 Jan 2024 16:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4A312DD94;
	Wed, 31 Jan 2024 16:52:07 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAF112CDBE
	for <reiserfs-devel@vger.kernel.org>; Wed, 31 Jan 2024 16:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706719927; cv=none; b=doRZHNdSF2s/qOlc7D38cVuTSM9Pf+Oj1LmvJuT/Sd9keqEGMath5sC9xijzEZQhOSNpD8x8EZHmfU4h1XnMhv2TioZHs9Tw2LVq5IXPJqIghpAKBu1GaO1kYIi+9pgYAfo2glJD6xuavGU727MQOLyvK6/mxHIyG7g/bGTTAyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706719927; c=relaxed/simple;
	bh=8mIlbgNFRn4hfguvC9zxPYL1vcAbk0M7lwbNKf4D3Ug=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MrYmYWAyBaTio9uZtwcKP5puw8rcg6e2SHU9ZJDjct7iBMeKXOK6Jg9UN4zbfulX5+dNr/nS1kviCBd4Af6zxyXkoNJb2UbIaM4+jR7uwqcFDSOX9WFZSefZ0Hr4iAtW6CQOYMl8VQLAyMQdS7aHn+l5bg/IbnWIkVf+Z8OHcNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-7bfeba24176so252290439f.3
        for <reiserfs-devel@vger.kernel.org>; Wed, 31 Jan 2024 08:52:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706719925; x=1707324725;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qKwMCNqqjxXZNdfuSQe4LlDy6lJeOUSAZT3H/H89flY=;
        b=D4F8l30nxv/6m+CO4YeT2Ye8UyTx3nFoyESaYVk6o7yNOXoVU761vNoTcuSDfj4IH0
         ezEkRkXSE+q2k+LxSQK+SIRylR4khOxJqEJX8Y2HT7zBJS7hT+F4vhxMFy3qMyKleDXD
         KyrGksa3mVm59XIkK3C9jWYNdBPf2RYWIq3ZwC8GbQ24mygJxM3DB4dRaU8AQ5hvPWyX
         /5hANf5SRmHrsVpG3SpTCF4t43bJpzJtw3curqjTfJQNCbQulstZJJgpU0zy3TQ4AYXH
         z/egU+heSjdWRNM72syvHuKi9SQbcopoV4t2HSxmgsr8oXR0GwEF4V5E+RzsVQfpf7B/
         uTbg==
X-Gm-Message-State: AOJu0Yy7ufA3ST77AWnXqtfReMuTEUwGxpR5KGT8ESqEvxgDijGgqhga
	5pPHTosdUKZt/SrniD1VFHxQ+XCno8+Mzq8XUl+v4GnPfshCwhhJdrwjNCPXDY+anJMr8uFamCI
	l3dGv2gDt4N+ByAGJ6sZrPkDIK8z0eFpOHD4KPvf5U/El2+51mUe2C48=
X-Google-Smtp-Source: AGHT+IGfIwM+AKkak4ZYg6BDLxJSI1TkOSSFyHTXghP3x687RLESV3g2QiRGib+cS5p+5Jf+Bq7ixz8Av0ejom50Ml9mYtKfyygv
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12e8:b0:35f:d9cc:1c9b with SMTP id
 l8-20020a056e0212e800b0035fd9cc1c9bmr198780iln.0.1706719925486; Wed, 31 Jan
 2024 08:52:05 -0800 (PST)
Date: Wed, 31 Jan 2024 08:52:05 -0800
In-Reply-To: <00000000000073b6d905eb48de3f@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e3d3f9061040b2ff@google.com>
Subject: Re: [syzbot] [reiserfs?] BUG: unable to handle kernel NULL pointer
 dereference in reiserfs_find_entry
From: syzbot <syzbot+4654552e088ed458b10d@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17e6fb5be80000
start commit:   51f269a6ecc7 Merge tag 'probes-fixes-6.4-rc4' of git://git..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=162cf2103e4a7453
dashboard link: https://syzkaller.appspot.com/bug?extid=4654552e088ed458b10d
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1177c895280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17f4b2a5280000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

