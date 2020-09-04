Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0833225E2AF
	for <lists+reiserfs-devel@lfdr.de>; Fri,  4 Sep 2020 22:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728061AbgIDUWz (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 4 Sep 2020 16:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbgIDUWw (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 4 Sep 2020 16:22:52 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 382E3C061244
        for <reiserfs-devel@vger.kernel.org>; Fri,  4 Sep 2020 13:22:52 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id t16so2487794edw.7
        for <reiserfs-devel@vger.kernel.org>; Fri, 04 Sep 2020 13:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=FNr1u//th403qZDqZcbdUVeB6Ybyi1wmpknoPqVZaRE=;
        b=mOirpFKLl8d4S9eyefMeVnXIGNJCGb5ILP69oxveZfw07lfdxnOvLjgeJUydZvyfce
         ntXaSs49Pj+nIu+nReuUs7xkgxJLburxyqgroBYT/QGm0LQ1VSKtg8Z/IF2q7crkFax+
         fI4DrcevKUOAuOZY3h6R9h80HmZx8tcdBFXzhRrVz3pz+jksquDGlxR1+RqtRevZeZSS
         YZPGo+tcEyjUtjstlmU7VQHYQ3bmQ9li25QXukHQrix/28Kh/fXGhzoAz+awRyMqD7dk
         K0LIw5CB8D8ag8vcLR7vl5h/jmApTCXCMalp4QitsB0gCTt6r/PBJMT0DmQAtaJq2rWV
         9n2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=FNr1u//th403qZDqZcbdUVeB6Ybyi1wmpknoPqVZaRE=;
        b=WxaZjbDes8IvbxxiBMx3aa/KKPljbrqV2mVWIjFKYVrK4VTI1HRa7FfXsDXbE3zWbT
         zQdZRTU/A99bnqR2CL4bzBM2ay6CmPWKiyVIW6YcDZTsD6oeQWAX51o6oc4XZ0PUls5T
         DHKoa3Al20mNaopRO+H3F+vrFx25hdqaVRXFSErxi11QNsg+9M7fqB7VKkN1c6/kMhVF
         JCgjK52z+fAxu547mBSZ/GOoMjHDdRoLZdSGzd9q5G+ZACVmzibeHe9hMVQS9ElQBgn6
         5UHpqNiDP/y8TZLMG8H/4WFDX/S1pxFzxbgqNzr0LW3AY7cXvI/Icqja6L973Wmyra8D
         uRcw==
X-Gm-Message-State: AOAM530cAJvlwETT7cwSeCTgbAx3URYCRzZn3ZZRDPM4R7PTONO8otJG
        TNlJRzrQBNs6qEExV+I9WYy0pdYfDJE=
X-Google-Smtp-Source: ABdhPJzkG6wo9VJIJ7frrYuc/32R0pE9ScyPeQVsEM5MlE0Frxrqj/txsPPU+FfJgtviKvWHKzLxvQ==
X-Received: by 2002:a05:6402:c15:: with SMTP id co21mr10116007edb.268.1599250970223;
        Fri, 04 Sep 2020 13:22:50 -0700 (PDT)
Received: from localhost.localdomain (HSI-KBW-046-005-005-088.hsi8.kabel-badenwuerttemberg.de. [46.5.5.88])
        by smtp.gmail.com with ESMTPSA id bf25sm6811759edb.95.2020.09.04.13.22.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Sep 2020 13:22:49 -0700 (PDT)
From:   Edward Shishkin <edward.shishkin@gmail.com>
To:     reiserfs-devel@vger.kernel.org
Cc:     Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH] Optimize data migration and operations on "striped" extents
Date:   Fri,  4 Sep 2020 22:22:27 +0200
Message-Id: <20200904202227.3874-1-edward.shishkin@gmail.com>
X-Mailer: git-send-email 2.13.6
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Implement a new tree operation update_item_key(), which calls
carry to update delimiting keys on the upper tree levels. Earlier it
wasn't needed, because COP_UPDATE was always posted in the context of
carry operations (e.h. carry_cut()). Now specifics of work with
"striped" extents requires to update item keys by high level tree
operations.

Don't use kill-and-create-item sequence when migrating a whole extent,
as it requires to unlock current position in the tree, when converting
the first item in the file (suboptimal). Instead, convert the extent
to one unallocated unit, and update its key by the newly introduced
update_item_key()

In plug_hole_stripe() try also to push the pointer to the beginning
of the item at the right. If possible, update key of the item calling
update_item_key().

Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
---
 plugin/item/extent_stripe_ops.c | 180 +++++++++++++++++++++++++---------------
 plugin/item/extent_volume_ops.c | 149 ++++++++++++++-------------------
 tree.c                          |  55 ++++++++++++
 3 files changed, 232 insertions(+), 152 deletions(-)

diff --git a/plugin/item/extent_stripe_ops.c b/plugin/item/extent_stripe_ops.c
index 4f0e578a8..16cb8a234 100644
--- a/plugin/item/extent_stripe_ops.c
+++ b/plugin/item/extent_stripe_ops.c
@@ -21,22 +21,9 @@ size_t filemap_copy_from_user(struct page *page, unsigned long offset,
 int find_stripe_item(hint_t *hint, const reiser4_key *key,
 		     znode_lock_mode lock_mode, struct inode *inode);
 reiser4_block_nr estimate_write_stripe_meta(int count);
+int update_item_key(coord_t *target, const reiser4_key *key);
 
-#if 0
-static void check_node(znode *node)
-{
-	const char *error;
-
-	zload(node);
-	assert("edward-2076",
-	       check_node40(node, REISER4_NODE_TREE_STABLE, &error) == 0);
-	zrelse(node);
-}
-#else
-#define check_node(node) noop
-#endif
-
-void try_merge_with_right_item(coord_t *left)
+int try_merge_with_right_item(coord_t *left)
 {
 	coord_t right;
 
@@ -46,33 +33,76 @@ void try_merge_with_right_item(coord_t *left)
 		/*
 		 * there is no items at the right
 		 */
-		return;
+		return 0;
 	if (are_items_mergeable(left, &right)) {
 		node_plugin_by_node(left->node)->merge_items(left, &right);
 		znode_make_dirty(left->node);
 	}
+	return 0;
+}
+
+int try_merge_with_left_item(coord_t *right)
+{
+	coord_t left;
+
+	coord_dup(&left, right);
+
+	if (coord_prev_item(&left))
+		/*
+		 * there is no items at the left
+		 */
+		return 0;
+
+	if (are_items_mergeable(&left, right)) {
+		node_plugin_by_node(left.node)->merge_items(&left, right);
+		znode_make_dirty(right->node);
+	}
+	return 0;
+}
+
+static inline int can_push_left(const coord_t *coord, const reiser4_key *key)
+{
+	reiser4_key akey;
+
+	return keyeq(key, append_key_extent(coord, &akey));
+}
+
+static inline int can_push_right(const coord_t *coord, const reiser4_key *key)
+{
+	coord_t right;
+	reiser4_key ikey;
+	reiser4_key pkey;
+
+	coord_dup(&right, coord);
+
+	if (coord_next_item(&right))
+		/*
+		 * there is no items at the right
+		 */
+		return 0;
+
+	memcpy(&pkey, key, sizeof(*key));
+	set_key_offset(&pkey, get_key_offset(key) + PAGE_SIZE);
+
+	return keyeq(&pkey, item_key_by_coord(&right, &ikey));
 }
 
 /**
- * Push a pointer to one unallocated physical block to the
- * storage tree.
+ * Place a pointer to one unallocated physical block to the storage tree
  *
- * @key: key of the logical block of the file's body;
- * @uf_coord: location to push (was found by coord_by_key());
+ * @key: key of the pointer to push
+ * @uf_coord: location to push (was found by coord_by_key())
  *
- * Pre-condition: logical block is not yet represented by any
- * pointer in the storage tree (thus, such name "plugging a hole")
+ * Pre-condition: the logical block is not yet represented by any pointer
+ * in the storage tree (thus, the procedure looks like "plugging a hole")
  *
- * First try to push the pointer to an existing item at the left.
- * If impossible, then create a new extent item and try to merge
- * it with an item at the right.
+ * First, try to push the pointer to existing items. If impossible, then
+ * create a new extent item
  */
 static int plug_hole_stripe(coord_t *coord, lock_handle *lh,
 			    const reiser4_key *key)
 {
 	int ret = 0;
-	znode *loaded;
-	reiser4_key akey;
 	reiser4_extent *ext;
 	reiser4_extent new_ext;
 	reiser4_item_data idata;
@@ -129,29 +159,13 @@ static int plug_hole_stripe(coord_t *coord, lock_handle *lh,
 	}
 	/*
 	 * We are on the twig level.
-	 * Try to push the pointer to the end of extent item specified
-	 * by @coord
+	 * First, try to push the pointer to existing extent items
 	 */
 	assert("edward-2057", item_is_extent(coord));
 
-	if (!keyeq(key, append_key_extent(coord, &akey))) {
+	if (can_push_left(coord, key)) {
 		/*
-		 * Can not push. Create a new item.
-		 *
-		 * FIXME-EDWARD: here it would be nice to try
-		 * also to push to the beginning of the item at
-		 * the right. However, current implementation
-		 * of extent items doesn't allow to do it. We
-		 * can only to create a new item and merge it
-		 * with the right neighbor.
-		 */
-		reiser4_set_extent(subvol_by_key(key), &new_ext,
-				   UNALLOCATED_EXTENT_START, 1);
-		init_new_extent(EXTENT41_POINTER_ID, &idata, &new_ext, 1);
-		ret = insert_by_coord(coord, &idata, key, lh, 0);
-	} else {
-		/*
-		 * We can push to the end of the item
+		 * push to the end of current item
 		 */
 		coord->unit_pos = coord_last_unit_pos(coord);
 		ext = extent_by_coord(coord);
@@ -176,28 +190,62 @@ static int plug_hole_stripe(coord_t *coord, lock_handle *lh,
 			init_new_extent(EXTENT41_POINTER_ID,
 					&idata, &new_ext, 1);
 			ret = insert_into_item(coord, lh, key, &idata, 0);
+			if (ret)
+				return ret;
 		}
+		return WITH_DATA(lh->node, try_merge_with_right_item(coord));
+
+	} else if (can_push_right(coord, key)) {
+		/*
+		 * push to the beginning of the item at right
+		 */
+		coord_next_item(coord);
+		ext = extent_by_coord(coord);
+
+		if ((state_of_extent(ext) == UNALLOCATED_EXTENT)) {
+			/*
+			 * fast paste
+			 */
+			extent_set_width(subvol_by_key(key), ext,
+					 extent_get_width(ext) + 1);
+			/*
+			 * since we push to the beginning of item,
+			 * we need to update its key
+			 */
+			return update_item_key(coord, key);
+		} else {
+			/*
+			 * paste with possible carry
+			 */
+			coord->between = BEFORE_UNIT;
+			reiser4_set_extent(subvol_by_key(key), &new_ext,
+					   UNALLOCATED_EXTENT_START, 1);
+			init_new_extent(EXTENT41_POINTER_ID,
+					&idata, &new_ext, 1);
+			return insert_into_item(coord, lh, key, &idata, 0);
+		}
+		/*
+		 * note that resulted item is not mergeable with an item
+		 * at the left (otherwise we would fall to can_push_left()
+		 * branch above)
+		 */
+	} else {
+		/*
+		 * we can't push to existing items, so create a new one
+		 */
+		reiser4_set_extent(subvol_by_key(key), &new_ext,
+				   UNALLOCATED_EXTENT_START, 1);
+		init_new_extent(EXTENT41_POINTER_ID, &idata, &new_ext, 1);
+		ret = insert_by_coord(coord, &idata, key, lh, 0);
+		if (ret)
+			return ret;
+		/*
+		 * it could happen that the newly created item got
+		 * to neighbor node, where it is mergeable with an
+		 * item at the right
+		 */
+		return WITH_DATA(lh->node, try_merge_with_right_item(coord));
 	}
-	if (ret)
-		return ret;
-	assert("edward-2075", coord->node == lh->node);
-	/*
-	 * Here @coord points out to the item, the pointer
-	 * was pushed to, or to a newly created item. Try to
-	 * merge it with the item at the right.
-	 */
-	ret = zload(coord->node);
-	if (ret)
-		return ret;
-	loaded = coord->node;
-	try_merge_with_right_item(coord);
-#if 0
-	assert("edward-2353",
-	       check_node40(loaded,
-			    REISER4_NODE_TREE_STABLE, &error) == 0);
-#endif
-	zrelse(loaded);
-	return 0;
 }
 
 int sync_jnode(jnode *node);
diff --git a/plugin/item/extent_volume_ops.c b/plugin/item/extent_volume_ops.c
index 3dfe9fa2b..ed6393622 100644
--- a/plugin/item/extent_volume_ops.c
+++ b/plugin/item/extent_volume_ops.c
@@ -16,8 +16,10 @@
 #define MIGRATION_GRANULARITY (8192)
 
 jnode *do_jget(struct page *pg);
-void try_merge_with_right_item(coord_t *left);
+int try_merge_with_right_item(coord_t *left);
+int try_merge_with_left_item(coord_t *right);
 int split_extent_unit(coord_t *coord, reiser4_block_nr pos, int adv_to_right);
+int update_item_key(coord_t *target, const reiser4_key *key);
 
 /*
  * primitive migration operations over item
@@ -162,7 +164,7 @@ static int readpages_extent_item(const coord_t *coord, loff_t off,
  * @from_off: offset to cut from.
  */
 static int cut_off_tail(coord_t *coord, struct inode *inode,
-			loff_t from_off, int count)
+			loff_t from_off)
 {
 	reiser4_key from, to;
 	coord_t from_coord;
@@ -178,9 +180,6 @@ static int cut_off_tail(coord_t *coord, struct inode *inode,
 	set_key_offset(&to, get_key_offset(&to) +
 		       reiser4_extent_size(coord) - 1);
 
-	assert("edward-2420", count > 0);
-	assert("edward-2421", count == get_key_offset(&to) - from_off + 1);
-
 	from = to;
 	set_key_offset(&from, from_off);
 
@@ -198,7 +197,7 @@ static int migrate_blocks(struct extent_migrate_context *mctx)
 	reiser4_block_nr block;
 	int nr_jnodes = 0;
 	coord_t *coord = mctx->coord;
-	znode *twig_node;
+	znode *loaded;
 	reiser4_subvol *new_subv = current_origin(mctx->new_loc);
 	struct atom_brick_info *abi;
 	ON_DEBUG(reiser4_key check_key);
@@ -246,81 +245,62 @@ static int migrate_blocks(struct extent_migrate_context *mctx)
 	}
 	nr_jnodes = mctx->nr_pages;
 
-	ret = cut_off_tail(coord, mctx->inode, mctx->stop_off,
-			   mctx->nr_pages << PAGE_SHIFT);
-	if (ret)
-		goto error;
-	/*
-	 * At this pointg all the collected jnodes have become orphan
-	 * and unallocated - deallocation happened at kill_hook_extent().
-	 * Pages and jnodes wasn't truncated by that hook because of
-	 * REISER4_FILE_IN_MIGRATION flag set.
-	 *
-	 * Create a new unallocated extent instead of the removed one.
-	 * However, not everything is so simple - we need to find out
-	 * the status of the removed item: was it the leftmost item in
-	 * the file? If so, then we need to change position for such
-	 * creation (specifically, we need to be on the leaf level).
-	 */
-	assert("edward-2410", coord->between == AT_UNIT);
+	if (mctx->migrate_whole_item) {
+		reiser4_extent *ext;
 
-	if (mctx->migrate_whole_item &&
-	    (coord_prev_item(coord) ||
-	     !inode_file_plugin(mctx->inode)->owns_item(mctx->inode, coord))) {
+		assert("edward-2464", coord->unit_pos == 0);
+		assert("edward-2465", mctx->stop_off ==
+		       get_key_offset(item_key_by_coord(coord, &check_key)));
 		/*
-		 * No more items to the left on this node, or the next
-		 * item to the left doesn't belong our file.
-		 *
-		 * The status of removed item is still unclear, so we
-		 * release the locked position and call tree search
-		 * procedure - it will land us in the right place.
+		 * cut all units except the first one;
+		 * deallocate all blocks, pointed out by that first unit;
+		 * set that unit as unallocated extent of proper width;
+		 * update item's key to point out to the new brick;
+		 * try to merge the resulted item with the item at left
+		 * and right.
 		 */
-		done_lh(mctx->lh);
-		ret = find_file_item_nohint(coord, mctx->lh, &key,
-					    ZNODE_WRITE_LOCK, mctx->inode);
-		if (IS_CBKERR(ret)) {
-			warning("edward-2457",
-				"Inode %llu: extent (%llu %d) on brick %llu lost during migration",
-				get_inode_oid(mctx->inode),
-				(jprivate(mctx->pages[0]))->blocknr,
-				mctx->nr_pages,
-				jnode_get_subvol(jprivate(mctx->pages[0]))->id);
-			goto error;
-		}
-		assert("edward-2411", coord->between != AT_UNIT);
-		if (coord->between == AFTER_UNIT) {
-			assert("edward-2412", coord->node->level == TWIG_LEVEL);
-			goto insert_on_twig;
+		if (nr_units_extent(coord) > 1) {
+			ret = cut_off_tail(coord, mctx->inode, mctx->stop_off +
+					   reiser4_extent_size_at(coord, 1));
+			if (ret)
+				goto error;
 		}
-		assert("edward-2413", coord->node->level == LEAF_LEVEL);
-
-		reiser4_set_extent(new_subv, &new_ext,
-				   UNALLOCATED_EXTENT_START, mctx->nr_pages);
-		init_new_extent(EXTENT41_POINTER_ID, &idata, &new_ext, 1);
-		ret = insert_extent_by_coord(coord, &idata, &key, mctx->lh);
+		loaded = coord->node;
+		ret = zload(loaded);
 		if (ret)
 			goto error;
 
-		twig_node = mctx->lh->node;
-		assert("edward-2414", twig_node != coord->node);
+		ext = extent_by_coord(coord);
+		if (state_of_extent(ext) == ALLOCATED_EXTENT) {
+			reiser4_block_nr start = extent_get_start(ext);
+			reiser4_block_nr len = extent_get_width(ext);
 
-		ret = zload(twig_node);
-		if (ret)
+			reiser4_dealloc_blocks(&start,
+					       &len,
+					       0, BA_DEFER,
+					       find_data_subvol(coord));
+		}
+		reiser4_set_extent(new_subv, ext,
+				   UNALLOCATED_EXTENT_START, nr_jnodes);
+		ret = update_item_key(coord, &key);
+		if (ret) {
+			zrelse(loaded);
 			goto error;
-		coord_init_zero(coord);
-		ret = node_plugin_by_node(twig_node)->lookup(twig_node,
-							     &key,
-							     FIND_EXACT,
-							     coord);
-		BUG_ON(ret != NS_FOUND);
-		assert("edward-2415", twig_node == coord->node);
+		}
+		try_merge_with_right_item(coord);
+		try_merge_with_left_item(coord);
+		assert("edward-2466",
+		       check_node40(coord->node,
+				    REISER4_NODE_TREE_STABLE, &error) == 0);
+		zrelse(loaded);
 	} else {
 		/*
-		 * There is at least one non-processed item, which belongs
-		 * to our file. So, we need to be on the twig level for
-		 * creation
+		 * cut of tail, insert a new item at the end
 		 */
-	insert_on_twig:
+		ret = cut_off_tail(coord, mctx->inode, mctx->stop_off);
+		if (ret)
+			goto error;
+
 		coord_init_after_item(coord);
 
 		reiser4_set_extent(new_subv, &new_ext,
@@ -329,27 +309,24 @@ static int migrate_blocks(struct extent_migrate_context *mctx)
 		ret = insert_by_coord(coord, &idata, &key, mctx->lh, 0);
 		if (ret)
 			goto error;
-		twig_node = coord->node;
-		ret = zload(twig_node);
+
+		loaded = coord->node;
+		ret = zload(loaded);
 		if (ret)
 			goto error;
+		assert("edward-2416",
+		       keyeq(&key, item_key_by_coord(coord, &check_key)));
+		assert("edward-2424",
+		       reiser4_extent_size(coord) == mctx->nr_pages << PAGE_SHIFT);
+
+		try_merge_with_right_item(coord);
+
+		assert("edward-2425",
+		       check_node40(coord->node,
+				    REISER4_NODE_TREE_STABLE, &error) == 0);
+		zrelse(loaded);
 	}
 	/*
-	 * current implementation of extent items doesn't allow
-	 * to simply push unit at the beginning of an item -
-	 * instead we need to create a new item, then try to merge
-	 * it with the item to the right.
-	 */
-	assert("edward-2416",
-	       keyeq(&key, item_key_by_coord(coord, &check_key)));
-	assert("edward-2424",
-	       reiser4_extent_size(coord) == mctx->nr_pages << PAGE_SHIFT);
-	assert("edward-2425",
-	       check_node40(twig_node,
-			    REISER4_NODE_TREE_STABLE, &error) == 0);
-	try_merge_with_right_item(coord);
-	zrelse(twig_node);
-	/*
 	 * Capture jnodes, set new addresses for them,
 	 * and make them dirty. At flush time all the
 	 * blocks will get new location on the new brick.
diff --git a/tree.c b/tree.c
index 0d369cfdd..9fdda1e30 100644
--- a/tree.c
+++ b/tree.c
@@ -1833,6 +1833,61 @@ int reiser4_cut_tree(reiser4_tree * tree, const reiser4_key * from,
 	return result;
 }
 
+/**
+ * Update item key and respectively delimiting keys on the upper
+ * levels (if needed).
+ *
+ * @target: item, whose key needs to be updated
+ * @key: new value of the key
+ */
+int update_item_key(coord_t *target, const reiser4_key *key)
+{
+	znode *node;
+	carry_pool *pool;
+	carry_level *todo;
+	carry_plugin_info info;
+
+	pool = init_carry_pool(sizeof(*pool) + 3 * sizeof(*todo));
+	if (IS_ERR(pool))
+		return PTR_ERR(pool);
+	todo = (carry_level *) (pool + 1);
+	init_carry_level(todo, pool);
+
+	info.doing = NULL;
+	info.todo = todo;
+
+	node = target->node;
+	node_plugin_by_node(node)->update_item_key(target, key, &info);
+
+	if (target->item_pos == 0) {
+		int ret;
+		reiser4_tree *tree;
+
+		/*
+		 * ->update_item_key() could post COP_UPDATE
+		 */
+		ret = reiser4_carry(todo, NULL /* previous level */);
+		if (ret) {
+			done_carry_pool(pool);
+			return ret;
+		}
+		tree = znode_get_tree(node);
+		read_lock_tree();
+		write_lock_dk(tree);
+
+		znode_set_ld_key(node, key);
+		if (znode_is_left_connected(node) && node->left)
+			znode_set_rd_key(node->left, key);
+
+		write_unlock_dk(tree);
+		read_unlock_tree();
+	}
+	znode_make_dirty(node);
+
+	done_carry_pool(pool);
+	return 0;
+}
+
 int reiser4_subvol_init_tree(struct reiser4_subvol *subv,
 			     const reiser4_block_nr *root_block,
 			     tree_level height, node_plugin *nplug)
-- 
2.13.6

