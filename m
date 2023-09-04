Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0588B791BD5
	for <lists+reiserfs-devel@lfdr.de>; Mon,  4 Sep 2023 19:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233914AbjIDRDB (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 4 Sep 2023 13:03:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232613AbjIDRDA (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 4 Sep 2023 13:03:00 -0400
Received: from mail-pf1-f206.google.com (mail-pf1-f206.google.com [209.85.210.206])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5591CCC5
        for <reiserfs-devel@vger.kernel.org>; Mon,  4 Sep 2023 10:02:57 -0700 (PDT)
Received: by mail-pf1-f206.google.com with SMTP id d2e1a72fcca58-68bec515fa9so2381201b3a.2
        for <reiserfs-devel@vger.kernel.org>; Mon, 04 Sep 2023 10:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693846977; x=1694451777;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SuRfH3tOxBAic+uxa8x4d/CGKfpXuOKHQOMpeu6T8Ps=;
        b=dP1OR8TcfzZczdhyM7pG1L874JiuKQZ0XguMO4jbzAJ78XceetBRfTkxvhfTO/F2Rb
         zpONDQ+yJfEBvnEXikF3qg5f8kmxpSQniqUYPbF7X+b8gFD9GvH98TMtDDcadfXqHab2
         70XQEDM/0KCiYswhTY1lknwEB99OCfUZVtkz6cMB1Y4Qx9N0KO7Y37fvhp3ipimdBoeI
         cXY3Kl58aFSnuw8Fg4pZWxcGfV/BliZxN3jJrg8O0qM/IHlGeK/pO+G5oJzFDNynsgCH
         ylM3wLcZG/ssgO6R87yTLVxRVba3guKMx6EkuPrwUywIki0+OiaL/PGpM67Z5puuNM3R
         Pq4g==
X-Gm-Message-State: AOJu0YwhQR+ukOUekUvkSoeMDMPNEfy7ghv+5QvCPqApC3KgCh+R0ZKV
        zjJLMhvJ/3fUPRNlmbNNv/y5BWmKBnQQwMWorM8O+O4E1N4g
X-Google-Smtp-Source: AGHT+IFb3ecwLVPqE7B5cABl8oNkg2h8a/AilLSfLvjLhPXh+bYLPFUjHSaAbJYLTm7QzOJUrkCwPitgxOIZLplS4EDpotT1Vn8Y
MIME-Version: 1.0
X-Received: by 2002:a05:6a00:1883:b0:68a:46d4:b863 with SMTP id
 x3-20020a056a00188300b0068a46d4b863mr4912683pfh.4.1693846976709; Mon, 04 Sep
 2023 10:02:56 -0700 (PDT)
Date:   Mon, 04 Sep 2023 10:02:56 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000059cb7006048b7b03@google.com>
Subject: [syzbot] [reiserfs?] BUG: unabSeaBIOS (version NUM.NUM.NUM-google)
From:   syzbot <syzbot+bdb228c3f8a87a7c9c98@syzkaller.appspotmail.com>
To:     linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    a47fc304d2b6 Add linux-next specific files for 20230831
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1124e210680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6ecd2a74f20953b9
dashboard link: https://syzkaller.appspot.com/bug?extid=bdb228c3f8a87a7c9c98
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10b9ba67a80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12170a10680000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b2e8f4217527/disk-a47fc304.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ed6cdcc09339/vmlinux-a47fc304.xz
kernel image: https://storage.googleapis.com/syzbot-assets/bd9b2475bf5a/bzImage-a47fc304.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/175d97cdd50c/mount_1.gz

Bisection is inconclusive: the issue happens on the oldest tested release.

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16060e13a80000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=15060e13a80000
console output: https://syzkaller.appspot.com/x/log.txt?x=11060e13a80000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+bdb228c3f8a87a7c9c98@syzkaller.appspotmail.com

BUG: unabSeaBIOS (version 1.8.2-google)


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
