Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4930273E708
	for <lists+reiserfs-devel@lfdr.de>; Mon, 26 Jun 2023 19:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230430AbjFZR4P (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 26 Jun 2023 13:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230086AbjFZR4M (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 26 Jun 2023 13:56:12 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F057171B
        for <reiserfs-devel@vger.kernel.org>; Mon, 26 Jun 2023 10:56:01 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f9b9863bfdso10775e9.1
        for <reiserfs-devel@vger.kernel.org>; Mon, 26 Jun 2023 10:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687802160; x=1690394160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KyqId0hy9n8ww7dcYImtfZGCEfGZtufQ6XSWSyML2w=;
        b=UWtA6BfqBZs0V7WU4CJsXSVx/DqY8RLqLfYuMZlc98E6LB0sbyhWRwGzRowIqb3fwb
         5SGmfJui+n46jrgKlCMTEBgO3XWs9VNxTAZO3zuBYF2gYwZA5Un1huHhl/12CyJGGmlc
         f2tbysJD8byNZvDVUxQ7lXacoxcNY9Z9g4/xPmTWLB1BFExo5WHNYu7gXcjGfPM4yT9p
         goqaekJCGUTzkMRrYE7bjxXPE7NTe5SOF/HMjEfz4VbBMv0eXLl/5h6YKAxn5lFuu/Ir
         goXiCjZrHj0/Q7ZIgI/cIaxmhMrZD5uOZoRx2mjLiqcX9KaOBlA+0b0UdDBnWdf9/2bL
         QZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687802160; x=1690394160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+KyqId0hy9n8ww7dcYImtfZGCEfGZtufQ6XSWSyML2w=;
        b=CV6Bml39k/JF+oJYZ9kkZwvHcuZwCncvpgmFvKhvZfRbnRU5HukXmvQHyQJiUkMFsF
         4esQiXaNIrPOOddfjDDoUHAK2kdH+Qvs678cUJIBot75G4l7GRSEym39O7rsdq3WuQeF
         9vLpz+SAKEhsATOOzWJ1iMctmEhD05qGNQqgh1kBZMULPyiVel7fX/EWNBsc3rYRemTO
         lIsy2f1q6V3Lv3/zUFeFgJ0cEC7regllXbeqF30laoYJcIK5GRYteN/pg4v6lm7wHySj
         OTS8xn4dOVqUphZJDygcXt47wpdT7zHUONVHL73TOe55ovQGbVzYm2G/+ytRuBrNLlJ2
         W/nw==
X-Gm-Message-State: AC+VfDw8LsPX2MzQZmCAUtj0N1K2XuKIPboAYPTxCiQM864RArYBby40
        cBZOCFsFsczwRDAo6TiDXFrE8HIqvtDnTBSt4aW5hA==
X-Google-Smtp-Source: ACHHUZ7fOtQqITnjUHE4upIpxoY78QOhNQWgm2nIIVhobHy5VsaUiiRz2ni1BkJ6rj6APH+79eaw69F6OE1YTga4dIY=
X-Received: by 2002:a05:600c:34d5:b0:3f4:fb7:48d4 with SMTP id
 d21-20020a05600c34d500b003f40fb748d4mr228125wmq.3.1687802159671; Mon, 26 Jun
 2023 10:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000302fb805fd180f4a@google.com> <d15cd98d8612e756b4c22a10394d680342512c44.camel@sipsolutions.net>
In-Reply-To: <d15cd98d8612e756b4c22a10394d680342512c44.camel@sipsolutions.net>
From:   Aleksandr Nogikh <nogikh@google.com>
Date:   Mon, 26 Jun 2023 19:55:47 +0200
Message-ID: <CANp29Y6eSpawFhDhv2SW78PKhvCSke8z26=MYNdSu8V4vPSoag@mail.gmail.com>
Subject: Re: [syzbot] [wireless?] [reiserfs?] general protection fault in __iterate_interfaces
To:     Johannes Berg <johannes@sipsolutions.net>
Cc:     syzbot <syzbot+1c54f0eff457978ad5f9@syzkaller.appspotmail.com>,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        pabeni@redhat.com, reiserfs-devel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Fri, Jun 23, 2023 at 1:08=E2=80=AFPM Johannes Berg <johannes@sipsolution=
s.net> wrote:
>
> On Thu, 2023-06-01 at 14:24 -0700, syzbot wrote:
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    715abedee4cd Add linux-next specific files for 20230515
> > git tree:       linux-next
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D13c96725280=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D6a2745d066d=
da0ec
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3D1c54f0eff4579=
78ad5f9
> > compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binu=
tils for Debian) 2.35.2
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D1588e9992=
80000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D1013cbc1280=
000
> >
>
> Looking at the reproducers, there's basically nothing happening in wifi.
>
> So seems likely it's just some really bad memory corruption issue in
> reiserfs?

Looks like that indeed.

Let's update bug's subsystems on the syzbot dashboard:

#syz set subsystems: reiserfs

>
> johannes
>
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/syzkaller-bugs/d15cd98d8612e756b4c22a10394d680342512c44.camel%40sipsoluti=
ons.net.
