Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31BCC2A1E77
	for <lists+reiserfs-devel@lfdr.de>; Sun,  1 Nov 2020 15:09:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726705AbgKAOJW (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sun, 1 Nov 2020 09:09:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbgKAOJV (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 1 Nov 2020 09:09:21 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 416AFC0617A6;
        Sun,  1 Nov 2020 06:09:21 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id a3so1977000pjh.1;
        Sun, 01 Nov 2020 06:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/9og09u1zo9NX9D44RRZapG5HLQMVJBUImJCPrX7E10=;
        b=XBh/ZQG09VwZL2EiUVzXO6QoYMWPFNyQYMfhzBF87zIMxDKw/abftzYZmS6wvWLkbS
         g7P2btAbHk+L2gY3o938IL/n3CQPr3ao8xbur4ni1agGW4PpkVC/AtOHgUgTvn13Q57A
         OEdeSwKAUBJVOZ6jggwWuREPbU+2R8JCK4v4wHDtQtOr1aX1rSx+CHw00EY4KWF7gWJx
         s9JrWfTd9NRMreR8tY6zF23u/nzMQFTcIGAdb+cbQOeswmQjsYiYr513w8dx7skmOWKx
         V6yjWK6ab2pFmq1MkJG9VLBexCPbmSk+maswIuLhitqmUXIN2oBm7+0cZbYfOIF5bLN7
         ZHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/9og09u1zo9NX9D44RRZapG5HLQMVJBUImJCPrX7E10=;
        b=D1k5PJZTJArIpxHiPTOAc5krXOM/lzsgaY67IzaZMfXC7Phq89AiiiFpODSvgtYyFZ
         gFvPPAET7o+PNT7c3FGaqxelYLPu492eLG+XFofIQWZuQMiT2uXSrR9/NUwqZ/uSehF9
         +lPKCW9s9CdERdDynWKuifrqWsxhKJtqC1DE+kK7fhgP/ly1vSryFP8miP7IiOkBge6E
         uhTHlwTLZCosdUJxBTQJl5X0OR5YJouAdH1CImQG+BNKQli6qI6iC/ezBVwuMHdeCoYv
         avBYBmVv8wUtmeMgdrmBq2XhLxM3/fW4CJDhbkAFn7oF2DZ8y1dCFtqG0qTJMAoHHUqP
         Nx8w==
X-Gm-Message-State: AOAM531jqcmjozKNynejZml0Lx5X8UaI5gixQY9P5NN87vsvBwckwFym
        RT2Xt05DiF/rkePwOo60FCc=
X-Google-Smtp-Source: ABdhPJxkoFz6bUWB/ur3u/570e3y4K4Q9+N1PjghCEI9WOLjGv3JghpAo05q6HUhDbI8h1O39hYbqA==
X-Received: by 2002:a17:90a:d818:: with SMTP id a24mr5215285pjv.169.1604239760740;
        Sun, 01 Nov 2020 06:09:20 -0800 (PST)
Received: from localhost.localdomain (104.36.148.139.aurocloud.com. [104.36.148.139])
        by smtp.gmail.com with ESMTPSA id i123sm11236442pfc.13.2020.11.01.06.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2020 06:09:20 -0800 (PST)
From:   Rustam Kovhaev <rkovhaev@gmail.com>
To:     alex.shi@linux.alibaba.com, jack@suse.cz,
        akpm@linux-foundation.org, yeyunfeng@huawei.com
Cc:     reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org, Rustam Kovhaev <rkovhaev@gmail.com>
Subject: [PATCH] reiserfs: add check for an invalid ih_entry_count
Date:   Sun,  1 Nov 2020 06:09:58 -0800
Message-Id: <20201101140958.3650143-1-rkovhaev@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

when directory item has an invalid value set for ih_entry_count it might
trigger use-after-free or out-of-bounds read in bin_search_in_dir_item()

ih_entry_count * IH_SIZE for directory item should not be larger than
ih_item_len

Reported-and-tested-by: syzbot+83b6f7cf9922cae5c4d7@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=83b6f7cf9922cae5c4d7
Signed-off-by: Rustam Kovhaev <rkovhaev@gmail.com>
---
 fs/reiserfs/stree.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
index 8bf88d690729..476a7ff49482 100644
--- a/fs/reiserfs/stree.c
+++ b/fs/reiserfs/stree.c
@@ -454,6 +454,12 @@ static int is_leaf(char *buf, int blocksize, struct buffer_head *bh)
 					 "(second one): %h", ih);
 			return 0;
 		}
+		if (is_direntry_le_ih(ih) && (ih_item_len(ih) < (ih_entry_count(ih) * IH_SIZE))) {
+			reiserfs_warning(NULL, "reiserfs-5093",
+					 "item entry count seems wrong %h",
+					 ih);
+			return 0;
+		}
 		prev_location = ih_location(ih);
 	}
 
-- 
2.28.0

