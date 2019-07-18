Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 775E76CF20
	for <lists+reiserfs-devel@lfdr.de>; Thu, 18 Jul 2019 15:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727730AbfGRNtg (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 18 Jul 2019 09:49:36 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:56529 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbfGRNtg (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 18 Jul 2019 09:49:36 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MTfgb-1i0NMn18gf-00U1Gc; Thu, 18 Jul 2019 15:49:32 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Jan Kara <jack@suse.cz>, Andrew Morton <akpm@linux-foundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, reiserfs-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: [PATCH] reiserfs: fix code unwinding with clang
Date:   Thu, 18 Jul 2019 15:49:14 +0200
Message-Id: <20190718134928.2472465-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:n//jM1UBMvz4mHz40peDwZc0bRe4ei5G+DelCfLdZD7Qggm1mNR
 5lg/1/Ua7+Flu6b43iHKvvAncGM9RX+0Iu1W0gkjKyJd1fYgvKnretljrYLFMMkQbYO946Y
 eFt8rOCaDb1e0s+DjAkwFbI+kLcWuWFEv4iTjUyQLrMy9g59dy8rFqB3VoVbVC+csXL6NiL
 A9aNZzyatGyOOzim35qsQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Dhra0qbXmnY=:zyw1yfG1la0nHo0Ct+9ozv
 oyX//ivF63x4MRRXFd10pqUK/uTuHL2XuzE+SsCgsZXKD5a3C/q2cdrF12xFba2SE4K7rEQLq
 PzZIRxDKm7TfeR7aYQI+IxWW3J6UAFsL0KQgknu2e9llHCY8qw9obDDn3QUCrI4zXMAn3ke9U
 m5V7elH8Gdyqzd/1+KM3Bxdo0Dj2+3Ha3S5ZdUA5OBr9dLN3MD/R3gfErAUVvGl89SqompmFl
 HbysB5BGdjrduFpnVlnH9dU5h9S0aJK8TlJWLZ1Kml9SGR9CGORZHQb0rwFqPPoX+tAbTfBtd
 GnSiRlpNe7Grsa3dg+PMIBYZPb32RV2mJstpOOPvSvyR34e7mIkLzLEISkqc51h+1GGybQK1v
 cnz4FORiZJZW8znDiIlXh57c6HobSu4Twd6HKhnF3/gMYs2IWhZPJoylHBTX1doITR79uOyXp
 /aD9sZmMXwZslA1A13ERrFF94/EegLV3Jw7i4G7nKjQhG+2ACuFCbA5wx22vPn+bnQfQv0p4q
 Q8fLCEHyYbzcAlOmp4oNIAA6xit5lFVFzVrsT6vKCLwP6VJ4p+7GdQ2yS900B+qDRr9qEfQ02
 wpGetCmR6xk/SjeNBrSZyc7FDTo6ImRQTmVop8m4o3U/xDmXmchMmD7Lqtaf22SPAPFTW1HI3
 4AQJwsJFbIJd/MjzWShdH2TiNYsBFjCCxpVqrQstctczHU4jCQuw/24PiFDFftCocupN+TKEE
 Xc2fAXLIHWDpLM3W4e1SfTGjBl5x1HtR9rQ8AQ==
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Building reiserfs with clang leads to objtool warnings about a part of the
unreachable code that may confuse the ORC unwinder:

fs/reiserfs/ibalance.o: warning: objtool: balance_internal()+0xe8f: stack state mismatch: cfa1=7+240 cfa2=7+248
fs/reiserfs/ibalance.o: warning: objtool: internal_move_pointers_items()+0x36f: stack state mismatch: cfa1=7+152 cfa2=7+144
fs/reiserfs/lbalance.o: warning: objtool: leaf_cut_from_buffer()+0x58b: stack state mismatch: cfa1=7+128 cfa2=7+112
fs/reiserfs/lbalance.o: warning: objtool: leaf_copy_boundary_item()+0x7a9: stack state mismatch: cfa1=7+104 cfa2=7+96
fs/reiserfs/lbalance.o: warning: objtool: leaf_copy_items_entirely()+0x3d2: stack state mismatch: cfa1=7+120 cfa2=7+128
fs/reiserfs/do_balan.o: warning: objtool: replace_key()+0x158: stack state mismatch: cfa1=7+40 cfa2=7+56
fs/reiserfs/do_balan.o: warning: objtool: balance_leaf()+0x2791: stack state mismatch: cfa1=7+176 cfa2=7+192

Reword this to use the regular BUG() call directly from the original code
location, since objtool finds the generated object code more reasonable.

This will likely get fixed in a future clang release, but in the meantime
the workaround helps us build cleanly with existing releases.

Link: https://groups.google.com/d/msgid/clang-built-linux/20190712135755.7qa4wxw3bfmwn5rp%40treble
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/reiserfs/prints.c   | 5 +++--
 fs/reiserfs/reiserfs.h | 5 ++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/reiserfs/prints.c b/fs/reiserfs/prints.c
index 9fed1c05f1f4..da996eaaebac 100644
--- a/fs/reiserfs/prints.c
+++ b/fs/reiserfs/prints.c
@@ -387,7 +387,6 @@ void __reiserfs_panic(struct super_block *sb, const char *id,
 	else
 		printk(KERN_WARNING "REISERFS panic: %s%s%s: %s\n",
 		      id ? id : "", id ? " " : "", function, error_buf);
-	BUG();
 }
 
 void __reiserfs_error(struct super_block *sb, const char *id,
@@ -397,8 +396,10 @@ void __reiserfs_error(struct super_block *sb, const char *id,
 
 	BUG_ON(sb == NULL);
 
-	if (reiserfs_error_panic(sb))
+	if (reiserfs_error_panic(sb)) {
 		__reiserfs_panic(sb, id, function, error_buf);
+		BUG();
+	}
 
 	if (id && id[0])
 		printk(KERN_CRIT "REISERFS error (device %s): %s %s: %s\n",
diff --git a/fs/reiserfs/reiserfs.h b/fs/reiserfs/reiserfs.h
index e5ca9ed79e54..f5bd17ee21f6 100644
--- a/fs/reiserfs/reiserfs.h
+++ b/fs/reiserfs/reiserfs.h
@@ -3185,10 +3185,9 @@ void unfix_nodes(struct tree_balance *);
 
 /* prints.c */
 void __reiserfs_panic(struct super_block *s, const char *id,
-		      const char *function, const char *fmt, ...)
-    __attribute__ ((noreturn));
+		      const char *function, const char *fmt, ...);
 #define reiserfs_panic(s, id, fmt, args...) \
-	__reiserfs_panic(s, id, __func__, fmt, ##args)
+	do { __reiserfs_panic(s, id, __func__, fmt, ##args); BUG(); } while (0)
 void __reiserfs_error(struct super_block *s, const char *id,
 		      const char *function, const char *fmt, ...);
 #define reiserfs_error(s, id, fmt, args...) \
-- 
2.20.0

