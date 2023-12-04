Return-Path: <reiserfs-devel+bounces-2-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A426E803323
	for <lists+reiserfs-devel@lfdr.de>; Mon,  4 Dec 2023 13:39:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AFCF1F211B0
	for <lists+reiserfs-devel@lfdr.de>; Mon,  4 Dec 2023 12:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977A1224EC;
	Mon,  4 Dec 2023 12:39:28 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE3D113
	for <reiserfs-devel@vger.kernel.org>; Mon,  4 Dec 2023 04:39:25 -0800 (PST)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-1fb1c742f0bso1933643fac.0
        for <reiserfs-devel@vger.kernel.org>; Mon, 04 Dec 2023 04:39:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701693564; x=1702298364;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lSnnQNh5WsqK5z5WWJftrXTfG+C0jshNuJ+tMybyKVg=;
        b=wrHEQgV88gt1HF5EamJPfvbeO1Z+8bcfKowbTHLd7AdvqoruBhFYDxmTH5G6m2HEbV
         enP7Zm9Mwodo+JUxxaqQtR443xDnr/FMqkfAd/Gil7PbetX78St7b3osQgpg/n5yQEUh
         Loc8ttIqFLsYMX0gI0A5oFc+se0DPrpQUeMeA+1I8vGpy7NN0rRygYC0Pju1hX+Gdoh9
         kkz0Nr7SxX0WWAao37/AeyjNcrSImKatdAKMrKlbwr6DaLT6u31l4cLzigJsTSUQr3//
         WL/aFjjnpxNdZlDu+8/MW+UtZxPL2sC+fw08eBLkrXvf71yNli2j6WygrgjpvWT0h6V6
         Mouw==
X-Gm-Message-State: AOJu0YyFblOJqgwLB5hpBQbfDjFfEaY8uFABB4X3vZ445zaLp1RPD++b
	nvc8t6HS35dJ2kUp5FP1QmMA/UJuHhIjWVWJFqp8O599vmxy
X-Google-Smtp-Source: AGHT+IHzUw5cIBVtAPz0Qy7spUe6NDHHqOfmbJm4fHrshgLhYydewJpCA6OzMMUGSSzrDLI/o5fEo1+swXo8bd5wYJGhvwsL8pv5
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6870:910f:b0:1fa:e851:720b with SMTP id
 o15-20020a056870910f00b001fae851720bmr2720878oae.8.1701693564794; Mon, 04 Dec
 2023 04:39:24 -0800 (PST)
Date: Mon, 04 Dec 2023 04:39:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000724223060bae6880@google.com>
Subject: [syzbot] Monthly reiserfs report (Dec 2023)
From: syzbot <syzbot+list6d707ca0e4ce5e990ff3@syzkaller.appspotmail.com>
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello reiserfs maintainers/developers,

This is a 31-day syzbot report for the reiserfs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/reiserfs

During the period, 5 new issues were detected and 0 were fixed.
In total, 88 issues are still open and 17 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  40685   Yes   KASAN: null-ptr-deref Read in do_journal_end (2)
                   https://syzkaller.appspot.com/bug?extid=845cd8e5c47f2a125683
<2>  6321    Yes   possible deadlock in open_xa_dir
                   https://syzkaller.appspot.com/bug?extid=8fb64a61fdd96b50f3b8
<3>  2995    No    KASAN: slab-out-of-bounds Read in search_by_key (2)
                   https://syzkaller.appspot.com/bug?extid=b3b14fb9f8a14c5d0267
<4>  1621    Yes   kernel BUG at fs/reiserfs/journal.c:LINE!
                   https://syzkaller.appspot.com/bug?extid=6820505ae5978f4f8f2f
<5>  1388    Yes   possible deadlock in mnt_want_write_file
                   https://syzkaller.appspot.com/bug?extid=1047e42179f502f2b0a2
<6>  1246    Yes   WARNING in reiserfs_lookup
                   https://syzkaller.appspot.com/bug?extid=392ac209604cc18792e5
<7>  967     No    KMSAN: uninit-value in reiserfs_new_inode (2)
                   https://syzkaller.appspot.com/bug?extid=6450929faa7a97cd42d1
<8>  402     Yes   possible deadlock in reiserfs_ioctl
                   https://syzkaller.appspot.com/bug?extid=79c303ad05f4041e0dad
<9>  380     Yes   WARNING in journal_end
                   https://syzkaller.appspot.com/bug?extid=d43f346675e449548021
<10> 349     Yes   possible deadlock in reiserfs_dirty_inode
                   https://syzkaller.appspot.com/bug?extid=c319bb5b1014113a92cf

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

