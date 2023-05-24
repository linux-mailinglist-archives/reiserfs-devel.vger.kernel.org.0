Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C438570F39A
	for <lists+reiserfs-devel@lfdr.de>; Wed, 24 May 2023 11:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjEXJ7p (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 24 May 2023 05:59:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjEXJ7o (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 24 May 2023 05:59:44 -0400
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72F91A1
        for <reiserfs-devel@vger.kernel.org>; Wed, 24 May 2023 02:59:43 -0700 (PDT)
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-763da06581dso53052939f.3
        for <reiserfs-devel@vger.kernel.org>; Wed, 24 May 2023 02:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684922382; x=1687514382;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1y4v5dGXXlsdtRC3uXVTLATx1IP65h/O1W1Vau1z36c=;
        b=Ij57TpbdsJhiZQQu4I9Q+hv2nHVj6R9V6SudxPahCHtPr2miHtaYSajmpApx1LCEHd
         dFevYBZIOd4sAfzwtOTmP/BMdnhWD+x/zrTiaBEN3MBffGPFhJ7wyfZiAWYf4QJVYetF
         wwwILdrQyUtSt+Dp5LqWMtGKz4iUuG9tUrUOIJk4+oM1nKMIR3HvXKbUWc9GfPOxzj/p
         q0E0mPMa4yoYPqi5uhMO3fRBSbkYHk4DzOAdxKo1G4+HCqIxixJwfQ9wkx/nCgSl0vBT
         koStYEFABHP5p99PGE4QcE0NCccx7z5TnZjZf8+reAbXC2B38gWMT6Jiol2RE7y7MTp6
         Bc4w==
X-Gm-Message-State: AC+VfDw7YLJC/KOcZyJGvl727dllCfF/8GKzeIsGAbd0SH1YrlZhCPMT
        4IKZ5ET7D1skErOKVjjONKB8MS4D6aSHE+huae6Th8Zvd41B
X-Google-Smtp-Source: ACHHUZ6PZMlHgxI46j1tQBns8nc8d3nGtIJnm0KlDV5DvWHSG0dXSo3asRiBt3s951Us5qDHQxRhmkeaH50+DeqGK/dOClg+Cr28
MIME-Version: 1.0
X-Received: by 2002:a6b:d907:0:b0:76c:69f7:9b2 with SMTP id
 r7-20020a6bd907000000b0076c69f709b2mr8176146ioc.2.1684922382742; Wed, 24 May
 2023 02:59:42 -0700 (PDT)
Date:   Wed, 24 May 2023 02:59:42 -0700
In-Reply-To: <000000000000be039005fc540ed7@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000018faf905fc6d9056@google.com>
Subject: Re: [syzbot] [reiserfs?] INFO: task hung in flush_old_commits
From:   syzbot <syzbot+0a684c061589dcc30e51@syzkaller.appspotmail.com>
To:     linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        paul@paul-moore.com, reiserfs-devel@vger.kernel.org,
        roberto.sassu@huawei.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
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

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11c39639280000
start commit:   421ca22e3138 Merge tag 'nfs-for-6.4-2' of git://git.linux-..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=13c39639280000
console output: https://syzkaller.appspot.com/x/log.txt?x=15c39639280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d8067683055e3f5
dashboard link: https://syzkaller.appspot.com/bug?extid=0a684c061589dcc30e51
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14312791280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12da8605280000

Reported-by: syzbot+0a684c061589dcc30e51@syzkaller.appspotmail.com
Fixes: d82dcd9e21b7 ("reiserfs: Add security prefix to xattr name in reiserfs_security_write()")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
