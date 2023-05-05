Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE986F8A6A
	for <lists+reiserfs-devel@lfdr.de>; Fri,  5 May 2023 22:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233397AbjEEUvf (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 5 May 2023 16:51:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233382AbjEEUve (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 5 May 2023 16:51:34 -0400
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 444582D60
        for <reiserfs-devel@vger.kernel.org>; Fri,  5 May 2023 13:51:29 -0700 (PDT)
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-76371bc5167so305062339f.1
        for <reiserfs-devel@vger.kernel.org>; Fri, 05 May 2023 13:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683319888; x=1685911888;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xz8oP5bTFGUj6c4RnphlwwmDszCEtGrIv7CYsijiB50=;
        b=F+UnQHnJRkV9z00wlzZcgXxzI7d+HtBP5xgSWL81k1THEo8IrpF7Mc1ux9Lb4//k7I
         Mx1IOIlCbRUVylNVFMjAEZ9kNLYaYMPHtJMhUPb7YnUsYSnTpAmRP5FAEFHB+0mp9Bc+
         DFpTGaiN1nmpaCogV3ymIfkhbb+MQTxeZi/l1050NezzihqSw/iv1hWFs45vPMwVLaRe
         AhMV/TbOhQiQLP0DmCQlZuEZ/IZEoRw7pt68KS5u3LuUEqeTfvluy1/DnwfWjPPUhFy5
         6cAFWyy9LMmyEvRO9ad4HltBRSb0J7GN2g3sQLwka3StJvhQROfv/YqAPuJRc0qNKX/S
         VKAg==
X-Gm-Message-State: AC+VfDyQc/sZPitiqZ8wSpNsXzI9dBnE7P4Y+bzb6Hf3niS/GOAUQgCO
        sEtKd7Y65AM326KVkjlp6YDyJZ2qsjtThpZNOLgLm83ifVu6
X-Google-Smtp-Source: ACHHUZ5vqOFA/5T+hNmtEX7lSCQTA27WTbngt21dM8oERoMh9pcLsuCOw/xFwc/AuBFHVzce/YEP+d5wbCIMMARA4ZzFB1Um25S1
MIME-Version: 1.0
X-Received: by 2002:a02:638e:0:b0:416:4d10:3896 with SMTP id
 j136-20020a02638e000000b004164d103896mr1200772jac.6.1683319888578; Fri, 05
 May 2023 13:51:28 -0700 (PDT)
Date:   Fri, 05 May 2023 13:51:28 -0700
In-Reply-To: <0000000000007bedb605f119ed9f@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000000964605faf87416@google.com>
Subject: Re: [syzbot] [reiserfs?] possible deadlock in open_xa_dir
From:   syzbot <syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com>
To:     hdanton@sina.com, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, paul@paul-moore.com,
        reiserfs-devel@vger.kernel.org, roberto.sassu@huawei.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
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

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14403182280000
start commit:   3c4aa4434377 Merge tag 'ceph-for-6.4-rc1' of https://githu..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=16403182280000
console output: https://syzkaller.appspot.com/x/log.txt?x=12403182280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=73a06f6ef2d5b492
dashboard link: https://syzkaller.appspot.com/bug?extid=8fb64a61fdd96b50f3b8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12442414280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=176a7318280000

Reported-by: syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com
Fixes: d82dcd9e21b7 ("reiserfs: Add security prefix to xattr name in reiserfs_security_write()")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
