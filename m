Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFA2D13CB88
	for <lists+reiserfs-devel@lfdr.de>; Wed, 15 Jan 2020 19:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728896AbgAOSBP (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 15 Jan 2020 13:01:15 -0500
Received: from mx2.suse.de ([195.135.220.15]:60412 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726574AbgAOSBP (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 15 Jan 2020 13:01:15 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 92D32ACD6;
        Wed, 15 Jan 2020 18:01:13 +0000 (UTC)
Received: from starscream.home.jeffm.io (starscream-1.home.jeffm.io [IPv6:2001:559:57b:1::254])
        by mail.home.jeffm.io (Postfix) with ESMTPS id 2F3A68137036;
        Wed, 15 Jan 2020 13:01:09 -0500 (EST)
Received: by starscream.home.jeffm.io (Postfix, from userid 1000)
        id 5A4248D0072; Wed, 15 Jan 2020 13:01:09 -0500 (EST)
From:   jeffm@suse.com
To:     reiserfs-devel@vger.kernel.org, jack@suse.cz
Cc:     brunni@netestate.de, Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfs: fix handling of -EOPNOTSUPP in reiserfs_for_each_xattr
Date:   Wed, 15 Jan 2020 13:00:59 -0500
Message-Id: <20200115180059.6935-1-jeffm@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

From: Jeff Mahoney <jeffm@suse.com>

Commit 60e4cf67a58 (reiserfs: fix extended attributes on the root
directory) introduced a regression open_xa_root started returning
-EOPNOTSUPP but it was not handled properly in reiserfs_for_each_xattr.

When the reiserfs module is built without CONFIG_REISERFS_FS_XATTR,
deleting an inode would result in a warning and chowning an inode
would also result in a warning and then fail to complete.

With CONFIG_REISERFS_FS_XATTR enabled, the xattr root would always be
present for read-write operations.

This commit handles -EOPNOSUPP in the same way -ENODATA is handled.

Fixes: 60e4cf67a58 (reiserfs: fix extended attributes on the root directory)
Reported-by: Michael Brunnbauer <brunni@netestate.de>
Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/xattr.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
index 06497965f0a0..d843c4789ced 100644
--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -319,8 +319,12 @@ static int reiserfs_for_each_xattr(struct inode *inode,
 out_dir:
 	dput(dir);
 out:
-	/* -ENODATA isn't an error */
-	if (err == -ENODATA)
+	/*
+	 * -ENODATA: this object doesn't have any xattrs
+	 * -EOPNOTSUPP: this file system doesn't have xattrs enabled on disk.
+	 * Neither are errors
+	 */
+	if (err == -ENODATA || err == -EOPNOTSUPP)
 		err = 0;
 	return err;
 }
-- 
2.16.4

