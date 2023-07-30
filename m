Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9858476860C
	for <lists+reiserfs-devel@lfdr.de>; Sun, 30 Jul 2023 16:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbjG3Oem (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sun, 30 Jul 2023 10:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbjG3Oek (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 30 Jul 2023 10:34:40 -0400
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08FC7E46
        for <reiserfs-devel@vger.kernel.org>; Sun, 30 Jul 2023 07:34:39 -0700 (PDT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3a72b2a52e5so569081b6e.3
        for <reiserfs-devel@vger.kernel.org>; Sun, 30 Jul 2023 07:34:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690727678; x=1691332478;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lWEs9tBxQ1qd6Nv15hqv+sQ9Wsq7wE6UQ0dhzWGDEw0=;
        b=Cid9FQeUwjvghhbdhN/f65uZgyPLrg6DBGEfRNhOL14EgkJpsW08o5f9+Fey9QmKmF
         GqrENXYkb1aTa2inFQMo/FX4WhpRtcyoH8SRd50cofKr90GQ1lSjkM8Mh+wj6SZvFFWX
         al/zChpKXn8PIsQic4D6EakNP8aRKp1yO7cxqLTrHjHiDY0ZLXtuqKgadicUEdwV3ktm
         75ihrMjiy9kfnrL0ZH5F+lkkyg1ozPDUQcvAOlL8/l9LdA7besADtSUHyRSD61zGfs1T
         VqBhYdp1hYonaN4cRUd7t/tLYNp4cYbixeBLJpeawflBq9hdS/70msThWKkYxt9rqUx0
         M8Ig==
X-Gm-Message-State: ABy/qLZTgDeA3PFnqv0NOgVV5P+bW9a9x1W4hBPLqQKB4Oc8aNnSB1NN
        jYGd8u0dQKhGug2VpnNSQOeCbTASXV9U0xfA4jzK+t4VwH/5
X-Google-Smtp-Source: APBJJlHlZeRsJhA1JwC+Vdmu+N9LIUtZDdY44VIw8JRBKBvwAYj1K34PoqnTCgPrj4fdOUK92lFjeE0YyPKsMBKChX5FPGXNgJdc
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1a18:b0:3a7:2d4c:5d34 with SMTP id
 bk24-20020a0568081a1800b003a72d4c5d34mr1839695oib.8.1690727677890; Sun, 30
 Jul 2023 07:34:37 -0700 (PDT)
Date:   Sun, 30 Jul 2023 07:34:37 -0700
In-Reply-To: <0000000000003b7fee05eec392a8@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a7178a0601b5366f@google.com>
Subject: Re: [syzbot] [reiserfs?] [overlayfs?] BUG: unable to handle kernel
 paging request in take_dentry_name_snapshot
From:   syzbot <syzbot+90392eaed540afcc8fc3@syzkaller.appspotmail.com>
To:     amir73il@gmail.com, brauner@kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-unionfs@vger.kernel.org, miklos@szeredi.hu,
        reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

syzbot suspects this issue was fixed by commit:

commit 1784fbc2ed9c888ea4e895f30a53207ed7ee8208
Author: Christian Brauner <brauner@kernel.org>
Date:   Fri Jun 16 12:53:58 2023 +0000

    ovl: port to new mount api

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12561bd9a80000
start commit:   8395ae05cb5a Merge tag 'scsi-misc' of git://git.kernel.org..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=85327a149d5f50f
dashboard link: https://syzkaller.appspot.com/bug?extid=90392eaed540afcc8fc3
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16199460480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1797f274480000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: ovl: port to new mount api

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
