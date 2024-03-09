Return-Path: <reiserfs-devel+bounces-103-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F29BD877026
	for <lists+reiserfs-devel@lfdr.de>; Sat,  9 Mar 2024 10:59:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B56C2B2114C
	for <lists+reiserfs-devel@lfdr.de>; Sat,  9 Mar 2024 09:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B6CE381DD;
	Sat,  9 Mar 2024 09:59:05 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD37381B1
	for <reiserfs-devel@vger.kernel.org>; Sat,  9 Mar 2024 09:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709978345; cv=none; b=AyjcERl7pIuAIvI8fkonCLoB06qAMOt6XY9v8kYjf6xASZXioe0cB2BcX0GRyANK72OuBG6+fIALvdCg+4HEGU3ny7qw4AAr/9x8wXJUMgg6UsQacg9f6k/kAKDIIS4SxmHTC06YYBvmfwlyMwGBsOL1e2ZNlFThleK92IGlItY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709978345; c=relaxed/simple;
	bh=asn96ezzDe7z4cS9Xr9t03l6ZD3ftiEfDmD7qxHPWR4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MIAV9+MfGDgYjXWsQh4Rt3rLslDZU3rdcNSRKZs8+u2CNyCJaL3ZX8EU7RxVAsjrChd4Aa84ucTtsagRXrvHE2jzwRo24UGZqLiy3m/ggg6wwia/jBMbRLOw7lVNCxdY08/NgLbapepplBLaJUfDvfctm2FZuDaOXmCL4GkLNOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3662fce6f54so12056005ab.2
        for <reiserfs-devel@vger.kernel.org>; Sat, 09 Mar 2024 01:59:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709978343; x=1710583143;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fVYUoCeuZ1fyxODvD3L6XZXHBvcIymgYiHpvfaB7YME=;
        b=QkO4LS+acYDeQQznitjaviVpB2nEDAtEPuDxcddsgyzPg3sDq/eKfmGNHaBhM6dYGv
         z87jd6OfU5rjPF8/m7V+QFir6iJwq134X3B3pWtof/Iw49MNlgXN9hgmZr6f29cYBC7t
         OVujhJH45iZl9fKN+4phlCV4p/n7rhO+kBjaRW/Lzp5iKKDzB0l3ht2/CXfdRjpA+qBY
         D7CWiHgsZF1/YX62HPvWvYmPJXYUUcW65iGEq1/5g5p5bu/2Yy+X6Qh9U/aEfx3kaEh9
         GK+0ej70CQwTS86CZrxcBOKWkmbrkFjqao4hgPQ9GH9+BCKHwFgGFpFBPvFhHLzgVb2l
         R2Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUKCRyURKIc0DX+04vJVahbQ1Q4WXWl2XVF7Z2o78jyYYoARbUoCYMTS/D53gYWPlSrmBpDlSfBBnRxpDsWoH3uTUlutHTlj8TLb9yUCec=
X-Gm-Message-State: AOJu0YyIK86wBLEMa9YLPQyuXmgZ5Hmn3BBtwBoJT3Sm0PZZ5sIO1QXA
	h+v9mMccGjMN5ePqW79F50+7q6FYzHuOJajm2KgmbGcDZnMLTbD1h76zA3WItA4SHznHr15yRg8
	t2d9GPX25VvqEgRODW3uyCCejeUZjogEAhGrIpt0MjtEzQWcs1QP3b80=
X-Google-Smtp-Source: AGHT+IE1qe21EYraqy1mF2HjTY4C7GyobmyXlxUrrhxJTThu1W+Kf+RgPU89aqiaYRwYdp0pyncoVYWN7fk62Y1+CPuhsAXE2nyz
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:214c:b0:365:147b:fb44 with SMTP id
 d12-20020a056e02214c00b00365147bfb44mr62585ilv.0.1709978343080; Sat, 09 Mar
 2024 01:59:03 -0800 (PST)
Date: Sat, 09 Mar 2024 01:59:03 -0800
In-Reply-To: <000000000000cfe6f305ee84ff1f@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b6989a0613375b88@google.com>
Subject: Re: [syzbot] [reiserfs?] possible deadlock in reiserfs_dirty_inode
From: syzbot <syzbot+c319bb5b1014113a92cf@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, hdanton@sina.com, jack@suse.cz, 
	jeffm@suse.com, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, paul@paul-moore.com, 
	reiserfs-devel@vger.kernel.org, roberto.sassu@huawei.com, 
	roberto.sassu@huaweicloud.com, syzkaller-bugs@googlegroups.com, 
	syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11750da6180000
start commit:   90b0c2b2edd1 Merge tag 'pinctrl-v6.7-1' of git://git.kerne..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=93ac5233c138249e
dashboard link: https://syzkaller.appspot.com/bug?extid=c319bb5b1014113a92cf
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=113f3717680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=154985ef680000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

