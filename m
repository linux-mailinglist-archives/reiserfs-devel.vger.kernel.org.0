Return-Path: <reiserfs-devel+bounces-71-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F73858924
	for <lists+reiserfs-devel@lfdr.de>; Fri, 16 Feb 2024 23:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B64FC282AC0
	for <lists+reiserfs-devel@lfdr.de>; Fri, 16 Feb 2024 22:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657FB1487EB;
	Fri, 16 Feb 2024 22:48:05 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CAA14831F
	for <reiserfs-devel@vger.kernel.org>; Fri, 16 Feb 2024 22:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708123685; cv=none; b=iQQd4CpDunK0E9sSoDse+Z7s55R8sfx/cwhkCxS60QUsokm06Uvx7Jl9/TFHejCQ6hBAjgBQvXL7BtrxXLBZJ7n/M5+hv/2WCP/Yo3oJegwCnUw79bfvBvlcHHj5mBm7BetsH8sIYev1OZMtpHR6XaqTFa85UQNQQqcZ45uqeuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708123685; c=relaxed/simple;
	bh=Oc8/VVHL3mJzxSm9wwcBnL/NkDYsxziPs924FwSBpcw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gmlHHFemdRXd7JxMJpcR7I6QdXfkmZ4bSY4NvrZx4eIp/bArSNvQsn7czELOtFeMhQv0YQpdBYaYXbBNpPbHp0R/LwwgS2S/Xd/iMi7m86O9ow94IUOOkwGfCMR0P48UyU0gsGz6OH9YTtYfhN2i9DprZj7EHVZ0GVqhbrz1p4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-7c4a0dc9f57so165334939f.0
        for <reiserfs-devel@vger.kernel.org>; Fri, 16 Feb 2024 14:48:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708123683; x=1708728483;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FgA0grvx/iurskLb7osrvJiMpOml1Vk2dU3E8tYqYNQ=;
        b=FdMsR25sX1vIZYLmy4DBDpf3hm1ZxONb13rNtMq8o6Liv15YYkwjYu1htr/Tp77Or4
         fVRts0GABnkmgSQOtjObunn5UWXcPYnve1BazBTHvSUAqPWrCHtH2Df7gul3yrQJCZK3
         Sl9rkJ0pyxB8dUnPiJz6UlJ349qhSCuKr9wNfDv5kcIuufn1j2DmDM7g+pEXIgy2OYTV
         5i/Ksx728ISHUQc0Fuvn+u25TUxkMpHVKmU0r86Pl/YUZ4U8rD0IJ9ztr6CX+ZkBOIP2
         EYCkTZ/iOHlrJljIi9m6hiCEenSFN1TccqwPepvjblXWJGGu11T4fPBUkV6kFS4qy3SS
         cz4w==
X-Forwarded-Encrypted: i=1; AJvYcCWxwq9Cgt/wjzYHg84UpJbh6p1CqK8y8TG931+iaWgGm1APngZkf0NioXR0KONxqimsWZhjlZQjgFHOBGfRUdf5mcHdZywf/6Qfg1vrofQ=
X-Gm-Message-State: AOJu0Yw7MncBW4CWY5OwYXNU+5BGBDpR0Q+2QR/snV0KKZbJF6frL8YH
	dySvdn/7d3XvxFb0t0tqAScLBEESctpHKImNzScSGJdk1nqnFB1YIsuutQG1EYWzgtFosxVAbyg
	QnAAD12sB2jnXP63J3Atscwv7CDD9DlrI/g5hNn22FZ4h5kjyeFhUsY4=
X-Google-Smtp-Source: AGHT+IG7sgyLqJEM4CdSPqmCU6u6X75Kn3VHzvRg1bqrsbQgtfcdDFL24k1piEhpu3S3maBCtZ+28CkM1eb1SnD5QQSXMiwAp8np
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d1e:b0:363:c25b:75e4 with SMTP id
 i30-20020a056e021d1e00b00363c25b75e4mr545125ila.5.1708123683116; Fri, 16 Feb
 2024 14:48:03 -0800 (PST)
Date: Fri, 16 Feb 2024 14:48:03 -0800
In-Reply-To: <000000000000520d3405f075a026@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005d6c8106118789ea@google.com>
Subject: Re: [syzbot] [reiserfs?] divide error in do_journal_end (3)
From: syzbot <syzbot+74b838cfa47fc9554471@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, bvanassche@acm.org, jack@suse.cz, 
	jlayton@kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, song@kernel.org, 
	syzkaller-bugs@googlegroups.com, willy@infradead.org, yi.zhang@huawei.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15009b1c180000
start commit:   610a9b8f49fb Linux 6.7-rc8
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=655f8abe9fe69b3b
dashboard link: https://syzkaller.appspot.com/bug?extid=74b838cfa47fc9554471
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=177f6ca1e80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11e6349ae80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

