Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE6FA1D0582
	for <lists+reiserfs-devel@lfdr.de>; Wed, 13 May 2020 05:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbgEMD2D convert rfc822-to-8bit (ORCPT
        <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 12 May 2020 23:28:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:52066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725898AbgEMD2D (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 12 May 2020 23:28:03 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     reiserfs-devel@vger.kernel.org
Subject: [Bug 207717] New: reiserfs: data race on inode->i_size in
 reiserfs_write_full_page()
Date:   Wed, 13 May 2020 03:28:02 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: File System
X-Bugzilla-Component: ReiserFS
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: baijiaju1990@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: reiserfs-devel@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-207717-695@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=207717

            Bug ID: 207717
           Summary: reiserfs: data race on inode->i_size in
                    reiserfs_write_full_page()
           Product: File System
           Version: 2.5
    Kernel Version: 5.4
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: ReiserFS
          Assignee: reiserfs-devel@vger.kernel.org
          Reporter: baijiaju1990@gmail.com
        Regression: No

The functions reiserfs_write_full_page() and reiserfs_write_end() are
concurrently executed at runtime in the following call contexts:

Thread 1:
reiserfs_writepage()
  reiserfs_write_full_page()

Thread 2:
reiserfs_write_end()

In reiserfs_write_full_page():
  unsigned long end_index = inode->i_size >> PAGE_SHIFT;

In reiserfs_write_end():
  inode->i_size = pos + copied;

Thus, a data race on inode->i_size occurs.

This data race was found and actually reproduced by our concurrency fuzzer.

I am not sure whether this data race is harmful and how to fix this data race
properly, so I want to listen to your opinions, thanks :)

-- 
You are receiving this mail because:
You are the assignee for the bug.
