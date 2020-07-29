Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A3C923177B
	for <lists+reiserfs-devel@lfdr.de>; Wed, 29 Jul 2020 03:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730328AbgG2B7V convert rfc822-to-8bit (ORCPT
        <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 28 Jul 2020 21:59:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:56504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728401AbgG2B7V (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 28 Jul 2020 21:59:21 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     reiserfs-devel@vger.kernel.org
Subject: [Bug 208719] PROBLEM: IO lockup on reiserfs RAID50 array.
Date:   Wed, 29 Jul 2020 01:59:20 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: File System
X-Bugzilla-Component: ReiserFS
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: deference@null.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: reiserfs-devel@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208719-695-OXJWG3NvlA@https.bugzilla.kernel.org/>
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

--- Comment #3 from deference@null.net ---
Thanks for your help!
I will forward this to the reiserfs maintainer.
I've managed to verify that all disks are accessible (smartctl -a /dev/sdX) and
that the RAID array is working and accessible (mdadm --detail and echo-ing
check/idle to the array and seeing progress).

-- 
You are receiving this mail because:
You are the assignee for the bug.
