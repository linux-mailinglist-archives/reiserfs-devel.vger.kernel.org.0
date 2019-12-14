Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 908AD11F504
	for <lists+reiserfs-devel@lfdr.de>; Sun, 15 Dec 2019 00:13:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbfLNXND (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sat, 14 Dec 2019 18:13:03 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:54060 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbfLNXND (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sat, 14 Dec 2019 18:13:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
        Subject:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=i+DDtky/nAKB+Rdsf1AfFhIsxPrHwkb2kPd66eWH5Ik=; b=p/zLE2ZTwWta6mQbO5dSZHUMC
        N4zSvVSULuKdmAD+dNkNq7GIqD7lMfxYiPyCdql0YPWAFFo1jcKIiABiuJ3607ZIa2COCzVgtDFbS
        1ypvgqjGuo5tVLomdSg1GY5Pi6jg/c4okebGYqw20zcRae+jG9kq9E++QhkMWh9fb7EEIG9nkIB3a
        VwEMIAbSdRNA2H2sWGN4EQT3wabvhz/vPgRIZRurts+aTOLwk8eym8fHpIEahDWCZMWnEDy9LCrhw
        cockEx5l+bFH541mXRYwtfCtThFRv6utHgtK1vWkN0+DWvFugEhDSgsL8K9B2us3WJHsWcb7OpkcH
        vcEfSbOHg==;
Received: from [2601:1c0:6280:3f0::fee9]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1igGap-0002Uz-Ey; Sat, 14 Dec 2019 23:12:59 +0000
Subject: [PATCH] Re: memory leak in reiserfs_fill_super
To:     syzbot <syzbot+1c6756baf4b16b94d2a6@syzkaller.appspotmail.com>,
        deepa.kernel@gmail.com, jack@suse.cz, jeffm@suse.com,
        jlayton@kernel.org, linux-kernel@vger.kernel.org,
        reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
        viro@zeniv.linux.org.uk
References: <000000000000ab22f20599779d25@google.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <dbad2a8f-5a58-ecb5-eec7-1d6ef90abaed@infradead.org>
Date:   Sat, 14 Dec 2019 15:12:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <000000000000ab22f20599779d25@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

fill_super() conditionally allocates a jdev string if "jdev=x"
is specified.  put_super() should free that memory.

Reported-by: syzbot+1c6756baf4b16b94d2a6@syzkaller.appspotmail.com
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 fs/reiserfs/super.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20191213.orig/fs/reiserfs/super.c
+++ linux-next-20191213/fs/reiserfs/super.c
@@ -629,6 +629,7 @@ static void reiserfs_put_super(struct su
 	reiserfs_write_unlock(s);
 	mutex_destroy(&REISERFS_SB(s)->lock);
 	destroy_workqueue(REISERFS_SB(s)->commit_wq);
+	kfree(REISERFS_SB(s)->s_jdev);
 	kfree(s->s_fs_info);
 	s->s_fs_info = NULL;
 }

