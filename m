Return-Path: <reiserfs-devel+bounces-105-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CFD877417
	for <lists+reiserfs-devel@lfdr.de>; Sat,  9 Mar 2024 23:20:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2B251C215ED
	for <lists+reiserfs-devel@lfdr.de>; Sat,  9 Mar 2024 22:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D31E51C4A;
	Sat,  9 Mar 2024 22:20:05 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123CF51005
	for <reiserfs-devel@vger.kernel.org>; Sat,  9 Mar 2024 22:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710022805; cv=none; b=YCe9BlbAQoM367UBU8Ie21jGgtkbMANQ+VWXecMTl4h2Uaco7QHtohJHEJINod1pWHtv6JzfPBH4nkYI6SFsHo/80/3IbdLlJ/qDYWzux8nPXZobAXs5XIywYLTr33Gx9ryGp6Q4iHme89d5iTFmiuHnWlWM7EC2I3XIMhse3/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710022805; c=relaxed/simple;
	bh=zFhNXKbHLt203SwwQ+ckq7WpijojBJ+o7aN23dGfPCo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=VOva9j2LXV6XohdKjJOzBG/wk2lmORTI7+1n06jV3RNa02O2zrjiISITOhQTwGFORUmVxN52cG6riDgteD9j+BC+DAWQUAyZ0QwBUXG8LcSrpXPEIRiwB4qjUXYlAQEkhCLBQpNQVT8vEVXo2xUsI1GGamYtcxUMQOOH7BE/F1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-7c8ae14c2ccso18767739f.2
        for <reiserfs-devel@vger.kernel.org>; Sat, 09 Mar 2024 14:20:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710022803; x=1710627603;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TPIQ5P+kw5ZjaCXLN4LFGtLM3L78K1ihJHtxoWuotIA=;
        b=iXzV0zgahyzh59Qubns4m4lRiygY08Quud9jDS9sTM3jFNttTLdetovpaJul0O8XtQ
         ghcbztUsCGeBCrkosGWYaWN1Mjlfq2QOm+Fm8ZYBsILC4ErNPBnUJpD2OST0hCNDpeuC
         d42m5EjIMwWSLeb4KkggLkLfpqP+OUwD1GpsqFTA3L6Zx4rzMzUR3ElAlfX+KnzSSdRG
         FY113BQAoFo5wKae4UIr61tRDx6UfR4xmOG8rreB390fE/tBJnnF4wwlizDQD1hLI+CT
         6fJOAFA8Ro1r4UV2Km9TXx2Zp83DXmU2GooZnBoCsuv2DxiDgAJUF/FZaBW6rKDXfP/z
         87Hw==
X-Forwarded-Encrypted: i=1; AJvYcCVYLrsV6N5Z9k4EkOFgi3XQDlWGZVQNK8ENs9d1DSawXTi5cAjdlVuV0MTNtEtOG3Gx8IffmrAH8A8Bs3raLhW8o9nb2Dgpx0TaV1OaM10=
X-Gm-Message-State: AOJu0YwQ5/08cGHCmiKL/HKOdF5//jHnoLLGVAIhXt6XtO54PAdkUiI5
	Ap5Y2so5XacCovK5Bi+zFnnHb6Gs+UchYUgZca8Ru0mphdCPUW1LvaKFYAQbeFEGZa+6Z4nMVCK
	wVpZNXgnHh0sFdSlRPvpjZ4ZGzKzZAwVPMbDm1Vokx7V8m7Mqf8ZQ6U0=
X-Google-Smtp-Source: AGHT+IGSVfooHSgQwTj5YVYCcfxioZPTQ9PhJk3trwjRuYHiOmZVPRfAANHZslMUL0ge14sAYcOQNmNuc8GVHbuxjaDiEEOQB1Xi
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:2b09:b0:474:8aed:36d2 with SMTP id
 fm9-20020a0566382b0900b004748aed36d2mr204238jab.2.1710022803352; Sat, 09 Mar
 2024 14:20:03 -0800 (PST)
Date: Sat, 09 Mar 2024 14:20:03 -0800
In-Reply-To: <0000000000007bedb605f119ed9f@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c07a08061341b549@google.com>
Subject: Re: [syzbot] [reiserfs?] possible deadlock in open_xa_dir
From: syzbot <syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, hdanton@sina.com, jack@suse.cz, 
	jeffm@suse.com, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mingo@redhat.com, paul@paul-moore.com, peterz@infradead.org, 
	reiserfs-devel@vger.kernel.org, roberto.sassu@huawei.com, 
	roberto.sassu@huaweicloud.com, syzkaller-bugs@googlegroups.com, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11c28556180000
start commit:   5eff55d725a4 Merge tag 'platform-drivers-x86-v6.7-7' of gi..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=655f8abe9fe69b3b
dashboard link: https://syzkaller.appspot.com/bug?extid=8fb64a61fdd96b50f3b8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12d80b99e80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=148cccdee80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

