Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 052AA7E1C62
	for <lists+reiserfs-devel@lfdr.de>; Mon,  6 Nov 2023 09:34:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbjKFIea (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 6 Nov 2023 03:34:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231407AbjKFIeX (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 6 Nov 2023 03:34:23 -0500
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 526421B2
        for <reiserfs-devel@vger.kernel.org>; Mon,  6 Nov 2023 00:34:08 -0800 (PST)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-587a54afb50so1627853eaf.0
        for <reiserfs-devel@vger.kernel.org>; Mon, 06 Nov 2023 00:34:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699259647; x=1699864447;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R//xFC6MCX07YnTjEGgkyVytVcMHK0VcX9I6eFXmSn0=;
        b=j+i8OoEMCcHOKGtM7Bs8tHqa3dloKqsiBh4VFAmr4duiLnEwTpNhjTo11jJGi6iWpl
         WmOD8hHQhuy/7OgYhdeSl6RcmJWhBCeKY4DL/P793qTvbY4u2VFIi14GLUD/fTu9X3o2
         EI4UXZoaxaRvCR7k29LOoHitFjjasfsuWx4K4kborFSyjF1H89LOGgtd7A2jM0DpEUcg
         n6xK9gMJHYHHfXct5P/VxZSR/rwPc9+kx/T7BGytKfYTFH575Yx7XuKfYB1cxSKYcFix
         p+UWv0LxB670Qsw5LfqXkSU6r8i6iTS/473zRQJlxKfTWIlDv4GRrfAATKd2VKCMRW07
         v7eA==
X-Gm-Message-State: AOJu0YwkbrA6Kelria6TUglIRsfXcLkoiAJPrPr08paLfCskq85Lkveg
        DqvYAaCFikS8y3GB41aRlG0HjXAP2jRg0wJXnpDyG85ADyAA
X-Google-Smtp-Source: AGHT+IGPvdUMp7cFbFWrKJV9OVBnXNdZFxJ2Ar/n96qlK/oegdaqwZk7Cnt4qpgL2n4nuLJ0ela54eQb73j/dM3UYdnpHggAwsHn
MIME-Version: 1.0
X-Received: by 2002:aca:1113:0:b0:3a3:c492:9be6 with SMTP id
 19-20020aca1113000000b003a3c4929be6mr3745348oir.2.1699259647315; Mon, 06 Nov
 2023 00:34:07 -0800 (PST)
Date:   Mon, 06 Nov 2023 00:34:07 -0800
In-Reply-To: <000000000000cfe6f305ee84ff1f@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a8d8e7060977b741@google.com>
Subject: Re: [syzbot] [reiserfs?] possible deadlock in reiserfs_dirty_inode
From:   syzbot <syzbot+c319bb5b1014113a92cf@syzkaller.appspotmail.com>
To:     hdanton@sina.com, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, paul@paul-moore.com,
        reiserfs-devel@vger.kernel.org, roberto.sassu@huawei.com,
        syzkaller-bugs@googlegroups.com, syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

syzbot has bisected this issue to:

commit d82dcd9e21b77d338dc4875f3d4111f0db314a7c
Author: Roberto Sassu <roberto.sassu@huawei.com>
Date:   Fri Mar 31 12:32:18 2023 +0000

    reiserfs: Add security prefix to xattr name in reiserfs_security_write()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14d0b787680000
start commit:   90b0c2b2edd1 Merge tag 'pinctrl-v6.7-1' of git://git.kerne..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=16d0b787680000
console output: https://syzkaller.appspot.com/x/log.txt?x=12d0b787680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=93ac5233c138249e
dashboard link: https://syzkaller.appspot.com/bug?extid=c319bb5b1014113a92cf
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=113f3717680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=154985ef680000

Reported-by: syzbot+c319bb5b1014113a92cf@syzkaller.appspotmail.com
Fixes: d82dcd9e21b7 ("reiserfs: Add security prefix to xattr name in reiserfs_security_write()")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
