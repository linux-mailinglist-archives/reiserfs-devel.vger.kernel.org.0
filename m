Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80AEA745319
	for <lists+reiserfs-devel@lfdr.de>; Mon,  3 Jul 2023 01:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbjGBX6h (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sun, 2 Jul 2023 19:58:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbjGBX6g (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 2 Jul 2023 19:58:36 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A695E1B7
        for <reiserfs-devel@vger.kernel.org>; Sun,  2 Jul 2023 16:58:35 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b8161f564dso238265ad.1
        for <reiserfs-devel@vger.kernel.org>; Sun, 02 Jul 2023 16:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688342315; x=1690934315;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lWnMPQFBusztmkgKaUES3szXF6Iacc01LX/0q3rq/lM=;
        b=krB0ZPVH0yXPp1f8gp+inqaoGKas63QNUcaTPlLAWoYl0M8qRtD6CqXQqpOw08AlNB
         FM2FVIH+pzTJRFvFcSKbSCO9IQpU1RBInDJkeWrD5A2JA1gr4Rfx4OvyINOrc4FY5YHJ
         FYKNyS11vuEQ0ytJp/1RSI0y6SJ4Vj8M/RoSutwymvzMeGyhPTOYHwCEYX8FVKZTXNDr
         yWDsSCWmGMgKLvPmJismvKx4/pAhzKnwu/khgPcIwSPfhk833L8KJDYIGVzqravxYuFa
         JS/KC0U1ZDDAw5WzBdkA6/+P/vOKYu+ni6H3Qu+Qvn4dyw1yZphut2rWRPV/8s78/feV
         QTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688342315; x=1690934315;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lWnMPQFBusztmkgKaUES3szXF6Iacc01LX/0q3rq/lM=;
        b=NYol4MkykkhazGJ+hOiv4295V/uV1s0uM18acOBgwjmAdg3CtfSAjyFy6qBX6SE7hG
         SXv4pObYaSNtvsMrr1Uup2NPefrW+qPVU/cs9woKeddDDQyhR2TeJOhWZabx9aErx19k
         rrHkx7p4Fhpf0YJi2VxvUmV4tfgBJta5NfN3WTZwsN/CauDA+rudQcPrD61iz5llJisu
         IN6cuTmP5yqxCbPQmXv9E7z6XG5q23cz9PGC6cVnidL2fJF1ptMBer3Qa9tuINHARoiJ
         Eln8QpfgnjXGDl1aCZLEmHz92UJCu5kn1eEw5gFZ/6LcMv5pCmrXlju8jF65GSGIMLfK
         fGuA==
X-Gm-Message-State: ABy/qLbn9F0y0ZYX9nfp3AbL0/T5msiIJstdOcR/8GCCwD78jBQcRpMw
        MugxDzxBRfS+7ds1qo7DhNXSEQ==
X-Google-Smtp-Source: APBJJlErDsJbZ3q3RStcfVbMiFG++lkuYVeigX0nYK2H9tYr2UfXpjwbCeKSIC2Ce0DGR3hR7bDipQ==
X-Received: by 2002:a17:903:41c7:b0:1b3:c62d:71c7 with SMTP id u7-20020a17090341c700b001b3c62d71c7mr287654ple.23.1688342314741;
        Sun, 02 Jul 2023 16:58:34 -0700 (PDT)
Received: from [2620:0:1008:15:f9d4:d371:9d50:fcd6] ([2620:0:1008:15:f9d4:d371:9d50:fcd6])
        by smtp.gmail.com with ESMTPSA id k2-20020a17090a4c8200b002609cadc56esm15172172pjh.11.2023.07.02.16.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 16:58:34 -0700 (PDT)
Date:   Sun, 2 Jul 2023 16:58:33 -0700 (PDT)
From:   David Rientjes <rientjes@google.com>
To:     syzbot <syzbot+cf0693aee9ea61dda749@syzkaller.appspotmail.com>
cc:     42.hyeyoo@gmail.com, Andrew Morton <akpm@linux-foundation.org>,
        cl@linux.com, iamjoonsoo.kim@lge.com, keescook@chromium.org,
        linux-fsdevel@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        penberg@kernel.org, reiserfs-devel@vger.kernel.org,
        roman.gushchin@linux.dev, syzkaller-bugs@googlegroups.com,
        Vlastimil Babka <vbabka@suse.cz>, Jan Kara <jack@suse.cz>
Subject: Re: [syzbot] [mm?] [reiserfs?] kernel panic: stack is corrupted in
 ___slab_alloc
In-Reply-To: <0000000000002373f005ff843b58@google.com>
Message-ID: <1bb83e9d-6d7e-3c80-12f6-847bf2dc865e@google.com>
References: <0000000000002373f005ff843b58@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Sun, 2 Jul 2023, syzbot wrote:

> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    e8f75c0270d9 Merge tag 'x86_sgx_for_v6.5' of git://git.ker..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=168b84fb280000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=a98ec7f738e43bd4
> dashboard link: https://syzkaller.appspot.com/bug?extid=cf0693aee9ea61dda749
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10310670a80000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1220c777280000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/f27c1d41217a/disk-e8f75c02.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/843ae5d5c810/vmlinux-e8f75c02.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/da48bc4c0ec1/bzImage-e8f75c02.xz
> mounted in repro: https://storage.googleapis.com/syzbot-assets/658601e354e4/mount_0.gz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+cf0693aee9ea61dda749@syzkaller.appspotmail.com
> 
> Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: ___slab_alloc+0x12c3/0x1400 mm/slub.c:3270
> CPU: 0 PID: 5009 Comm: syz-executor248 Not tainted 6.4.0-syzkaller-01406-ge8f75c0270d9 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/27/2023
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:88 [inline]
>  dump_stack_lvl+0xd9/0x150 lib/dump_stack.c:106
>  panic+0x686/0x730 kernel/panic.c:340
>  __stack_chk_fail+0x19/0x20 kernel/panic.c:759
>  ___slab_alloc+0x12c3/0x1400 mm/slub.c:3270
> 

This is happening during while mounting reiserfs, so I'm inclined to think 
it's more of a reisterfs issue than a slab allocator issue :/

> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the bug is already fixed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
> 
> If you want to change bug's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the bug is a duplicate of another bug, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup
> 
