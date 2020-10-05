Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC5BE283F47
	for <lists+reiserfs-devel@lfdr.de>; Mon,  5 Oct 2020 21:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728361AbgJETFh (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 5 Oct 2020 15:05:37 -0400
Received: from smtp6.ctinetworks.com ([205.166.61.199]:47764 "EHLO
        smtp6.ctinetworks.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbgJETFg (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 5 Oct 2020 15:05:36 -0400
X-Greylist: delayed 343 seconds by postgrey-1.27 at vger.kernel.org; Mon, 05 Oct 2020 15:05:36 EDT
Received: from localhost (unknown [117.193.7.59])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: enometh@meer.net)
        by smtp6.ctinetworks.com (Postfix) with ESMTPSA id 8DA0E82099
        for <reiserfs-devel@vger.kernel.org>; Mon,  5 Oct 2020 14:59:49 -0400 (EDT)
Date:   Tue, 06 Oct 2020 00:29:52 +0530 (IST)
Message-Id: <20201006.002952.1265255213313398815.enometh@meer.net>
To:     reiserfs-devel@vger.kernel.org
Subject: Problems mounting a reiserfs partiton on the 5.8 kernel
From:   Madhu <enometh@meer.net>
X-Mailer: Mew version 6.8 on Emacs 28.0
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-ctinetworks-Information: Please contact the ISP for more information
X-ctinetworks-MailScanner-ID: 8DA0E82099.A6B04
X-ctinetworks-VirusCheck: Found to be clean
X-ctinetworks-SpamCheck: 
X-ctinetworks-Watermark: 1602788392.56123@/VqxmUHaYGdiWdaQ/XakYQ
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hello.

I'm using sys-fs/reiserfsprogs-3.6.27.  The 5.8 kernel refuses to
mount a reiser partition:

$ /bin/mount /dev/mapper/5 /5

[  203.691395] REISERFS (device dm-1): found reiserfs format "3.6" with standard journal
[  203.691429] REISERFS (device dm-1): using ordered data mode
[  203.691431] reiserfs: using flush barriers
[  203.719044] REISERFS (device dm-1): journal params: device dm-1, size 8192, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
[  203.719364] REISERFS (device dm-1): checking transaction log (dm-1)
[  203.732153] loop: Write error at byte offset 5402468352, length 4096.
[  203.732167] blk_update_request: I/O error, dev loop5, sector 65936 op 0x1:(WRITE) flags 0x800 phys_seg 1 prio class 0
[  203.732172] blk_update_request: I/O error, dev loop5, sector 65936 op 0x1:(WRITE) flags 0x800 phys_seg 1 prio class 0
[  203.732190] Buffer I/O error on dev dm-1, logical block 8210, lost sync page write
[  203.732213] REISERFS warning (device dm-1): journal-837 _update_journal_header_block: IO error during journal replay
[  203.732219] REISERFS warning (device dm-1): reiserfs-2006 journal_init: Replay Failure, unable to mount
[  203.732474] REISERFS warning (device dm-1): sh-2022 reiserfs_fill_super: unable to initialize journal space

This is the 5.8.12 kernel.

The file system is on a dmcrypt device
$ dmsetup  status 5
0 167192565 crypt

which is mapped from a loopback device, which is mapped from an offset
from a raw partition.

$ losetup -a /dev/loop5
/dev/loop5: [0005]:6284 (/dev/sda5), offset 5368709120

$ fdisk | grep sda[45]
   Device Boot      Start         End      Blocks   Id  System
/dev/sda4       187655265   625137344   218741040    5  Extended
/dev/sda5       187655328   365334164    88839418+  83  Linux

The reiser partition is over a decade old and has been very
reliable. Running fsck finds no problems.  And the partition mounts
fine and is usable with the 5.7 kernel.

Any ideas what the problem might be?  The dmesg output looks bogus and
suggests to me that a write is failing somewhere.  I suspect it is the
device layer which has changed.  If there is a bug to be filed where
should I file it? I'd Appreciate any clues.
---Madhu
