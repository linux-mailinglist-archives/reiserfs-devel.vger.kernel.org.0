Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D958C6C741C
	for <lists+reiserfs-devel@lfdr.de>; Fri, 24 Mar 2023 00:37:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbjCWXhV (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 23 Mar 2023 19:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230416AbjCWXhV (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 23 Mar 2023 19:37:21 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D7B7241E3
        for <reiserfs-devel@vger.kernel.org>; Thu, 23 Mar 2023 16:37:19 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id j7so308507ybg.4
        for <reiserfs-devel@vger.kernel.org>; Thu, 23 Mar 2023 16:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1679614638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H5DqnFNdwoRsvRD9gY7AVflhKHmqWJvLpG3CELYJwy4=;
        b=MvmzhjViCPcj6Nhc+3xUZBlHLNZc4r6lPParcd8U1SVaNbw7wKC7ctiSLNtETXsbZR
         SfRHOqCYRqd1uqAwWuo9yiMFLI0eaNDRiZlTA6cLo/WgAikQelZ1tHGFpIZZPWcjT35o
         RAn0baZ5sYIIGCdLt+R9DAyKHRnnJXL0EwkWhxKR9y3ewPQOPLqgHbZlIjayJV65Q4zv
         5Lw4K4PXz4x9XgSVjgC27sSASSJW5nHoZurlVklnEY9HZZJhC9oqu0bxuU17lvaxiU3a
         kl+1LdimUZ3SdVmvRmCVK2t7FT3bIF4MTO+fvC6g4axqIpSiLufJkJgHH86Rqinq42Ye
         nNDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679614638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H5DqnFNdwoRsvRD9gY7AVflhKHmqWJvLpG3CELYJwy4=;
        b=oNFQ0ZMuPZGmpkRraMJUO7J08R4QRQhP7DnCybag/mGDsiZBBdD46bGnUjwneg8Jtf
         uhRQ7urUzKc6Gl10pyyfCVxZPfrpMfvYTiz2ltrQsRnMZMBOdra1mHBtoyH0BO6yDtPh
         rcrfAj8O5o2vFU5xkuito10CNl/ThMRan7RZ/wkfnyFi1T+rJEAcjkMBryzIiUx8/VWq
         oYYYBuMVKRE9BKa2F6w+KcDlsDDzzBfKuGaCxrAlkBfrI2PfjHpXmXQQ3DVsYJ4aXKru
         biIhliZWh0nOPDZr6RL+2PVYdVPA7/HwaQhT9MufCRqh7aSHZ5pKyScZoIMghtCFAwon
         aFSw==
X-Gm-Message-State: AAQBX9dchyMf1MNlcJpd0l3Cyjbsr7VaqNCdpFPeeMOT3lSIq/UZgW2t
        CvhxUTR0c4SQIy3VhU1dajRy97BtDIce0XnMsRCK
X-Google-Smtp-Source: AKy350aKUo52lrEIhVqCcrwLfuJGssfxNEL6IV2NSjb63kt7Z52L3fpiOf67Jiyy9HPq6D2tt3ioTIkNycC6sWUe3fE=
X-Received: by 2002:a05:6902:18c7:b0:b72:fff0:2f7f with SMTP id
 ck7-20020a05690218c700b00b72fff02f7fmr715296ybb.4.1679614638263; Thu, 23 Mar
 2023 16:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230314081720.4158676-1-roberto.sassu@huaweicloud.com> <20230314081720.4158676-3-roberto.sassu@huaweicloud.com>
In-Reply-To: <20230314081720.4158676-3-roberto.sassu@huaweicloud.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Thu, 23 Mar 2023 19:37:07 -0400
Message-ID: <CAHC9VhSPMs6k4zm0rACiZZYuB84Avg9t+AnGBH4F+iiLsNgzkg@mail.gmail.com>
Subject: Re: [PATCH v8 2/6] ocfs2: Switch to security_inode_init_security()
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
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Tue, Mar 14, 2023 at 4:18=E2=80=AFAM Roberto Sassu
<roberto.sassu@huaweicloud.com> wrote:
>
> From: Roberto Sassu <roberto.sassu@huawei.com>
>
> In preparation for removing security_old_inode_init_security(), switch to
> security_inode_init_security().
>
> Extend the existing ocfs2_initxattrs() to take the
> ocfs2_security_xattr_info structure from fs_info, and populate the
> name/value/len triple with the first xattr provided by LSMs.
>
> As fs_info was not used before, ocfs2_initxattrs() can now handle the cas=
e
> of replicating the behavior of security_old_inode_init_security(), i.e.
> just obtaining the xattr, in addition to setting all xattrs provided by
> LSMs.
>
> Supporting multiple xattrs is not currently supported where
> security_old_inode_init_security() was called (mknod, symlink), as it
> requires non-trivial changes that can be done at a later time. Like for
> reiserfs, even if EVM is invoked, it will not provide an xattr (if it is
> not the first to set it, its xattr will be discarded; if it is the first,
> it does not have xattrs to calculate the HMAC on).
>
> Finally, since security_inode_init_security(), unlike
> security_old_inode_init_security(), returns zero instead of -EOPNOTSUPP i=
f
> no xattrs were provided by LSMs or if inodes are private, additionally
> check in ocfs2_init_security_get() if the xattr name is set.
>
> If not, act as if security_old_inode_init_security() returned -EOPNOTSUPP=
,
> and set si->enable to zero to notify to the functions following
> ocfs2_init_security_get() that no xattrs are available.
>
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
> Acked-by: Joseph Qi <joseph.qi@linux.alibaba.com>
> ---
>  fs/ocfs2/namei.c |  2 ++
>  fs/ocfs2/xattr.c | 30 ++++++++++++++++++++++++++----
>  2 files changed, 28 insertions(+), 4 deletions(-)

Merged into lsm/next, thanks.

--=20
paul-moore.com
