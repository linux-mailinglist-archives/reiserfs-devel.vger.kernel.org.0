Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32D6D230E6F
	for <lists+reiserfs-devel@lfdr.de>; Tue, 28 Jul 2020 17:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731115AbgG1PxW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 28 Jul 2020 11:53:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:55060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731004AbgG1PxV (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 28 Jul 2020 11:53:21 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     reiserfs-devel@vger.kernel.org
Subject: [Bug 208719] PROBLEM: IO lockup on reiserfs RAID50 array.
Date:   Tue, 28 Jul 2020 15:53:20 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: File System
X-Bugzilla-Component: ReiserFS
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: axboe@kernel.dk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: reiserfs-devel@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to product
Message-ID: <bug-208719-695-MKIFJeQlDL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208719-695@https.bugzilla.kernel.org/>
References: <bug-208719-695@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208719

Jens Axboe (axboe@kernel.dk) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Block Layer                 |ReiserFS
           Assignee|axboe@kernel.dk             |reiserfs-devel@vger.kernel.
                   |                            |org
            Product|IO/Storage                  |File System

--- Comment #2 from Jens Axboe (axboe@kernel.dk) ---
Most likely a reiserfs issue, please re-assign the bug. I'd also strongly
reconsider using a filesystem that is actively maintained...

-- 
You are receiving this mail because:
You are the assignee for the bug.
