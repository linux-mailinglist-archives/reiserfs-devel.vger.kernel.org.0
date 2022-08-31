Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05A4E5A7720
	for <lists+reiserfs-devel@lfdr.de>; Wed, 31 Aug 2022 09:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbiHaHKX (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 31 Aug 2022 03:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbiHaHKL (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 31 Aug 2022 03:10:11 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F07D18E12;
        Wed, 31 Aug 2022 00:10:10 -0700 (PDT)
Received: from canpemm500005.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MHZxp04FfznTvw;
        Wed, 31 Aug 2022 15:07:42 +0800 (CST)
Received: from huawei.com (10.175.127.227) by canpemm500005.china.huawei.com
 (7.192.104.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 31 Aug
 2022 15:10:07 +0800
From:   Zhang Yi <yi.zhang@huawei.com>
To:     <linux-ext4@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <cluster-devel@redhat.com>,
        <ntfs3@lists.linux.dev>, <ocfs2-devel@oss.oracle.com>,
        <reiserfs-devel@vger.kernel.org>
CC:     <jack@suse.cz>, <tytso@mit.edu>, <akpm@linux-foundation.org>,
        <axboe@kernel.dk>, <viro@zeniv.linux.org.uk>,
        <rpeterso@redhat.com>, <agruenba@redhat.com>,
        <almaz.alexandrovich@paragon-software.com>, <mark@fasheh.com>,
        <dushistov@mail.ru>, <hch@infradead.org>, <yi.zhang@huawei.com>,
        <chengzhihao1@huawei.com>, <yukuai3@huawei.com>
Subject: [PATCH 07/14] ntfs3: replace ll_rw_block()
Date:   Wed, 31 Aug 2022 15:21:04 +0800
Message-ID: <20220831072111.3569680-8-yi.zhang@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220831072111.3569680-1-yi.zhang@huawei.com>
References: <20220831072111.3569680-1-yi.zhang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500005.china.huawei.com (7.192.104.229)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

ll_rw_block() is not safe for the sync read path because it cannot
guarantee that submitting read IO if the buffer has been locked. We
could get false positive EIO after wait_on_buffer() if the buffer has
been locked by others. So stop using ll_rw_block() in
ntfs_get_block_vbo().

Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
---
 fs/ntfs3/inode.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 51363d4e8636..bbe7d4ea1750 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -630,12 +630,9 @@ static noinline int ntfs_get_block_vbo(struct inode *inode, u64 vbo,
 			bh->b_size = block_size;
 			off = vbo & (PAGE_SIZE - 1);
 			set_bh_page(bh, page, off);
-			ll_rw_block(REQ_OP_READ, 1, &bh);
-			wait_on_buffer(bh);
-			if (!buffer_uptodate(bh)) {
-				err = -EIO;
+			err = bh_read(bh, 0);
+			if (err)
 				goto out;
-			}
 			zero_user_segment(page, off + voff, off + block_size);
 		}
 	}
-- 
2.31.1

