Return-Path: <reiserfs-devel+bounces-108-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B82098779E5
	for <lists+reiserfs-devel@lfdr.de>; Mon, 11 Mar 2024 03:43:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7F501C20803
	for <lists+reiserfs-devel@lfdr.de>; Mon, 11 Mar 2024 02:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8E4110A;
	Mon, 11 Mar 2024 02:43:04 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE569EDB
	for <reiserfs-devel@vger.kernel.org>; Mon, 11 Mar 2024 02:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710124984; cv=none; b=TRVzGHgQ2muz7yW16po3E17QFEtaIEmggJ+w92sLS+Eery6byepe0UJbr47JCDbb5HvzBdzcTiDoIO03kzGsXVZN1aR8b/jkuze/ZaXLnue6ewHn2B7P2Ayqj2YYYAPA4KphAXdd+Ua3bm71fwE9tZxa2Ak4ojL05HAIwQHSTLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710124984; c=relaxed/simple;
	bh=xCUFlySz/HJzwmMAGBTFTxjuuWHHUASmrs7xC9rWZPw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=VIjX/hdhDVCpDb7EZrIuwuFxiyMS3uORBHEScqYm0d4MBXUqcetz9FFOcE9pzegni7N1LaBi28trRVSxhMzde34p7qgePwy0mM+4xuknXsmg6/UJtivKO19nF1b+PHdZcSmJjPrhzSQl3eafcOyXg35H6wRa+YQL5T7aC7CdzkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-7c7f57fa5eeso271795539f.1
        for <reiserfs-devel@vger.kernel.org>; Sun, 10 Mar 2024 19:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710124982; x=1710729782;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lYcxoW7cD8kZbmcK9CYx64+UUR754gw2mSrSbnYLk3U=;
        b=tx1xMeGB3vStoUicyn86imH+tw0XGkb6p0lV2MVLc/fq21p0fJbp67RnooZyAaFZW5
         VxIdmSMo7VREdZtWCBUPuTUdp9KJy79Qva5vLBpRHz2kfkRVz+l3B0iM2Pa2uOkOufxp
         fommCHDInXQkiL5x5/d+9qKladfnDxT3eJ/u7KYndiesB6t8+JxgkkmH/sIpslqt93uc
         veRtZZe6dzVKGGyGYhTbyTXDNMqkrzwK1tWLgEUm2Gu8Vi2e5e6hkLxmo6JqpS2IrqHQ
         zLWnCmxkY7rVd7vDrrbmI5+wlnnr6cTfILy4V4fDFABN/YBZUOGkCJzsrkCLk9kzefqp
         3GkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrdCZ+TDH9kwVuDa5ZIiE/xRBkhdJm1D/8A6DvvtqUt5zqQ7CuvAtufBy9+J+0c4NprmehOHpZh9aIYMfL05bTNafodIMxPNMwH+OyQjc=
X-Gm-Message-State: AOJu0Yyy1UPc8BdIynDlvh35A8e5Id8iuJgv4LTi1bt0ewPGUqLFcA+n
	udlg99Xb9VBlplkHNnULHHlHKRlSL631p6BvpoXd35RiCbETZ3sz8mP9cyifJew1QmpD2RlhwX0
	ODLTp2Nrvi6+8BvkJNDvLJXzZsV1mM1zRzWVSry1GGiu8NM+hDaYHauM=
X-Google-Smtp-Source: AGHT+IFusFZ3cMvP6daHHhxIg1ZsGPjKlL68E2l1ow40+7e2ifpNBPt1WflepZ0E4AeJRGxuTr3IKFO2SzeuMxFXKz+Qf3Kkd3kN
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:2187:b0:476:d30d:8d10 with SMTP id
 s7-20020a056638218700b00476d30d8d10mr369190jaj.6.1710124981946; Sun, 10 Mar
 2024 19:43:01 -0700 (PDT)
Date: Sun, 10 Mar 2024 19:43:01 -0700
In-Reply-To: <0000000000001bd66b05fcec6d92@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000121d4f0613598092@google.com>
Subject: Re: [syzbot] [reiserfs?] possible deadlock in vfs_setxattr (2)
From: syzbot <syzbot+c98692bac73aedb459c3@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, hdanton@sina.com, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=124c2811180000
start commit:   f5837722ffec Merge tag 'mm-hotfixes-stable-2023-12-27-15-0..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=f8e72bae38c079e4
dashboard link: https://syzkaller.appspot.com/bug?extid=c98692bac73aedb459c3
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=167dba7ee80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=160cfe19e80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

