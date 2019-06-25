Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC0BD5532D
	for <lists+reiserfs-devel@lfdr.de>; Tue, 25 Jun 2019 17:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728284AbfFYPTm (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 25 Jun 2019 11:19:42 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:35568 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728199AbfFYPTm (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 25 Jun 2019 11:19:42 -0400
Received: from callcc.thunk.org (guestnat-104-133-0-109.corp.google.com [104.133.0.109] (may be forged))
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x5PFJbgr002328
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Jun 2019 11:19:38 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id D3E6C42002B; Tue, 25 Jun 2019 11:19:36 -0400 (EDT)
Date:   Tue, 25 Jun 2019 11:19:36 -0400
From:   "Theodore Ts'o" <tytso@mit.edu>
To:     reiserfs-devel@vger.kernel.org
Subject: xfstests results for reiserfs
Message-ID: <20190625151936.GA3116@mit.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

I'm not sure if anyone is actively working on reiserfs at this point,
but since I recently have been adding support to {kvm,gce}-xfstests[1]
for some additional file systems, I thought I would send the results
here.

[1] https://thunk.org/gce-xfstests

First of all, it's trivially easy to deadlock resierfs using fsstress.
To work around those issues, I had to blacklist a number of tests:

    # This tests causes reiserfs to deadlock; it appears to be related to
    # FITHAW; possibly a deadlock involving s_umount and the inode_lock
    # when modifying xattrs.
    generic/068

    # This test causes reiserfs to deadlock; it may be related to a
    # deadlock between reiserfs's sbi->lock and the inode_lock in
    # open_xa_dir().
    generic/083

    # These tests are also subject to deadlocks in reiserfs
    generic/233
    generic/269
    generic/270
    generic/390
    generic/476

Secondly, with those tests blacklisted, attached please find the
summary results from running "gce-xfstests -c reiserfs -g auto".  If
anyone is interested in the full set of test artifacts, which will
give more details about the test failures, please let me know and I'll
be happy to send you the resutls.tar.xz file.

Cheers,

					- Ted

TESTRUNID: tytso-20190625085023
KERNEL:    kernel 5.2.0-rc2-xfstests-00018-gd0191a583b08 #1083 SMP Sun Jun 23 22:24:13 EDT 2019 x86_64
CMDLINE:   --update-files -c reiserfs -g auto
CPUS:      2
MEM:       7680

reiserfs/default: 869 tests, 22 failures, 324 skipped, 3895 seconds
  Failures: generic/027 generic/102 generic/230 generic/232 
    generic/235 generic/258 generic/321 generic/355 generic/381 
    generic/382 generic/383 generic/385 generic/386 generic/418 
    generic/459 generic/472 generic/475 generic/495 generic/520 
    generic/533 generic/535 generic/547 
Totals: 545 tests, 324 skipped, 22 failures, 0 errors, 3877s

FSTESTIMG: gce-xfstests/xfstests-201906240824
FSTESTPRJ: gce-xfstests
FSTESTVER: blktests e689373 (Wed, 5 Jun 2019 15:21:30 -0700)
FSTESTVER: fio  fio-3.14 (Wed, 22 May 2019 13:41:41 -0600)
FSTESTVER: fsverity bdebc45 (Wed, 5 Sep 2018 21:32:22 -0700)
FSTESTVER: ima-evm-utils 0267fa1 (Mon, 3 Dec 2018 06:11:35 -0500)
FSTESTVER: nvme-cli v1.8.1-72-g4fe9563 (Fri, 7 Jun 2019 10:17:00 -0600)
FSTESTVER: quota  daba90f (Fri, 24 May 2019 12:53:32 +0200)
FSTESTVER: stress-ng 7d0353cf (Sun, 20 Jan 2019 03:30:03 +0000)
FSTESTVER: syzkaller 85c57315 (Fri, 24 May 2019 22:33:56 +0200)
FSTESTVER: xfsprogs v5.0.0 (Fri, 3 May 2019 12:14:36 -0500)
FSTESTVER: xfstests-bld 203b827 (Sun, 23 Jun 2019 22:57:45 -0400)
FSTESTVER: xfstests linux-v3.8-2443-gf6e829eb (Sun, 23 Jun 2019 19:06:42 -0400)
FSTESTCFG: reiserfs
FSTESTSET: -g auto
FSTESTOPT: aex
GCE ID:    5702412653587048055
