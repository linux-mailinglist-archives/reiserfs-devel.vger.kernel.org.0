Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECA262D37D
	for <lists+reiserfs-devel@lfdr.de>; Wed, 29 May 2019 03:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbfE2BvP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 28 May 2019 21:51:15 -0400
Received: from mail.wl.linuxfoundation.org ([198.145.29.98]:50902 "EHLO
        mail.wl.linuxfoundation.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725816AbfE2BvP (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 28 May 2019 21:51:15 -0400
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
        by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 5642F28742
        for <reiserfs-devel@vger.kernel.org>; Wed, 29 May 2019 01:51:14 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
        id 47C0928791; Wed, 29 May 2019 01:51:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
        pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS autolearn=ham version=3.3.1
From:   bugzilla-daemon@bugzilla.kernel.org
To:     reiserfs-devel@vger.kernel.org
Subject: [Bug 203749] Reiserfs: kernel BUG at fs/reiserfs/prints.c:390!
Date:   Wed, 29 May 2019 01:51:13 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: File System
X-Bugzilla-Component: ReiserFS
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jeffm@suse.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: reiserfs-devel@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203749-695-xE7dLBtM99@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203749-695@https.bugzilla.kernel.org/>
References: <bug-203749-695@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=203749

Jeff Mahoney (jeffm@suse.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jeffm@suse.com

--- Comment #1 from Jeff Mahoney (jeffm@suse.com) ---
It's pretty trivial to create a crafted image to panic reiserfs.  That's how it
handles corruption in many places.  It's a deliberate panic, not an Oops.

-- 
You are receiving this mail because:
You are the assignee for the bug.
