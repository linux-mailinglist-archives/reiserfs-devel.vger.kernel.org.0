Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44A2170D92C
	for <lists+reiserfs-devel@lfdr.de>; Tue, 23 May 2023 11:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236141AbjEWJe7 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 23 May 2023 05:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236384AbjEWJep (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 23 May 2023 05:34:45 -0400
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1FE91AD
        for <reiserfs-devel@vger.kernel.org>; Tue, 23 May 2023 02:34:31 -0700 (PDT)
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-76ce93a10f3so284733739f.0
        for <reiserfs-devel@vger.kernel.org>; Tue, 23 May 2023 02:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684834471; x=1687426471;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6XhonWAPAu8OTH4owMzaT0fJr80igSY+VEVOwOtFTeA=;
        b=h6OzEkxkc4DdK3UXxsslYfv1FfrdHmRZ6j+wmv/eVrIqg2xlc08sIlQKrD67nKvcOl
         d2mJAESS3ZPQmPnDBBE+eAg9jZvF7fMjn9vPtQOgYpMum0GC7wmdAf+nmCe+KcxBufo2
         D4Rb9Lz1Y4sMAX+yXo0cfX1RsROctineWQC8a6ZCLuwbDRy/fNxqKOypylMAx+zoptfC
         FiMxY+pSCsnKB6lnqDNNTZV34tPYz6f2O0uG29qvgsYhw1XhlWdccVwb6I8EeD63Mq3q
         MbRxWxm4pFlu57ZhoGIaKyi1e2pt7Xzwg3t3FFLQqsxBajJ+hFyRVrkyvzQ5+CwyA/St
         Sgdg==
X-Gm-Message-State: AC+VfDz4NbXaScpz11ZtdawEKjWWnsH70DGbTE9PXIhv5lXM+9dKwdgY
        4A3t+0kPOIoKVIT9dlS1nCKhQpVcRr/Un4Djy/VeHg64uIzF
X-Google-Smtp-Source: ACHHUZ5YZD8fx0KgCTuHpDJe0wpCyOKPizAlCEPgXSRJ4L1EvfuXNi5P5YSJh8gMioCuqsedxNrAggthsCP4xsGho4gpnN+tE5a8
MIME-Version: 1.0
X-Received: by 2002:a5d:9285:0:b0:763:5a5a:90e7 with SMTP id
 s5-20020a5d9285000000b007635a5a90e7mr6621320iom.3.1684834471032; Tue, 23 May
 2023 02:34:31 -0700 (PDT)
Date:   Tue, 23 May 2023 02:34:31 -0700
In-Reply-To: <00000000000066a94205fc488445@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000026bdd305fc5918a5@google.com>
Subject: Re: [syzbot] [block?] [reiserfs?] KASAN: user-memory-access Write in zram_slot_lock
From:   syzbot <syzbot+b8d61a58b7c7ebd2c8e0@syzkaller.appspotmail.com>
To:     akpm@linux-foundation.org, axboe@kernel.dk, hch@lst.de,
        linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, minchan@kernel.org,
        reiserfs-devel@vger.kernel.org, senozhatsky@chromium.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

syzbot has bisected this issue to:

commit 9fe95babc7420722d39a1ded379027a1e1825d3a
Author: Christoph Hellwig <hch@lst.de>
Date:   Tue Apr 11 17:14:44 2023 +0000

    zram: remove valid_io_request

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=132fa586280000
start commit:   44c026a73be8 Linux 6.4-rc3
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=10afa586280000
console output: https://syzkaller.appspot.com/x/log.txt?x=172fa586280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d8067683055e3f5
dashboard link: https://syzkaller.appspot.com/bug?extid=b8d61a58b7c7ebd2c8e0
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1223f7d9280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1245326a280000

Reported-by: syzbot+b8d61a58b7c7ebd2c8e0@syzkaller.appspotmail.com
Fixes: 9fe95babc742 ("zram: remove valid_io_request")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
