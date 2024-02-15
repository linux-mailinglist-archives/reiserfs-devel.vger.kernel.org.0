Return-Path: <reiserfs-devel+bounces-69-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4CA856356
	for <lists+reiserfs-devel@lfdr.de>; Thu, 15 Feb 2024 13:38:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF0BD1C21C86
	for <lists+reiserfs-devel@lfdr.de>; Thu, 15 Feb 2024 12:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49C8612CDAC;
	Thu, 15 Feb 2024 12:38:07 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBADC12CD80
	for <reiserfs-devel@vger.kernel.org>; Thu, 15 Feb 2024 12:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708000687; cv=none; b=f16e7jHjZnESdPSvJe5bg5CeoI/hpjU6XzvFbAlBDlin7tQybvk1IvJRiLlmHClHcHlDi2E6N5x0sC1FG/wh38s8ehTMhf7JH12zBwU9C4/ee10N7a1uDMvvfWg+s2lZchGgyua19qpamaVWVehL6I2An7L8d2JJ6pin2SpInJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708000687; c=relaxed/simple;
	bh=LznutpEVOxHt4TsC0YpPkpc5D9HK8cOlRg1tQl6qTLM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=mYLR2hWgbIkWXQHk2lwWSrzMHVGfr7u4jsn0k1JSP7NtGiGH814748+KH8zb5bYYHTnqso8LIA3ARwrk+2caHV39hJo7Okbdxa0saBupWb4C5HFyx3PfahFMGTaJa59tV3AjHJ0Vr9NJiNGcqraqfl62NB8LHtdTzDh++iMNI/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-7c0001148c3so58957139f.0
        for <reiserfs-devel@vger.kernel.org>; Thu, 15 Feb 2024 04:38:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708000685; x=1708605485;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y4EiGIu2mTjtQ2BKESlH87IOtFfw0dlvPHITGr5W5T4=;
        b=ABlIIrVL8GiTwe0PLw89pin5nGMyWabQbxnOYVI57B0uNepduadLSAe9YP1FWGs/mX
         0PBCdFyLJ2eFvDQo9IHsUPycRfwGAb60ANQhz2K2ggJTBTJESSMaBZdueNKiHWwm1USF
         s0t56p9SekEEwb/6Xo54DHQtTpID4Wb8j72ED86+6QHR2yqNqsEn7vJp2+Wv+jLDxNAg
         qi10qWFWFHr9j9/55aqz8ikDcqMAthObAetekbokxk20ZHijmIE2MgGnhJnTgtGxyL6C
         LQLdKWai0QenNtfIBf0EQxi5ajETs6BTp+UDWSOp2UhFy3nEnMxSNA2MjuOuSXhQ7pYA
         6FlA==
X-Forwarded-Encrypted: i=1; AJvYcCUKUEE5bUcFmE7JTFQUYze3Mtd0isZeH+duQDNzU+TybmvtejPCVRovsvQ1U5HB4sgrWaiunDkaYKSJNSB7T3b6lDsMwJ5z2H+iOXfWh2I=
X-Gm-Message-State: AOJu0Yxf8lKG+kpdpLskDQfNhpRWp46ij7oDbsG1k0gXlmn8fsXzMX7a
	wNu2Wky7N6f529WBU/wwh4F98CqvWc2k2/mMgwOHUp/wZA0SBNEDn5N1+AUBHWcwGmIufrF5Sp9
	/7SddMUSo3RgzQrOluSZk+r/uQ9TSBC4S+qj9swOATpWfcHVVc0KJ5yk=
X-Google-Smtp-Source: AGHT+IFL92pJv2bjiJRhXIiR95FF9dQns631ia4A87d6518YNfgSwHqS1NKPmdx+39TqBAEzlU9IOeqWxjvpkl7HaHm7mH6Rg4Wu
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:4387:b0:471:3c6d:b574 with SMTP id
 bo7-20020a056638438700b004713c6db574mr10331jab.4.1708000684861; Thu, 15 Feb
 2024 04:38:04 -0800 (PST)
Date: Thu, 15 Feb 2024 04:38:04 -0800
In-Reply-To: <000000000000a3818b05f18916e0@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000018f2c806116ae6d3@google.com>
Subject: Re: [syzbot] [reiserfs?] BUG: unable to handle kernel paging request
 in reiserfs_readdir_inode
From: syzbot <syzbot+3f6ef04b7cf85153b528@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, jack@suse.cz, 
	jfs-discussion@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, 
	shaggy@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14ffd320180000
start commit:   534293368afa Merge tag 'kbuild-fixes-v6.3' of git://git.ke..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=9688428cfef5e8d5
dashboard link: https://syzkaller.appspot.com/bug?extid=3f6ef04b7cf85153b528
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=138d82bac80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1123fed2c80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

