Return-Path: <reiserfs-devel+bounces-92-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E9A86F424
	for <lists+reiserfs-devel@lfdr.de>; Sun,  3 Mar 2024 10:21:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 718A92829BA
	for <lists+reiserfs-devel@lfdr.de>; Sun,  3 Mar 2024 09:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76018AD4C;
	Sun,  3 Mar 2024 09:21:05 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9818F40
	for <reiserfs-devel@vger.kernel.org>; Sun,  3 Mar 2024 09:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709457665; cv=none; b=Cw5xXffhyrFgS3WJOVoBjTR6z4axOVt1By3IdMDnMDgfCqgzQ9SzGYTKGPkaTIsAe8x3M2aZdpDzOz9uQ48SU1IqlBNRzG4jaqQ4jIFL2RbeV58c2yUBX/vcGxcYNYb7GYTxZy5Jq7/p5UnykI9RWJtA5RSeYzMJuxUfMZPGlt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709457665; c=relaxed/simple;
	bh=eQ2zKyXcg6lchPmJDdH4J88CdY7LkmQ+FwqDiZ3fWrs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=cQ8kdcsvnwWJzKq0Dbfltdpt92p9KNRR0175vODEd3hMeD8sEGDgsTuA0CQfa8iK8Av/5jppPDDUxPF0TTkte/dNcYCcu2cmHTKwZNsXX6N6ZOoUFyTg22LGp2o+t3nhCcr13LrvEnDS0y+6BjPqb320/YeVmXHnh1aCNakoYdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3651a261194so34607975ab.1
        for <reiserfs-devel@vger.kernel.org>; Sun, 03 Mar 2024 01:21:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709457663; x=1710062463;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mnnr37vr7kK8/uItRIjje7sAKUW3hU17pprTGtiVvYY=;
        b=hUtznzDCuAUjPoY9ykreVaMe7tMKcTNr1DFM1LnfaS5D77wp3nfDIq9xOQKmVyZtg6
         /PRJNnSbsdAdk1rezRYfsISBpWQyjqR4aCmciHwSDmv3gnVC0bLh0882jNyIIivnmkXQ
         MJT2ITn9lVfFluQJA+d/OC9xmHclrqZS3eHWKsjFf5hg8lfFyQhTPTfFHBI0+1lA+bh8
         7u3VqIzWlcPmBogDNtHOYepSPURPeuBwrwJvUnV92UDpgQL3f4HSKb/DeQvHfSl5P3uM
         jeNdsxTKPft+Ufl32aESTmfeVOU1COvAJi10eBV4E/p0gJLqsj8re7/cjoKrhrdGzQuT
         AV+A==
X-Forwarded-Encrypted: i=1; AJvYcCUaweF3wq0EcsUJQkAEF0NrV1zvYlz8eXEONijnOTbklJbgYJu4e6/IfIIFI3rLXtsoETVcK3rKag2sqFnkjz0gQSgH+4eyNLcOa7JMGpA=
X-Gm-Message-State: AOJu0YxhUW0yNdiF5W6udmDQEUJxxtt4PtfPj2xsD8lEirdapM4j9XTT
	0fJvfAZm2Qp4FyRjrdLKg7KX3VWUt+YST5Olsn2ab5ElmxI5diXieypRYNjKn2fpr/6rOAZL9aw
	cHfyOV27ilDiHiVsbrTiEIGFB61T5LoJbV1EiD8mHV+UfYLEfTCDn0Cs=
X-Google-Smtp-Source: AGHT+IExuAl1BYRZUWOqXt/mPBBPeN+jgdmkqUJMT8iH+3nUEGBGafeE5uibvMk2oOpsuDQS+nimT4c6JqP26uCjxEZUZJS11+AF
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1ca5:b0:365:5dbd:b956 with SMTP id
 x5-20020a056e021ca500b003655dbdb956mr353124ill.3.1709457663236; Sun, 03 Mar
 2024 01:21:03 -0800 (PST)
Date: Sun, 03 Mar 2024 01:21:03 -0800
In-Reply-To: <0000000000002373f005ff843b58@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c6b0fa0612be2070@google.com>
Subject: Re: [syzbot] [reiserfs] kernel panic: stack is corrupted in ___slab_alloc
From: syzbot <syzbot+cf0693aee9ea61dda749@syzkaller.appspotmail.com>
To: 42.hyeyoo@gmail.com, akpm@linux-foundation.org, axboe@kernel.dk, 
	brauner@kernel.org, cl@linux.com, cl@os.amperecomputing.com, 
	dvyukov@google.com, iamjoonsoo.kim@lge.com, jack@suse.cz, 
	keescook@chromium.org, linux-fsdevel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, penberg@kernel.org, reiserfs-devel@vger.kernel.org, 
	rientjes@google.com, roman.gushchin@linux.dev, 
	syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1629e3ca180000
start commit:   e8f75c0270d9 Merge tag 'x86_sgx_for_v6.5' of git://git.ker..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=a98ec7f738e43bd4
dashboard link: https://syzkaller.appspot.com/bug?extid=cf0693aee9ea61dda749
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10310670a80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1220c777280000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

