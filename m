Return-Path: <reiserfs-devel+bounces-43-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DB983544E
	for <lists+reiserfs-devel@lfdr.de>; Sun, 21 Jan 2024 04:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95E771F21F46
	for <lists+reiserfs-devel@lfdr.de>; Sun, 21 Jan 2024 03:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0481336114;
	Sun, 21 Jan 2024 03:17:05 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB6A2EB0C
	for <reiserfs-devel@vger.kernel.org>; Sun, 21 Jan 2024 03:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705807024; cv=none; b=bp5OgNsdnR2QnYQMlPPfp6z4aqp0+I8aEiKiT05XRzeVuQ3MJXNWsFOV/yTGPMiCT6yGZIF9ut6/skgzNKehl3d57IfArrIget8a38Tgxbmnass1GDkXsHlOIxW/12OFUkNYTfn+giVTg1KTPo5sars/Y2rr3Ro3+4RQmFmEFXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705807024; c=relaxed/simple;
	bh=Y3U3gmSoBpPBqejzWBvJi7czCL1r6vTqCtRFhtN/0lc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=F4NC99S3N0jvoP8dB+CuY76Ceb03HgrVye1KZA4DMXHsiim21wMNHcPxbuRWwZQYPfQaHOmsguctYejeO37bQAjgZyNhplp9r/PvtfGoH85J9VEL5I3NkoY4tPVngbKX+/giS/xJOcYvjUagYS1JPN6e43nHq5P69xzORoAsTEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-361a5c2e84eso21381565ab.3
        for <reiserfs-devel@vger.kernel.org>; Sat, 20 Jan 2024 19:17:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705807023; x=1706411823;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O5EGxrXRJliwproW9XKS8xWAASP6Q517tHhuqRHfHFo=;
        b=Wn3LlPwf13IO0D0nTkySjSOazxauzjC/ECbDytHcurx6Za5BxK3SnNS+lOlCWoTQhv
         N8tgG8m89bmdNquD9J/RC7sYMqe5O1nmcjCZPdcopxjIKcI/sjZ/xZMlAyNgm2MPJlSC
         +Bf2CQ0KiYYQzMAyT2kkHL3J2wy/NpQ9zuciXn3aAP29ZCGOp1HZ0826AaFTyMQgfbsr
         YLMsbWEn/fCdTXLobIM3kJ7UFEqqfba+f38vu8fbz0HRnV0AgmdWTlYjKpg09NfVKoL0
         tGXH9oBHnMa9rQnlqfbugvmrfflXb7AF9ahJcIcQjyom3MDPT62Xt5sf5LW7AijhdaU0
         5OaA==
X-Gm-Message-State: AOJu0YzzgO1HfTczZmG7nKWnkXVA1jqGgE59Pw5hvDqUvAL5xm8AzTYp
	hb990fMypeNOUUzAjlGstBZbh9rZ4aoDIbRjUz/9WGZs9Bl6h7Gtm5I+52RdSh/li9c/ofP2OwQ
	RLcs0G/i/NEoekVC9Jpa+6TO9NQKjvQAyWXa02dELeyL0mDKyE8OvRBk=
X-Google-Smtp-Source: AGHT+IGRGmSbpZOAandnep2TjFNdtBtmS5GbpJlBkr8Y1TPC2FaHN1DScWFyE7Braf3ZajxeC1wTuTX0WO0vt0Bcv1KhDuzrh6nD
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d88:b0:360:d7:186b with SMTP id
 h8-20020a056e021d8800b0036000d7186bmr274095ila.0.1705807022976; Sat, 20 Jan
 2024 19:17:02 -0800 (PST)
Date: Sat, 20 Jan 2024 19:17:02 -0800
In-Reply-To: <0000000000001eae4605f16be009@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a8f68a060f6c259f@google.com>
Subject: Re: [syzbot] [reiserfs?] kernel BUG in balance_leaf
From: syzbot <syzbot+6a0877ace12bfad107fc@syzkaller.appspotmail.com>
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

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10cc8ee7e80000
start commit:   88603b6dc419 Linux 6.2-rc2
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=9babfdc3dd4772d0
dashboard link: https://syzkaller.appspot.com/bug?extid=6a0877ace12bfad107fc
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12bdb82a480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=108acc94480000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

