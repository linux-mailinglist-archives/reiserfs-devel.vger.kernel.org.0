Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D45078DD08
	for <lists+reiserfs-devel@lfdr.de>; Wed, 30 Aug 2023 20:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241914AbjH3Sr2 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 30 Aug 2023 14:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242873AbjH3Jyx (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 30 Aug 2023 05:54:53 -0400
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8E60CD6
        for <reiserfs-devel@vger.kernel.org>; Wed, 30 Aug 2023 02:54:50 -0700 (PDT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1bf5aa81af9so66614395ad.0
        for <reiserfs-devel@vger.kernel.org>; Wed, 30 Aug 2023 02:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693389290; x=1693994090;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=futJjrISsM49zoZxDR8r/Bu6gXuRV0qm6uZRuxXz32A=;
        b=PxXlvjI/3wjSYFI2JmHxNuPpoax0IWzOaiYTXDmOAcabGAzId/iwK7RsN69hCG76K1
         vbHPq1G+iwoFsWsI0JZqexeRvqxop00XplivnYXdqfYz5JR8p8IQYwly3zyzDp3Spjpu
         vN7KN7S7wEBsrQXSPQ4gmkE+o9IENZaivJhNTpDdt8JCBLHEg4cvEu+lIbBcfFD5P431
         H0J+6YsYE1H+ZW6FPVwlduzr5bY7FnSSr0Iv0qlxpVw9+Uua8HHNsroDVznvQd4cTK6e
         8QadKlj6W8F1s9ftqJmYX2vUl2BNIDsI8ibTH63pqkHFdtJmkpIyfHhUdUoC8/IljWA2
         Qsbg==
X-Gm-Message-State: AOJu0Yx3Ur7QQpONyBFSSFKDaxmjCqj+I6PqhIJ5pmiDUYkbrTiZ+TJk
        ZeFGL5N1ZnnREporxGbr5GzYdLDCQrVkI0OQyp55xXSlHr/w
X-Google-Smtp-Source: AGHT+IHOxuCxq5X1Y0klYh2UO5uaBWsMBRNIoRkZnnME2Rftp2OQGQKGq6gJKIpcqFHeUd7eDkbtCeTvPTAoXglZOkIRRe+VckVl
MIME-Version: 1.0
X-Received: by 2002:a17:903:5c7:b0:1ba:a36d:f82c with SMTP id
 kf7-20020a17090305c700b001baa36df82cmr437545plb.7.1693389290445; Wed, 30 Aug
 2023 02:54:50 -0700 (PDT)
Date:   Wed, 30 Aug 2023 02:54:50 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001fa20c060420eb39@google.com>
Subject: [syzbot] Monthly reiserfs report (Aug 2023)
From:   syzbot <syzbot+lista2084c97a93c18a7715f@syzkaller.appspotmail.com>
To:     linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hello reiserfs maintainers/developers,

This is a 31-day syzbot report for the reiserfs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/reiserfs

During the period, 2 new issues were detected and 0 were fixed.
In total, 88 issues are still open and 18 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  27921   Yes   KASAN: null-ptr-deref Read in do_journal_end (2)
                   https://syzkaller.appspot.com/bug?extid=845cd8e5c47f2a125683
<2>  4228    Yes   possible deadlock in open_xa_dir
                   https://syzkaller.appspot.com/bug?extid=8fb64a61fdd96b50f3b8
<3>  4054    No    UBSAN: array-index-out-of-bounds in direntry_create_vi
                   https://syzkaller.appspot.com/bug?extid=e5bb9eb00a5a5ed2a9a2
<4>  1698    No    KASAN: slab-out-of-bounds Read in search_by_key (2)
                   https://syzkaller.appspot.com/bug?extid=b3b14fb9f8a14c5d0267
<5>  1421    Yes   kernel BUG at fs/reiserfs/journal.c:LINE!
                   https://syzkaller.appspot.com/bug?extid=6820505ae5978f4f8f2f
<6>  1224    Yes   WARNING in reiserfs_lookup
                   https://syzkaller.appspot.com/bug?extid=392ac209604cc18792e5
<7>  990     Yes   possible deadlock in mnt_want_write_file
                   https://syzkaller.appspot.com/bug?extid=1047e42179f502f2b0a2
<8>  297     Yes   possible deadlock in reiserfs_ioctl
                   https://syzkaller.appspot.com/bug?extid=79c303ad05f4041e0dad
<9>  248     Yes   KASAN: out-of-bounds Read in leaf_paste_entries (2)
                   https://syzkaller.appspot.com/bug?extid=38b79774b6c990637f95
<10> 218     Yes   possible deadlock in do_journal_begin_r
                   https://syzkaller.appspot.com/bug?extid=5e385bfa7d505b075d9f

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
