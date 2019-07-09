Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2D4B63CB3
	for <lists+reiserfs-devel@lfdr.de>; Tue,  9 Jul 2019 22:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727241AbfGIU0o (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 9 Jul 2019 16:26:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:51840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729532AbfGIU0o (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 9 Jul 2019 16:26:44 -0400
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net [24.5.143.220])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7B7742087F;
        Tue,  9 Jul 2019 20:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562704002;
        bh=Q8lJunzvHA1hNJvcYCrAGVr7+FzwmbTZShJ9CiwF6vc=;
        h=Date:From:To:Cc:Subject:From;
        b=CEm7vztHVchPlqxQQwL8bd4TKtK7i9+bFCQT1iWKsKpqwACTJxo1Ghx9B+f6zpocr
         lhixxGyF9mUAe4zLWq3UcO6R7xSK5G25FdeYpRpoWDgjsqIWM2Hg4RCU3bkBiY6A4y
         H6R1crB4Q0J/q4Pv0PctlRjyd+a03TFM6owI3OfY=
Date:   Tue, 9 Jul 2019 13:26:41 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     reiserfs-devel@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Reminder: 5 open syzbot bugs in "fs/reiserfs" subsystem
Message-ID: <20190709202641.GK641@sol.localdomain>
Mail-Followup-To: reiserfs-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

[This email was generated by a script.  Let me know if you have any suggestions
to make it better, or if you want it re-generated with the latest status.]

Of the currently open syzbot reports against the upstream kernel, I've manually
marked 5 of them as possibly being bugs in the "fs/reiserfs" subsystem.  I've
listed these reports below, sorted by an algorithm that tries to list first the
reports most likely to be still valid, important, and actionable.

If you believe a bug is no longer valid, please close the syzbot report by
sending a '#syz fix', '#syz dup', or '#syz invalid' command in reply to the
original thread, as explained at https://goo.gl/tpsmEJ#status

If you believe I misattributed a bug to the "fs/reiserfs" subsystem, please let
me know, and if possible forward the report to the correct people or mailing
list.

Here are the bugs:

--------------------------------------------------------------------------------
Title:              KASAN: use-after-free Read in blkdev_get
Last occurred:      19 days ago
Reported:           391 days ago
Branches:           Mainline and others
Dashboard link:     https://syzkaller.appspot.com/bug?id=00965426fe7ceec1fd2d8756770d4c7c3cacdc4b
Original thread:    https://lkml.kernel.org/lkml/000000000000e59aab056e8873ae@google.com/T/#u

This bug has a C reproducer.

The original thread for this bug received 1 reply, 215 days ago.

If you fix this bug, please add the following tag to the commit:
    Reported-by: syzbot+eaeb616d85c9a0afec7d@syzkaller.appspotmail.com

If you send any email or patch for this bug, please consider replying to the
original thread.  For the git send-email command to use, or tips on how to reply
if the thread isn't in your mailbox, see the "Reply instructions" at
https://lkml.kernel.org/r/000000000000e59aab056e8873ae@google.com

--------------------------------------------------------------------------------
Title:              BUG: unable to handle kernel paging request in cleanup_bitmap_list
Last occurred:      13 days ago
Reported:           464 days ago
Branches:           Mainline
Dashboard link:     https://syzkaller.appspot.com/bug?id=f7a51e226194a72ab7364a64af1b8fb1e80e94bb
Original thread:    https://lkml.kernel.org/lkml/001a1140e9201dd16b0568cc6beb@google.com/T/#u

This bug has a C reproducer.

No one replied to the original thread for this bug.

If you fix this bug, please add the following tag to the commit:
    Reported-by: syzbot+008ac33be9dec51e0ca3@syzkaller.appspotmail.com

If you send any email or patch for this bug, please consider replying to the
original thread.  For the git send-email command to use, or tips on how to reply
if the thread isn't in your mailbox, see the "Reply instructions" at
https://lkml.kernel.org/r/001a1140e9201dd16b0568cc6beb@google.com

--------------------------------------------------------------------------------
Title:              WARNING in unlock_new_inode
Last occurred:      446 days ago
Reported:           446 days ago
Branches:           Mainline
Dashboard link:     https://syzkaller.appspot.com/bug?id=ef79070d08a744686c4db202d9ba6817bba86ebb
Original thread:    https://lkml.kernel.org/lkml/0000000000002ab8c5056a35b12b@google.com/T/#u

This bug has a C reproducer.

No one replied to the original thread for this bug.

If you fix this bug, please add the following tag to the commit:
    Reported-by: syzbot+187510916eb6a14598f7@syzkaller.appspotmail.com

If you send any email or patch for this bug, please consider replying to the
original thread.  For the git send-email command to use, or tips on how to reply
if the thread isn't in your mailbox, see the "Reply instructions" at
https://lkml.kernel.org/r/0000000000002ab8c5056a35b12b@google.com

--------------------------------------------------------------------------------
Title:              kernel BUG at fs/reiserfs/journal.c:LINE!
Last occurred:      445 days ago
Reported:           465 days ago
Branches:           Mainline
Dashboard link:     https://syzkaller.appspot.com/bug?id=4f66f3287ba3341410ff35b736339628173a5aaa
Original thread:    https://lkml.kernel.org/lkml/001a113eba282f2ffc0568b76123@google.com/T/#u

This bug has a syzkaller reproducer only.

No one replied to the original thread for this bug.

If you fix this bug, please add the following tag to the commit:
    Reported-by: syzbot+6820505ae5978f4f8f2f@syzkaller.appspotmail.com

If you send any email or patch for this bug, please consider replying to the
original thread.  For the git send-email command to use, or tips on how to reply
if the thread isn't in your mailbox, see the "Reply instructions" at
https://lkml.kernel.org/r/001a113eba282f2ffc0568b76123@google.com

--------------------------------------------------------------------------------
Title:              kernel BUG at fs/reiserfs/lock.c:LINE!
Last occurred:      78 days ago
Reported:           364 days ago
Branches:           Mainline and others
Dashboard link:     https://syzkaller.appspot.com/bug?id=633d4e446a638abe31cc3054b5a69a42a4cd25d6
Original thread:    https://lkml.kernel.org/lkml/0000000000002bd65e0570aa16f2@google.com/T/#u

Unfortunately, this bug does not have a reproducer.

No one replied to the original thread for this bug.

If you fix this bug, please add the following tag to the commit:
    Reported-by: syzbot+66d2c2155ece8b6d3fc0@syzkaller.appspotmail.com

If you send any email or patch for this bug, please consider replying to the
original thread.  For the git send-email command to use, or tips on how to reply
if the thread isn't in your mailbox, see the "Reply instructions" at
https://lkml.kernel.org/r/0000000000002bd65e0570aa16f2@google.com

