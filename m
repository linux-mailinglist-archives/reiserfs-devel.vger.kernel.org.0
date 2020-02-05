Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 983D3152412
	for <lists+reiserfs-devel@lfdr.de>; Wed,  5 Feb 2020 01:28:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727522AbgBEA2J (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 4 Feb 2020 19:28:09 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55528 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727494AbgBEA2J (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 4 Feb 2020 19:28:09 -0500
Received: by mail-wm1-f67.google.com with SMTP id q9so498085wmj.5
        for <reiserfs-devel@vger.kernel.org>; Tue, 04 Feb 2020 16:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language;
        bh=Z1xYRpb1bVfuzQWiaKtil6nM5cdeU/NKJAbYLl6vRZs=;
        b=S/CWflw75H0hdZkF92cotz9oJIIPVwXOywvc4hZqCo7o6iToEj63QEEtAajpfIYW1f
         zmgNCGeXSWj8L2MVHhVtYxO5QtxNFJhKceYCUm8pGxI24ExtoQtPrXmpHX5U8ddhGX25
         UCqsEONUGhKQ8B7NE+wxzPHFnHFbNHW8aGs4eY1mxd9JUcC69L+tbTOC20p8uCOnK9mM
         TbY8Rcko2HOP9tWJ6a+PHh6JUykEGJqZ8ZOZtZr1ElBlCh/sYwYzgofpF/Mro/6vJQge
         ccE7vbyLt0hC81QtU8bfrTupMs8Y+HTMQvmMj/uSp30N69kbLP865MO4h97/CeStHTkC
         sBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language;
        bh=Z1xYRpb1bVfuzQWiaKtil6nM5cdeU/NKJAbYLl6vRZs=;
        b=kyQ2EQNa9aM7FEPjrYjjeODtTu/AvWjsQN8B8Q01dyns2ecqM1KICx4gQiyGHrYwla
         jAybBgdo34SyPMwSwS+TXXUE5rzx/CjJq4xgvkvuTGcvYyULE8tQy4F4rRAdDr4ZqExW
         EKfAoNssplelFhQ8YP2z2oEamDNTMDZuQYfrqq9/nGB6kOF2y5LnhpNnugq1hnJojgzb
         fDDBuTsBKtARm3Hn0miAnp4/MPOstKqdjw5VjDS4D7pBCKZNoc1oRgZ/QA+JIO8AmKKM
         AwcqpB2ZJoI2dNpPWLJd0JnlbHPbFytqLErWQrApVVakE9bXJQCyIJis6gB3aI3faTnc
         /TbQ==
X-Gm-Message-State: APjAAAVhnSCnHMvY28ST2btsbylEupDlaLBzLbhiuwMuEbPRJmBIeRDa
        O7t4zP9+q4O+LSiuOnn0EsnnxkO9APE=
X-Google-Smtp-Source: APXvYqzc4EC5sih/SfvdwmEMlOe08q3hN4ohiN2o7jQ+RS2HfdqWvO5Zkh9SIAGa0J/qXyldFu37Pg==
X-Received: by 2002:a05:600c:2c06:: with SMTP id q6mr1788956wmg.154.1580862487756;
        Tue, 04 Feb 2020 16:28:07 -0800 (PST)
Received: from [192.168.0.48] (HSI-KBW-46-223-1-130.hsi.kabel-badenwuerttemberg.de. [46.223.1.130])
        by smtp.gmail.com with ESMTPSA id a13sm32829874wrp.93.2020.02.04.16.28.07
        for <reiserfs-devel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Feb 2020 16:28:07 -0800 (PST)
To:     ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>
From:   Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH] reiser4: prevent system lockups
Message-ID: <94861335-0ff3-a8cf-8d73-e0f521fa0ffa@gmail.com>
Date:   Wed, 5 Feb 2020 01:28:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------F3FF70D4737419259F49BAF5"
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

This is a multi-part message in MIME format.
--------------F3FF70D4737419259F49BAF5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

Starting from Linux-4.15, VFS introduces optimizations, which
are incompatible with Reiser4 (as well as with any FS possessing
an advanced transaction manager). Here is the problematic commit:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aa65c29ce1b6e1990cd2c7d8004bbea7ff3aff38

The attached patch fixes the problem. This patch is against
Linux-5.4+reiser4. Please, apply.

Later I'll prepare backports for all the mentioned kernels and will
put them on Sourceforge. If someone urgently needs a backport, then
let me know.

Thanks,
Edward.

--------------F3FF70D4737419259F49BAF5
Content-Type: text/x-patch;
 name="reiser4-fix-lockup.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-fix-lockup.patch"

diff -urN linux-5.4.6/fs/reiser4/page_cache.c linux-5.4.6.patched/fs/reiser4/page_cache.c
--- linux-5.4.6/fs/reiser4/page_cache.c	2020-02-05 00:08:07.121592727 +0100
+++ linux-5.4.6.patched/fs/reiser4/page_cache.c	2020-02-05 00:09:44.508645047 +0100
@@ -549,7 +549,8 @@
 	 */
 	.releasepage = reiser4_releasepage,
 	.direct_IO = NULL,
-	.migratepage = reiser4_migratepage
+	.migratepage = reiser4_migratepage,
+	.batch_lock_tabu = 1
 };
 
 /* called just before page is released (no longer used by reiser4). Callers:
diff -urN linux-5.4.6/fs/reiser4/plugin/object.c linux-5.4.6.patched/fs/reiser4/plugin/object.c
--- linux-5.4.6/fs/reiser4/plugin/object.c	2020-02-05 00:08:07.129592814 +0100
+++ linux-5.4.6.patched/fs/reiser4/plugin/object.c	2020-02-05 00:09:44.508645047 +0100
@@ -150,7 +150,8 @@
 	.bmap = reiser4_bmap_dispatch,
 	.invalidatepage = reiser4_invalidatepage,
 	.releasepage = reiser4_releasepage,
-	.migratepage = reiser4_migratepage
+	.migratepage = reiser4_migratepage,
+	.batch_lock_tabu = 1
 };
 
 /* VFS methods for symlink files */
diff -urN linux-5.4.6/include/linux/fs.h linux-5.4.6.patched/include/linux/fs.h
--- linux-5.4.6/include/linux/fs.h	2020-02-05 00:08:07.135592878 +0100
+++ linux-5.4.6.patched/include/linux/fs.h	2020-02-05 00:09:21.339394689 +0100
@@ -409,6 +409,7 @@
 	int (*swap_activate)(struct swap_info_struct *sis, struct file *file,
 				sector_t *span);
 	void (*swap_deactivate)(struct file *file);
+	int batch_lock_tabu;
 };
 
 extern const struct address_space_operations empty_aops;
diff -urN linux-5.4.6/mm/truncate.c linux-5.4.6.patched/mm/truncate.c
--- linux-5.4.6/mm/truncate.c	2019-12-21 11:05:23.000000000 +0100
+++ linux-5.4.6.patched/mm/truncate.c	2020-02-05 00:09:21.339394689 +0100
@@ -360,6 +360,13 @@
 				continue;
 			}
 			pagevec_add(&locked_pvec, page);
+			if (mapping->a_ops->batch_lock_tabu)
+				/*
+				 * the file system doesn't allow to hold
+				 * many pages locked, while calling
+				 * ->invalidatepage() for one of them
+				 */
+				break;
 		}
 		for (i = 0; i < pagevec_count(&locked_pvec); i++)
 			truncate_cleanup_page(mapping, locked_pvec.pages[i]);

--------------F3FF70D4737419259F49BAF5--
