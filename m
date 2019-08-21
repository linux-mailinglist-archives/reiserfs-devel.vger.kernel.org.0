Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D24EF97609
	for <lists+reiserfs-devel@lfdr.de>; Wed, 21 Aug 2019 11:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbfHUJZv (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 21 Aug 2019 05:25:51 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5172 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726648AbfHUJZu (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 21 Aug 2019 05:25:50 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 5494CA3B3E0BE9D2773A;
        Wed, 21 Aug 2019 17:25:48 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Wed, 21 Aug 2019
 17:25:38 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <jack@suse.cz>, <akpm@linux-foundation.org>,
        <linux.bhar@gmail.com>, <arnd@arndb.de>,
        <hariprasad.kelam@gmail.com>, <reiserfs-devel@vger.kernel.org>
CC:     <yi.zhang@huawei.com>, <zhengbin13@huawei.com>
Subject: [PATCH 0/7] fs/reiserfs: remove set but not used variables
Date:   Wed, 21 Aug 2019 17:32:02 +0800
Message-ID: <1566379929-118398-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

zhengbin (7):
  fs/reiserfs/journal.c: remove set but not used variables
  fs/reiserfs/stree.c: remove set but not used variables
  fs/reiserfs/lbalance.c: remove set but not used variables
  fs/reiserfs/objectid.c: remove set but not used variables
  fs/reiserfs/prints.c: remove set but not used variables
  fs/reiserfs/fix_node.c: remove set but not used variables
  fs/reiserfs/do_balan.c: remove set but not used variables

 fs/reiserfs/do_balan.c | 12 +-----------
 fs/reiserfs/fix_node.c |  6 +-----
 fs/reiserfs/journal.c  | 10 +---------
 fs/reiserfs/lbalance.c |  3 +--
 fs/reiserfs/objectid.c |  3 +--
 fs/reiserfs/prints.c   |  3 ---
 fs/reiserfs/stree.c    |  4 ----
 7 files changed, 5 insertions(+), 36 deletions(-)

--
2.7.4

