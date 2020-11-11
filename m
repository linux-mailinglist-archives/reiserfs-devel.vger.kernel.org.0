Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF15B2AEBEF
	for <lists+reiserfs-devel@lfdr.de>; Wed, 11 Nov 2020 09:30:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgKKIak (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 11 Nov 2020 03:30:40 -0500
Received: from mail7.static.mailgun.info ([104.130.122.7]:30772 "EHLO
        mail7.static.mailgun.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbgKKIai (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 11 Nov 2020 03:30:38 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1605083437; h=Content-Transfer-Encoding: MIME-Version:
 Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=NF3OK4o7YBnT/ihLxlt8yvhTL3rIKyTTTVqb2IYY3Hk=; b=hvAB0riuURQdHBXUP8yApNbm1o/KGGjD4Mt6La+zh70CfGaangeRlHFuaWjp1j4VNAQJWElE
 jlzhcNRcBtuLzl6swijWJKRpyQKN3fYGBZ7L6qbdDc8yvcxqWY3rU0GWEIppoLnEUMxjHODi
 WM4SEb5U86Q8fc4xsngtMcuQFu0=
X-Mailgun-Sending-Ip: 104.130.122.7
X-Mailgun-Sid: WyIxM2M2YSIsICJyZWlzZXJmcy1kZXZlbEB2Z2VyLmtlcm5lbC5vcmciLCAiMTdiNTQiXQ==
Received: from huitzilopochtli.metztli-it.com
 (99-130-254-3.lightspeed.sntcca.sbcglobal.net [99.130.254.3]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5faba12b37ede2253be71d49 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Wed, 11 Nov 2020 08:30:35 GMT
Sender: jose=metztli.it@mixtli.metztli.it
Received: by huitzilopochtli.metztli-it.com (Postfix, from userid 1000)
        id 94EB270AA154; Wed, 11 Nov 2020 00:30:43 -0800 (PST)
From:   Metztli Information Technology <jose@metztli.it>
To:     reiserfs-devel@vger.kernel.org
Cc:     Metztli Information Technology <jose@metztli.it>
Subject: [PATCH] Adding Reiser4 probe *only* to GNU Parted v3.3
Date:   Tue, 10 Nov 2020 23:51:41 -0800
Message-Id: <20201111075141.42568-1-jose@metztli.it>
X-Mailer: git-send-email 2.27.0
Reply-To: jose.r.r@metztli.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

---
 libparted/Makefile.am          |  1 +
 libparted/fs/Makefile.am       |  3 ++
 libparted/fs/reiser4/reiser4.c | 71 ++++++++++++++++++++++++++++++++++
 libparted/libparted.c          |  4 ++
 4 files changed, 79 insertions(+)
 create mode 100644 libparted/fs/reiser4/reiser4.c

diff --git a/libparted/Makefile.am b/libparted/Makefile.am
index bcdde77..0e86ca0 100644
--- a/libparted/Makefile.am
+++ b/libparted/Makefile.am
@@ -3,6 +3,7 @@
 #
 # This file may be modified and/or distributed without restriction.
 
+AUTOMAKE_OPTIONS = subdir-objects
 SUBDIRS_CHECK =
 if HAVE_CHECK
 SUBDIRS_CHECK += tests
diff --git a/libparted/fs/Makefile.am b/libparted/fs/Makefile.am
index 74f275a..675c01e 100644
--- a/libparted/fs/Makefile.am
+++ b/libparted/fs/Makefile.am
@@ -3,6 +3,8 @@
 #
 # This file may be modified and/or distributed without restriction.
 
+AUTOMAKE_OPTIONS = subdir-objects
+
 partedincludedir = -I$(top_builddir)/include -I$(top_srcdir)/include
 
 AM_CFLAGS = $(WARN_CFLAGS)
@@ -44,6 +46,7 @@ libfs_la_SOURCES =		\
   ntfs/ntfs.c			\
   reiserfs/reiserfs.c		\
   reiserfs/reiserfs.h		\
+  reiser4/reiser4.c		\
   udf/udf.c			\
   ufs/ufs.c			\
   xfs/platform_defs.h		\
diff --git a/libparted/fs/reiser4/reiser4.c b/libparted/fs/reiser4/reiser4.c
new file mode 100644
index 0000000..0a86e0c
--- /dev/null
+++ b/libparted/fs/reiser4/reiser4.c
@@ -0,0 +1,71 @@
+/*
+    libparted - a library for manipulating disk partitions
+    Copyright (C) 2000 Free Software Foundation, Inc.
+
+    This program is free software; you can redistribute it and/or modify
+    it under the terms of the GNU General Public License as published by
+    the Free Software Foundation; either version 2 of the License, or
+    (at your option) any later version.
+
+    This program is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+    GNU General Public License for more details.
+
+    You should have received a copy of the GNU General Public License
+    along with this program; if not, write to the Free Software
+    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+*/
+
+#include <config.h>
+
+#include <parted/parted.h>
+#include <parted/endian.h>
+
+#if ENABLE_NLS
+#  include <libintl.h>
+#  define _(String) dgettext (PACKAGE, String)
+#else
+#  define _(String) (String)
+#endif /* ENABLE_NLS */
+
+#include <unistd.h>
+#include <string.h>
+
+static PedGeometry*
+reiser4_probe (PedGeometry* geom)
+{
+	char	buf[512];
+
+	if (!ped_geometry_read (geom, buf, 128, 1))
+		return 0;	
+	
+	if ( strcmp( buf, "ReIsEr4" ) == 0 )
+		return ped_geometry_duplicate( geom ) ;
+
+	else
+		return NULL;
+}
+
+static PedFileSystemOps reiser4_ops = {
+	probe:		reiser4_probe,
+};
+
+static PedFileSystemType reiser4_type = {
+	next:	NULL,
+	ops:	&reiser4_ops,
+	name:	"reiser4"
+};
+
+void
+ped_file_system_reiser4_init ()
+{
+	ped_file_system_type_register (&reiser4_type);
+}
+
+void
+ped_file_system_reiser4_done ()
+{
+	ped_file_system_type_unregister (&reiser4_type);
+}
+
diff --git a/libparted/libparted.c b/libparted/libparted.c
index 00f5ff8..4cb8882 100644
--- a/libparted/libparted.c
+++ b/libparted/libparted.c
@@ -110,6 +110,7 @@ extern void ped_file_system_jfs_init (void);
 extern void ped_file_system_hfs_init (void);
 extern void ped_file_system_fat_init (void);
 extern void ped_file_system_ext2_init (void);
+extern void ped_file_system_reiser4_init (void);
 extern void ped_file_system_nilfs2_init (void);
 extern void ped_file_system_btrfs_init (void);
 extern void ped_file_system_udf_init (void);
@@ -127,6 +128,7 @@ init_file_system_types ()
 	ped_file_system_hfs_init ();
 	ped_file_system_fat_init ();
 	ped_file_system_ext2_init ();
+	ped_file_system_reiser4_init ();
 	ped_file_system_nilfs2_init ();
 	ped_file_system_btrfs_init ();
 	ped_file_system_udf_init ();
@@ -193,6 +195,7 @@ extern void ped_file_system_ntfs_done (void);
 extern void ped_file_system_reiserfs_done (void);
 extern void ped_file_system_ufs_done (void);
 extern void ped_file_system_xfs_done (void);
+extern void ped_file_system_reiser4_done (void);
 extern void ped_file_system_amiga_done (void);
 extern void ped_file_system_btrfs_done (void);
 extern void ped_file_system_udf_done (void);
@@ -210,6 +213,7 @@ done_file_system_types ()
 	ped_file_system_reiserfs_done ();
 	ped_file_system_ufs_done ();
 	ped_file_system_xfs_done ();
+	ped_file_system_reiser4_done ();
 	ped_file_system_amiga_done ();
 	ped_file_system_btrfs_done ();
 	ped_file_system_udf_done ();
-- 
2.27.0

