Return-Path: <reiserfs-devel+bounces-86-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F8B869B8A
	for <lists+reiserfs-devel@lfdr.de>; Tue, 27 Feb 2024 17:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48E161F23296
	for <lists+reiserfs-devel@lfdr.de>; Tue, 27 Feb 2024 16:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A328F146912;
	Tue, 27 Feb 2024 16:05:04 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187AB535AE
	for <reiserfs-devel@vger.kernel.org>; Tue, 27 Feb 2024 16:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709049904; cv=none; b=Oz/7ZkY7zYeJ4D2hMP/Mijwc9wF7xt1E69gjYNxbAe3QQBt3bvXVzbxZVgPWWKoEIZSaUoKHFfgotkKb9unWJOnKCZVKXg4pkFUMxjYO+Bv9bNvu+yovRWvdpquv7p4ovFbSg4f3uobAcbr1W/OXrwlYstsHimd2c2yd6k7DTKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709049904; c=relaxed/simple;
	bh=HBH/mlGn1GKuD1rLuQCa/9qkGT6/IzdMQvpWS/cMWy0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=g4rSzJjYPddV7vVfYH3YNeXx0/wpp1AAnV7OnCQ2A0ZeyyUxa2otLxQ1lklFNKoT9CL89d4uVbTwtSDPVT1FMtUe0PUSAhTo+co3cCnWskc9Jkf/QCZdUku0KzJM0fYDGZMwmAF51Ek5UVEMjYGL2Wc17w37qIlUdihI97A0bFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-7c7a733ce70so300832439f.3
        for <reiserfs-devel@vger.kernel.org>; Tue, 27 Feb 2024 08:05:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709049902; x=1709654702;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yln7e3X50hPzjP07hatAlBcYIA7D/0apOIsor57CCn4=;
        b=JU30ZL+Tho+p+K3qr/iNlWy9iYKrqPA43yy99jDJbUqfffdlWp2reylesQABmPUTZo
         c/kK5/q+UbY1AOiNptOriw1oFh7kpgAA2EVUjn2lQhkCkg37XV3FWXFwoNm1TlsQAhT1
         fjBWBa0X3UVHrk7gfhSKM98Mvpn7Ls7kUPrpURbTD24jdiUsBBe+4OXEojWIUf11Ak/j
         9CjqKRbpM1+D+WN+37A1siicydvhtaI8wxZCCJT+Ox+JqwhYz5xEs7vAwNZB5ss9m1bC
         8VhDmjy9UHmOu4LyzkXE+OkU1iyHNOmPXf5o4qKbRG3lpOBR3kHLEFWt5gEqbsl2Wbdw
         iA1A==
X-Forwarded-Encrypted: i=1; AJvYcCUUH0xnaiU91xMlPIQK54+ORJGbbN+qQnF8TLsdUN6qEDr4TNYbjBGhOpzL+oXXnOQiQF12f6ylhNIlxWQ6pRt8oPe9WPpQRchEpPzi2+c=
X-Gm-Message-State: AOJu0Yyg9srpj1ytqwB7t+pcagk6PLPp5rtCipBKDYjT0b9JR4HVeQZs
	NbwNKSF93XnrXy4+Q40/TwAauuYlPkIOu/2wtjI/UqCKnIUl/vv1pI1WD2CKZrt0q8yB+AgF9xE
	rlJwTjbRmWiTN91a0fLqMGGXEKrtgdbo2aFQ8h1JWRfCoHp6pEa7LHIM=
X-Google-Smtp-Source: AGHT+IGQrddUrzNg1cM0TuCyUnXm9cGXvL4qtuDHM1W3BsW0ptWD5HvYEy2BneyZBz5v/nqMCzBPdqx+SIOhr4bYRHxVwbUCFvDB
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:2710:b0:474:8b40:13fb with SMTP id
 m16-20020a056638271000b004748b4013fbmr316654jav.6.1709049902417; Tue, 27 Feb
 2024 08:05:02 -0800 (PST)
Date: Tue, 27 Feb 2024 08:05:02 -0800
In-Reply-To: <0000000000005a9fab05ff484cc4@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000564c5006125f3087@google.com>
Subject: Re: [syzbot] [lsm?] [reiserfs?] general protection fault in fsnotify_perm
From: syzbot <syzbot+1d7062c505b34792ef90@syzkaller.appspotmail.com>
To: axboe@kernel.dk, bpf@vger.kernel.org, brauner@kernel.org, 
	ivan.orlov0322@gmail.com, jack@suse.cz, jmorris@namei.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, paul@paul-moore.com, 
	reiserfs-devel@vger.kernel.org, serge@hallyn.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17eb1102180000
start commit:   a92b7d26c743 Merge tag 'drm-fixes-2023-06-23' of git://ano..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=24ce1b2abaee24cc
dashboard link: https://syzkaller.appspot.com/bug?extid=1d7062c505b34792ef90
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1066cc77280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=116850bf280000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

