Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FDCC3EFE89
	for <lists+reiserfs-devel@lfdr.de>; Wed, 18 Aug 2021 10:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238369AbhHRIBw (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 18 Aug 2021 04:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237348AbhHRIBw (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 18 Aug 2021 04:01:52 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51BEDC061764
        for <reiserfs-devel@vger.kernel.org>; Wed, 18 Aug 2021 01:01:18 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id k14so1421617pga.13
        for <reiserfs-devel@vger.kernel.org>; Wed, 18 Aug 2021 01:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=RZd2EPpa+0IzGiASvV0USnaW0JFO1iWZeUGWtK85EDw=;
        b=VVMbXUqIgAFUxBF3iu4GRac25drCIRkTO5lr21zo8yicaEp49wRqDjQhXEbK3cSFoz
         ZhshX9J5AC3zP81G/r6K/f7KKTYyp0woBCuCS6g7Z8cPlv5255hpPfb2NAtpwd4ZCRkB
         DuZcib+DjJyfZ6EdcIUT9g10lmSPT0UtyFI38VZo5+fflexR2oXbrdN/nyMMpeaAb7Y4
         kutgstIr4d+ftUutRUStnphBBRdEu5kclr83jejQANi8xrD4PviDeFOI3FhCXvhx3hom
         aohju0mVAPNRaoZIDjeMtU1OlZhFeeB/zCzUS1H2+dGoR537zyfRjbySdO9Dhhkl0z99
         8jfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=RZd2EPpa+0IzGiASvV0USnaW0JFO1iWZeUGWtK85EDw=;
        b=rIgJ9fRcVT58iDvq01WQKJmqbSoBqdtZrbVpopSbEzOJLk3AxpH6zZt2EmD2BT6e8R
         uzc9UPsX/QmDGReR5gQ8onN0t/tcIYdEwgWSG55DzgVCzZGnIXq9aP388aNEMZIcPXc+
         Z4e5tsFPfAgf71mlKZ33GfKYiGbIebu8QJyjBD54WxV7+gKIGV09g1zaLxdxudQOVMQK
         detqKyNHSUfNkiHVU7/EPWDHum64SK5duL1K2k+7UuR7HUik5Byd75ant5ffplOnmpG3
         FFhL+8MTPRbYcr4Bzk4wlKz506fK1TWYHJ7npJXzjmAjVXQcantQZ2Q2kc3bJwWviVaI
         qg/g==
X-Gm-Message-State: AOAM530YcpVFG+5+5oLACyJsjcbdOjDA9NvdkOfOmm2nahO4fAndiuCW
        Kc2NQMuEAn9bt1x3QFvB6Kg=
X-Google-Smtp-Source: ABdhPJw/rK5zhsu14zVL+4Ha1zRQ7j9jkQu880LHE1l2xsV4ZyZvVmeW8Ip0V9C2RNr26OpbhOQvOA==
X-Received: by 2002:aa7:84c5:0:b0:3e1:16bb:6e22 with SMTP id x5-20020aa784c5000000b003e116bb6e22mr8133574pfn.32.1629273677874;
        Wed, 18 Aug 2021 01:01:17 -0700 (PDT)
Received: from localhost.localdomain ([42.194.241.189])
        by smtp.gmail.com with ESMTPSA id fv2sm4212820pjb.53.2021.08.18.01.01.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Aug 2021 01:01:17 -0700 (PDT)
From:   tcs.kernel@gmail.com
X-Google-Original-From: tcs_kernel@tencent.com
To:     christian.brauner@ubuntu.com, mszeredi@redhat.com,
        jamorris@linux.microsoft.com, gustavoars@kernel.org,
        reiserfs-devel@vger.kernel.org
Cc:     Haimin Zhang <tcs_kernel@tencent.com>
Subject: [PATCH] fs: reiserfs: fix NULL pointer dereference in
Date:   Wed, 18 Aug 2021 16:01:07 +0800
Message-Id: <1629273667-7687-1-git-send-email-tcs_kernel@tencent.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

From: Haimin Zhang <tcs_kernel@tencent.com> 

If root_inode->i_op is reiserfs_special_inode_operations
reiserfs_special_inode_operations doesn't implement the lookup callback
function,resulting an NULL pointer when the reiserfs_lookup_privroot() 
function was called.

Call Trace:
 __lookup_slow+0x267/0x490 build/../fs/namei.c:1646
 lookup_one_len+0x163/0x190 build/../fs/namei.c:2663
 reiserfs_lookup_privroot+0x92/0x290 build/../fs/reiserfs/xattr.c:980
 reiserfs_fill_super+0x1f2a/0x2d80 build/../fs/reiserfs/super.c:2176
 mount_bdev+0x33d/0x410 build/../fs/super.c:1368
 legacy_get_tree+0x103/0x210 build/../fs/fs_context.c:610
 vfs_get_tree+0x86/0x2f0 build/../fs/super.c:1498
 do_new_mount build/../fs/namespace.c:2905 [inline]
 path_mount+0x688/0x1d10 build/../fs/namespace.c:3235
 do_mount+0xf1/0x110 build/../fs/namespace.c:3248
 __do_sys_mount build/../fs/namespace.c:3456 [inline]
 __se_sys_mount build/../fs/namespace.c:3433 [inline]
 __x64_sys_mount+0x1d5/0x220 build/../fs/namespace.c:3433
 do_syscall_x64 build/../arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x34/0xb0 build/../arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Reported-by: syzbot+11c49c...@syzkaller.appspotmail.com
Signed-off-by: Haimin Zhang <tcs_kernel@tencent.com>
---
 fs/reiserfs/namei.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/reiserfs/namei.c b/fs/reiserfs/namei.c
index 3d7a35d..947b51b 100644
--- a/fs/reiserfs/namei.c
+++ b/fs/reiserfs/namei.c
@@ -350,6 +350,12 @@ static int reiserfs_find_entry(struct inode *dir, const char *name, int namelen,
 	}			/* while (1) */
 }
 
+static struct dentry *reiserfs_noop_lookup(struct inode *dir, struct dentry *dentry,
+				      unsigned int flags)
+{
+	return ERR_PTR(-ENOENT);
+}
+
 static struct dentry *reiserfs_lookup(struct inode *dir, struct dentry *dentry,
 				      unsigned int flags)
 {
@@ -1680,6 +1686,7 @@ static int reiserfs_rename(struct user_namespace *mnt_userns,
  * special file operations.. just xattr/acl stuff
  */
 const struct inode_operations reiserfs_special_inode_operations = {
+	.lookup = reiserfs_noop_lookup,
 	.setattr = reiserfs_setattr,
 	.listxattr = reiserfs_listxattr,
 	.permission = reiserfs_permission,
-- 
1.8.3.1

