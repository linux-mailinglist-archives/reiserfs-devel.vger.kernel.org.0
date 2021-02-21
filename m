Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91636320862
	for <lists+reiserfs-devel@lfdr.de>; Sun, 21 Feb 2021 06:16:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbhBUFMM (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sun, 21 Feb 2021 00:12:12 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:58955 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbhBUFLW (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 21 Feb 2021 00:11:22 -0500
Received: from fsav104.sakura.ne.jp (fsav104.sakura.ne.jp [27.133.134.231])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 11L5A8s5025450;
        Sun, 21 Feb 2021 14:10:08 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav104.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav104.sakura.ne.jp);
 Sun, 21 Feb 2021 14:10:08 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav104.sakura.ne.jp)
Received: from localhost.localdomain (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 11L5A1Ol025332
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Sun, 21 Feb 2021 14:10:08 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To:     Jeff Mahoney <jeffm@suse.com>
Cc:     reiserfs-devel@vger.kernel.org, mudongliangabcd@gmail.com,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        syzbot <syzbot+690cb1e51970435f9775@syzkaller.appspotmail.com>
Subject: [PATCH] reiserfs: update reiserfs_xattrs_initialized() condition
Date:   Sun, 21 Feb 2021 14:09:57 +0900
Message-Id: <20210221050957.3601-1-penguin-kernel@I-love.SAKURA.ne.jp>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <000000000000f5be7f05afcf862a@google.com>
References: <000000000000f5be7f05afcf862a@google.com>
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

syzbot is reporting NULL pointer dereference at reiserfs_security_init()
[1], for commit ab17c4f02156c4f7 ("reiserfs: fixup xattr_root caching") is
assuming that REISERFS_SB(s)->xattr_root != NULL in
reiserfs_xattr_jcreate_nblocks() despite that commit made
REISERFS_SB(sb)->priv_root != NULL && REISERFS_SB(s)->xattr_root == NULL
case possible.

I guess that commit 6cb4aff0a77cc0e6 ("reiserfs: fix oops while creating
privroot with selinux enabled") wanted to check xattr_root != NULL before
reiserfs_xattr_jcreate_nblocks(), for the changelog is talking about the
xattr root.

 The issue is that while creating the privroot during mount
 reiserfs_security_init calls reiserfs_xattr_jcreate_nblocks which
 dereferences the xattr root.  The xattr root doesn't exist, so we get an
 oops.

Therefore, update reiserfs_xattrs_initialized() to check both the privroot
and the xattr root.

[1] https://syzkaller.appspot.com/bug?id=8abaedbdeb32c861dc5340544284167dd0e46cde

Reported-and-tested-by: syzbot <syzbot+690cb1e51970435f9775@syzkaller.appspotmail.com>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Fixes: 6cb4aff0a77cc0e6 ("reiserfs: fix oops while creating privroot with selinux enabled")
---
 fs/reiserfs/xattr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/reiserfs/xattr.h b/fs/reiserfs/xattr.h
index c764352447ba..81bec2c80b25 100644
--- a/fs/reiserfs/xattr.h
+++ b/fs/reiserfs/xattr.h
@@ -43,7 +43,7 @@ void reiserfs_security_free(struct reiserfs_security_handle *sec);
 
 static inline int reiserfs_xattrs_initialized(struct super_block *sb)
 {
-	return REISERFS_SB(sb)->priv_root != NULL;
+	return REISERFS_SB(sb)->priv_root && REISERFS_SB(sb)->xattr_root;
 }
 
 #define xattr_size(size) ((size) + sizeof(struct reiserfs_xattr_header))
-- 
2.18.4

