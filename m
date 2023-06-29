Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B56FF7422B2
	for <lists+reiserfs-devel@lfdr.de>; Thu, 29 Jun 2023 10:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231737AbjF2IyH (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 29 Jun 2023 04:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231561AbjF2IyG (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 29 Jun 2023 04:54:06 -0400
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEB12E4B
        for <reiserfs-devel@vger.kernel.org>; Thu, 29 Jun 2023 01:54:02 -0700 (PDT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6b747da8ab9so688896a34.0
        for <reiserfs-devel@vger.kernel.org>; Thu, 29 Jun 2023 01:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688028842; x=1690620842;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zEUG58nL5iLmeTt4LnH06pyXU55y46fgRDzs9ZfJaKw=;
        b=kfU7bNZpo8ZXm0yEZ7DFcTvMV3vSP2RLQQNnpaONFX1slqBA2WgrQG+UoEsRmr0moh
         ipfmJ9RIZ9E2SKOGh/nq1lFH7DDGCppEzXoT3VcSJU+JpmW4asQ7R7VAy0MozVuIRUVt
         x87Jx6G3Ca4e//mbcfERa0KUXgVpG0uMN81ChhPnhOwZNywg78hZqaGwzQtQ0WE0eVLh
         uZYheaFenKMs9COqVxcA+BLiEtba8GLKff33DE/U0V4Yhyu88v1XN6v50jGcsbnplP4Q
         mZ5aw7rpO1AUSTzk1kRuxppU/jRMPze6xSgCpmsqrJVnx9iJvE/3NfOGWklNiN5dHto5
         DWPg==
X-Gm-Message-State: AC+VfDw7NVoisLnFZ48ZKHe9xbyleHvRZe5XAbivOpz4VV9ne5jGCmjo
        Lts62l034g+joQp31SfnsCrgH+V5sPv+DRYoV8MzLAuCDJfQ
X-Google-Smtp-Source: ACHHUZ4oYdEE5FHWfiHBwn7fffeJLHHJch/YalC2dRBY7bZ2Hv371AeaSCXmkBauDLzffnM/TdG1hmxApe31kltI/KpGXjzScTS6
MIME-Version: 1.0
X-Received: by 2002:a9d:7a94:0:b0:6b7:4aa6:77b3 with SMTP id
 l20-20020a9d7a94000000b006b74aa677b3mr3616673otn.3.1688028842186; Thu, 29 Jun
 2023 01:54:02 -0700 (PDT)
Date:   Thu, 29 Jun 2023 01:54:02 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000825f0d05ff40d7ca@google.com>
Subject: [syzbot] Monthly reiserfs report (Jun 2023)
From:   syzbot <syzbot+list27f0754ef9e5b00bcfe9@syzkaller.appspotmail.com>
To:     linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hello reiserfs maintainers/developers,

This is a 31-day syzbot report for the reiserfs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/reiserfs

During the period, 13 new issues were detected and 0 were fixed.
In total, 84 issues are still open and 17 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  3597    Yes   possible deadlock in open_xa_dir
                   https://syzkaller.appspot.com/bug?extid=8fb64a61fdd96b50f3b8
<2>  2491    Yes   KASAN: null-ptr-deref Read in do_journal_end (2)
                   https://syzkaller.appspot.com/bug?extid=845cd8e5c47f2a125683
<3>  1474    Yes   kernel BUG in do_journal_begin_r
                   https://syzkaller.appspot.com/bug?extid=2da5e132dd0268a9c0e4
<4>  1394    Yes   kernel BUG at fs/reiserfs/journal.c:LINE!
                   https://syzkaller.appspot.com/bug?extid=6820505ae5978f4f8f2f
<5>  1197    Yes   WARNING in reiserfs_lookup
                   https://syzkaller.appspot.com/bug?extid=392ac209604cc18792e5
<6>  912     No    UBSAN: array-index-out-of-bounds in direntry_create_vi
                   https://syzkaller.appspot.com/bug?extid=e5bb9eb00a5a5ed2a9a2
<7>  861     Yes   possible deadlock in mnt_want_write_file
                   https://syzkaller.appspot.com/bug?extid=1047e42179f502f2b0a2
<8>  291     Yes   possible deadlock in reiserfs_ioctl
                   https://syzkaller.appspot.com/bug?extid=79c303ad05f4041e0dad
<9>  266     Yes   WARNING in journal_end
                   https://syzkaller.appspot.com/bug?extid=d43f346675e449548021
<10> 233     Yes   KASAN: out-of-bounds Read in leaf_paste_entries (2)
                   https://syzkaller.appspot.com/bug?extid=38b79774b6c990637f95

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
