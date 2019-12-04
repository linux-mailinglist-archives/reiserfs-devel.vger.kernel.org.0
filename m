Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E66F5112D5F
	for <lists+reiserfs-devel@lfdr.de>; Wed,  4 Dec 2019 15:23:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbfLDOXL (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 4 Dec 2019 09:23:11 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:44006 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727850AbfLDOXL (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 4 Dec 2019 09:23:11 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id E01303A4CD5614230013;
        Wed,  4 Dec 2019 22:23:05 +0800 (CST)
Received: from [127.0.0.1] (10.177.251.225) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Wed, 4 Dec 2019
 22:22:58 +0800
To:     <akpm@linux-foundation.org>, <zhengbin13@huawei.com>,
        <reiserfs-devel@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "hushiyuan@huawei.com" <hushiyuan@huawei.com>,
        "linfeilong@huawei.com" <linfeilong@huawei.com>
From:   Yunfeng Ye <yeyunfeng@huawei.com>
Subject: [PATCH] reiserfs: prevent NULL pointer dereference in
 reiserfs_insert_item()
Message-ID: <79c5135d-ff25-1cc9-4e99-9f572b88cc00@huawei.com>
Date:   Wed, 4 Dec 2019 22:22:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.251.225]
X-CFilter-Loop: Reflected
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

The variable inode may be NULL in reiserfs_insert_item(), but there is
no check before accessing the member of inode.

Fix this by adding NULL pointer check before calling reiserfs_debug().

Signed-off-by: Yunfeng Ye <yeyunfeng@huawei.com>
---
 fs/reiserfs/stree.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
index da9ebe33882b..bb4973aefbb1 100644
--- a/fs/reiserfs/stree.c
+++ b/fs/reiserfs/stree.c
@@ -2246,7 +2246,8 @@ int reiserfs_insert_item(struct reiserfs_transaction_handle *th,
 	/* also releases the path */
 	unfix_nodes(&s_ins_balance);
 #ifdef REISERQUOTA_DEBUG
-	reiserfs_debug(th->t_super, REISERFS_DEBUG_CODE,
+	if (inode)
+		reiserfs_debug(th->t_super, REISERFS_DEBUG_CODE,
 		       "reiserquota insert_item(): freeing %u id=%u type=%c",
 		       quota_bytes, inode->i_uid, head2type(ih));
 #endif
-- 
2.7.4

