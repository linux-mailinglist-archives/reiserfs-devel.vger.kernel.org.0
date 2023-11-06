Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A70F7E302E
	for <lists+reiserfs-devel@lfdr.de>; Mon,  6 Nov 2023 23:54:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233236AbjKFWyD (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 6 Nov 2023 17:54:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233225AbjKFWyC (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 6 Nov 2023 17:54:02 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2030C10D
        for <reiserfs-devel@vger.kernel.org>; Mon,  6 Nov 2023 14:54:00 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5a7eef0b931so59446027b3.0
        for <reiserfs-devel@vger.kernel.org>; Mon, 06 Nov 2023 14:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1699311239; x=1699916039; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNKybQWPnk2Ce8tjd4ygA9PCEAcyMepwChQ21Wxo49Q=;
        b=eS+gVTHOwbaUhdRE2dcKKt55Br7rVqShiRidyy+yAC/sib5+Y6z+jJw/7zz3H/A/iD
         nZC/jSSLjzpON8CNt/CNCVYA94y7GJHmvfJ4reO1gV8DgSPqQuB7jclC9+ea7bA1dhTz
         2Wu3MXwztn6JtVVxfUMNOgf+OGd0YOcoe1SCn/FlLa9qNPeg5dT5BD052XoKfYBTevGn
         r8uVAGE1GxzFO2UveSBXaRrEQozSOi/tWLKONU1bxpCjxNAn2JsRs4KrP3nrV+mAGnpJ
         E0ITzg0NO59aaBfWzLapGQnFpcLhZa+ktVAnw8QLqh1wRqMdtIVXNet9NOds6NmUXXI+
         V0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699311239; x=1699916039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vNKybQWPnk2Ce8tjd4ygA9PCEAcyMepwChQ21Wxo49Q=;
        b=gWOSPADlUhzL406+hD7Y0wrUBtuT8E6NM6QssWLZpgkZwmvU+KF2YZD9D9M+RrOB4o
         esOWNIneAg7/SIDozdw+OQk2NzLbOcrB9GbsyHvNXGkU+87ImEHzxzfCJFRp55l4Fr0Y
         MTttCqtl4Zx/Vtq/vGAzE4mEJ74OKS/5on/7PTHEVXrAaDY7nh+haVZ85iHktO8Wtmpm
         /LRCB5uUsJBxB00fxeY8LEa3M7beDt0FCEBmQZv9iuqbdO1T6PsGrkuP7aTP6PI/T2J3
         8ArePWsJPf2TQZ3hKlPX7uPbYdChVZA3ccIW6PIHOC/f2rHMtofeF/LMzknMyIQfdw5a
         t/Zw==
X-Gm-Message-State: AOJu0YyU0eaANRQ8gdTXOeLXCzS/17kbbMnczKJbjmfiYEUSo34dWj5+
        YTG/X028+zQS0s62kBVZ/ieFEMggpxhUutl4omfu
X-Google-Smtp-Source: AGHT+IHZtlkskeIKbm+EW0uQZXkwuE4jHHoiiwhdcK0HgQeq6o4GqdUA6KYYEVVg4c/cz32HA+X7WbYUN1vLqa6WKCE=
X-Received: by 2002:a25:d186:0:b0:d9a:3bf1:35e9 with SMTP id
 i128-20020a25d186000000b00d9a3bf135e9mr30012463ybg.3.1699311239327; Mon, 06
 Nov 2023 14:53:59 -0800 (PST)
MIME-Version: 1.0
References: <000000000000cfe6f305ee84ff1f@google.com> <000000000000a8d8e7060977b741@google.com>
In-Reply-To: <000000000000a8d8e7060977b741@google.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Mon, 6 Nov 2023 17:53:48 -0500
Message-ID: <CAHC9VhTFs=AHtsdzas-XXq2-Ub4V9Tbkcp4_HBspmGaARzWanw@mail.gmail.com>
Subject: Re: [syzbot] [reiserfs?] possible deadlock in reiserfs_dirty_inode
To:     syzbot <syzbot+c319bb5b1014113a92cf@syzkaller.appspotmail.com>
Cc:     hdanton@sina.com, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org,
        roberto.sassu@huawei.com, syzkaller-bugs@googlegroups.com,
        syzkaller@googlegroups.com, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Mon, Nov 6, 2023 at 3:34=E2=80=AFAM syzbot
<syzbot+c319bb5b1014113a92cf@syzkaller.appspotmail.com> wrote:
>
> syzbot has bisected this issue to:
>
> commit d82dcd9e21b77d338dc4875f3d4111f0db314a7c
> Author: Roberto Sassu <roberto.sassu@huawei.com>
> Date:   Fri Mar 31 12:32:18 2023 +0000
>
>     reiserfs: Add security prefix to xattr name in reiserfs_security_writ=
e()
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D14d0b78768=
0000
> start commit:   90b0c2b2edd1 Merge tag 'pinctrl-v6.7-1' of git://git.kern=
e..
> git tree:       upstream
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D16d0b78768=
0000
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D12d0b78768000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D93ac5233c1382=
49e
> dashboard link: https://syzkaller.appspot.com/bug?extid=3Dc319bb5b1014113=
a92cf
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D113f3717680=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D154985ef68000=
0
>
> Reported-by: syzbot+c319bb5b1014113a92cf@syzkaller.appspotmail.com
> Fixes: d82dcd9e21b7 ("reiserfs: Add security prefix to xattr name in reis=
erfs_security_write()")
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisect=
ion

Hi Roberto,

I know you were looking at this over the summer[1], did you ever find
a resolution to this?  If not, what do you think of just dropping
security xattr support on reiserfs?  Normally that wouldn't be
something we could consider, but given the likelihood that this hadn't
been working in *years* (if ever), and reiserfs is deprecated, I think
this is a viable option if there isn't an obvious fix.

[1] https://lore.kernel.org/linux-security-module/CAHC9VhTM0a7jnhxpCyonepcf=
WbnG-OJbbLpjQi68gL2GVnKSRg@mail.gmail.com/

--=20
paul-moore.com
