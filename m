Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 985FA2E10CE
	for <lists+reiserfs-devel@lfdr.de>; Wed, 23 Dec 2020 01:36:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbgLWAfu (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 22 Dec 2020 19:35:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbgLWAfu (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 22 Dec 2020 19:35:50 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3385DC0613D3
        for <reiserfs-devel@vger.kernel.org>; Tue, 22 Dec 2020 16:35:10 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id b9so20661317ejy.0
        for <reiserfs-devel@vger.kernel.org>; Tue, 22 Dec 2020 16:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language;
        bh=KC1hZ/GVZw+uqoGYbe+l4o8l/kdsCISh0crtDONigD8=;
        b=Ntd7PFL3tuCu9TO7xnVCjHXxMyXnVzrhFqYXqzCT7q6y7rco34SDU3OzgaIrcKiJ19
         WvoAUiqcROCZGbtD0lAvErHE5DXxhyfQWhjP+BC/0r/V7qWPqWNVk8eVw5ePn+rv4McL
         CI2POaK7FTagNvxOAIX9EF6J/pa1j6BU/CDHaCT8ZIatkTYBNiN0WDIvZKhT1LUxDL8+
         bZ9y6cKxWAUBiECgoM4413PmvFVT46Ueu7HTiR4IToziRKsUU1G3ROcVaVCCBHVnrQfX
         TTm7GCXz0mnxrciAu/yvU1/N+6Bfz0zyF7+PfG3zq4brKe3qSarawIy/7z9iJI6A56gO
         ib0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language;
        bh=KC1hZ/GVZw+uqoGYbe+l4o8l/kdsCISh0crtDONigD8=;
        b=a3URx8umm1MBMWrNqXCUZ12hlIQw6qL2MLlPLewTdqb9b8f67ZavkR133K16sKqNUt
         L7YEEyeTF4rUBnSLJxI66KA/eS/VNKIha7QOgJSOs+OUDGgfhUJFNG+KSulp0wVlNDTt
         tGfdNO7cbKPNuLvrKChkYdX5qarmTO4wlkFeQXexL85dFAKrhsW4Kk2IgpQDEAxH/Be9
         jrPR6RmZE6RRZa6ICBsHA9BiEKelahYFTVCMNBX232lW5gZy8bJ3hdzW/eRCkVykU1ai
         JAsISeKbUXyQ/kqhgaCny6QYsOK85cdy+2IftBRlkBqVYjq2/s8cmTBdMdG2FSQXv3i3
         zvaQ==
X-Gm-Message-State: AOAM5335xXyb/3kPdaGRPDSch/Vigfp+0+hv/VyqISkOG7tb39/3Dofs
        lWEaWu3lWKE8Zetb5acOk7O6jlVlPuU=
X-Google-Smtp-Source: ABdhPJz92o/mlyXkVaop96PxvaQ3TqfzhDKz8JVKfOWwvH7PUB20NUfShwcV5fuDDJ50vI6aXMpoaA==
X-Received: by 2002:a17:906:7a18:: with SMTP id d24mr22353339ejo.324.1608683708800;
        Tue, 22 Dec 2020 16:35:08 -0800 (PST)
Received: from [192.168.0.48] (HSI-KBW-046-005-005-168.hsi8.kabel-badenwuerttemberg.de. [46.5.5.168])
        by smtp.gmail.com with ESMTPSA id dk16sm10970741ejb.85.2020.12.22.16.35.07
        for <reiserfs-devel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Dec 2020 16:35:08 -0800 (PST)
To:     ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>
From:   Edward Shishkin <edward.shishkin@gmail.com>
Subject: [PATCH] reiser4: port for Linux-5.10
Message-ID: <4e8963df-33e4-8c8f-5eae-afa1bdcb44ed@gmail.com>
Date:   Wed, 23 Dec 2020 01:35:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------139F299A316E52C3DA9F5182"
Content-Language: en-US
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

This is a multi-part message in MIME format.
--------------139F299A316E52C3DA9F5182
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Don't add/use PF_FLUSHER per task flag.
Instead add/use per reiser4_context flag flush_bd_task to indicate
that it is bd flushing task.

--------------139F299A316E52C3DA9F5182
Content-Type: text/x-patch;
 name="reiser4-get-rid-of-pf_flusher_flag.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-get-rid-of-pf_flusher_flag.patch"

diff -urN linux-5.8.10-reiser4/fs/fs-writeback.c linux-5.8.10/fs/fs-writeback.c
--- linux-5.8.10-reiser4/fs/fs-writeback.c	2020-10-11 21:00:01.000000000 +0200
+++ linux-5.8.10/fs/fs-writeback.c	2020-12-12 15:33:16.000000000 +0100
@@ -2090,7 +2090,7 @@
 	long pages_written;
 
 	set_worker_desc("flush-%s", bdi_dev_name(wb->bdi));
-	current->flags |= PF_FLUSHER | PF_SWAPWRITE;
+	current->flags |= PF_SWAPWRITE;
 
 	if (likely(!current_is_workqueue_rescuer() ||
 		   !test_bit(WB_registered, &wb->state))) {
diff -urN linux-5.8.10-reiser4/fs/reiser4/context.c linux-5.8.10/fs/reiser4/context.c
--- linux-5.8.10-reiser4/fs/reiser4/context.c	2020-10-11 20:55:06.000000000 +0200
+++ linux-5.8.10/fs/reiser4/context.c	2020-12-12 15:56:05.000000000 +0100
@@ -153,7 +153,7 @@
 	if (sbinfo != NULL && sbinfo->fake != NULL &&
 	    context->nr_marked_dirty != 0 &&
 	    !(current->flags & PF_MEMALLOC) &&
-	    !current_is_flush_bd_task())
+	    !context->flush_bd_task)
  		reiser4_throttle_write(sbinfo->fake);
 }
 
diff -urN linux-5.8.10-reiser4/fs/reiser4/context.h linux-5.8.10/fs/reiser4/context.h
--- linux-5.8.10-reiser4/fs/reiser4/context.h	2020-10-11 20:55:06.000000000 +0200
+++ linux-5.8.10/fs/reiser4/context.h	2020-12-12 16:46:39.000000000 +0100
@@ -64,6 +64,8 @@
 	unsigned int on_stack:1;
 	/* file system is read-only */
 	unsigned int ro:1;
+	/* replacement of PF_FLUSHER */
+	unsigned int flush_bd_task:1;
 
 	/* count non-trivial jnode_set_dirty() calls */
 	unsigned long nr_marked_dirty;
diff -urN linux-5.8.10-reiser4/fs/reiser4/super_ops.c linux-5.8.10/fs/reiser4/super_ops.c
--- linux-5.8.10-reiser4/fs/reiser4/super_ops.c	2020-10-11 20:55:06.000000000 +0200
+++ linux-5.8.10/fs/reiser4/super_ops.c	2020-12-12 15:49:06.000000000 +0100
@@ -383,6 +383,7 @@
 		spin_lock(&wb->list_lock);
 		goto skip;
 	}
