Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E30A6C3C98
	for <lists+reiserfs-devel@lfdr.de>; Tue, 21 Mar 2023 22:26:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbjCUV02 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 21 Mar 2023 17:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbjCUV01 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 21 Mar 2023 17:26:27 -0400
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18FA15708F
        for <reiserfs-devel@vger.kernel.org>; Tue, 21 Mar 2023 14:26:24 -0700 (PDT)
Received: by mail-io1-f69.google.com with SMTP id i2-20020a5d9e42000000b0074cfcc4ed07so8642122ioi.22
        for <reiserfs-devel@vger.kernel.org>; Tue, 21 Mar 2023 14:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679433983;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C+FYNnqKd+w1ZGDSpw0zb6Lp4HM2HTikzf97IDwlhu4=;
        b=Jwy+FJu1FwGLnap5fZhDPRwVkA8jiPYgMq4Zhj6HTmh7Lc7dTRa09PPryYFUugc0nt
         KbewUwjrr9Ne0wOjg/hEmvkodc2mm2fyr5X2oBtE726L5A3NbfMJQ7cwpwTZJIn5DNZ2
         j/p8O5hZHAiE/+5QA7Nl/jxqEzblYclp0pRKCWwc3uIueHp8ZJMVB4aJDIydhYUW1/6F
         D9DQ+jiEoVVyyJ+pwlgmj0KgAh4p4o3Btkzm/SsankEaxL/52BCie+vnAnXZMzYpiQFB
         2JB0ailvAm2bzTYjPRXa2q2HsaCfQGCyL9/hHKsCluC4eG4BgMPzAlUSPQpfVscaVhMM
         aEXQ==
X-Gm-Message-State: AO0yUKVOr0OUDxpx3lb5aYH2/Ug0SV9Pfv2trJpoPV+sWGIwu/acZEQ6
        26pvXlWa1NWu2vO1uMfE5NAxOCUrzQsdUigZSEU1EADyPlkL
X-Google-Smtp-Source: AK7set8j1wnd0RNetmYMJ/6UVm+vkodHnklVedOj+4iGTAzRcSeU6bH9Zrt6hOlJcbmSWyRb6BJUUARVYMGbJfml75OIIWH9dC2/
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:f13:b0:310:fc49:1d9 with SMTP id
 x19-20020a056e020f1300b00310fc4901d9mr1464283ilj.6.1679433983388; Tue, 21 Mar
 2023 14:26:23 -0700 (PDT)
Date:   Tue, 21 Mar 2023 14:26:23 -0700
In-Reply-To: <00000000000022a65705ec7f923c@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000000f2d005f76fb25e@google.com>
Subject: Re: [syzbot] [reiserfs?] kernel BUG in do_journal_begin_r
From:   syzbot <syzbot+2da5e132dd0268a9c0e4@syzkaller.appspotmail.com>
To:     akpm@linux-foundation.org, axboe@kernel.dk, bvanassche@acm.org,
        idosch@nvidia.com, jack@suse.cz, jacob.e.keller@intel.com,
        jiri@nvidia.com, jlayton@kernel.org, kuba@kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        neilb@suse.de, pabeni@redhat.com, reiserfs-devel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com, willy@infradead.org,
        yi.zhang@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.1 required=5.0 tests=FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

syzbot suspects this issue was fixed by commit:

commit b20b8aec6ffc07bb547966b356780cd344f20f5b
Author: Ido Schimmel <idosch@nvidia.com>
Date:   Wed Feb 15 07:31:39 2023 +0000

    devlink: Fix netdev notifier chain corruption

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=139af019c80000
start commit:   033c40a89f55 Merge tag 'apparmor-v6.2-rc9' of git://git.ke..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=fe56f7d193926860
dashboard link: https://syzkaller.appspot.com/bug?extid=2da5e132dd0268a9c0e4
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1264a8d7480000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: devlink: Fix netdev notifier chain corruption

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
