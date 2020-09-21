Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 164F627335C
	for <lists+reiserfs-devel@lfdr.de>; Mon, 21 Sep 2020 21:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbgIUT6K (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 21 Sep 2020 15:58:10 -0400
Received: from mail-io1-f80.google.com ([209.85.166.80]:34100 "EHLO
        mail-io1-f80.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726592AbgIUT6J (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 21 Sep 2020 15:58:09 -0400
Received: by mail-io1-f80.google.com with SMTP id i1so10888531iom.1
        for <reiserfs-devel@vger.kernel.org>; Mon, 21 Sep 2020 12:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=alVi99wcGR4KF0/EHp0MBZMK0CgriRXeZymu+1h/cXk=;
        b=k2i6TU6mFxV0mk4S/22wWR03Y8OPlUctzY/IPO3i7hPLvpKXzEgfnqs/gvgK5Ut53a
         UZX0kYCGyenQP6YKKkIQkzlV95/CNbu3Foo9G0oMUZOzErew/D2Dssg5dmgN/oyRGzzS
         T4dmGMFOOT0kDcc9i5zCOiLN0stWVF/mPRguDDQtUzBrrOEYNNkG8sYfQbuHdW1HN593
         i5Nj0wfZ8sRu9leEBofgPpu3TYzhcp1KS3Bp17LETpF2bMtf1pDPWrXAp5RpXTUel7kl
         uoLDuEc5AV+ovUEtBMmRff6OOJbWyYjSZ8OO5j/8qbNIJ7ybEP5XQfWabI3cKWAa7CQF
         PJFw==
X-Gm-Message-State: AOAM532slNLNRR4uAMaTB0M+XCLxEF8OloH4WD9KEfCXMHeplKXi8d4k
        xxF0J7YDDog8XjPQ6Lz8qFGlgWID4x9ZaKTAevcUyawuFNWb
X-Google-Smtp-Source: ABdhPJxkQ1g5PNEJxbE0Iv6MFNLvGWp1qpEpJQ51q32GaKCxEvtNog5hSKTboOOsu9XPGk2SyuyJxSiH6o2FIUcTRXF74Pkq9SFV
MIME-Version: 1.0
X-Received: by 2002:a92:7713:: with SMTP id s19mr1432669ilc.161.1600718288785;
 Mon, 21 Sep 2020 12:58:08 -0700 (PDT)
Date:   Mon, 21 Sep 2020 12:58:08 -0700
In-Reply-To: <000000000000f5be7f05afcf862a@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fd18b405afd84475@google.com>
Subject: Re: general protection fault in reiserfs_security_init
From:   syzbot <syzbot+690cb1e51970435f9775@syzkaller.appspotmail.com>
To:     baolin.wang7@gmail.com, gregkh@linuxfoundation.org,
        linhua.xu@unisoc.com, linus.walleij@linaro.org,
        linux-kernel@vger.kernel.org, rafael@kernel.org,
        reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

syzbot has bisected this issue to:

commit 1592c4b9935fa8a3b7c297955bb872a357e5a3b6
Author: Linhua Xu <linhua.xu@unisoc.com>
Date:   Wed Mar 25 08:25:28 2020 +0000

    pinctrl: sprd: Add pin high impedance mode support

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=111050d3900000
start commit:   325d0eab Merge branch 'akpm' (patches from Andrew)
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=131050d3900000
console output: https://syzkaller.appspot.com/x/log.txt?x=151050d3900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b12e84189082991c
dashboard link: https://syzkaller.appspot.com/bug?extid=690cb1e51970435f9775
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15705a3d900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=117b3281900000

Reported-by: syzbot+690cb1e51970435f9775@syzkaller.appspotmail.com
Fixes: 1592c4b9935f ("pinctrl: sprd: Add pin high impedance mode support")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
