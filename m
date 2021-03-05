Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00AEA32E241
	for <lists+reiserfs-devel@lfdr.de>; Fri,  5 Mar 2021 07:31:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbhCEGbh (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 5 Mar 2021 01:31:37 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:53466 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbhCEGbg (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 5 Mar 2021 01:31:36 -0500
Received: from fsav302.sakura.ne.jp (fsav302.sakura.ne.jp [153.120.85.133])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 1256VUkm050664;
        Fri, 5 Mar 2021 15:31:30 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav302.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav302.sakura.ne.jp);
 Fri, 05 Mar 2021 15:31:30 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav302.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 1256VTVJ050660
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 5 Mar 2021 15:31:30 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: [PATCH (resend)] reiserfs: update reiserfs_xattrs_initialized()
 condition
To:     Jan Kara <jack@suse.cz>
Cc:     reiserfs-devel@vger.kernel.org
References: <000000000000f5be7f05afcf862a@google.com>
 <20210221050957.3601-1-penguin-kernel@I-love.SAKURA.ne.jp>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <700fcc0a-0da7-6d70-620e-af0ed956cd85@i-love.sakura.ne.jp>
Date:   Fri, 5 Mar 2021 15:31:26 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210221050957.3601-1-penguin-kernel@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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


