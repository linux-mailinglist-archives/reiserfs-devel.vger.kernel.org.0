Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41A3770AAC4
	for <lists+reiserfs-devel@lfdr.de>; Sat, 20 May 2023 21:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbjETTrR (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sat, 20 May 2023 15:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbjETTrQ (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sat, 20 May 2023 15:47:16 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6836512A
        for <reiserfs-devel@vger.kernel.org>; Sat, 20 May 2023 12:47:15 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-561d249f045so38281057b3.2
        for <reiserfs-devel@vger.kernel.org>; Sat, 20 May 2023 12:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1684612034; x=1687204034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ue7/cVqXgfA7kNhmyGLtkRQz93W3e/8NXAw0hFFNEc=;
        b=EKM8LbVJ8GwlUQJKb8kSEWKvl/Y3bVBhzHr9a6f3ZaoSou91MibiqYCFMlODRo7jas
         45I+9RQNUhElZgHYD+OzSsLZRLMkdeytpKkSIkQNUzpIJNsFxMyvNRm1pZ7RIlH9FPkz
         braS+fSGZmX+jTylltN6Iws1WIh5kwNAJjF+u1NCrhn89UamcoEwiRyyBFkDHSF9Nv8s
         2lnQ6RxMZt++jZLr0bod3bVekOktBgDImXSp/8f3u0J+HVFSz3P46cpi57IAPxLyxcvg
         mLjIAkFhRsSYeZ2pgTyN5dQxE/mwLil1TjYwghRYsciJIBBY2CCehvaMIwtw7UQ/sPWo
         W6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684612034; x=1687204034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ue7/cVqXgfA7kNhmyGLtkRQz93W3e/8NXAw0hFFNEc=;
        b=ZiwbSR7RKEAFd+6s9tOGdg2b5chXBHvH2ovHBCFXzl/hEOZI902MMc1+WoONXoXfAG
         t1eDJRWqdYcmJBP7uhIQWCs7jZjY8/+cZezwLubX9pCViRWrJh3dSt0Z+BHhXwmA3Ynt
         K+P+WNVSb7cUYKuvmt/gwc4hAOEO+Qgs09gegaYR+4i99/YYp5xrU64b1C5+sybXd+pe
         lPMBKWB6HRC50B8rysy6dt3t5RDFDI/pmrgzSlWM1AIr/neulmkyqOyEqaS3cRD6nmqI
         IBSgkT1rxAWoBFgW60ZEI7MfTIxI+In+GzbRhWSSIMmRUyortzY1rjB7F7XZ72LU5sIF
         c1Mg==
X-Gm-Message-State: AC+VfDwHr3juNMkT4fSu/TAdA1vSVABAP2kitSD8nGKQA8/idRqpBXz1
        kY4WLJZAeDIK4Lh1qvuQ9e9RHUogzhFxqq/feGO1TRFkunHI0Ss=
X-Google-Smtp-Source: ACHHUZ6i5FalX6tGGgh5dqOlKoU/1XDcXIr/+yjKbw4jVsrha8KamVqydhHwlCyxovFMjXNO7bq2qfG3haoVaK+2IAg=
X-Received: by 2002:a0d:e541:0:b0:55a:8226:6192 with SMTP id
 o62-20020a0de541000000b0055a82266192mr7183129ywe.7.1684612034607; Sat, 20 May
 2023 12:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000d368dd05fb5dd7d3@google.com> <a800496b-cae9-81bf-c79e-d8342418c5be@I-love.SAKURA.ne.jp>
In-Reply-To: <a800496b-cae9-81bf-c79e-d8342418c5be@I-love.SAKURA.ne.jp>
From:   Paul Moore <paul@paul-moore.com>
Date:   Sat, 20 May 2023 15:47:03 -0400
Message-ID: <CAHC9VhSEd5BK=ROaN7wMB4WtGMZ=vXz7gQk=xjjn1-mbp_RWSQ@mail.gmail.com>
Subject: Re: [PATCH] reiserfs: Initialize sec->length in reiserfs_security_init().
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     syzbot <syzbot+00a3779539a23cbee38c@syzkaller.appspotmail.com>,
        syzkaller-bugs@googlegroups.com,
        Roberto Sassu <roberto.sassu@huawei.com>,
        Mimi Zohar <zohar@linux.ibm.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        reiserfs-devel@vger.kernel.org, glider@google.com,
        linux-fsdevel@vger.kernel.org,
        linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Thu, May 11, 2023 at 10:49=E2=80=AFAM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> syzbot is reporting that sec->length is not initialized.
>
> Since security_inode_init_security() returns 0 when initxattrs is provide=
d
> but call_int_hook(inode_init_security) returned -EOPNOTSUPP, control will
> reach to "if (sec->length && ...) {" without initializing sec->length.
>
> Reported-by: syzbot <syzbot+00a3779539a23cbee38c@syzkaller.appspotmail.co=
m>
> Closes: https://syzkaller.appspot.com/bug?extid=3D00a3779539a23cbee38c
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Fixes: 52ca4b6435a4 ("reiserfs: Switch to security_inode_init_security()"=
)
> ---
>  fs/reiserfs/xattr_security.c | 1 +
>  1 file changed, 1 insertion(+)

Adding the LSM list to the CC line.

> diff --git a/fs/reiserfs/xattr_security.c b/fs/reiserfs/xattr_security.c
> index 6e0a099dd788..078dd8cc312f 100644
> --- a/fs/reiserfs/xattr_security.c
> +++ b/fs/reiserfs/xattr_security.c
> @@ -67,6 +67,7 @@ int reiserfs_security_init(struct inode *dir, struct in=
ode *inode,
>
>         sec->name =3D NULL;
>         sec->value =3D NULL;
> +       sec->length =3D 0;
>
>         /* Don't add selinux attributes on xattrs - they'll never get use=
d */
>         if (IS_PRIVATE(dir))
> --
> 2.18.4

--=20
paul-moore.com
