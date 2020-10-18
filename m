Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55A10291B7E
	for <lists+reiserfs-devel@lfdr.de>; Sun, 18 Oct 2020 21:32:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731772AbgJRTbu (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sun, 18 Oct 2020 15:31:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:42788 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731944AbgJRT1K (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 18 Oct 2020 15:27:10 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2B7A2207DE;
        Sun, 18 Oct 2020 19:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603049229;
        bh=BDaNRQlXFgIo1MS5RhoWgPQZFBQSTt8FJD73v82WDac=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Hd+9wZEbGYyyu0BmZ1uN64CEA/hWp/PyX250W5RWIpj/n25qEnKJesDyqvWHIOodH
         lv1zvLR1Eqi4Gjov+JRJupEzc8zEDO6yBEwTu0ExBidKNSzgVIkg2jnNK6aaupz0Px
         JxUxzuJEkIFpdK1elsByoASTim+LfqD3tjNPq+GY=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Eric Biggers <ebiggers@google.com>,
        syzbot+187510916eb6a14598f7@syzkaller.appspotmail.com,
        Jan Kara <jack@suse.cz>, Sasha Levin <sashal@kernel.org>,
        reiserfs-devel@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 28/41] reiserfs: only call unlock_new_inode() if I_NEW
Date:   Sun, 18 Oct 2020 15:26:22 -0400
Message-Id: <20201018192635.4056198-28-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201018192635.4056198-1-sashal@kernel.org>
References: <20201018192635.4056198-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

From: Eric Biggers <ebiggers@google.com>

[ Upstream commit 8859bf2b1278d064a139e3031451524a49a56bd0 ]

unlock_new_inode() is only meant to be called after a new inode has
already been inserted into the hash table.  But reiserfs_new_inode() can
call it even before it has inserted the inode, triggering the WARNING in
unlock_new_inode().  Fix this by only calling unlock_new_inode() if the
inode has the I_NEW flag set, indicating that it's in the table.

This addresses the syzbot report "WARNING in unlock_new_inode"
(https://syzkaller.appspot.com/bug?extid=187510916eb6a14598f7).

Link: https://lore.kernel.org/r/20200628070057.820213-1-ebiggers@kernel.org
Reported-by: syzbot+187510916eb6a14598f7@syzkaller.appspotmail.com
Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Jan Kara <jack@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/reiserfs/inode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index 9531b6c18ac7b..6613afc6595fa 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -2170,7 +2170,8 @@ int reiserfs_new_inode(struct reiserfs_transaction_handle *th,
 out_inserted_sd:
 	clear_nlink(inode);
 	th->t_trans_id = 0;	/* so the caller can't use this handle later */
-	unlock_new_inode(inode); /* OK to do even if we hadn't locked it */
+	if (inode->i_state & I_NEW)
+		unlock_new_inode(inode);
 	iput(inode);
 	return err;
 }
-- 
2.25.1

