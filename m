Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B56928DA8
	for <lists+reiserfs-devel@lfdr.de>; Fri, 24 May 2019 01:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388137AbfEWXKg (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 23 May 2019 19:10:36 -0400
Received: from mail7.static.mailgun.info ([104.130.122.7]:51997 "EHLO
        mail7.static.mailgun.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388015AbfEWXKg (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 23 May 2019 19:10:36 -0400
X-Greylist: delayed 300 seconds by postgrey-1.27 at vger.kernel.org; Thu, 23 May 2019 19:10:25 EDT
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1558653035; h=Content-Transfer-Encoding: MIME-Version:
 Reply-To: References: In-Reply-To: Message-Id: Date: Subject: Cc: To:
 From: Sender; bh=ZQ5Ww+WDI5Qy7Yeh6u/x0Q23qARJi0rvUxcfeqbfBCY=; b=xxDxJQSC8Kg4rcBP7nSrPCKbXGerz8eDwZ7FL22lRotUg/r1gpsfn7iLXDhxptHJZzzYhduu
 koht609vtPBCqdllNRccQ5/ObJ+IB+DBjtEJ0GByVW7lOvhwuZbK23Q9w1qvt7KISh7e8OFQ
 Q+EpSkm6dscHbqrRsPy7fO4eOQk=
X-Mailgun-Sending-Ip: 104.130.122.7
X-Mailgun-Sid: WyIxM2M2YSIsICJyZWlzZXJmcy1kZXZlbEB2Z2VyLmtlcm5lbC5vcmciLCAiMTdiNTQiXQ==
Received: from huitzilopochtli.metztli-it.com (99-130-254-3.lightspeed.sntcca.sbcglobal.net [99.130.254.3])
 by mxa.mailgun.org with ESMTP id 5ce7273e.7fbe293648a0-smtp-out-n01;
 Thu, 23 May 2019 23:05:34 -0000 (UTC)
Received: by huitzilopochtli.metztli-it.com (Postfix, from userid 1000)
        id D11A03C53E0C; Thu, 23 May 2019 16:05:32 -0700 (PDT)
From:   Metztli Information Technology <jose@metztli.it>
To:     reiserfs-devel@vger.kernel.org
Cc:     Metztli Information Technology <jose@metztli.it>
Subject: [PATCH] Reiser4 probe updating GNU Parted v3.2 from git repo
Date:   Thu, 23 May 2019 16:05:02 -0700
Message-Id: <20190523230502.12152-2-jose@metztli.it>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523230502.12152-1-jose@metztli.it>
References: <20190523230502.12152-1-jose@metztli.it>
Reply-To: jose.r.r@metztli.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

---
 include/parted/unit.in.h       |  2 +-
 libparted/Makefile.am          |  1 +
 libparted/fs/Makefile.am       |  3 ++
 libparted/fs/reiser4/reiser4.c | 71 ++++++++++++++++++++++++++++++++++
 libparted/libparted.c          |  4 ++
 5 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 libparted/fs/reiser4/reiser4.c

diff --git a/include/parted/unit.in.h b/include/parted/unit.in.h
index 315660d..9d6e06a 100644
--- a/include/parted/unit.in.h
+++ b/include/parted/unit.in.h
@@ -66,7 +66,7 @@ typedef enum {
 
 extern long long ped_unit_get_size (const PedDevice* dev, PedUnit unit);
 extern const char *ped_unit_get_name (PedUnit unit)
-  _GL_ATTRIBUTE_PURE;
+  _GL_ATTRIBUTE_PURE _GL_ATTRIBUTE_CONST;
 extern PedUnit ped_unit_get_by_name (const char* unit_name) _GL_ATTRIBUTE_PURE;
 
 extern void ped_unit_set_default (PedUnit unit);
diff --git a/libparted/Makefile.am b/libparted/Makefile.am
index e4a8049..bee3a99 100644
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
index cab32c7..b41ac06 100644
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
index e517875..bc8ea35 100644
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
2.20.1
