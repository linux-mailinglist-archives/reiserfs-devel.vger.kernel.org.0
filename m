Return-Path: <reiserfs-devel+bounces-89-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 518F886C604
	for <lists+reiserfs-devel@lfdr.de>; Thu, 29 Feb 2024 10:50:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83A691C2182E
	for <lists+reiserfs-devel@lfdr.de>; Thu, 29 Feb 2024 09:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C2062803;
	Thu, 29 Feb 2024 09:50:06 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F1062801
	for <reiserfs-devel@vger.kernel.org>; Thu, 29 Feb 2024 09:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709200206; cv=none; b=kvg+28dpygRhbGDjcdCODsSCzjNx8K3Oa0e9BN045pYw/fgfCYOC1LKhy69WmyIhLfrOxVNuk6cqvY9UTCX5BZYGL0XOxsIqhgm98kfZ2qNwhZgtauncRn1sSVeBhy25hNBCJAli3u1Q0L0qad0oBdsPKCQQP1ZWEhL50YTEeOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709200206; c=relaxed/simple;
	bh=xi6HIJAD+eeBu9LW7f4Hh3oqUUXdFVpYzkHwowOaOQU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=iaU7i8CZp6MNU+AVXEl0rPkACBvAvpdDt/3jSW/66WyLq5gaXY/hwLMGqhcwODtfiWTpetN1bdfuk7bLtClKrW4TvvejyUoCR/gUG9m3+kcT3cQZ8Abku50wY2tbJARW9i+rsKHwljOqMdnsAzAkLg09M8HVjImXF+D2goHN/Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7c7a45b5ec6so67061239f.2
        for <reiserfs-devel@vger.kernel.org>; Thu, 29 Feb 2024 01:50:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709200203; x=1709805003;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zDGmgKlqgwk985gGaF2O6kw62GJaKE8V/tYQe0mxx8U=;
        b=cOkIoytOWv6Wh2Y/v6/HHUBTGAhNHQJnfX6BGRFVwAq5zpq/xRnKewM4B6OFM8Vhv3
         eVx7nO7RJPyJJZKx4MfcXNER1ICngJqClSIRGuPgenAxFlKDC+SfZQYyjMuSvBOL90cy
         tgCX+YC2mCrlUhStc3zCngYBUnpQfijZQNTsvof/d88BIp/GOcPb/Gbn9HkTDw59FFyA
         FjM5KBdcF+ylXkH3jaaR1jChJT4S2JFF4OPbaaZiMdydIADS4ftMZ7gKVoj9biIylBjc
         yMg3hc/0BvDCchs3AhLdHVLn3Wgl6F/B1Rgxi3UdL9wOaMYkfyRDfYxjlvj87TKJvFpI
         Lkag==
X-Forwarded-Encrypted: i=1; AJvYcCXqEeThORS560GRYcXgDstEJzpXnrup7R1iotfsyCtOA27E+T5JNYHmXfATuDfnzqv0v4ycTDkPqk9Af899dCN6T97jSHd0UDHqa2mzdU0=
X-Gm-Message-State: AOJu0YzW0Rx8h+Y70wVObCI1N+d/cmixvIJiGYutYEv+C7K9tZcZx7U5
	ewMBd0SeKSxdDlS2noabmB9p2cW4+HdApkuwz7YXPex3k6a0WP1U6XzWs6MB61PpFBA/HKsNPNj
	36peclx0iRfzKHitpQaUVwJACzRN6eBGywAPZNLa4LQiPrG5uF4slH70=
X-Google-Smtp-Source: AGHT+IG4QI0KeghT/04h1y+qObg0of7pbkvKUpoiyWTfn6I+VKPKB7VJiBDBfJC6+j8HBzzrx2DohQ/EipLv3inF8Xn6oz88XXxK
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c26e:0:b0:365:1c10:9cfa with SMTP id
 h14-20020a92c26e000000b003651c109cfamr129745ild.5.1709200203621; Thu, 29 Feb
 2024 01:50:03 -0800 (PST)
Date: Thu, 29 Feb 2024 01:50:03 -0800
In-Reply-To: <000000000000e2c68a05ff02fe43@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fcae190612822e30@google.com>
Subject: Re: [syzbot] [reiserfs?] kernel panic: corrupted stack end in do_sys_ftruncate
From: syzbot <syzbot+3e32db5854a2dc0011ff@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, luto@kernel.org, 
	peterz@infradead.org, reiserfs-devel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12203874180000
start commit:   a92b7d26c743 Merge tag 'drm-fixes-2023-06-23' of git://ano..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=2cbd298d0aff1140
dashboard link: https://syzkaller.appspot.com/bug?extid=3e32db5854a2dc0011ff
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16a44d50a80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10bee4cb280000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

