Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74C8F5AC9F1
	for <lists+reiserfs-devel@lfdr.de>; Mon,  5 Sep 2022 07:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236081AbiIEFyH (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 5 Sep 2022 01:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235679AbiIEFyG (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 5 Sep 2022 01:54:06 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50D8B303F0;
        Sun,  4 Sep 2022 22:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=kQz5M7cactBBREqbBBZOBGfipP
        rcBfqUWCmw/z1So0qOCVWdhlBUK/BwYNH4TIS1Q1hO8Z2M9LlfWFJdlrvQZ2GQTaSCp4RFZD9/Z97
        UcScN5niOc8ie5WnDmNgcBfXwhTdZpriyqytaH7rTUeanTyXpoMzAwVo0jiOxCmVAKyqUBhUWEv2c
        O97kl3DsKD+gtO3bzsznQS9t9uj2jSVucdGpPvFLfEyUHGY5aijeEFhNMEhqC1YDm3ffpJFo/m5wj
        9rb35kWJHvaLBh4ppIUe3DNU0FINaz+KPXKcmiYwKfiEPisTdf8p/wrjW2YuZf/xyc15joyXW3nHh
        +R7plbeQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1oV53b-00BZGb-1S; Mon, 05 Sep 2022 05:54:03 +0000
Date:   Sun, 4 Sep 2022 22:54:03 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Zhang Yi <yi.zhang@huawei.com>
Cc:     linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
        ntfs3@lists.linux.dev, ocfs2-devel@oss.oracle.com,
        reiserfs-devel@vger.kernel.org, jack@suse.cz, tytso@mit.edu,
        akpm@linux-foundation.org, axboe@kernel.dk,
        viro@zeniv.linux.org.uk, rpeterso@redhat.com, agruenba@redhat.com,
        almaz.alexandrovich@paragon-software.com, mark@fasheh.com,
        dushistov@mail.ru, hch@infradead.org, chengzhihao1@huawei.com,
        yukuai3@huawei.com
Subject: Re: [PATCH v2 04/14] gfs2: replace ll_rw_block()
Message-ID: <YxWO+wTg/55C38Fg@infradead.org>
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
 <20220901133505.2510834-5-yi.zhang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901133505.2510834-5-yi.zhang@huawei.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
