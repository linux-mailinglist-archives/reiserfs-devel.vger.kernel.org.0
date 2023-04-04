Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F7926D6CB7
	for <lists+reiserfs-devel@lfdr.de>; Tue,  4 Apr 2023 20:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235724AbjDDS4b (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 4 Apr 2023 14:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235970AbjDDS4a (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 4 Apr 2023 14:56:30 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDC2E1991
        for <reiserfs-devel@vger.kernel.org>; Tue,  4 Apr 2023 11:56:28 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-544f7c176easo633149507b3.9
        for <reiserfs-devel@vger.kernel.org>; Tue, 04 Apr 2023 11:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1680634588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuYMP9oERucJ/O/ah5M668zvZcUxIDKJFH+6ndYhYhw=;
        b=PQaRIIZkpGihz6wkjt6tSlzCY4838BGeVloFrkgUy+TiPjGJbg3Xju0fSOz0ugEkLa
         4M8JsBMaHjY8ojIZiBKrw25TFChUm/J4/9aimvN5zAF5yyzAJlL2UfxkMYrv/zAJW/nA
         jwyh8THBan3RpnhNHPD9gjX0xuKBf51UcePGUO7o0LaDMyF74f8YReyFbAXUUPkQpImX
         DC76fVSQD8bpquZb3y4h8S8ed1r8VitaUMVJbkb5wVqkWxpxh/fzAO9pT/D1XDoekIuz
         qjzS8hMqbNGhmWQaD035n8+tMbSOtDVlAbMYXFICMdWGmUL28QNylVAGMUDdcFBiprXN
         MQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680634588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yuYMP9oERucJ/O/ah5M668zvZcUxIDKJFH+6ndYhYhw=;
        b=k7vYWRA6+M4gx4PywY7MroSiTDbmaI2LLHgggXwqO7u8VeA0PirZWvVn5u9cTKQulF
         ZKYzfBBKp1DaCHrth2pYuziNOiUrfrakjMVUY5Uhx8q6ZqtTyG75uOdHYRUZRSkrbMLk
         Zdo/uEljPjk+kbfAYDQEoZghb0aU/0ywlGXZaiB6xMZGJ/EKR6lRW5oHYwa6BSGxEP2o
         nUIgqgtyNUot4tRiZUEZWibzrROxsRRiK25s/b0EzZgIXOz5Ay97jnt/MnoxXjJ1hZ9k
         PcfEBpqXdz73uLVxNdWkePZdkIFsoBJkB7kgC8s+9f/wU0x7W7G1t05x7lrO1DZjwBhY
         jpOw==
X-Gm-Message-State: AAQBX9fA/koxFgzYNmJ/vZFlqKOJtCJQsiCtMUx9AggPsPjYilo2pUUM
        SGokCft4S3DGxq0jAOAgyma5hTkU2+0gjIXKOwcF
X-Google-Smtp-Source: AKy350YxxXydXcJ3GRJ0BEKkYqhynh4SF2ERZFWAntaIKyMLNleszHadlV51xUjwR+gGb8zwomvEMLjrI4Z2QWit7js=
X-Received: by 2002:a81:b389:0:b0:544:cd0e:2f80 with SMTP id
 r131-20020a81b389000000b00544cd0e2f80mr1986292ywh.8.1680634587849; Tue, 04
 Apr 2023 11:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230331123221.3273328-1-roberto.sassu@huaweicloud.com> <20230331123221.3273328-4-roberto.sassu@huaweicloud.com>
In-Reply-To: <20230331123221.3273328-4-roberto.sassu@huaweicloud.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 4 Apr 2023 14:56:17 -0400
Message-ID: <CAHC9VhSMdrPP6+9cmhAU1=tDikJ5Y8_mJEORdqiaJw3pQuFDDg@mail.gmail.com>
Subject: Re: [PATCH v10 3/4] evm: Align evm_inode_init_security() definition
 with LSM infrastructure
To:     Roberto Sassu <roberto.sassu@huaweicloud.com>
Cc:     zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, jmorris@namei.org,
        serge@hallyn.com, stephen.smalley.work@gmail.com,
        eparis@parisplace.org, casey@schaufler-ca.com,
        reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        bpf@vger.kernel.org, kpsingh@kernel.org, keescook@chromium.org,
        nicolas.bouchinet@clip-os.org,
        Roberto Sassu <roberto.sassu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Fri, Mar 31, 2023 at 8:33=E2=80=AFAM Roberto Sassu
<roberto.sassu@huaweicloud.com> wrote:
>
> From: Roberto Sassu <roberto.sassu@huawei.com>
>
> Change the evm_inode_init_security() definition to align with the LSM
> infrastructure. Keep the existing behavior of including in the HMAC
> calculation only the first xattr provided by LSMs.
>
> Changing the evm_inode_init_security() definition requires passing the
> xattr array allocated by security_inode_init_security(), and the number o=
f
> xattrs filled by previously invoked LSMs.
>
> Use the newly introduced lsm_get_xattr_slot() to position EVM correctly i=
n
> the xattrs array, like a regular LSM, and to increment the number of fill=
ed
> slots. For now, the LSM infrastructure allocates enough xattrs slots to
> store the EVM xattr, without using the reservation mechanism.
>
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> ---
>  include/linux/evm.h               | 13 +++++++------
>  security/integrity/evm/evm_main.c | 16 ++++++++++------
>  security/security.c               |  6 +++---
>  3 files changed, 20 insertions(+), 15 deletions(-)

This seems reasonable to me, but I'll want to see a sign-off from Mimi
for the EVM bits.  Same thing for patch 4/4.

--=20
paul-moore.com
