Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 876D0190635
	for <lists+reiserfs-devel@lfdr.de>; Tue, 24 Mar 2020 08:27:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbgCXH1p (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 24 Mar 2020 03:27:45 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:49362 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbgCXH1o (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 24 Mar 2020 03:27:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=sQdGzcjtu/OHKLduBOWEwidcFsI1MjEMWz8/QYw8Sz8=; b=Z/YFQKyRlB/lTbApkMRU4pDjNf
        Z+LFq1mRmB88pv8W+WaubwDyzFA582A/8gJgxzQqaId6LhcamOWEgXi5o7sFnaNGpJTPCSeNFkvmj
        +BIp+8KUQd6Y5gzOROVUrEiothgAMYYMHdMvLIuqRo16cbirhTXCwMSAv0PuPE6eh/X471WEfYksa
        wmyg/BSWNI4rGJUhlTuELJgPWluksXT98/uEVnQ3pVOvHmMWfmvwfYFBhA7lxho/JfVGxTANC9vJg
        W3tBUtNAULRVlDB2NVfJxGjDmJdkte1AwAQ6o1C1MYOyxBpv9mxeto6e1R/4iat6Z8bv9Na9F5v7o
        Hy7mNs2A==;
Received: from 213-225-10-87.nat.highway.a1.net ([213.225.10.87] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jGdyR-0002CC-VO; Tue, 24 Mar 2020 07:27:44 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-block@vger.kernel.org, linux-raid@vger.kernel.org,
        linux-scsi@vger.kernel.org, reiserfs-devel@vger.kernel.org
Subject: cleanup the partitioning code v2
Date:   Tue, 24 Mar 2020 08:25:09 +0100
Message-Id: <20200324072530.544483-1-hch@lst.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hi Jens,

this series cleans up the partitioning code.

Changes sinve v1:
 - rebased to for-5.7/block
