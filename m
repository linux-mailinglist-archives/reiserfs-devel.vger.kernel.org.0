Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2250D7E0111
	for <lists+reiserfs-devel@lfdr.de>; Fri,  3 Nov 2023 11:30:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbjKCKWa (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 3 Nov 2023 06:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjKCKW3 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 3 Nov 2023 06:22:29 -0400
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81043D52
        for <reiserfs-devel@vger.kernel.org>; Fri,  3 Nov 2023 03:22:22 -0700 (PDT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-1efb84e655aso2482046fac.2
        for <reiserfs-devel@vger.kernel.org>; Fri, 03 Nov 2023 03:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699006942; x=1699611742;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uc6FYLAopkgJT15uv3TdDC2GDeP4YlXHM2CzEWdADSI=;
        b=vY+glLkTSmKk4nphiODnEGVQclKKwl4cQI7FtT768F+d8pcoh6UEE5CcqV+v3O73f+
         B6u/PCvSXTkFzIxPf9PwqgQ4axLlHlNcoOjvwFI/hbkLjVpphE3aqvwH/Py3Tuyjir9r
         Q/5ZIR3hPIT9YEWQJMz+6oNuTMU7PspKkd4SY1kA9Z21+coEsGGqV7S7jh9o8isfdctH
         j1KsheYKrQeYGkvy8vCiLV+4qO2GbRDXCaH4GEf3HcsEgSUx0zxGBCOGSV+YMU3DVd/r
         m5Q1xJAQzpK0tCZUT4qocqjqhbMhKixY20TvTNNwswDRtCKJ8mLzhn8lbHPoxDg2F5Cd
         uNHw==
X-Gm-Message-State: AOJu0YxIyII6Sqj2AEOzNjH3cKd/9MYVWRDnncw4KlaZyLsbPnN+/xFA
        I/wtF/+wfIkrErJlPVaTiO/EYHpdiSunRRYnRKNxXKl+BZ8G
X-Google-Smtp-Source: AGHT+IHvVzI4EkIrE7Q/aziOILbGKGM6tNCR5pFCuO/mUo3q1r8yizrt0z20md0SFWPfyCNGW4h+rt1uIvb1dddismjP0dry5sl3
MIME-Version: 1.0
X-Received: by 2002:a05:6870:3645:b0:1e9:dbd8:b0bd with SMTP id
 v5-20020a056870364500b001e9dbd8b0bdmr9855586oak.10.1699006941834; Fri, 03 Nov
 2023 03:22:21 -0700 (PDT)
Date:   Fri, 03 Nov 2023 03:22:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003d356f06093ce16b@google.com>
Subject: [syzbot] Monthly reiserfs report (Nov 2023)
From:   syzbot <syzbot+listbc495c19bdf2523c9b32@syzkaller.appspotmail.com>
To:     linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
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

During the period, 1 new issues were detected and 0 were fixed.
In total, 89 issues are still open and 18 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  40677   Yes   KASAN: null-ptr-deref Read in do_journal_end (2)
                   https://syzkaller.appspot.com/bug?extid=845cd8e5c47f2a125683
<2>  5621    Yes   possible deadlock in open_xa_dir
                   https://syzkaller.appspot.com/bug?extid=8fb64a61fdd96b50f3b8
<3>  2433    No    KASAN: slab-out-of-bounds Read in search_by_key (2)
                   https://syzkaller.appspot.com/bug?extid=b3b14fb9f8a14c5d0267
<4>  1506    Yes   kernel BUG at fs/reiserfs/journal.c:LINE!
                   https://syzkaller.appspot.com/bug?extid=6820505ae5978f4f8f2f
<5>  1240    Yes   WARNING in reiserfs_lookup
                   https://syzkaller.appspot.com/bug?extid=392ac209604cc18792e5
<6>  1219    Yes   possible deadlock in mnt_want_write_file
                   https://syzkaller.appspot.com/bug?extid=1047e42179f502f2b0a2
<7>  784     No    KMSAN: uninit-value in reiserfs_new_inode (2)
                   https://syzkaller.appspot.com/bug?extid=6450929faa7a97cd42d1
<8>  354     Yes   possible deadlock in reiserfs_ioctl
                   https://syzkaller.appspot.com/bug?extid=79c303ad05f4041e0dad
<9>  324     Yes   WARNING in journal_end
                   https://syzkaller.appspot.com/bug?extid=d43f346675e449548021
<10> 267     Yes   KASAN: out-of-bounds Read in leaf_paste_entries (2)
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
