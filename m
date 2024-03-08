Return-Path: <reiserfs-devel+bounces-101-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB30876C5C
	for <lists+reiserfs-devel@lfdr.de>; Fri,  8 Mar 2024 22:27:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3AC41F21471
	for <lists+reiserfs-devel@lfdr.de>; Fri,  8 Mar 2024 21:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1305F848;
	Fri,  8 Mar 2024 21:27:06 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445E153373
	for <reiserfs-devel@vger.kernel.org>; Fri,  8 Mar 2024 21:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709933226; cv=none; b=URBBYKoscLpI7KRus4tJk44mRAa01FEIoq1sKp6UBOMHazt4Sb6+6BGVVCI1lXz0Uyr3hF0PpcAz20VoWaDj8IjaSD18pYCBoZnOLjeIWv32CtL69KuGw0iKRxoKtxAbd23DUUoY2fDdenVvqCq3TfDNmdVor3S0XoJxk7Flmn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709933226; c=relaxed/simple;
	bh=u7l/U1k0b8WLPkq/O7XnXWPK2N8wgWRoVz/cbJw/lxo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PWXFfWwHazlpCl7Wix+hyaV7oNvolhVTlX70eXIc+97qRnn8GjXRk9SItmWdnTKojm9f9mODK8FIoJoOeC0S3fgkc8kOgzZxZtg2K1rWGB7KMhWN7doE+sAu/7dRMm4IpP3J2DGFTzBvb/VsuGfLD6VwfQ1cvcQuA23ib/nkj9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-7c887bcd6caso210319239f.3
        for <reiserfs-devel@vger.kernel.org>; Fri, 08 Mar 2024 13:27:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709933224; x=1710538024;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I7u6kH6QRLYYasOKH6vti3N8lwLjnLDCzgOQh2S+Wgc=;
        b=H1awu2ZjO4gB12Xgfd480pnlZ5Iyy4o6L5RNF44S/Y1Q+M/K2VMkvb/3ksJ9Imfuml
         0O6FsDbhXH+cB62jX+YDZuKtsT9QQnPKOG4OAgVajHqkQlaCjSgV4SYDmzD79TaN7KSB
         xdH7vZXsEvYPFRMs5/7Fd1JzYjcmXmCguDP3iYUDovbyzgYdyN2FcgFujB+wPRuJbdRV
         OJnVlGu8F2qFhaahuiE09EHViEjbljScZSToFPlbJy76nRukeUN/0/y9x8SlyrB7PCEy
         O6x/RVAS6IVGNXJDb1YtNxYa5cJM7WFuPgaByqblyfb26vkVqKTua+w1sduyReewedU+
         M0/Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8HjUREJFRgGmTxxdExwqw8DpYUdGpga3q6/I5AjyxU5x9+IC9PV0Ke43x+4yxc4Bd5VAI9A7JYgawDd7ut1AHBpP3i9hUG9C4uV9U510=
X-Gm-Message-State: AOJu0YzIIMUzTcP3tN5y0MNtV3P0KLW46W9SnGuLsvQweTsjgJJqTHLE
	3oPTdHp3wrxe8S05L/DDAAW/Bo12VwuRmLhVZZ7vqu8N9B9ymejAtqnmk86JfIWEpIvOM7DihD5
	TmOWC77/BSJaNdHst/kR1s5y3YxDksoekYhQQnUyScLmn8u3cJuScOIg=
X-Google-Smtp-Source: AGHT+IGnhB6ok+UT6dhlPPsdCYDSnoJazzwrIi3u8UzfwuMhJBQqJy+kvc9v9EefH+8uxg2q+1ZBvU6SUVqi6RBl+GmY/FXaZX7d
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:2b09:b0:474:bc7d:544b with SMTP id
 fm9-20020a0566382b0900b00474bc7d544bmr4094jab.6.1709933223590; Fri, 08 Mar
 2024 13:27:03 -0800 (PST)
Date: Fri, 08 Mar 2024 13:27:03 -0800
In-Reply-To: <0000000000006c2bbc05e714ec79@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000061cc2d06132cda4f@google.com>
Subject: Re: [syzbot] [reiserfs?] WARNING in reiserfs_lookup
From: syzbot <syzbot+392ac209604cc18792e5@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1748692e180000
start commit:   9b4509495418 Merge tag 'for-6.0-rc4-tag' of git://git.kern..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=c79df237bd9a0448
dashboard link: https://syzkaller.appspot.com/bug?extid=392ac209604cc18792e5
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=142a4277080000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=146950ed080000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

