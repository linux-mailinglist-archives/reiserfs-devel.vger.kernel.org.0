Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6D18AAAA
	for <lists+reiserfs-devel@lfdr.de>; Tue, 13 Aug 2019 00:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbfHLWmu (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 12 Aug 2019 18:42:50 -0400
Received: from mail-wm1-f46.google.com ([209.85.128.46]:51068 "EHLO
        mail-wm1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbfHLWmu (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 12 Aug 2019 18:42:50 -0400
Received: by mail-wm1-f46.google.com with SMTP id v15so1055969wml.0
        for <reiserfs-devel@vger.kernel.org>; Mon, 12 Aug 2019 15:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language;
        bh=CcSPOZ81pn6cFNTN6Nt99ugQJRoMwr2K0l7NY1DvIlQ=;
        b=so1foLaeplJzYRp5fAZ6RhTskFR8GeATAxUbm0SfZgI6yW6tyi0RP8XXU8wARk121E
         BLM+wDSGCSgTJ1sER4fSRCwaojFBFmmGSry/LKVnb+p7LGalFIP8n3YRznX0PPUjIIpK
         XuBHalbtgCqeRY6wqcWMZvVHAKO5/Ll2CGlZkdtXpS5uvNdImmB1LrWZJlvue4YqKdkn
         oaB9IFoK6NTqwn6Lw6+wTKc/zro+ZLhjHlNV6EcbetW3jJR7Gjc3PLGJtCHELzEzM26R
         PsA8q1mBpWKHV3pwmDlyAbk1UEfgLNiXrLYw9ORnUokZhYxj+cCOQeYi6364+msqEjQL
         vtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language;
        bh=CcSPOZ81pn6cFNTN6Nt99ugQJRoMwr2K0l7NY1DvIlQ=;
        b=PfCASDyItpF8/tG4UP2M6j6TJVhhUb3L29KWrJB13PbH41Gxguz8ZzK81O+PnweRPb
         x5eORHTyD5S6dM3QliN59cwnin3G2//FrOtzVFOklzLZa/zekhcUHYh9UZgSJ4mFlsNA
         z13Lifp6MOWiMwlkA5/cJvdIsbAdvoJzmqfISf666m29EWDtNAPNGwFhzV18TBna2s0D
         1L+d0tB6ww7Zl6WBuwJfvZyVlsfH6J4QpIJLNWuBifFOe3rt/P9KFYwgwScg+rGuLbDb
         vmBmvLVMnukO666PnKIIRkUrqWKl7jJJ7NhqGOrxj01h7ZFmkim0P4lwddoPhlmx9h2q
         9e5Q==
X-Gm-Message-State: APjAAAUJUHTJ6wbw27sPonnuDg/jSTRBxy7U7vLhQZ1OxRToVl2BOj9g
        GkPOTewGQqScUcZbD5dMoS9kKPz4
X-Google-Smtp-Source: APXvYqyArD7SfcIZxR9qDX4HpNwO9BT0o+Rcb/Q0dNELHr52MMKIqNE5OYfEmM8r22F2HImeI0v0+w==
X-Received: by 2002:a1c:e487:: with SMTP id b129mr1269877wmh.93.1565649767932;
        Mon, 12 Aug 2019 15:42:47 -0700 (PDT)
Received: from [192.168.0.48] (ip5f5ac648.dynamic.kabel-deutschland.de. [95.90.198.72])
        by smtp.gmail.com with ESMTPSA id f192sm642830wmg.30.2019.08.12.15.42.46
        for <reiserfs-devel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 15:42:47 -0700 (PDT)
To:     ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>
From:   Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH] reiser4: port for Linux-5.1
Message-ID: <1db9960d-343a-1db7-2e48-b6492dedd0ed@gmail.com>
Date:   Tue, 13 Aug 2019 00:42:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------177FB60E074764B1CB83723D"
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

This is a multi-part message in MIME format.
--------------177FB60E074764B1CB83723D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



--------------177FB60E074764B1CB83723D
Content-Type: text/x-patch;
 name="reiser4-port-for-5.1.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-port-for-5.1.patch"

diff --git a/debug.c b/debug.c
index 96c95085e..ddee95fda 100644
--- a/debug.c
+++ b/debug.c
@@ -293,7 +293,7 @@ void reiser4_debugtrap(void)
 	/* do nothing. Put break point here. */
 #if defined(CONFIG_KGDB) && !defined(CONFIG_REISER4_FS_MODULE)
 	extern void kgdb_breakpoint(void);
-	kgdb_breakpoint();
+	//kgdb_breakpoint();
 #endif
 }
 #endif
diff --git a/flush_queue.c b/flush_queue.c
index ef880aa64..e83413ff1 100644
--- a/flush_queue.c
+++ b/flush_queue.c
@@ -399,8 +399,11 @@ int atom_fq_parts_are_clean(txn_atom * atom)
 static void end_io_handler(struct bio *bio)
 {
 	int i;
+	int nr = 0;
 	int nr_errors = 0;
 	flush_queue_t *fq;
+	struct bio_vec *bvec;
+	struct bvec_iter_all iter_all;
 
 	assert("zam-958", bio_op(bio) == WRITE);
 
@@ -408,8 +411,8 @@ static void end_io_handler(struct bio *bio)
 	 * for synchronization and error counting. */
 	fq = bio->bi_private;
 	/* Check all elements of io_vec for correct write completion. */
-	for (i = 0; i < bio->bi_vcnt; i += 1) {
-		struct page *pg = bio->bi_io_vec[i].bv_page;
+	bio_for_each_segment_all(bvec, bio, i, iter_all) {
+		struct page *pg = bvec->bv_page;
 
 		if (bio->bi_status) {
 			SetPageError(pg);
@@ -427,7 +430,7 @@ static void end_io_handler(struct bio *bio)
 
 			JF_CLR(node, JNODE_WRITEBACK);
 		}
-
+		nr ++;
 		end_page_writeback(pg);
 		put_page(pg);
 	}
@@ -438,7 +441,7 @@ static void end_io_handler(struct bio *bio)
 
 		/* If all write requests registered in this "fq" are done we up
 		 * the waiter. */
-		if (atomic_sub_and_test(bio->bi_vcnt, &fq->nr_submitted))
+		if (atomic_sub_and_test(nr, &fq->nr_submitted))
 			wake_up(&fq->wait);
 	}
 
@@ -453,7 +456,8 @@ void add_fq_to_bio(flush_queue_t *fq, struct bio *bio)
 	bio->bi_end_io = end_io_handler;
 
 	if (fq)
-		atomic_add(bio->bi_vcnt, &fq->nr_submitted);
+		atomic_add(bio->bi_iter.bi_size >> PAGE_SHIFT,
+			   &fq->nr_submitted);
 }
 
 /* Move all queued nodes out from @fq->prepped list. */
diff --git a/wander.c b/wander.c
index e23b34d6e..df82d27de 100644
--- a/wander.c
+++ b/wander.c
@@ -540,12 +540,14 @@ get_more_wandered_blocks(int count, reiser4_block_nr * start, int *len)
 static void undo_bio(struct bio *bio)
 {
 	int i;
+	struct bio_vec *bvec;
+	struct bvec_iter_all iter_all;
 
-	for (i = 0; i < bio->bi_vcnt; ++i) {
+	bio_for_each_segment_all(bvec, bio, i, iter_all) {
 		struct page *pg;
 		jnode *node;
 
-		pg = bio->bi_io_vec[i].bv_page;
+		pg = bvec->bv_page;
 		end_page_writeback(pg);
 		node = jprivate(pg);
 		spin_lock_jnode(node);
@@ -828,7 +830,6 @@ static int write_jnodes_to_disk_extent(
 		if (nr_used > 0) {
 			assert("nikita-3453",
 			       bio->bi_iter.bi_size == super->s_blocksize * nr_used);
-			assert("nikita-3454", bio->bi_vcnt == nr_used);
 
 			/* Check if we are allowed to write at all */
 			if (sb_rdonly(super))

--------------177FB60E074764B1CB83723D--
