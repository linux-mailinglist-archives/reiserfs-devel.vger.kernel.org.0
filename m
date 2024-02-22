Return-Path: <reiserfs-devel+bounces-78-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DF8860180
	for <lists+reiserfs-devel@lfdr.de>; Thu, 22 Feb 2024 19:35:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1F67285116
	for <lists+reiserfs-devel@lfdr.de>; Thu, 22 Feb 2024 18:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02ABE548EA;
	Thu, 22 Feb 2024 18:22:06 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B013548E5
	for <reiserfs-devel@vger.kernel.org>; Thu, 22 Feb 2024 18:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708626125; cv=none; b=Z30eK5Gtcsc+zp6dNnFogBZ4fAdS4ORLY8Ux7PplM78fgniMV9p5W+1INcmU+qY0Kib+8v2OQNBAllMkmmzYAv7yJ1bcFuxMmQidpKfNX8UMV8xVjT1QMtJmKHeARR+IxjHbFAfVQoJLLPvw63g7gRLdzSFzer17QumRgZNrwDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708626125; c=relaxed/simple;
	bh=97Tg+DwGMA04csHe9nB+KIigBSYghq8PAkVFMvrJ57Q=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=QaqBq3BZjLFZScHx42HdRajSFsxf1XXKpGiYzRzmqlVs8SGam8GClvekPoWjdcnD1Ce39az/v7MqN5vBdbDvurxFi34I6upwAME5sHIYphleDDe4Zzde/4RzbzL+ec7bnK8jms+4/NSS18QZaxaPUTc+neexwMikq2WvlYpl2sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-36516bed7c3so10043905ab.0
        for <reiserfs-devel@vger.kernel.org>; Thu, 22 Feb 2024 10:22:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708626123; x=1709230923;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RtNEI/4Zr5JmjLe0NXFrbfZxQOyOn8Q5SFKbwujF9s8=;
        b=FnPMCDocNODrMHWKwKzLChtMPlHYSWezbm0kvo4k/ub2R3Ba959SgjdZc4bT5ekuNU
         y5Hsr1VnugNE5xlPZWf2CYX+CY3NjzLb8i93kNj7BO+rVGS7UjkQshIKBnqjPaxju70t
         zVP/Jpa+TUQXYmtcEhi+QyJrUR6a2akMYaxFzzcDiyqTQ/JuCT+VmlEn+W2acpHCArOU
         1g0nuaaiziJ9nmtTuTZSde6fdGQrRPD2WqDn+jI+U9dnZx3ZEmeQu6Z0t1CjYJO1cINz
         Pogpl/H+PoJpSYt9mqQpPu+DHxVFNEf0go4428R0cIsDMjv3AO9R1vDy/N6VPAPZhaZ2
         fQqA==
X-Forwarded-Encrypted: i=1; AJvYcCWDPCy6hZrhm9Ppjbaf1Z+sIfcJux3Ysv5a2RmPy3i6LRWRbyCM6Atm5HzuL4HrqQFBJST1K3rJBdl5eWpw7DePgDXG4s7SeyRLTp35wCY=
X-Gm-Message-State: AOJu0Yx3z+pBPB8XdX13B4yIzSSBJ8bvz+eflYOpBy492OlQ86uezB9i
	wVtf2yJ0ylNTEV/iJ94f+V+N98bD0i7rEUVrGvtUV06GtNfTo2kSGJA031VpbQAF68u+bGS/D4s
	4zGYyYrmGLbKMZKHtElYZToSuU/pEo8AANNaPVKPIHQyXuN/xEF6b5kM=
X-Google-Smtp-Source: AGHT+IEpFT1CSBFiFs4xWJdv7kZs+tazOCwxhjUWG9LceWLo6+LE/qsPZ5lQjxIH/lO5QVtrkHfhN19TP5j+QgQ2OCYE9xNt/3y9
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1745:b0:363:cf28:f1cc with SMTP id
 y5-20020a056e02174500b00363cf28f1ccmr191061ill.3.1708626123755; Thu, 22 Feb
 2024 10:22:03 -0800 (PST)
Date: Thu, 22 Feb 2024 10:22:03 -0800
In-Reply-To: <0000000000008a0fa9060e1d198e@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000029237c0611fc8535@google.com>
Subject: Re: [syzbot] [mm?] [reiserfs?] general protection fault in
 free_swap_cache (4)
From: syzbot <syzbot+fd93e36ced1a43a58f75@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, axboe@kernel.dk, brauner@kernel.org, 
	bristot@redhat.com, bsegall@google.com, chouhan.shreyansh630@gmail.com, 
	dietmar.eggemann@arm.com, jack@suse.cz, jeffm@suse.com, juri.lelli@redhat.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, mgorman@suse.de, mingo@redhat.com, peterz@infradead.org, 
	reiserfs-devel@vger.kernel.org, rkovhaev@gmail.com, rostedt@goodmis.org, 
	syzkaller-bugs@googlegroups.com, vincent.guittot@linaro.org
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=170ec4b4180000
start commit:   610a9b8f49fb Linux 6.7-rc8
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=48ca880a5d56f9b1
dashboard link: https://syzkaller.appspot.com/bug?extid=fd93e36ced1a43a58f75
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15f4cc41e80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14d526ade80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

