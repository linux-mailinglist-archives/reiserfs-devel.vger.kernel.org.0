Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE9C8231792
	for <lists+reiserfs-devel@lfdr.de>; Wed, 29 Jul 2020 04:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730524AbgG2CUe convert rfc822-to-8bit (ORCPT
        <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 28 Jul 2020 22:20:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:34696 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730505AbgG2CUe (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 28 Jul 2020 22:20:34 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     reiserfs-devel@vger.kernel.org
Subject: [Bug 208719] PROBLEM: IO lockup on reiserfs FS.
Date:   Wed, 29 Jul 2020 02:20:34 +0000
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
Message-ID: <bug-208719-695-ZxMBe9Zpf1@https.bugzilla.kernel.org/>
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

--- Comment #4 from deference@null.net ---
On the suggestion to not use reiserfs:

My interest in using reiserfs was so that I would have tail packing. I've
searched online and can't find another FS with this function for Linux.
The reason I need tail packing is because I keep a bunch of mostly git
repositories on my system. These contain a lot of files that are either small
or are empty. I could try to hardlink all the empty files and small duplicate
files, but git would complain. I could compress the source code like I do with
normal code bases, but then I'd need to decompress and update them all.
Writing a script to do that would be nothing, it's just the time involved
compressing/decompressing that would be a waist (which is saying nothing
compared to git's love for full histories instead of up-to-the-last-4-versions
or something).

-- 
You are receiving this mail because:
You are the assignee for the bug.
