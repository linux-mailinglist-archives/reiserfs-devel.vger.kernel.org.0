Return-Path: <reiserfs-devel+bounces-73-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE5885A9E7
	for <lists+reiserfs-devel@lfdr.de>; Mon, 19 Feb 2024 18:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92D481C21049
	for <lists+reiserfs-devel@lfdr.de>; Mon, 19 Feb 2024 17:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E66482C3;
	Mon, 19 Feb 2024 17:26:05 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76C0481DF
	for <reiserfs-devel@vger.kernel.org>; Mon, 19 Feb 2024 17:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708363565; cv=none; b=GjSGYHRBEORYaXDheh0+19yfU5bynjEcwd8m12QRxhF+SvZoDcpg7WfP29ANZNNempVfebuCVLbLzgUuncQJKj/k0p51+io+3tZI1Y0TOaWXp39AwDjOSaWGLiHpvyT+cff/dCXQjNNptbPuheXoht319L2Au0Baktl8p8gMhuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708363565; c=relaxed/simple;
	bh=aZmoMCgbUJdjQL0v39nvpibD9TtPYmXNpPVEeyvHuVM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=bZmfpnwquJxw8ODeQm9R7d5PqkruRw72ujuLpm4jakw0BVCbL+M/PK1B8EWnQXq+MJvOQLIIcDXK8QpM/TDQZpp02JgykIalhwHYnphQyyT4UA+ow1FM0RqT9qBx/1rEuKu6+fr5OdVuIvCty3Nm+U18n+Z8s7SwxLh5rgAZPB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-36512fcf643so23452615ab.1
        for <reiserfs-devel@vger.kernel.org>; Mon, 19 Feb 2024 09:26:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708363563; x=1708968363;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ounGnQVyQWCAqb1gZccJxpOSoYs9iqhP6nXF46zXbQ4=;
        b=GjiPZyF2iaJOcMUNXV9OJMHcZ0dN11p7+pGCJJNuMpV5hbUlmzb4QGXphYECaHLFO2
         9YeOQJXmfkVmKrQHazGJa86d5Hw8xml5HB3H8lHcBbCEBB8liXU25lKvz8CG3WBm1zDQ
         PNAjmMz60WtJ7/wJUEhtWrOt36uT2Rwl+YJ3UievPj6UXHGQESpyyqw+vi+JnL7MK+By
         DaROgjO3oZmNbMt3Y30nQCWGAsr1So6MBj70omTSL5fEX3Rx3o/urk6/O7cpVf/Qtsov
         S3oyb6DLSZ4a7C8RGZjOh3VdFtsfg9iV0B0J3nONAw4+9nvFjdXL8MFWUGwp57OybY6R
         wz8A==
X-Forwarded-Encrypted: i=1; AJvYcCXVF7gpQzq3L6a5etTFWc/QSTegJT80PX4yDaxuKoQUjkF16qGKqlpbnxGD1PoNySL6wVEjNvuio0gLHRyVz2eBBZ2EMoGJ7P8jRn4DcZc=
X-Gm-Message-State: AOJu0YxNBubFaUlpGNrdMGrHIndfl3+lVvJZn4NVBVr2WGu7xn5ygwFn
	6rdVyHOTmQrZEvx7DHOTOIrqLA+GTJ1OBsOUndd7GgVWpiSQQpF6SuhnsDtHZi11VMNdmqUopuf
	iKqwuCnjBRkqCzSoTcE2/Pj6BJQ/8QnG7jAm+KiTq3ZmK/76q+xguE9s=
X-Google-Smtp-Source: AGHT+IFwUWM05/bAStl8NBq/eDdz5SadddI9IhapVYlljinuyOAxoboUUL051r7seYwMybLrVBTmh8rZFIVe9kEM6QeKRhdZmN6C
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d04:b0:365:26e3:6e48 with SMTP id
 i4-20020a056e021d0400b0036526e36e48mr383468ila.0.1708363562962; Mon, 19 Feb
 2024 09:26:02 -0800 (PST)
Date: Mon, 19 Feb 2024 09:26:02 -0800
In-Reply-To: <000000000000fa007305fcd83579@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005159340611bf637e@google.com>
Subject: Re: [syzbot] [reiserfs?] possible deadlock in do_unlinkat
From: syzbot <syzbot+ada12d2d935bbc82aa7f@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=146e7e94180000
start commit:   933174ae28ba Merge tag 'spi-fix-v6.4-rc3' of git://git.ker..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d8067683055e3f5
dashboard link: https://syzkaller.appspot.com/bug?extid=ada12d2d935bbc82aa7f
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=106e6d19280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13cf84e5280000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

