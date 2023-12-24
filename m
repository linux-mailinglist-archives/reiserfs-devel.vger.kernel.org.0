Return-Path: <reiserfs-devel+bounces-17-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EE081DB70
	for <lists+reiserfs-devel@lfdr.de>; Sun, 24 Dec 2023 17:40:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4716B213B9
	for <lists+reiserfs-devel@lfdr.de>; Sun, 24 Dec 2023 16:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19ABFD262;
	Sun, 24 Dec 2023 16:40:08 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8D0CA6B
	for <reiserfs-devel@vger.kernel.org>; Sun, 24 Dec 2023 16:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-7ba7b2c0c1cso458627039f.2
        for <reiserfs-devel@vger.kernel.org>; Sun, 24 Dec 2023 08:40:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703436006; x=1704040806;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BQ3dtE3cEj3t8PX7zTCW89boYQSV2gt5/WlGrjv/hRY=;
        b=oU1pSa9/SmzRYz8SpAdsXQQ/iTZbwLFNhvkRyPXaGLQ+rn5pX6usL0RPhxs2vOXaMW
         PebhgIfi8ZG12z+cvmxRC4Osf4YFzlpwaQaABwdY1+VWYFWlvjPqZEvi3Mv+zlTFXXe2
         RvPa1gKXcZQwi0SLNT6d4aBB5munnWHPthUmCSzxmcACV7rvd8XEu1RAturpx7ZTdQrW
         WCCMxd502JnWxSBET6XEhGnoEKTY1RKsPRTu5VDNpaqwQnHDJCUH14sxMGNMFfRLX3af
         SFOJqCVxRwL/qSB6YQJ9at07rDbU1l4KuwqVBHC1V/Uc9mOav5OCGl/LRvspIq1QVtv+
         Dy+A==
X-Gm-Message-State: AOJu0YyhWrh4JItDmVXtMXcyzCUNuguPdgvwZ4/Air3HOsd2AmAns4dT
	7WUA2MRpfM5UsH11PWSczirhZNOhxnuZ8wdXDbRShLWiG+2Y
X-Google-Smtp-Source: AGHT+IGqnCO5KaDzC+K+VNi8UHEk7h8wMbFhPswwONHLgmnp+xNRwaClUzAiR+nZ1ZcaM+sXms963MDU7uiovAIF+D1+ROqCLdKG
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a02:cb1b:0:b0:46c:fefd:bb37 with SMTP id
 j27-20020a02cb1b000000b0046cfefdbb37mr120454jap.4.1703436005920; Sun, 24 Dec
 2023 08:40:05 -0800 (PST)
Date: Sun, 24 Dec 2023 08:40:05 -0800
In-Reply-To: <0000000000001825ce06047bf2a6@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000007d6a9060d441adc@google.com>
Subject: Re: [syzbot] [reiserfs?] possible deadlock in super_lock
From: syzbot <syzbot+062317ea1d0a6d5e29e7@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, chao@kernel.org, christian@brauner.io, 
	daniel.vetter@ffwll.ch, hch@lst.de, hdanton@sina.com, jack@suse.cz, 
	jaegeuk@kernel.org, jinpu.wang@ionos.com, 
	linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mairacanal@riseup.net, mcanal@igalia.com, 
	reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	terrelln@fb.com, willy@infradead.org, yukuai3@huawei.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit fd1464105cb37a3b50a72c1d2902e97a71950af8
Author: Jan Kara <jack@suse.cz>
Date:   Wed Oct 18 15:29:24 2023 +0000

    fs: Avoid grabbing sb->s_umount under bdev->bd_holder_lock

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14639595e80000
start commit:   2cf0f7156238 Merge tag 'nfs-for-6.6-2' of git://git.linux-..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=710dc49bece494df
dashboard link: https://syzkaller.appspot.com/bug?extid=062317ea1d0a6d5e29e7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=107e9518680000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Avoid grabbing sb->s_umount under bdev->bd_holder_lock

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

