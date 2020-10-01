Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D325127FC2F
	for <lists+reiserfs-devel@lfdr.de>; Thu,  1 Oct 2020 11:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731628AbgJAJGA (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 1 Oct 2020 05:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgJAJGA (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 1 Oct 2020 05:06:00 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDDC2C0613D0;
        Thu,  1 Oct 2020 02:05:59 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id s31so3557328pga.7;
        Thu, 01 Oct 2020 02:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o+n930xyfkrF12hPhSCQSJtiGdIh1Oqz/H5hvm0xQ2E=;
        b=a34Jtsu0JJNqL+ebJlBV+1sTp5jHO3arcKpfJkh+K55BWhKHBDp8S6SnJuYgbxiSlu
         lp0eNiBLX4pIxo0IYgTgfhm2zuhBh8O2UmvP3uyptpYO3utovwbzTMKftqNx5K2iRNzo
         BXLpa+WfF2X0AYr3TGL0QXZbgP3cVCn5Uo+ujromNLp9vD46zb+fhEaZUpma+evsCE0E
         +zNHnLIvPH2lurCRUak86+bY6jblUfw7iKQbRK/+oZzRg0pFivsxwmF4jyUaAJ8IYUI4
         iVsDC3gEPjT8tjVYZkWoS0282eVasCq3uwkps5VJGd/4aa5FjUFmL8S5LzI9VJPhwxtn
         GzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o+n930xyfkrF12hPhSCQSJtiGdIh1Oqz/H5hvm0xQ2E=;
        b=nFwk9qjMyiHyhDq4lWpo+9gRUaqMkgKb7DcHqngKbHNg0RsmljEXrheFQxOFIMfYVT
         a4oUDB0tiuZ2zezmzjBp1T4czaRbmVy9VyhjwAemnWksJLsHYKvBK7R4hOnSvqhFcsHq
         o/SI5URROpXJOUitZPeouaQGS3d/uj9I3vL/L7DDDMgjjf3XdWDNcuvbYqAQENpVjQUO
         SD92nITicpz/WaoBWNNFUQfV23XZA1IZFIC6KF7WKlK7IqV4VqHkkcp8FWgVoq+KG4vi
         TeH7XACgIYUWI/AgBx+FHUrHOQXqQqA1h0aFoUkuiCf/ryyfh/pBFOgk7pTggKRF/lLF
         wYAA==
X-Gm-Message-State: AOAM532t+61Ub3R74ymLO/4IEiwJg521iOtr6twrIB5weXrykXT9kjCF
        Ibt9CcdxSwcIuTGYbVLq7/dg5Ud71ZSV8yJH
X-Google-Smtp-Source: ABdhPJxEo2cCaMAsL2FuAUfE+cu6vWbE7YNB1CKjOvfZm/YpDXdKe0OwpxnXA6BQHS+XYEojiaVgIQ==
X-Received: by 2002:a62:26c1:0:b029:142:2501:35ef with SMTP id m184-20020a6226c10000b0290142250135efmr6072501pfm.79.1601543159103;
        Thu, 01 Oct 2020 02:05:59 -0700 (PDT)
Received: from localhost.localdomain ([45.118.167.204])
        by smtp.googlemail.com with ESMTPSA id q5sm4489607pgh.16.2020.10.01.02.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 02:05:57 -0700 (PDT)
From:   Anmol Karn <anmol.karan123@gmail.com>
To:     jack@suse.cz, jeffm@suse.com
Cc:     linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        syzkaller-bugs@googlegroups.com, anmol.karan123@gmail.com,
        syzbot+9b33c9b118d77ff59b6f@syzkaller.appspotmail.com
Subject: [Linux-kernel-mentees] [PATCH] fs: reiserfs: xattr: Fix null pointer derefernce in open_xa_root()
Date:   Thu,  1 Oct 2020 14:35:47 +0530
Message-Id: <20201001090547.431840-1-anmol.karan123@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

d_really_is_negative() checks for the dentry->d_inode whether it's NULL or not, 
but in open_xa_root(), when it checks 'privroot->d_inode', it doesn't check whether
privroot is NULL or not, this leads to a null pointer dereference while calling it 
from open_xa_dir() while initializing xaroot.

- fs/reiserfs/xattr.c
The bug seems to get triggered at this line:
	
if (d_really_is_negative(privroot))
		return ERR_PTR(-EOPNOTSUPP);

Fix it by adding a NULL check for privroot. 

Reported-and-tested-by: syzbot+9b33c9b118d77ff59b6f@syzkaller.appspotmail.com 
Link: https://syzkaller.appspot.com/bug?extid=9b33c9b118d77ff59b6f 
Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
---
 fs/reiserfs/xattr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/reiserfs/xattr.c b/fs/reiserfs/xattr.c
index 28b241cd6987..a75480d0ee7e 100644
--- a/fs/reiserfs/xattr.c
+++ b/fs/reiserfs/xattr.c
@@ -121,8 +121,9 @@ static struct dentry *open_xa_root(struct super_block *sb, int flags)
 	struct dentry *privroot = REISERFS_SB(sb)->priv_root;
 	struct dentry *xaroot;
 
-	if (d_really_is_negative(privroot))
+	if (!privroot || d_really_is_negative(privroot)) {
 		return ERR_PTR(-EOPNOTSUPP);
+	}
 
 	inode_lock_nested(d_inode(privroot), I_MUTEX_XATTR);
 
-- 
2.28.0

