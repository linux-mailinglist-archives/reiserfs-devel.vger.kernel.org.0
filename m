Return-Path: <reiserfs-devel+bounces-87-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A777F86A83C
	for <lists+reiserfs-devel@lfdr.de>; Wed, 28 Feb 2024 07:09:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E1CDB215A2
	for <lists+reiserfs-devel@lfdr.de>; Wed, 28 Feb 2024 06:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DC421A02;
	Wed, 28 Feb 2024 06:09:06 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37276219FC
	for <reiserfs-devel@vger.kernel.org>; Wed, 28 Feb 2024 06:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709100546; cv=none; b=JZsUEiIu92uQysLRm0YQHDW/ECc+pdCz/RkBUGvEC1UiGtZKTM0m01oXoGwxJXYcj5TB5lwCOgRv4fMPY5gFedh+I/LCxa7uRHEHezHmp9Znqj7OTgcgQJmNNdiCM8Z5D4r+dJA6wuq9ewDKjwzhartL1NNZc2zpkpqRDYQ7VvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709100546; c=relaxed/simple;
	bh=abFXQnDiYBj25XYqxfq/Rfluiqv8Lo1I1Hyuf+oVNSk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=N+azJsxWpI8ZG+exX0A2MtdfH/7gq5/R1sQ/e6RbkBo6tkOLsZwJuYI1EAfsB4rlYqAQBAMWEEQ+KxI4Z5g7aE+z0LUgtsgylJ41UEz/XUdp3TRMyBGZr1MgFSKFTX/rlq0pyEmT9Bk7M3Coc8CZsz1ho/62EonhFpXPeFaX8bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7bfffd9b47fso465244139f.1
        for <reiserfs-devel@vger.kernel.org>; Tue, 27 Feb 2024 22:09:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709100544; x=1709705344;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WvbhFmYG3Hl0zJaQNnUCZb9RV12RO5xJllqs34cJFVU=;
        b=OXnVGqaad63CyyU2VbP8SVjFx//zw/JoYD8+NE9ZFdrpcfJMGzcK/D7r1DIQkU1Vak
         6mMWccD1z9QUAbezwG/PPnmt15rGJ6nZ7JhMhU0fbWMGUIUAFK1Dq6eN2XC+vpbUFCqi
         4MSrltC7xE7lx0wlQY5JTpR5+UFwQyoYg4BM4FxsRaShfbBSCw7Tm+tDBKlQ1O4QJjck
         LtpgqTdpIjKhXJvmxMdENT38IOORZcO5Va2Pd91dfG5EYkO0tCRCd8156TzbIVI1jP8K
         9rIfaDdy6PaUO5Utk1h3dmoPzBy5l3V9FBsHfFg2ZiR17mEEDz7fftNpYsHbXHcdBOLB
         Y7xA==
X-Forwarded-Encrypted: i=1; AJvYcCWl6hdS+vIa8Avmb1ScbhotoS0ZIPXuL0GueKjpsyg8O7CLzPCo1+mftRvX66joFNQ4DojtF67D6/SR4Q3fQy0/t454y0Gif72cVvoYRMo=
X-Gm-Message-State: AOJu0YxVO53vVVMaY/v87NGcPQwrtGO/zovXWQ7kTEvZA0lvTMRzoTpV
	9OkZhQqzGX5ROp4cTpmfVBPNIZ0NBygXZaR4Pe5DQ5lUvcDgvhMcaIjlN1vmdjDSZd5niQHJ0fc
	ft3YRfi65D40uhwcFtbXFWQ0lDlc7t21QHi9GqRPRNfFgQwHfdFl2mMA=
X-Google-Smtp-Source: AGHT+IHA2oKF9Yzw50FyKsGXiUIyRwFWO8Tky0w0Ujw64VYWlHYtYe29AY9cNSZ8GLIVv72i6dQ5C8t0KPELS5B/i1ZUsMrjq0Xq
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:411e:b0:474:7c04:29bf with SMTP id
 ay30-20020a056638411e00b004747c0429bfmr547122jab.3.1709100544403; Tue, 27 Feb
 2024 22:09:04 -0800 (PST)
Date: Tue, 27 Feb 2024 22:09:04 -0800
In-Reply-To: <0000000000004e88ee0601947922@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d5af3006126afaeb@google.com>
Subject: Re: [syzbot] [reiserfs?] kernel BUG in reiserfs_rename
From: syzbot <syzbot+d843d85655e23f0f643b@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=164b3816180000
start commit:   bee0e7762ad2 Merge tag 'for-linus-iommufd' of git://git.ke..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=b45dfd882e46ec91
dashboard link: https://syzkaller.appspot.com/bug?extid=d843d85655e23f0f643b
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=117e7af2e80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=109af986e80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

