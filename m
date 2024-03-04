Return-Path: <reiserfs-devel+bounces-93-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2191C86FB5C
	for <lists+reiserfs-devel@lfdr.de>; Mon,  4 Mar 2024 09:12:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DD4AB21F1B
	for <lists+reiserfs-devel@lfdr.de>; Mon,  4 Mar 2024 08:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B3B171BA;
	Mon,  4 Mar 2024 08:12:04 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E863168BC
	for <reiserfs-devel@vger.kernel.org>; Mon,  4 Mar 2024 08:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709539924; cv=none; b=OZKnYqpCQ58HG12J/VjRVsQ8u+8mtULAb4TaptJGAMogjGIjl2v2Zb4xBKcLMEtE/cWQc4p/PrD1+8x3sL4HX0vCWlDX+dJFmvCvHGxIYmO20Yr3KZgafnaQeoXFZwyCMTG5Mn0BPOuui6y+o33AEEaQ21HpS5K0A6a0eT17LtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709539924; c=relaxed/simple;
	bh=05Zg3Yfh5R7PIlbPjhsaPvx4ut1XAWO/IPGktUKBJgg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MGud0US5ZICvKbJQbAZ2VaW5k5dhKF7rdYDLZVqHqggTQu6T5mWlzrOJvbqmXAoDifttLT0CiQ5KNh9cLCPIaRJ2LvhLuuTRyLefiogd63pMfHwirig0u5o2/y701oIBQQlcMffSApqQSErQJdeJ0Y/XrbTGiCEk8gRLMhcFDLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-7c8364e4a31so167733539f.2
        for <reiserfs-devel@vger.kernel.org>; Mon, 04 Mar 2024 00:12:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709539922; x=1710144722;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=egdYmnZntij2p3DhMY51S6LIFFVV0i12cJm24YKgZOc=;
        b=jDqICfxvOZQ8T3hv31HDfgToLT0HQi3szDgQD+7Bd5Vp/1V2n89UF4qmCJHXV2rXsL
         yhkHi91ykPf6SlutuPa/ojlTL3kTtNgKDkFLadjdnSybWK/8qDIqtmSvLGXm9zfRLk4A
         iEuhWnPOyG6OcD3ey9G9NPV6j935SAS5DeTDi1aTwPJdH9XoswxyM5BWBZh+PlaMuFAA
         9RTtE8T8x4RRkCJzwPN5q2dmdJQzPu8nW4AdHBfCGBAoKeoc+8ek2Ly0KYy0MvxGu3x7
         +95hg7yFXkxtX63wysU/Ll0+Zk+5mSUgRbyUjLTM5Ygqiqfe3ZLdkhEhhKfR7+UIU9wW
         An5A==
X-Forwarded-Encrypted: i=1; AJvYcCUdrfT4ZGcF5al6donfH070Y2tWQ0RE9WynKq2CrM1YWWJ7/C16M8gi+Xhzgm61LMIIu+EekWlwyZrjgK0wF4hCsMPyZRf+MZQQNcMfJoE=
X-Gm-Message-State: AOJu0YzOP88XiHGqH+HZLtjMXwNhpBB71fbB8KXfSo4cMPGoA2Qgwpb6
	wvVk3KtqXoJraw9AQmlb5jjZmX+kwDd+YHMIb74ktK4FzfuY0N9YxhwdnJR5fhhc3vEXGalv5WG
	hAFT6oh7Mb8h3TQ5Allk4tTXBq7WAA5f5RhxfaA/o5MMNo+3ReoZZj4E=
X-Google-Smtp-Source: AGHT+IHd++C0mIqHIx4KMRWW4LIbs1lu5uiKyHeoLqXPiG35XwNNd2mAtRYPPjUcgSTA9cOGPnHrQzdR41PAlHTfXw2JfxIWyGgv
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:144e:b0:474:ebfd:1749 with SMTP id
 l14-20020a056638144e00b00474ebfd1749mr138087jad.0.1709539922680; Mon, 04 Mar
 2024 00:12:02 -0800 (PST)
Date: Mon, 04 Mar 2024 00:12:02 -0800
In-Reply-To: <000000000000751c0305f19b3faa@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d225a60612d1476b@google.com>
Subject: Re: [syzbot] [reiserfs?] general protection fault in prepare_for_delete_or_cut
From: syzbot <syzbot+e621a445f96fd0e94be4@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, axboe@kernel.dk, brauner@kernel.org, 
	bvanassche@acm.org, jack@suse.cz, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, song@kernel.org, 
	syzkaller-bugs@googlegroups.com, yi.zhang@huawei.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13493754180000
start commit:   4f82870119a4 Merge tag 'mm-hotfixes-stable-2023-10-24-09-4..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=174a257c5ae6b4fd
dashboard link: https://syzkaller.appspot.com/bug?extid=e621a445f96fd0e94be4
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1382cf0b680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=136a5849680000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