+	ctx->flush_bd_task = 1;
 	/*
 	 * call reiser4_writepages for each of dirty inodes to turn
 	 * dirty pages into transactions if they were not yet.
diff -urN linux-5.8.10-reiser4/fs/reiser4/txnmgr.c linux-5.8.10/fs/reiser4/txnmgr.c
--- linux-5.8.10-reiser4/fs/reiser4/txnmgr.c	2020-10-11 20:55:06.000000000 +0200
+++ linux-5.8.10/fs/reiser4/txnmgr.c	2020-12-12 15:55:04.000000000 +0100
@@ -1413,7 +1413,7 @@
 		 * Write throttling is case of no one atom can be
 		 * flushed/committed.
 		 */
-		if (!current_is_flush_bd_task()) {
+		if (!ctx->flush_bd_task) {
 			list_for_each_entry(atom, &tmgr->atoms_list, atom_link) {
 				spin_lock_atom(atom);
 				/* Repeat the check from the above. */
diff -urN linux-5.8.10-reiser4/include/linux/sched.h linux-5.8.10/include/linux/sched.h
--- linux-5.8.10-reiser4/include/linux/sched.h	2020-10-11 20:55:06.000000000 +0200
+++ linux-5.8.10/include/linux/sched.h	2020-12-12 15:58:22.000000000 +0100
@@ -1483,7 +1483,6 @@
 /*
  * Per process flags
  */
-#define PF_FLUSHER              0x00000001      /* responsible for disk writeback */
 #define PF_IDLE			0x00000002	/* I am an IDLE thread */
 #define PF_EXITING		0x00000004	/* Getting shut down */
 #define PF_VCPU			0x00000010	/* I'm a virtual CPU */
diff -urN linux-5.8.10-reiser4/include/linux/writeback.h linux-5.8.10/include/linux/writeback.h
--- linux-5.8.10-reiser4/include/linux/writeback.h	2020-10-11 20:59:43.000000000 +0200
+++ linux-5.8.10/include/linux/writeback.h	2020-12-12 15:30:43.000000000 +0100
@@ -17,12 +17,6 @@
 
 DECLARE_PER_CPU(int, dirty_throttle_leaks);
 
-static inline int is_flush_bd_task(struct task_struct *task)
-{
-       return task->flags & PF_FLUSHER;
-}
-#define current_is_flush_bd_task()  is_flush_bd_task(current)
-
 /*
  * The 1/4 region under the global dirty thresh is for smooth dirty throttling:
  *

--------------139F299A316E52C3DA9F5182--
