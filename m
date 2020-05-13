Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF6E81D0583
	for <lists+reiserfs-devel@lfdr.de>; Wed, 13 May 2020 05:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbgEMD2M convert rfc822-to-8bit (ORCPT
        <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 12 May 2020 23:28:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:52100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725898AbgEMD2M (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 12 May 2020 23:28:12 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     reiserfs-devel@vger.kernel.org
Subject: [Bug 207717] reiserfs: data race on inode->i_size in
 reiserfs_write_full_page()
Date:   Wed, 13 May 2020 03:28:11 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-207717-695-sCbVu7A4Tl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207717-695@https.bugzilla.kernel.org/>
References: <bug-207717-695@https.bugzilla.kernel.org/>
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

Jia-Ju Bai (baijiaju1990@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |baijiaju1990@gmail.com

-- 
You are receiving this mail because:
You are the assignee for the bug.
