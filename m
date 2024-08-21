Return-Path: <reiserfs-devel+bounces-154-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD3B9594EF
	for <lists+reiserfs-devel@lfdr.de>; Wed, 21 Aug 2024 08:44:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A02041C21330
	for <lists+reiserfs-devel@lfdr.de>; Wed, 21 Aug 2024 06:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFFB21C8FBB;
	Wed, 21 Aug 2024 06:44:13 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939EF1C8FBF
	for <reiserfs-devel@vger.kernel.org>; Wed, 21 Aug 2024 06:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724222653; cv=none; b=u20tPdAwn88h7vTYdoDngTCA5YGD+eFibkvf7VzCpbB3fWTMmjRg3IaLuMQ8boWR/fPXspXbRsQvAbD2zSjtCx3J6dWoGy4eT/KLB43YxfoqUuEtH84hCbn9Ggro6jh74C7NfblrvztraGTRKH7L7TzYV5jX57sFs75pNsMoX90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724222653; c=relaxed/simple;
	bh=tJp1wiBWBE8a2Bt0Eus2XskrmbhnDuoHXXMfd9+oQU0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Cfoao3PHnd9N8c6HHFpSqCwngH+XVC5OmTuiYkU3mWAlfTvA/35FHJ3Nh7JB0MYYWeR/O+Tu/AFHyyvBxEdQJt+4OSQM9r4QB8TKGUdx2y8O07AHn4b92kID7nTp+rvqqpQEofuKidRkrMp5UUJhEyBf2gbkbPByzU0aC+82mQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WpcD7648Qz1HGTt;
	Wed, 21 Aug 2024 14:40:55 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id B84A31401E9;
	Wed, 21 Aug 2024 14:44:07 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 21 Aug
 2024 14:44:07 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <brauner@kernel.org>, <jack@suse.cz>, <viro@zeniv.linux.org.uk>
CC: <lihongbo22@huawei.com>, <reiserfs-devel@vger.kernel.org>
Subject: [PATCH -next] reiserfs: use LIST_HEAD() to simplify code
Date: Wed, 21 Aug 2024 14:51:36 +0800
Message-ID: <20240821065136.2293615-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500022.china.huawei.com (7.185.36.66)

list_head can be initialized automatically with LIST_HEAD()
instead of calling INIT_LIST_HEAD().

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 fs/reiserfs/journal.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index e477ee0ff35d..606b363196aa 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -795,8 +795,7 @@ static int write_ordered_buffers(spinlock_t * lock,
 	struct reiserfs_jh *jh;
 	int ret = j->j_errno;
 	struct buffer_chunk chunk;
-	struct list_head tmp;
-	INIT_LIST_HEAD(&tmp);
+	LIST_HEAD(tmp);
 
 	chunk.nr = 0;
 	spin_lock(lock);
-- 
2.34.1


