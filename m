Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C7E9453F9D
	for <lists+reiserfs-devel@lfdr.de>; Wed, 17 Nov 2021 05:34:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233149AbhKQEhp (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 16 Nov 2021 23:37:45 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:43862 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233165AbhKQEhp (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 16 Nov 2021 23:37:45 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 9C811212C8;
        Wed, 17 Nov 2021 04:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1637123686; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=Vm8JBp7sP6WtAAmJStkzdnz/sawLE2jCkHB8Ojd5L/A=;
        b=eZpHCda9NuCjoxUGmTxiuJxjS3VxByuKXyrdy+cpVIsK5whls1Rsst9E0G2eoIpsc1OmXO
        mp+veGGLnmMndg6en3pwSzub8fvu63zawG6nStFduUfWZQZntB28lpylZTtBLtOY/A/lmp
        JSIHupPgTZLrzCK8MOUZsVIHInKsOJg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1637123686;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=Vm8JBp7sP6WtAAmJStkzdnz/sawLE2jCkHB8Ojd5L/A=;
        b=+nakQQ+EbqBUsv14dgbSkyN/kCCGNSv0+h+BdaVAwB06FWnyE4/v4T1dQQGu22o3dRObzd
        c3yzTOuu8dj36HCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 44BE913BCD;
        Wed, 17 Nov 2021 04:34:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id BSFIAWWGlGFYGQAAMHmgww
        (envelope-from <neilb@suse.de>); Wed, 17 Nov 2021 04:34:45 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
From:   "NeilBrown" <neilb@suse.de>
To:     Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>
Cc:     reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] reiserfs: don't use congestion_wait()
Date:   Wed, 17 Nov 2021 15:34:42 +1100
Message-id: <163712368225.13692.3419908086400748349@noble.neil.brown.name>
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org


Block devices do not, in general, report congestion any more, so this
congestion_wait() is effectively just a sleep.

It isn't entirely clear what is being waited for, but as we only wait
when j_async_throttle is elevated, it seems reasonable to stop waiting
when j_async_throttle becomes zero - or after the same timeout.

So change to use wait_event_event_timeout() for waiting, and
wake_up_var() to signal an end to waiting.

Signed-off-by: NeilBrown <neilb@suse.de>
---

I have no idea who might take this.... Jens and Jan have both landed
reiserfs patches recently...

Thanks,
NeilBrown

 fs/reiserfs/journal.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 0834b101c316..a3e21160b634 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -951,7 +951,9 @@ static int reiserfs_async_progress_wait(struct super_bloc=
k *s)
 		int depth;
=20
 		depth =3D reiserfs_write_unlock_nested(s);
-		congestion_wait(BLK_RW_ASYNC, HZ / 10);
+		wait_var_event_timeout(&j->j_async_throttle,
+				       atomic_read(&j->j_async_throttle) =3D=3D 0,
+				       HZ / 10);
 		reiserfs_write_lock_nested(s, depth);
 	}
=20
@@ -1058,7 +1060,8 @@ static int flush_commit_list(struct super_block *s,
 			put_bh(tbh) ;
 		}
 	}
-	atomic_dec(&journal->j_async_throttle);
+	if (atomic_dec_and_test(&journal->j_async_throttle))
+		wake_up_var(&journal->j_async_throttle);
=20
 	for (i =3D 0; i < (jl->j_len + 1); i++) {
 		bn =3D SB_ONDISK_JOURNAL_1st_BLOCK(s) +
--=20
2.33.1

