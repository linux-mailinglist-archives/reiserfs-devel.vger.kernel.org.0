Return-Path: <reiserfs-devel+bounces-169-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A15A05794
	for <lists+reiserfs-devel@lfdr.de>; Wed,  8 Jan 2025 11:05:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DF7F1886F81
	for <lists+reiserfs-devel@lfdr.de>; Wed,  8 Jan 2025 10:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EBA61F0E3F;
	Wed,  8 Jan 2025 10:05:06 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2141719D8B7
	for <reiserfs-devel@vger.kernel.org>; Wed,  8 Jan 2025 10:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736330706; cv=none; b=ia+81rMcz1SRATISFkXOKJCCoctQc62U/S+hsuZKPA55f9vq1sMtv8naMBAHKes3+uARUUhboPuO1f74PWSvt0LmlqsTZdYnmOQwDpZiHrcijtjBoIHSoYwNPGV9TMuM6bBF59fELQfPFg/BXj6RWViYqWK41albJIV8P2FcbvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736330706; c=relaxed/simple;
	bh=qqow4cim7M4tvP/6M5DvGnxqHpiaYO5sM7qO2pHUBCA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JD3+7FSlsWziFyvXOp3DYja6lDOZpHN0yUfs8v9GjKXheEA9TIeMdxR7mnVBF+VzuGfdOVwgZBv+Yqge26yYzCPu3ueflq/dpT9TzBwQY3eZpfSaxS1P/j6zkypb22JdjEh0sgvpzDceJ0P1sB6cW9H9lSSByPewJQmYsvrDsRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3a815ab079cso328648745ab.0
        for <reiserfs-devel@vger.kernel.org>; Wed, 08 Jan 2025 02:05:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736330704; x=1736935504;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SnvZQ5y1SDQip7RaKW0GhP6Dw9CXDIeAZ2qrBZulk6k=;
        b=PRMl1cyG5WwaFo76hvlfwVTssExz7ZdxpzrlX9p/0G48l4jyP9aEvBsl2aclAEe+jL
         zqiPK+0WnRjbuuKuhFMJI9QlRQAwxhWPfG+aiepH/O/PCCFY2QXLFMTInrZGuVv0JIaG
         LAn7vXOizAgrxJJHVnZ8ilzOUZY8lJ8RQevExbfREzR6UaE+B4HLpaooFC8JjUP3GS8f
         Skqv6mRJNYz4Nk10Fp24buVECZumGN4nEz0GP42iX+e9jdlZypcpeIQ5wmaL4NtF2Ti4
         BLLetnVGvlpnLBRYp0XyfXc7C0Y45N2iSzS2RedB1nizrRjnY7tqV3xJXWmns3/MM4k8
         e6bw==
X-Forwarded-Encrypted: i=1; AJvYcCXplOHpVVKmr0fg4M1rLGGV74q/u+9H0zOMU2nT3SYKXfNeRsK2bwY4im7/dbJtupkLg/uXr5oSwbN4CP+i6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSc6qauJEXsoI13nm1Vn9lBM4yFk0AttasmifP6qEUeNztpsX5
	ZLRmmBeJEbUom3Fo+udQX6V89n56IHB9WqlGs9F7seYQ1lVkX+uJ6Vzo77TxCpU6zH+TU92OFih
	XqPdAyW7+sKDTpmvr637DSOACjzPJW9DZVVv9bnG1cU0F6PyhfIt+ugQ=
X-Google-Smtp-Source: AGHT+IGmxUmHEDXjqkj7ADg/wPp+BLtwh+B6QbslNHtgSbnU+sBcnXBaxPv2uMWHto8vB+KsQ0PuIPSgZhX/4LCFhtddIBjDIgjx
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:87:b0:3a6:c98d:86bc with SMTP id
 e9e14a558f8ab-3ce3a86a258mr22098385ab.1.1736330704196; Wed, 08 Jan 2025
 02:05:04 -0800 (PST)
Date: Wed, 08 Jan 2025 02:05:04 -0800
In-Reply-To: <670030bd.050a0220.49194.0497.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <677e4dd0.050a0220.3b3668.02e2.GAE@google.com>
Subject: Re: [syzbot] [reiserfs?] KASAN: use-after-free Read in
 reiserfs_fill_super (3)
From: syzbot <syzbot+d796ad2656d5b38910ee@syzkaller.appspotmail.com>
To: brauner@kernel.org, djwong@kernel.org, jack@suse.cz, 
	linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit fb6f20ecb121cef4d7946f834a6ee867c4e21b4a
Author: Jan Kara <jack@suse.cz>
Date:   Thu Oct 17 10:28:23 2024 +0000

    reiserfs: The last commit

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=168c7edf980000
start commit:   59b723cd2adb Linux 6.12-rc6
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=921b01cbfd887a9b
dashboard link: https://syzkaller.appspot.com/bug?extid=d796ad2656d5b38910ee
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1765c740580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12a786a7980000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: reiserfs: The last commit

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

