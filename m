Return-Path: <reiserfs-devel+bounces-97-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB1D874AD0
	for <lists+reiserfs-devel@lfdr.de>; Thu,  7 Mar 2024 10:27:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CE1DB21A2F
	for <lists+reiserfs-devel@lfdr.de>; Thu,  7 Mar 2024 09:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8063E83CC6;
	Thu,  7 Mar 2024 09:27:04 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EF583A12
	for <reiserfs-devel@vger.kernel.org>; Thu,  7 Mar 2024 09:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709803624; cv=none; b=LGKvHdFKepcN7D/aoyQZ8kq+zbD004DtOxgMWhckMsa0hRwIpdVe1cYP3BWTpQB3F3TcjI0TTiD/wkeI1S7pZZEdldvY5w4rOelp5rKJKg7t+mkfCwnlFYtDVlSlPVs/J2a+2E96/OzgHzM6t9nY2y1/tSb0WjYJW4k16Emg/Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709803624; c=relaxed/simple;
	bh=zUFafqTJeGxcmc/hlLS6N7jomBCs1Nv+oR8cEWaOQho=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kanl7nKNtcDZJqUrY/sdYMngG6DTGRijJoz+05m/ubFnhE1zbD99cammBPhYzD6RwtOuYHz2/vaO8D3XTVYp9xtnVPwYQy6jq2lVDaVg0grc9f/ZNhJOPWM8B9POfBjcKsqCnPW/y+qoTnHfFQectJNO+2isA4qis+boKsxCGWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-7c8364e4a31so78157839f.2
        for <reiserfs-devel@vger.kernel.org>; Thu, 07 Mar 2024 01:27:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709803622; x=1710408422;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NB9RZnkYPt4n1WS3RCfCtIlEr1JDKFgDjIZaAQfJpFs=;
        b=KgkYfODMKPw2EERitNNxg1eH/80SDnz0a2dDRSovOZpsayHhrSfeonpi4hO4ZJ2hH4
         nDWlbPVdSKfzZ+jRbLM3W70jQw0jLoeTfIudZNHPn62dO6KPiQAlnmzwaySupVV2Elw9
         Z6odcqxzfNqLfKSairDazN12ULfSSQZGYKo40aL/zatBgVJ/qxInMmFP5EItre+OLheu
         O7YNi3kuF9aIJ/K4vT65N5ZQY9qy57E2hjBQNWFNcoAgvJTDSrd23mHv1/g+VYwEVimG
         XlUlj8x+OR/gKOZ/IgddKHh9S9ALnxib2gilfUHURmY6s2cUpogejVJB5/UMVYhfWbON
         RSBA==
X-Forwarded-Encrypted: i=1; AJvYcCVtIMVgUqqQs61I3f4zdcZDZkD3s68PG/Qi3AoqTP+CgENjbftnvUPpC+3JkRSLj/FvTVole1ZYqWIufYY3DccdycuKPgEMkW46+sqkNng=
X-Gm-Message-State: AOJu0YyeagP7poE4tgj6lcAoKeo/VengQPBWvJHRO/QCcWNFQsKUSvjm
	KLKHtrGItPxR+G960oslBshUDhvgNTETOCfYkgkbJJ9WWZ7K9WogVfUsQuOu+yzQ4ZynS3rxzO4
	soGKXpCvRLvqNB5gyeJ+c3rnR/ezJoizGEMaHw4rz0DN9UA3MVPGkNJ8=
X-Google-Smtp-Source: AGHT+IGOUknSfs/AHY6R3/Cjy4fOCegkxgrx3co2CQHYN42ngoneFYTa92ongzEBgALOXl5ekZ3ITbZDiyeZlEubwImv5mzWt38e
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:6289:b0:476:b3d1:323e with SMTP id
 fh9-20020a056638628900b00476b3d1323emr41882jab.6.1709803622009; Thu, 07 Mar
 2024 01:27:02 -0800 (PST)
Date: Thu, 07 Mar 2024 01:27:01 -0800
In-Reply-To: <000000000000be039005fc540ed7@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000869cc706130ead1b@google.com>
Subject: Re: [syzbot] [reiserfs?] INFO: task hung in flush_old_commits
From: syzbot <syzbot+0a684c061589dcc30e51@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, jack@suse.cz, jeffm@suse.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, paul@paul-moore.com, 
	reiserfs-devel@vger.kernel.org, roberto.sassu@huawei.com, 
	roberto.sassu@huaweicloud.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=152ff3f2180000
start commit:   421ca22e3138 Merge tag 'nfs-for-6.4-2' of git://git.linux-..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d8067683055e3f5
dashboard link: https://syzkaller.appspot.com/bug?extid=0a684c061589dcc30e51
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14312791280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12da8605280000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

