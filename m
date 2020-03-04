Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E8C217912C
	for <lists+reiserfs-devel@lfdr.de>; Wed,  4 Mar 2020 14:19:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728969AbgCDNTN (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 4 Mar 2020 08:19:13 -0500
Received: from mx2.suse.de ([195.135.220.15]:47266 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726440AbgCDNTN (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 4 Mar 2020 08:19:13 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id BCAF3AD41;
        Wed,  4 Mar 2020 13:19:11 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
        id 6F64A1E0E99; Wed,  4 Mar 2020 14:19:11 +0100 (CET)
From:   Jan Kara <jack@suse.cz>
To:     reiserfs-devel@vger.kernel.org
Cc:     <linux-fsdevel@vger.kernel.org>, Jan Kara <jack@suse.cz>
Subject: [PATCH] reiserfs: Fix memory leak in reiserfs_parse_options()
Date:   Wed,  4 Mar 2020 14:18:59 +0100
Message-Id: <20200304131859.24219-1-jack@suse.cz>
X-Mailer: git-send-email 2.16.4
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

When a usrjquota or grpjquota mount option is used multiple times, we
will leak memory allocated for the file name. Make sure the last setting
is used and all the previous ones are properly freed.

Reported-by: syzbot+c9e294bbe0333a6b7640@syzkaller.appspotmail.com
Signed-off-by: Jan Kara <jack@suse.cz>
---
 fs/reiserfs/super.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

I'll queue this patch to my tree if nobody objects.

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index a6bce5b1fb1d..1b9c7a387dc7 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -1258,6 +1258,10 @@ static int reiserfs_parse_options(struct super_block *s,
 						 "turned on.");
 				return 0;
 			}
+			if (qf_names[qtype] !=
+			    REISERFS_SB(s)->s_qf_names[qtype])
+				kfree(qf_names[qtype]);
+			qf_names[qtype] = NULL;
 			if (*arg) {	/* Some filename specified? */
 				if (REISERFS_SB(s)->s_qf_names[qtype]
 				    && strcmp(REISERFS_SB(s)->s_qf_names[qtype],
@@ -1287,10 +1291,6 @@ static int reiserfs_parse_options(struct super_block *s,
 				else
 					*mount_options |= 1 << REISERFS_GRPQUOTA;
 			} else {
-				if (qf_names[qtype] !=
-				    REISERFS_SB(s)->s_qf_names[qtype])
-					kfree(qf_names[qtype]);
-				qf_names[qtype] = NULL;
 				if (qtype == USRQUOTA)
 					*mount_options &= ~(1 << REISERFS_USRQUOTA);
 				else
-- 
2.16.4

