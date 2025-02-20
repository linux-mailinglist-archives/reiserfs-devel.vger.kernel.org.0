Return-Path: <reiserfs-devel+bounces-172-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC78FA3E07C
	for <lists+reiserfs-devel@lfdr.de>; Thu, 20 Feb 2025 17:23:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06DA5701E51
	for <lists+reiserfs-devel@lfdr.de>; Thu, 20 Feb 2025 16:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B447C20B1FD;
	Thu, 20 Feb 2025 16:20:04 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A77209F3F
	for <reiserfs-devel@vger.kernel.org>; Thu, 20 Feb 2025 16:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740068404; cv=none; b=BlZ93z49lt+TCBDwB7P2eTwLAnyFDDf8CQhOjRJ0HcU4/30qohWcagIt6sPfo43Q/jIvu/FeNG1DcED8hlZNECqw7BjBWRv/MC7cPEG/JoAqPOFOsM6IC9eo5InxTISS8otpb4iN/HgzYfmqNEhTi8vKdoEktq997fJV2J6Sz9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740068404; c=relaxed/simple;
	bh=APzJKwyhb3OuH1pPBqJmkSn0GS/wNMS+wru7Yxj4RO8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ffj92GxdfFvbyDVW6JJYidJqjxWrJwCIhhOJ40WCMbtd3OuGduPNSy5YAS0rHCiTnowXtmo9dOCC+BHpZGYKooewvuBGtC2odTHeFijS8WXNXtXEdTACCKHW2x+qK+g+wIgVc5uIy8mqBykhER/snf7hMJEsf088MuD++mYJnlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d2b6d933acso8375015ab.3
        for <reiserfs-devel@vger.kernel.org>; Thu, 20 Feb 2025 08:20:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740068402; x=1740673202;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l7pYURb2UEyQVm3UDJSJZBqVAJmGORVXuCUKt2v1imU=;
        b=cccpyjt3H52cA5D4VN6A022OJo0bZlurkAzhayQUlGkLKRoByLN1QH95fdohRbKdMH
         qL3Qeurr4VvJtKV9uKQT0rMXWcbT2+T3xe2FEh1s4ld6D0dB4XIXr9LXpmrJQHvR7Uft
         w5DZ/dbPGn0+VwbSUNAqemqUxi/D0Q4qFr9xKN/HgRHPvrwVd/mQfEsSFBDe4YXS8zoN
         UsIr8cmy5KHgCqcihMp7Ln7HomuUsBMTh9qZGro+oZqWeT9LZKOPQ4H4LaHrV3O8rpiT
         5IF2JSHUO1mCNromqTjaX2bJsYaRKwzM1PDM2qjXXD3bjuf34CCSeM+saeHxMVIo0+1m
         wNdw==
X-Forwarded-Encrypted: i=1; AJvYcCVDqT0lyV1KZDVDEkVGmeeTj17by1kGVyM+cOFwumnHYtsbCl0ZNZNCt/ivIYMhH6GoL/d5w3KmNv/EXauddw==@vger.kernel.org
X-Gm-Message-State: AOJu0YziXv9oFJKXv9IaZKWVYnRmm0S5+ZweL3ZjeiRVJqfUPMScHuE2
	yYbmaVaMLaPe4pjO52PYbId3z4HE3vy7lbeIRyJCpItxGWx9Gfza8Yxd14MUt+PLvt783WJUD/X
	NtXWL8ZhEKXjYiH06PGM1UqP5hIiI5LR1qV10RautxL8aJ9kl6OTRXTA=
X-Google-Smtp-Source: AGHT+IGuEGXZgTpLDMgM/7S6GNTYnUn0UKrpL/T5rB0YUuM5iNtKYmjKbdIOL1xmpNOVQAHIaCIJ4uHlLv+tqDA4IfFw1W0JU8s5
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c24d:0:b0:3d1:966c:fc8c with SMTP id
 e9e14a558f8ab-3d2809066demr217751225ab.17.1740068402061; Thu, 20 Feb 2025
 08:20:02 -0800 (PST)
Date: Thu, 20 Feb 2025 08:20:02 -0800
In-Reply-To: <000000000000d0021505f0522813@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67b75632.050a0220.14d86d.02e4.GAE@google.com>
Subject: Re: [syzbot] [mm] [fs] possible deadlock in page_cache_ra_unbounded
From: syzbot <syzbot+47c7e14e1bd09234d0ad@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, axboe@kernel.dk, brauner@kernel.org, 
	jack@suse.cz, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, reiserfs-devel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16e867f8580000
start commit:   861deac3b092 Linux 6.7-rc7
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=e1e118a9228c45d7
dashboard link: https://syzkaller.appspot.com/bug?extid=47c7e14e1bd09234d0ad
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=100b9595e80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1415ff9ee80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

