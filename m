Return-Path: <reiserfs-devel+bounces-65-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9F585591A
	for <lists+reiserfs-devel@lfdr.de>; Thu, 15 Feb 2024 04:07:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50280286318
	for <lists+reiserfs-devel@lfdr.de>; Thu, 15 Feb 2024 03:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25D8B3FEF;
	Thu, 15 Feb 2024 03:07:07 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F10B1870
	for <reiserfs-devel@vger.kernel.org>; Thu, 15 Feb 2024 03:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707966427; cv=none; b=TV1SyT1S4ZHJkyRtVJA4UDiTbhBgZ1h++wNf5bVYG24hkMXYAmvOAPPSE1hE9kE6Bl3iJVzGDIa3s1Kvpft/ajhbkzRds91WRTR21pxFakHd2WTPY1LHFmlTaWTniC5r0UsaAbSDZvjs6nZax+sByxBbiBRZ45n3o9pmH0wmtdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707966427; c=relaxed/simple;
	bh=+WH7uPzfjj81wqBb60oGRmq5wR6eVikk7Rh/pPaG/zM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=jt3I7fmYfP5J7n/1rIFGDiSdGfEmu31bIm4VVwVk/RdyiXlabKnDQk8y26oMuRJzf/k3ZnuH9HBQB2kVXdzik063l+8gPNKnvmQbsTjCrxWAvM+r29FpCq+spsynSfbsWWkXnAzCvFT7IPzQ9KO0Fg73cNFTKP+d6M+ZMtcbuIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-36387e7abccso2802695ab.2
        for <reiserfs-devel@vger.kernel.org>; Wed, 14 Feb 2024 19:07:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707966425; x=1708571225;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hu3WnfFcFlDDxQZ/5rA1nzDSVs6Azrnu1Ol+niXifK4=;
        b=xKirFjtwEHTPyWwYnYEs4BI0ex8rfYE2dvY1GmSlI8RWVdDyy7YU7zYZkzj+UUBiCo
         cvrlEIXnq/voSWo66OfYAAvFrZ67PNewePwVp/ly0L0nbwH8E/7FHxoG9Ix+lqVAUmWZ
         KSMcN4CQ3C2rhJgULzhn7vaK7GM6WdjN5S0nlFq7CNNs/HcSy42cPfxFlxV05uQSfxI1
         xLI3fVXEaVMYC2L5jEf19uKCFPYSjCI/IPFXDbDvEqIHdozL0uV4NsfS7QTzqfGq2MR3
         uqFJ3mgyoqfT0rQ8760mxxZA326NKtIijQBTzxrkcrw9zhkgluy5eCm6oo13lXK5L5xg
         ICag==
X-Forwarded-Encrypted: i=1; AJvYcCXSgZ+kh/Gqdi+qGPOZE2UWEr6OCRiXKJvbR9sRqPIVsaTdXCbp5gbCgIavIVuPmeS8vVUpu8fY5RdsApu2SIK/rf5zHfZ9d7QqYrktI7w=
X-Gm-Message-State: AOJu0Yw2+vsfCAE0PU/nmVUqzr9t1pWoTOd2m1H6HGX3i+pUoKEvb7Wc
	EHXnLfL2WXRKrn9JJ1TKNzXtN3/Y+XrVFGxujwpmsyQc+jsXg7TdzwPl8ahbXAGgjourTltQN7T
	zruJ0Uv4QbAN911G0yX06I/jhhOuyVc5GdswyDhBBv+KwZoCtZB8qBOc=
X-Google-Smtp-Source: AGHT+IH0mUXBoVo6kd1a3ZPvV61p0PAgEUateH+/Hk/zY01riz1kIj9fB3Dkx22kScLVWX8T2JXv6d2RzarTpAUDpK8IWZiQczjE
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:154f:b0:363:de50:f7bb with SMTP id
 j15-20020a056e02154f00b00363de50f7bbmr27964ilu.2.1707966424876; Wed, 14 Feb
 2024 19:07:04 -0800 (PST)
Date: Wed, 14 Feb 2024 19:07:04 -0800
In-Reply-To: <0000000000005c72b5060abf946a@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000b0fcc061162ec09@google.com>
Subject: Re: [syzbot] [reiserfs?] kernel BUG in entry_points_to_object
From: syzbot <syzbot+927b0cd57b86eedb4193@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	paul@paul-moore.com, reiserfs-devel@vger.kernel.org, roberto.sassu@huawei.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12e6241c180000
start commit:   98b1cc82c4af Linux 6.7-rc2
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=52c9552def2a0fdd
dashboard link: https://syzkaller.appspot.com/bug?extid=927b0cd57b86eedb4193
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=101b9214e80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12fb7214e80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

