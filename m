Return-Path: <reiserfs-devel+bounces-74-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D372985D6A4
	for <lists+reiserfs-devel@lfdr.de>; Wed, 21 Feb 2024 12:19:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D2D7283FBB
	for <lists+reiserfs-devel@lfdr.de>; Wed, 21 Feb 2024 11:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2598C3FB2A;
	Wed, 21 Feb 2024 11:19:06 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933B7376E2
	for <reiserfs-devel@vger.kernel.org>; Wed, 21 Feb 2024 11:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708514346; cv=none; b=DPQZC1H9uW5UOMKJ8zed9gdornf8k+lNrkJqXN6EbETRBZsKGpvfRSn9RIHgdL4ACpWpWBwEyDBXfUQhIv6sGLMXZSuT5yNFrHOpx55lAiRw8Q3BVdBhbxdWHZsE+0T/o4VbdNy02kNRCYpY4dLMbR8o5u5bZnlYD+z+D+BjGSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708514346; c=relaxed/simple;
	bh=WbsYXi0sQoeBrRtG8LEEJMDbRHe4pCcXkoVQe+o9P9E=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=iGSBJQaB9kCjp6MDu/N76MzQmLcaX8Vxj5qhUS4KF9VSwk9ktHCm8zIQTYa89v6UnM+YRSx3hO1V8TXSPclj3Jm8fgm2f2jQwK2oJ0Eq1ii3qG8WXrXR1yx95Qx73b0Qyp9UdWulbHyf/MseurRHC/BDwa4TM3MLYkbUmhrehVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-7c4a0dc9f57so632743539f.0
        for <reiserfs-devel@vger.kernel.org>; Wed, 21 Feb 2024 03:19:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708514344; x=1709119144;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbrdijXox5ooEuf5BBf2QH/64bIqY05Q5+fqoucIHj0=;
        b=SEgVo4jBBWEZOjTJJDfvTzc8Mb5geAaVxnf0pghYanxFOtJ6CyfrZjrAusaiZqlD46
         tA+EeXAe+6QthdKm4SfZuX2Qk2/Q9P97s4AOAkGREoC4ZB7Fc1CIylUmB6Ek1AkBZXvB
         0UdEAnNqdQpMpzKECao4h4fb8Hkge6Aj/B+VhWnZmCbbsBKUtI5uj71qNruwZr302T91
         AebVOzQTt6xlTAGxukjEkPFJ4nV12Oz4bb83JIf/UGFa7T2TF4kMoFwEumWC4/c/9e+J
         gJfJnTeuyLLj/ZKuRftnq9uC8jOAOgJzBRuGjE8tEbXV4jTcpTKHFcFvxB3VRviUCKWM
         qNcw==
X-Forwarded-Encrypted: i=1; AJvYcCWQ0rNa9VruQQebuabMB1VFjh1vK8hbW5ViLIM4nLGpNCAJnp7QI4UigGU6FwMEkveiEUnX/FBSeCbxf3hPsgU8bwqfwj3fM3wvotUHHGE=
X-Gm-Message-State: AOJu0YyXBaleJrEgxr4w1YMoKPOs+nHXugIjyfqZZhvxCAqiTcPcDuh+
	7UeeU7BgCmoswuWoJw9CFEwcSY1Qhk0zTDDK32J87jQTcqvklpZynUDzuXVsoIQJxv4axstce1N
	r4IIvwcmI09H/B6oPVVzJ6CeUumPIJm4BqIfiv2hZJlBJ998fPEU97TI=
X-Google-Smtp-Source: AGHT+IEl2nnn5rgcwKGL3uoX7Dr4oceo7ZARM8R7Lygmjhdlvvn+iSGgsYQHQQtIaZhPPEWYhr8xQqcGAI67BDH4Z4TfKB6yAFu4
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:4124:b0:474:3790:dc68 with SMTP id
 ay36-20020a056638412400b004743790dc68mr291903jab.3.1708514343811; Wed, 21 Feb
 2024 03:19:03 -0800 (PST)
Date: Wed, 21 Feb 2024 03:19:03 -0800
In-Reply-To: <00000000000081f1a405f05f111f@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008e7fab0611e27e8f@google.com>
Subject: Re: [syzbot] [reiserfs?] kernel BUG in reiserfs_update_sd_size
From: syzbot <syzbot+7d78ccda251bc1bdbaed@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	yijiangshan@kylinos.cn
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13d8b4f8180000
start commit:   4bbdb725a36b Merge tag 'iommu-updates-v6.7' of git://git.k..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=beb32a598fd79db9
dashboard link: https://syzkaller.appspot.com/bug?extid=7d78ccda251bc1bdbaed
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1284ed04e80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1590870f680000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

