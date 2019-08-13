Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6FB38C248
	for <lists+reiserfs-devel@lfdr.de>; Tue, 13 Aug 2019 22:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbfHMUqL (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 13 Aug 2019 16:46:11 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42]:51916 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726007AbfHMUqL (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 13 Aug 2019 16:46:11 -0400
Received: by mail-wm1-f42.google.com with SMTP id 207so2706761wma.1
        for <reiserfs-devel@vger.kernel.org>; Tue, 13 Aug 2019 13:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language;
        bh=U7vMJ4IY/SpG28m74yGe9y7KT516387fTFvezMhgSp8=;
        b=KC3tYlRu0CMGgk2ypZKZZRxpAqxL9T4AXMb0LiVs7YGE9v0kIYfpc/T0uNlSx8fZg/
         xh/18lMp8Vxp7t1NMH2uuF5fT/MtUrmPvojletJjYj+KrvNMUlHhU/Cixekx4MM+rtwo
         djJnSnkjxVoi09zq/aj22MQJC+ARXNuwGXQyKzCoC/3R13imXjmiHxbox70Hfqe6POJE
         zxp8wUUVTkPe3BsTrPwRss3jr+X+E16b7D6MkPJibczSplLUMUwD7ipQbbLOGcO4D3Vy
         57kDBHRe0/x1w8uVpFSRuGRWibBrxftXY2/23ioaLT6mEFyw1IJgmOVhEGFM8P/vzv/4
         DYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language;
        bh=U7vMJ4IY/SpG28m74yGe9y7KT516387fTFvezMhgSp8=;
        b=Rb5cY1+9WGHqgUKjEFzbpFTvZ925V9eMlNNCJE88nLivXMFIzd+ZLIfvX9Qkot7Tgq
         p8Hzie7qiUeJjE91vA1iNOZtg7ZH1UCRPD9EbA+pWi5q6ohqFc3rUMTwjnbxa+nKVZ63
         lVz1TO5ljcOOOZMvRnTkMmrIBvKPSj1tmAeXqnX7VcdPebDTk5QbCaCYfKWHmDLzppdK
         x1ucYsd2T/6ZVLAbZ6Q5cVsnN4pzhimsTmfz/O+BFLc0UcTiylgxZ8dCu2kfRwAPDkz5
         Cl34dOii7OV+5syyVE6As1tuaiAcg9OHCVNixB1ExWAwIbxAWZ98Qc5I911CxctrlATu
         ukGQ==
X-Gm-Message-State: APjAAAVazzLlMp9759VurLLU90qQxCX2kYaNF30vNLfG2I1uV4+ZVkKA
        9SVGRjIaryMLBBWuVllP5yK07P5v
X-Google-Smtp-Source: APXvYqx1KRDbWw0pp7yzDGXtz/qJJlVuDTNL21CenTEvF/bgikZk+WD3TqPWuJvVyE/ae6sex0KcAQ==
X-Received: by 2002:a05:600c:48b:: with SMTP id d11mr5074854wme.124.1565729169071;
        Tue, 13 Aug 2019 13:46:09 -0700 (PDT)
Received: from [192.168.0.48] (ip5f5ac648.dynamic.kabel-deutschland.de. [95.90.198.72])
        by smtp.gmail.com with ESMTPSA id d207sm2033424wmd.0.2019.08.13.13.46.07
        for <reiserfs-devel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Aug 2019 13:46:08 -0700 (PDT)
To:     ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>
From:   Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH] reiser4: port for Linux-5.2
Message-ID: <6d772e3b-f3a6-a94a-ec60-c9c744a018eb@gmail.com>
Date:   Tue, 13 Aug 2019 22:46:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------2832356A6CAA8ABA3471F603"
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

This is a multi-part message in MIME format.
--------------2832356A6CAA8ABA3471F603
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



--------------2832356A6CAA8ABA3471F603
Content-Type: text/x-patch;
 name="reiser4-port-for-5.2.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-port-for-5.2.patch"

diff --git a/checksum.h b/checksum.h
index ff6812f75..5bf784ad7 100644
--- a/checksum.h
+++ b/checksum.h
@@ -16,7 +16,6 @@ u32 static inline reiser4_crc32c(struct crypto_shash *tfm,
 	int err;
 
 	desc.shash.tfm = tfm;
-	desc.shash.flags = 0;
 	*(u32 *)desc.ctx = crc;
 
 	err = crypto_shash_update(&desc.shash, address, length);
diff --git a/flush_queue.c b/flush_queue.c
index e83413ff1..254e22f43 100644
--- a/flush_queue.c
+++ b/flush_queue.c
@@ -398,7 +398,6 @@ int atom_fq_parts_are_clean(txn_atom * atom)
  */
 static void end_io_handler(struct bio *bio)
 {
-	int i;
 	int nr = 0;
 	int nr_errors = 0;
 	flush_queue_t *fq;
@@ -411,7 +410,7 @@ static void end_io_handler(struct bio *bio)
 	 * for synchronization and error counting. */
 	fq = bio->bi_private;
 	/* Check all elements of io_vec for correct write completion. */
-	bio_for_each_segment_all(bvec, bio, i, iter_all) {
+	bio_for_each_segment_all(bvec, bio, iter_all) {
 		struct page *pg = bvec->bv_page;
 
 		if (bio->bi_status) {
diff --git a/jnode.c b/jnode.c
index 4cce9d1d6..a40527829 100644
--- a/jnode.c
+++ b/jnode.c
@@ -989,9 +989,9 @@ void jrelse_tail(jnode * node/* jnode to release references to */)
 	assert("nikita-489", atomic_read(&node->d_count) > 0);
 	atomic_dec(&node->d_count);
 	/* release reference acquired in jload_gfp() or jinit_new() */
-	jput(node);
 	if (jnode_is_unformatted(node) || jnode_is_znode(node))
 		LOCK_CNT_DEC(d_refs);
+	jput(node);
 }
 
 /* drop reference to node data. When last reference is dropped, data are
diff --git a/wander.c b/wander.c
index df82d27de..d8afe8c99 100644
--- a/wander.c
+++ b/wander.c
@@ -539,11 +539,10 @@ get_more_wandered_blocks(int count, reiser4_block_nr * start, int *len)
  */
 static void undo_bio(struct bio *bio)
 {
-	int i;
 	struct bio_vec *bvec;
 	struct bvec_iter_all iter_all;
 
-	bio_for_each_segment_all(bvec, bio, i, iter_all) {
+	bio_for_each_segment_all(bvec, bio, iter_all) {
 		struct page *pg;
 		jnode *node;
 

--------------2832356A6CAA8ABA3471F603--
