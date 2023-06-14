Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEB4F730A86
	for <lists+reiserfs-devel@lfdr.de>; Thu, 15 Jun 2023 00:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236304AbjFNWUl (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 14 Jun 2023 18:20:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235084AbjFNWUi (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 14 Jun 2023 18:20:38 -0400
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDECD1FEB
        for <reiserfs-devel@vger.kernel.org>; Wed, 14 Jun 2023 15:20:35 -0700 (PDT)
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-77b266b9fc3so266739139f.3
        for <reiserfs-devel@vger.kernel.org>; Wed, 14 Jun 2023 15:20:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686781235; x=1689373235;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=saQrsy2XrGPJ3k719ppS8DNAI7XodtKtjgjHItuEn30=;
        b=N88NkpRLH3VNkZwDLiR9DzWYSwDq7NtUPMtsv4tBDbdbFZKe7tAUTa/Ri3RUTVBEDL
         GpQRBMFoT2GuRhjernis0mGe2S3YObGNuA6XNsPKy0wiAlHMBuom1W424hn8ggDJMPc3
         4D1YRvWnBFiiia4HIhAI0LnNRaILQ3tdc2Kd1Iw96ZMEMcDWi1biTUEVk7mLrBIVhhUd
         1cT/j6PCeArSaNivOz+NJAl9a06DUmFDYBCf47KcchUcGLIQ3ibw/5GQfWJO7cV/z8Bo
         VL1EzEwbJi+Jy6vcErOgNVSpjF3/uhrxPn+X3ttPZfe0h0b2K7Gjx++0YvyeMXTCs0v9
         A1Pw==
X-Gm-Message-State: AC+VfDwvjmRHKZ2ntm/lTEBPzM+/nRoXRnFrATwIXVZ6A7mJPafzK7it
        +/dvXXh2+PzcsOxdrJpXzzpnXUYGdBtdsG5uusnVF3VrVcVV
X-Google-Smtp-Source: ACHHUZ4Rq8vPI0UKF0LwNM11iVpw+lNRi7DPQKw4Nr0zSl0czZF/ZNGfw/30Cg7/WbBl1KXK9aAQ1q06ZnR1lu0pxzQQ34v296Id
MIME-Version: 1.0
X-Received: by 2002:a02:b147:0:b0:41d:71e1:4764 with SMTP id
 s7-20020a02b147000000b0041d71e14764mr6578556jah.3.1686781235127; Wed, 14 Jun
 2023 15:20:35 -0700 (PDT)
Date:   Wed, 14 Jun 2023 15:20:35 -0700
In-Reply-To: <0000000000009dc57505fd85ceb9@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000556d9605fe1e5c40@google.com>
Subject: Re: [syzbot] [reiserfs?] general protection fault in rcu_core (2)
From:   syzbot <syzbot+b23c4c9d3d228ba328d7@syzkaller.appspotmail.com>
To:     jack@suse.cz, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, luto@kernel.org,
        peterz@infradead.org, reiserfs-devel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de,
        yukuai3@huawei.com
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

commit 2acf15b94d5b8ea8392c4b6753a6ffac3135cd78
Author: Yu Kuai <yukuai3@huawei.com>
Date:   Fri Jul 2 04:07:43 2021 +0000

    reiserfs: add check for root_inode in reiserfs_fill_super

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1715ffdd280000
start commit:   f8dba31b0a82 Merge tag 'asym-keys-fix-for-linus-v6.4-rc5' ..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1495ffdd280000
console output: https://syzkaller.appspot.com/x/log.txt?x=1095ffdd280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3c980bfe8b399968
dashboard link: https://syzkaller.appspot.com/bug?extid=b23c4c9d3d228ba328d7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1680f7d1280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12fad50d280000

Reported-by: syzbot+b23c4c9d3d228ba328d7@syzkaller.appspotmail.com
Fixes: 2acf15b94d5b ("reiserfs: add check for root_inode in reiserfs_fill_super")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
