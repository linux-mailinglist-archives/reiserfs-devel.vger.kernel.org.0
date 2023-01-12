Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38DB6667D3F
	for <lists+reiserfs-devel@lfdr.de>; Thu, 12 Jan 2023 19:02:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238056AbjALSCE (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 12 Jan 2023 13:02:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239769AbjALSBQ (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 12 Jan 2023 13:01:16 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA2AB13D18
        for <reiserfs-devel@vger.kernel.org>; Thu, 12 Jan 2023 09:22:08 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id v23so19801813pju.3
        for <reiserfs-devel@vger.kernel.org>; Thu, 12 Jan 2023 09:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0xDr4QknDNxPi2cT8FrUuwNvsQNO379ZboIpi4mwvIk=;
        b=Fiy522RNvvYxq4nWHpNZeEHiH1/P9P8SLmCZIIqj2T5uix0e9SLinDtq8qjCWr3RvO
         M++tjLHwR63OcuftzaEi1ChHQB/nAHWAlphG1r3019blrCX5ANTv/XcoJVZFBBzi6aUe
         MvLJxuqoSKKFHXXwDx19ZDLhPn5pfMZSOuEkIskLBENuvcoYcn3D/7ZnF+V0JdJj2ozl
         w3ZMpd9CGXnSWHPtu6A4IicaLCensH+4iBwQSp85GIynWT/+gTgkDRA2xQ+ry9YEolgp
         /TFO++DWjtppIUWlzcQtHMiWEruGd66Jn+076IgtMtnBQOtWeZNPvs9hxtIGRLFYmktV
         Etnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0xDr4QknDNxPi2cT8FrUuwNvsQNO379ZboIpi4mwvIk=;
        b=rKqpzMWzOHi5OGLmu0avf9V9r3DLSL5BPVIfYqqpI8rDLZc3yuuTyvbsvREv2fkL5O
         yqv0wMfU4aViPwnjYGowd0X7c3kjsasLCjNYdlII2b4/LPcXchKDoGwO2UKnnGTXmbIG
         oGPRom+YQvTd0Bpd2tlD0UZ0SVv1Nhu7nNRj16mERcX0FtX0lhMIrL81p7vQQY3jEHwV
         UtvAhn3uKQ8AxatldtayCQGh8nVsUbwklccpLZ9dxhx5a0Y0kCNeXYcCHy41bysxBrNZ
         /I0RnxlL0D9o+DMXDYSUjlggtcp+JUF/SlkUuxsGHEcygporEFUOtbkG4NEW1Os842tt
         Yr4w==
X-Gm-Message-State: AFqh2ko0dIKqfFkA8Mmsfv/KWClh96pxM7Gq98SH7dhBsjmpiqppb9kf
        zX4c2z9JydvPV0aZm1/oSg7/7y0nxZjrRVkeeQUJ
X-Google-Smtp-Source: AMrXdXu2M2VDaYhrvTSfy4I4j0IQ3Wj0M50ON3uTCXgABm7WK5YXNWc5b+Li6BFUEvojgI035C9WkWYZx2mqYyqriPo=
X-Received: by 2002:a17:902:cec8:b0:192:6675:8636 with SMTP id
 d8-20020a170902cec800b0019266758636mr4530544plg.15.1673544128229; Thu, 12 Jan
 2023 09:22:08 -0800 (PST)
MIME-Version: 1.0
References: <20221201104125.919483-1-roberto.sassu@huaweicloud.com>
 <20221201104125.919483-3-roberto.sassu@huaweicloud.com> <6905166125130c22c244ebf234723d1587a01ae8.camel@huaweicloud.com>
In-Reply-To: <6905166125130c22c244ebf234723d1587a01ae8.camel@huaweicloud.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Thu, 12 Jan 2023 12:21:57 -0500
Message-ID: <CAHC9VhRu_pdEur4XDkwMETAQEd-8=13k+qvpMEgW=hiYMCKw2A@mail.gmail.com>
Subject: Re: [PATCH v7 2/6] ocfs2: Switch to security_inode_init_security()
To:     Roberto Sassu <roberto.sassu@huaweicloud.com>
Cc:     mark@fasheh.com, jlbec@evilplan.org, joseph.qi@linux.alibaba.com,
        zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, jmorris@namei.org,
        serge@hallyn.com, stephen.smalley.work@gmail.com,
        eparis@parisplace.org, casey@schaufler-ca.com,
        ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org,
        linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
        linux-kernel@vger.kernel.org, keescook@chromium.org,
        nicolas.bouchinet@clip-os.org,
        Roberto Sassu <roberto.sassu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Tue, Jan 10, 2023 at 3:56 AM Roberto Sassu
<roberto.sassu@huaweicloud.com> wrote:
> On Thu, 2022-12-01 at 11:41 +0100, Roberto Sassu wrote:
> > From: Roberto Sassu <roberto.sassu@huawei.com>
> >
> > In preparation for removing security_old_inode_init_security(), switch to
> > security_inode_init_security().
> >
> > Extend the existing ocfs2_initxattrs() to take the
> > ocfs2_security_xattr_info structure from fs_info, and populate the
> > name/value/len triple with the first xattr provided by LSMs.
>
> Hi Mark, Joel, Joseph
>
> some time ago I sent this patch set to switch to the newer
> function security_inode_init_security(). Almost all the other parts of
> this patch set have been reviewed, and the patch set itself should be
> ready to be merged.
>
> I kindly ask if you could have a look at this patch and give your
> Reviewed-by, so that Paul could take the patch set.

I've been pushing to clean up some of the LSM interfaces to try and
simplify things and remove as many special cases as possible,
Roberto's work in this patchset is part of that.  I would really
appreciate it if the vfs/ocfs2 folks could give patch 2/6 a quick look
to make sure you are okay with the changes.

I realize that the various end-of-year holidays tend to slow things
down a bit, but this patchset has been on the lists for over a month
now; if I don't hear anything in the next week or two I'll assume you
folks are okay with these patches ...

-- 
paul-moore.com
