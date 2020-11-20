Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 743B22BB346
	for <lists+reiserfs-devel@lfdr.de>; Fri, 20 Nov 2020 19:38:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730292AbgKTScJ (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 20 Nov 2020 13:32:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:51322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730315AbgKTScJ (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 20 Nov 2020 13:32:09 -0500
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6564624137;
        Fri, 20 Nov 2020 18:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605897128;
        bh=iulE+KLntbnkYHnpp3V6ms2NVYQETxkeP+5vYNfCD8w=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=sBu+qenmt30F7OoM3sUlnKTAqwsekFyc9baqj29e99o/ArUzPGx2hDEspU89Obts6
         jbqAMbsfYcrDWsOthAfZpyjhcKGOzj8qqk9R28nmLorBvwSH3JIZHE9ee1nQEHvMh4
         T7gp2qNgpACnhChuQFMGDOMEoD1xVahLjcugQYuU=
Date:   Fri, 20 Nov 2020 12:32:14 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH 051/141] reiserfs: Fix fall-through warnings for Clang
Message-ID: <6859fecccd96f79612f9650fdba7a66bbff70560.1605896059.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
by explicitly adding a break statement instead of letting the code fall
through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 fs/reiserfs/namei.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/reiserfs/namei.c b/fs/reiserfs/namei.c
index 1594687582f0..90bb49bfdba0 100644
--- a/fs/reiserfs/namei.c
+++ b/fs/reiserfs/namei.c
@@ -132,6 +132,7 @@ int search_by_entry_key(struct super_block *sb, const struct cpu_key *key,
 			return IO_ERROR;
 		}
 		PATH_LAST_POSITION(path)--;
+		break;
 
 	case ITEM_FOUND:
 		break;
-- 
2.27.0

