Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36E787505BD
	for <lists+reiserfs-devel@lfdr.de>; Wed, 12 Jul 2023 13:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231950AbjGLLPb (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 12 Jul 2023 07:15:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232997AbjGLLPa (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 12 Jul 2023 07:15:30 -0400
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53DBC170E
        for <reiserfs-devel@vger.kernel.org>; Wed, 12 Jul 2023 04:15:28 -0700 (PDT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-39a9590f9fdso1037795b6e.1
        for <reiserfs-devel@vger.kernel.org>; Wed, 12 Jul 2023 04:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689160527; x=1691752527;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fonbPBO8cCp6d+S6nLyQevAy5YwUth5CtOcp2ssE2z0=;
        b=NeWSiBmVfZQqfl112DZ2wm4iEXIWPjT4iExGjY5YfDvvgqP3/Wx19cEy1OeXg27GD6
         Fp5NNZxMl4lh6akIadUF/9zXRa3zKSQv/0b07BtyU3FbEOnS2cDGpSVvtwXWjZiD3OAA
         zvxQ2UMG3YXtITFfzR48W8vVdVnb6TKx+lsYv22n3FWVe3vfs0/aj02e5J6tUCj5MffV
         s21HUPCiPhRypneNCYWmr4S+2nvE6V9EFLahu6oFvEX5tFmI37Wp8/ee/sOn+beWuJnl
         Ob/VBnG2jdwWVBJC8nd7K1n4INToHMNJAxDf16CsCyZMJlL622m7oZyCAJlsrobqUEQK
         sYQQ==
X-Gm-Message-State: ABy/qLb5PqV2MdzHMcf8AVh5Obd+mgbZ2Ciko/al4htimAxbhq/WIDZF
        QwCZmxTXgYQ/FZgJj8IqdJp03SCkn1KBC5r7LfVH3o+0YQjL
X-Google-Smtp-Source: APBJJlFSBYrzOmNe0PXXB2yxlCulu+0N3cWtIwSA4bhXITab6Sf/6Ao/A6stEk5QEYoT2gX8A4gNYlKAPHM00w5NlXyvmItMcaGr
MIME-Version: 1.0
X-Received: by 2002:a05:6808:20a0:b0:3a1:c163:6022 with SMTP id
 s32-20020a05680820a000b003a1c1636022mr2348196oiw.4.1689160527544; Wed, 12 Jul
 2023 04:15:27 -0700 (PDT)
Date:   Wed, 12 Jul 2023 04:15:27 -0700
In-Reply-To: <000000000000d7894b05f5924787@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000368623060048550c@google.com>
Subject: Re: [syzbot] [reiserfs] general protection fault in timerqueue_add (4)
From:   syzbot <syzbot+21f2b8753d8bfc6bb816@syzkaller.appspotmail.com>
To:     akpm@linux-foundation.org, jack@suse.cz,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        miklos@szeredi.hu, nogikh@google.com,
        reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
        tglx@linutronix.de, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

syzbot suspects this issue was fixed by commit:

commit d685c668b0695dff927c85e27ef27d4f404f16a3
Author: Matthew Wilcox (Oracle) <willy@infradead.org>
Date:   Thu Dec 15 21:43:51 2022 +0000

    buffer: add b_folio as an alias of b_page

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13d6c9caa80000
start commit:   4a7d37e824f5 Merge tag 'hardening-v6.3-rc1' of git://git.k..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=8b969c5af147d31c
dashboard link: https://syzkaller.appspot.com/bug?extid=21f2b8753d8bfc6bb816
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17c64f20c80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13734ba0c80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: buffer: add b_folio as an alias of b_page

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
