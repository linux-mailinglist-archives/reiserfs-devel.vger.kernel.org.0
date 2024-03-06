Return-Path: <reiserfs-devel+bounces-96-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E44A48740E2
	for <lists+reiserfs-devel@lfdr.de>; Wed,  6 Mar 2024 20:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0F6A28733F
	for <lists+reiserfs-devel@lfdr.de>; Wed,  6 Mar 2024 19:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C603140E22;
	Wed,  6 Mar 2024 19:55:07 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F5313BAF4
	for <reiserfs-devel@vger.kernel.org>; Wed,  6 Mar 2024 19:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709754907; cv=none; b=I0dVSKw3l79nBWmHwNDjysRs2zxy83brPKeW86pK/jzAGGbyCH+C634KLLOIO0ND3AUlN6kxldhCiCpcDpt2Plg3Yrdklc6Mu1LhjrqxoJG7852tgIYzTe9h1rotJG4Red3zMivP/nG1mHdsPmB/fMW1VOlrpAXnNzvG7jQVoaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709754907; c=relaxed/simple;
	bh=KNE4j+Z5IwZtEzYq+J/luvtWvN5sVuzSZmIOQVAnfsA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=HVNnt64gEJk7Tptt852jI6oMI1kyS1ulZj3fTWbptasHtXbUMJxLA15tNdFDf3LfIGyYoAsz98kghoywk0uKJ//kf68+kkCT6iaqnjReqfDAg+yLJAfWPESCsWeY+1hdx7eD3yvGpvpraA6Wd4r1PKrpf2hBDtwdJ59wGlUkTQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-7c000114536so15324139f.2
        for <reiserfs-devel@vger.kernel.org>; Wed, 06 Mar 2024 11:55:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709754905; x=1710359705;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cm71RN2EZA1lVxvXDjeI/SyYZjhQ9Ei/MLh6kpMY8Vk=;
        b=OLdRJ3S3dhcnbl7oRsgWQ3pNySRUKBUHmPxD5HCW2sxdi4gmw+Arkt3va0ClTp3/Qv
         9LkNY3htD2sFWfPmIywIx0j9CToXqbrMihzS8I3p9HUdGqTlaLonlwpG4d9ctGmK7pV/
         R9BYkqtoaqW0BRScgZGmQsc2lx2yRMr78Msdf0HBHy/09QpnUYfaRxwvALei6nAZSBL0
         crlTLb/x/rV2UcRcFE+Ja4F8xkIq+/nOnWnxZX8wMi2kiod2mjErFcLlGhOFTfXJa9YU
         Em+BdNxWsh3Wg8fUq5FXR3X9YL8WVVw5NjYutLszZW9/psQnINdSn7yWW05QdcrjxDHZ
         Gafw==
X-Forwarded-Encrypted: i=1; AJvYcCVime00NRgO7N5VMYYIsD6aZvKayzwlhio0k23wWJT3FrfHEIc0L4UR2atKffDWiEUT6Uk12veBVqCHyJuMFTZoT8R5Dfc2SpeVUyho2hc=
X-Gm-Message-State: AOJu0Yz6cLSBUpeimwnLQV5bK20F2GjNPkH19KLpHKZqV42viQzXZFjm
	RyPBhNoAsbJHkK8NQOCrMDvGLi79PUy5SuY4gjduEqxQy+sxZwvWloIdeeBaqpnDZfV4d+2fKum
	ehdXT9Gg/99MDwLqxhEAO8240+VGP/wPviTemajW+U6dplvFXWg7AhLI=
X-Google-Smtp-Source: AGHT+IGJnFc+ACMpaoLbA/hXZPjn2ydhowA9DoK6at8Bca9PlFNFrEgMECF+pCA+FpueB9foHP7V09ocm/gknBdB8SAYS4YIFDL+
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:480f:b0:475:5ee3:52f7 with SMTP id
 cp15-20020a056638480f00b004755ee352f7mr181086jab.1.1709754905093; Wed, 06 Mar
 2024 11:55:05 -0800 (PST)
Date: Wed, 06 Mar 2024 11:55:05 -0800
In-Reply-To: <00000000000043463e05ee9c4277@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c5790906130355ca@google.com>
Subject: Re: [syzbot] [reiserfs?] WARNING in journal_end
From: syzbot <syzbot+d43f346675e449548021@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, axboe@kernel.dk, brauner@kernel.org, 
	bvanassche@acm.org, damien.lemoal@opensource.wdc.com, jack@suse.cz, 
	jlayton@kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, song@kernel.org, 
	syzkaller-bugs@googlegroups.com, willy@infradead.org, yi.zhang@huawei.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16d5d3de180000
start commit:   aea6bf908d73 Merge tag 'f2fs-for-6.7-rc1' of git://git.ker..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=93ac5233c138249e
dashboard link: https://syzkaller.appspot.com/bug?extid=d43f346675e449548021
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=161d67f3680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12eda928e80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

