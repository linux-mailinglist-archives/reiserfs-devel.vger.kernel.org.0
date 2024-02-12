Return-Path: <reiserfs-devel+bounces-63-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDE98511C7
	for <lists+reiserfs-devel@lfdr.de>; Mon, 12 Feb 2024 12:07:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 425E41F244DF
	for <lists+reiserfs-devel@lfdr.de>; Mon, 12 Feb 2024 11:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B02F39843;
	Mon, 12 Feb 2024 11:07:06 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4BC38FAD
	for <reiserfs-devel@vger.kernel.org>; Mon, 12 Feb 2024 11:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707736026; cv=none; b=QLh/YU40tqBBqu5Wrq3Z5uNa2qp11BjkFRPR65tPGCni/DQmJZbZZpywYW3N67IiyHpnNlG4coUFQUMfM090xHOLRY6/CvYLHfnGbHx5StZ0BID1vowlXCdJy677iH8DsiykCdzVy67RbCicGFqqXK9a6ilD6zJ941EAybJVMSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707736026; c=relaxed/simple;
	bh=TiTTw+hGF84P0tRgaBMy2VpXj54TRkQdwyGXOuSJuRg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=UkTGd3MDSS72Rdxg6qxv6k73gUvNagDrNbilJYcN/+1yz6FUj7uppcIWYUwXX7IWh704nE2RX3eNbRrAxy0uqh985t3o/qNx5SUmE+4n1JUi/dOEZxo5ZaClant6nsJd3zT/kpj50uCldm89L0PwkDEQl93focmy72iSdQ0ZESU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-363e220bb2fso27856535ab.2
        for <reiserfs-devel@vger.kernel.org>; Mon, 12 Feb 2024 03:07:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707736023; x=1708340823;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x/xJQPp3141bB6LLHb+O47KgAgODwbbVCXQLBM4yS0E=;
        b=OyQ5EJPiY/COJTKYu8R73KfjEm3BDVnzMByNAiwAtWcchDalxPcmC7HYpY9gMsXWSZ
         YSxfY2OKasg6njbH68+KmMVjdXqJP4MG/utDE32Px3FxCuAZnunSVb9VStXFa3L7u/AY
         s+VBD+kyhgrCWuLmuTFUvbfiu+1Yr1sNwOROlJj0An+wgOLPiBY5GixQJvQVIdy/qx6O
         jOivKixYONQ21pa0/i9GTeKvcWDjjtTyGNT1WPwMNKoms0mH2OXcPe3KBKAHcJig1S3o
         a2r9vwgVaijgIKeDt5QnKniG8PjFZfwHQ0I4QWpl0Fn5SNVMOizdW+MnyjK16GMui7Gk
         tJ/w==
X-Gm-Message-State: AOJu0YzaQZRrbaIpsoJkQXUAuBPwL7wysC4Y+z1/16WXzwaQ+W0GMjjS
	yF5octeBpI47xJoI/jbDc2eubTfW6ENidub0tuGz8dGmUwCSqS6JsCpSyAzc/Ez2yM1P6rAbJ/6
	bYdskcp+XrOaUGfAH2Tt7Ybb5jutbv+3BEZ47T9CnfnyQJEoAw2FrC8Y=
X-Google-Smtp-Source: AGHT+IH16WGqEbfrd3+o1CSIasNblQnZGNn7ZhqheuO8ThHR5IJ3F8URiBZA5m1q8b0W7FZFL4ADFHowhQo3vgmeTSNPXWhV6RB9
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a2e:b0:363:ac48:e28d with SMTP id
 g14-20020a056e021a2e00b00363ac48e28dmr679193ile.3.1707736023784; Mon, 12 Feb
 2024 03:07:03 -0800 (PST)
Date: Mon, 12 Feb 2024 03:07:03 -0800
In-Reply-To: <000000000000ddb17905ee995d32@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000011649a06112d474c@google.com>
Subject: Re: [syzbot] [reiserfs?] KASAN: use-after-free Read in reiserfs_release_objectid
From: syzbot <syzbot+909a2191a4352fd77d25@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14df7cec180000
start commit:   ca57f02295f1 afs: Fix fileserver probe RTT handling
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=2325e409a9a893e1
dashboard link: https://syzkaller.appspot.com/bug?extid=909a2191a4352fd77d25
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1563673d880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=134d9425880000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

