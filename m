Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A60742254E7
	for <lists+reiserfs-devel@lfdr.de>; Mon, 20 Jul 2020 02:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgGTAOi (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sun, 19 Jul 2020 20:14:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726159AbgGTAOi (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 19 Jul 2020 20:14:38 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 525CCC0619D2;
        Sun, 19 Jul 2020 17:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=TkhWvc8l5CWS7bsnAdkWIdDqNQ8IJGTo9sI225rq3q4=; b=F97bN00y3oZwW6tXBYCAsEozAk
        KYJN3W/aECayJzQSpsGwG4AD0hR8oYAYaJSS718Rx2y4ljPfyfVfYvKY9+ZjTejnFtdCqotwk+5/X
        bFa8A/wMZDTgkwANY7tsfq1X6BolD6eZzCTilngKKlQmWxOF0ABKhUjFBPbxLZxOv960dpu4bsNtV
        Mx4bocaliEvjvET+6y7k6KWVM+7afWLYJBa4CahI1XrHOmP9J0fSSAA1ILxMoGSNRPMqsRGiIxqXW
        rIUtWvPKAI5pJxYpWxe6dxAgv9dlcoc84rXVsFGLxIXFwFYuqkCSCL6rpwco+7p2rrYGtii7o4jpW
        p6eXJtqg==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jxJRz-00040R-GU; Mon, 20 Jul 2020 00:14:36 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>, Jan Kara <jack@suse.cz>,
        Jeff Mahoney <jeffm@suse.com>, reiserfs-devel@vger.kernel.org
Subject: [PATCH] reiserfs: reiserfs.h: delete a duplicated word
Date:   Sun, 19 Jul 2020 17:14:31 -0700
Message-Id: <20200720001431.29718-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Drop the repeated word "than" in a comment.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jan Kara <jack@suse.cz>
Cc: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel@vger.kernel.org
---
 fs/reiserfs/reiserfs.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200717.orig/fs/reiserfs/reiserfs.h
+++ linux-next-20200717/fs/reiserfs/reiserfs.h
@@ -1109,7 +1109,7 @@ int is_reiserfs_jr(struct reiserfs_super
  * ReiserFS leaves the first 64k unused, so that partition labels have
  * enough space.  If someone wants to write a fancy bootloader that
  * needs more than 64k, let us know, and this will be increased in size.
- * This number must be larger than than the largest block size on any
+ * This number must be larger than the largest block size on any
  * platform, or code will break.  -Hans
  */
 #define REISERFS_DISK_OFFSET_IN_BYTES (64 * 1024)
