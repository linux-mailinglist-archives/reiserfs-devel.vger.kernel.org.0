Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E787D1204C3
	for <lists+reiserfs-devel@lfdr.de>; Mon, 16 Dec 2019 13:06:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727652AbfLPMGN (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 16 Dec 2019 07:06:13 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:59092 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727644AbfLPMGN (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 16 Dec 2019 07:06:13 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 428CEA28CB66BB409030;
        Mon, 16 Dec 2019 20:06:10 +0800 (CST)
Received: from [127.0.0.1] (10.177.251.225) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Mon, 16 Dec 2019
 20:05:55 +0800
Subject: [PATCH] reiserfs: prevent NULL pointer dereference in
 reiserfs_insert_item()
From:   Yunfeng Ye <yeyunfeng@huawei.com>
To:     <akpm@linux-foundation.org>, <zhengbin13@huawei.com>,
        <jack@suse.cz>, <yanaijie@huawei.com>, <darrick.wong@oracle.com>,
        <linux.bhar@gmail.com>, <hariprasad.kelam@gmail.com>,
        <deepa.kernel@gmail.com>, <reiserfs-devel@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <79c5135d-ff25-1cc9-4e99-9f572b88cc00@huawei.com>
CC:     "hushiyuan@huawei.com" <hushiyuan@huawei.com>,
        "linfeilong@huawei.com" <linfeilong@huawei.com>
Message-ID: <20c04f55-aa48-d28a-f8ff-1efed8a38f3a@huawei.com>
Date:   Mon, 16 Dec 2019 20:05:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <79c5135d-ff25-1cc9-4e99-9f572b88cc00@huawei.com>
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

