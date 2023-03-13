Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 582C46B84E6
	for <lists+reiserfs-devel@lfdr.de>; Mon, 13 Mar 2023 23:42:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbjCMWm2 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 13 Mar 2023 18:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbjCMWm2 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 13 Mar 2023 18:42:28 -0400
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30C07900B1
        for <reiserfs-devel@vger.kernel.org>; Mon, 13 Mar 2023 15:42:20 -0700 (PDT)
Received: by mail-il1-f197.google.com with SMTP id c7-20020a056e020cc700b0032305bab689so2552624ilj.14
        for <reiserfs-devel@vger.kernel.org>; Mon, 13 Mar 2023 15:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678747339;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eByn0hcpMeptzqeE5fW4i3qazh2DBAhZRn02bjUF1dw=;
        b=XSzNwS/tuq7XHi+0fLpqzSrOtLCvvStC+1+MrjNEe3dlg2/q6nGrJVC62FKI+WbUhg
         6Hp8FDXrjhOKnyGXuLMFByRI/TM5wgpdgkdpXjVeswNyIUHIHi+ktCIWC3cMxCKjzo+0
         x7OAY2oQosVpRWOexDALR1XNZthjWhfkd1uIF35AilPMf8qg6c5bFrjqPyRAPtnMnVaX
         gZtxhziKyPv4pq3sY9VfowOr0OLkkVfGCqaaxr5aa7xLLFaZCUDPSDwyoq6tIhRljy6t
         dzPhUVqKgiT2ZshfqE5/Dc29HmCbxnWTm0CBp8d+tP3cyOOCuE7bppiRc617vIcffXen
         IUnw==
X-Gm-Message-State: AO0yUKUjM/BgMJnd+Nw+09N5ZQs5N/AauxeJGpXKNk2qx9hvRKasVFtF
        s1yMznN5p8vxu8fLHLQwReWqhqjAzhA+ejq+hKmyx0Y1Z82K
X-Google-Smtp-Source: AK7set+fnk55krITt4nQ7dp/jxaceUY4R+J29wFnbO5f0kTTIE+CiL6hu7x9nP551hGsq4nMawWE93qeRydgkCVUG8z6POugriqz
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:54f:b0:319:34bf:dbef with SMTP id
 i15-20020a056e02054f00b0031934bfdbefmr648931ils.0.1678747339558; Mon, 13 Mar
 2023 15:42:19 -0700 (PDT)
Date:   Mon, 13 Mar 2023 15:42:19 -0700
In-Reply-To: <000000000000e3af1a05eec2e287@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d7988d05f6cfd256@google.com>
Subject: Re: [syzbot] [reiserfs?] KASAN: use-after-free Read in leaf_paste_in_buffer
From:   syzbot <syzbot+55b82aea13452e3d128f@syzkaller.appspotmail.com>
To:     linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        mingo@kernel.org, peterz@infradead.org,
        reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

syzbot suspects this issue was fixed by commit:

commit 26388a7c353f7b1d3fd8a6df6452fa9773193155
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Thu Jan 12 19:44:03 2023 +0000

    cpuidle,arch: Mark all regular cpuidle_state:: Enter methods __cpuidle

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16fc20aac80000
start commit:   420b2d431d18 Merge tag 'clk-fixes-for-linus' of git://git...
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=6bb1911ff9919df0
dashboard link: https://syzkaller.appspot.com/bug?extid=55b82aea13452e3d128f
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17249347480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14281c1b480000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: cpuidle,arch: Mark all regular cpuidle_state:: Enter methods __cpuidle

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
