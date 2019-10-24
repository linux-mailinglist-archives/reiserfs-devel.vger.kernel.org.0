Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4873EE359B
	for <lists+reiserfs-devel@lfdr.de>; Thu, 24 Oct 2019 16:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391483AbfJXObh (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 24 Oct 2019 10:31:37 -0400
Received: from mx2.suse.de ([195.135.220.15]:53542 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732293AbfJXObh (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 24 Oct 2019 10:31:37 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id A7E0AB376;
        Thu, 24 Oct 2019 14:31:34 +0000 (UTC)
Received: from starscream.home.jeffm.io (starscream-1.home.jeffm.io [192.168.1.254])
        by mail.home.jeffm.io (Postfix) with ESMTPS id 618F281AD3D1;
        Thu, 24 Oct 2019 11:33:23 -0400 (EDT)
Received: by starscream.home.jeffm.io (Postfix, from userid 1000)
        id 8E03E6F26EA; Thu, 24 Oct 2019 10:31:28 -0400 (EDT)
From:   jeffm@suse.com
To:     reiserfs-devel@vger.kernel.org
Cc:     jack@suse.cz, Jeff Mahoney <jeffm@suse.com>
Subject: [PATCH] reiserfs: fix extended attributes on the root directory
Date:   Thu, 24 Oct 2019 10:31:27 -0400
Message-Id: <20191024143127.17509-1-jeffm@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

From: Jeff Mahoney <jeffm@suse.com>

Since commit d0a5b995a30 (vfs: Add IOP_XATTR inode operations flag)
extended attributes haven't worked on the root directory in reiserfs.

This is due to reiserfs conditionally setting the sb->s_xattrs handler
array depending on whether it located or create the internal privroot
directory.  It necessarily does this after the root inode is already
read in.  The IOP_XATTR flag is set during inode initialization, so
it never gets set on the root directory.

This commit unconditionally assigns sb->s_xattrs and clears IOP_XATTR on
internal inodes.  The old return values due to the conditional assignment
are handled via open_xa_root, which now returns EOPNOTSUPP as the VFS
would have done.

Signed-off-by: Jeff Mahoney <jeffm@suse.com>
---
 fs/reiserfs/inode.c     | 12 ++++++++++--
 fs/reiserfs/namei.c     |  7 +++++--
 fs/reiserfs/reiserfs.h  |  2 ++
 fs/reiserfs/super.c     |  2 ++
 fs/reiserfs/xattr.c     | 19 ++++++++++++-------
 fs/reiserfs/xattr_acl.c |  4 +---
 6 files changed, 32 insertions(+), 14 deletions(-)

diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index 132ec4406ed0..6419e6dacc39 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -2097,6 +2097,15 @@ int reiserfs_new_inode(struct reiserfs_transaction_handle *th,
 		goto out_inserted_sd;
 	}
 
+	/*
+	 * Mark it private if we're creating the privroot
+	 * or something under it.
+	 */
+	if (IS_PRIVATE(dir) || dentry == REISERFS_SB(sb)->priv_root) {
+		inode->i_flags |= S_PRIVATE;
+		inode->i_opflags &= ~IOP_XATTR;
+	}
+
 	if (reiserfs_posixacl(inode->i_sb)) {
 		reiserfs_write_unlock(inode->i_sb);
 		retval = reiserfs_inherit_default_acl(th, dir, dentry, inode);
@@ -2111,8 +2120,7 @@ int reiserfs_new_inode(struct reiserfs_transaction_handle *th,
 		reiserfs_warning(inode->i_sb, "jdm-13090",
 				 "ACLs aren't enabled in the fs, "
 				 "but vfs thinks they are!");
-	} else if (IS_PRIVATE(dir))
-		inode->i_flags |= S_PRIVATE;
+	}
 
 	if (security->name) {
 		reiserfs_write_unlock(inode->i_sb);
diff --git a/fs/reiserfs/namei.c b/fs/reiserfs/namei.c
index 97f3fc4fdd79..959a066b7bb0 100644
--- a/fs/reiserfs/namei.c
+++ b/fs/reiserfs/namei.c
@@ -377,10 +377,13 @@ static struct dentry *reiserfs_lookup(struct inode *dir, struct dentry *dentry,
 
 		/*
 		 * Propagate the private flag so we know we're
-		 * in the priv tree
+		 * in the priv tree.  Also clear IOP_XATTR
+		 * since we don't have xattrs on xattr files.
 		 */
-		if (IS_PRIVATE(dir))
+		if (IS_PRIVATE(dir)) {
 			inode->i_flags |= S_PRIVATE;
+			inode->i_opflags &= ~IOP_XATTR;
+		}
 	}
 	reiserfs_write_unlock(dir->i_sb);
 	if (retval == IO_ERROR) {
diff --git a/fs/reiserfs/reiserfs.h b/fs/reiserfs/reiserfs.h
index e5ca9ed79e54..726580114d55 100644
--- a/fs/reiserfs/reiserfs.h
+++ b/fs/reiserfs/reiserfs.h
@@ -1168,6 +1168,8 @@ static inline int bmap_would_wrap(unsigned bmap_nr)
 	return bmap_nr > ((1LL << 16) - 1);
 }
 
+extern const struct xattr_handler *reiserfs_xattr_handlers[];
+
 /*
  * this says about version of key of all items (but stat data) the
  * object consists of
diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index d69b4ac0ae2f..3244037b1286 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -2049,6 +2049,8 @@ static int reiserfs_fill_super(struct super_block *s, void *data, int silent)
 	if (replay_only(s))
 		goto error_unlocked;
 
+	s->s_xattr = reiserfs_xattr_handlers;
+
 	if (bdev_read_only(s->s_bdev) && !sb_rdonly(s)) {
 		SWARN(silent, s, "clm-7000",
 		      "Detected readonly device, marking FS readonly");
diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
index c1b996e548af..06497965f0a0 100644
--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -122,13 +122,13 @@ static struct dentry *open_xa_root(struct super_block *sb, int flags)
 	struct dentry *xaroot;
 
 	if (d_really_is_negative(privroot))
-		return ERR_PTR(-ENODATA);
+		return ERR_PTR(-EOPNOTSUPP);
 
 	inode_lock_nested(d_inode(privroot), I_MUTEX_XATTR);
 
 	xaroot = dget(REISERFS_SB(sb)->xattr_root);
 	if (!xaroot)
-		xaroot = ERR_PTR(-ENODATA);
+		xaroot = ERR_PTR(-EOPNOTSUPP);
 	else if (d_really_is_negative(xaroot)) {
 		int err = -ENODATA;
 
@@ -619,6 +619,10 @@ int reiserfs_xattr_set(struct inode *inode, const char *name,
 	int error, error2;
 	size_t jbegin_count = reiserfs_xattr_nblocks(inode, buffer_size);
 
+	/* Check before we start a transaction and then do nothing. */
+	if (!d_really_is_positive(REISERFS_SB(inode->i_sb)->priv_root))
+		return -EOPNOTSUPP;
+
 	if (!(flags & XATTR_REPLACE))
 		jbegin_count += reiserfs_xattr_jcreate_nblocks(inode);
 
@@ -841,8 +845,7 @@ ssize_t reiserfs_listxattr(struct dentry * dentry, char *buffer, size_t size)
 	if (d_really_is_negative(dentry))
 		return -EINVAL;
 
-	if (!dentry->d_sb->s_xattr ||
-	    get_inode_sd_version(d_inode(dentry)) == STAT_DATA_V1)
+	if (get_inode_sd_version(d_inode(dentry)) == STAT_DATA_V1)
 		return -EOPNOTSUPP;
 
 	dir = open_xa_dir(d_inode(dentry), XATTR_REPLACE);
@@ -882,6 +885,7 @@ static int create_privroot(struct dentry *dentry)
 	}
 
 	d_inode(dentry)->i_flags |= S_PRIVATE;
+	d_inode(dentry)->i_opflags &= ~IOP_XATTR;
 	reiserfs_info(dentry->d_sb, "Created %s - reserved for xattr "
 		      "storage.\n", PRIVROOT_NAME);
 
@@ -893,7 +897,7 @@ static int create_privroot(struct dentry *dentry) { return 0; }
 #endif
 
 /* Actual operations that are exported to VFS-land */
-static const struct xattr_handler *reiserfs_xattr_handlers[] = {
+const struct xattr_handler *reiserfs_xattr_handlers[] = {
 #ifdef CONFIG_REISERFS_FS_XATTR
 	&reiserfs_xattr_user_handler,
 	&reiserfs_xattr_trusted_handler,
@@ -964,8 +968,10 @@ int reiserfs_lookup_privroot(struct super_block *s)
 	if (!IS_ERR(dentry)) {
 		REISERFS_SB(s)->priv_root = dentry;
 		d_set_d_op(dentry, &xattr_lookup_poison_ops);
-		if (d_really_is_positive(dentry))
+		if (d_really_is_positive(dentry)) {
 			d_inode(dentry)->i_flags |= S_PRIVATE;
+			d_inode(dentry)->i_opflags &= ~IOP_XATTR;
+		}
 	} else
 		err = PTR_ERR(dentry);
 	inode_unlock(d_inode(s->s_root));
@@ -994,7 +1000,6 @@ int reiserfs_xattr_init(struct super_block *s, int mount_flags)
 	}
 
 	if (d_really_is_positive(privroot)) {
-		s->s_xattr = reiserfs_xattr_handlers;
 		inode_lock(d_inode(privroot));
 		if (!REISERFS_SB(s)->xattr_root) {
 			struct dentry *dentry;
diff --git a/fs/reiserfs/xattr_acl.c b/fs/reiserfs/xattr_acl.c
index aa9380bac196..05f666794561 100644
--- a/fs/reiserfs/xattr_acl.c
+++ b/fs/reiserfs/xattr_acl.c
@@ -320,10 +320,8 @@ reiserfs_inherit_default_acl(struct reiserfs_transaction_handle *th,
 	 * would be useless since permissions are ignored, and a pain because
 	 * it introduces locking cycles
 	 */
-	if (IS_PRIVATE(dir)) {
-		inode->i_flags |= S_PRIVATE;
+	if (IS_PRIVATE(inode))
 		goto apply_umask;
-	}
 
 	err = posix_acl_create(dir, &inode->i_mode, &default_acl, &acl);
 	if (err)
-- 
2.16.4

