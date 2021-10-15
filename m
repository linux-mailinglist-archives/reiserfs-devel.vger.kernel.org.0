Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C84A542F78F
	for <lists+reiserfs-devel@lfdr.de>; Fri, 15 Oct 2021 18:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241081AbhJOQCZ (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 15 Oct 2021 12:02:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241087AbhJOQCY (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 15 Oct 2021 12:02:24 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ED78C06176D
        for <reiserfs-devel@vger.kernel.org>; Fri, 15 Oct 2021 09:00:17 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id y4so6704204plb.0
        for <reiserfs-devel@vger.kernel.org>; Fri, 15 Oct 2021 09:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oA+XtrVpatY111qi9rW+eMi2Ccu5JD4bZ/9KhM3WrlE=;
        b=XqIRk8njJo5f/smXtBnMnpa5uhREVTwoyHge7bthfJu3PV1eAY0raWnd7H8TUnbAlP
         6QJTXqryNMqTNsEzDWj/azKOg0JWIJXEUmyPhlYenUOsueW8KFdrQGT7L/i4Eg4OiZnx
         gS2Q2/7koaDEtdkJVEfY5BHTSx0EojKPtQeUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oA+XtrVpatY111qi9rW+eMi2Ccu5JD4bZ/9KhM3WrlE=;
        b=6Uiu/ZfdCQeMOszQJfrKds88/fiCNc6rKovdck7V26DOQPL/2/3oSo0VeBsycbuxo7
         U2ezrrxr8zhc+bOMUwXtaTCBTHL3/hH12/yB1lt4l4fzdCnKKI8ynX0FxXOGeEM/zfCa
         jfpMiIRMepzIyeUYNgKpKqQcCCyd4ZFKR4Cuj9KuRAtIsjuhmc0TFRGftt9YLfW5OKz7
         CJ8c40KWtzIbFmLHi3yBq9jx/UGsGyaVipocgXXnq5Npoz1UyA9XJkdc7nIEZocoS5l9
         6fsW6CXoeM6o0CKh9ZNV0sEfHNy/CcB0qHe+PdmWcyFXyTTej41FzvAaZBvb999Z3lVX
         omog==
X-Gm-Message-State: AOAM533bLSwyMLFnZm0gx0AiBLVR4vqbfnbwzIVQFCkaFtHH9UtOrzwC
        i8/8muUGj+VOpYbtKcsPt8p4NA==
X-Google-Smtp-Source: ABdhPJzKtqYe4vRxUad2HzrB2swbKAK83Cb9s6XXYIsx2Jq5whQZG4n13YyVL1QUtSJ6rA0qtwQqhQ==
X-Received: by 2002:a17:90a:a386:: with SMTP id x6mr14380761pjp.56.1634313616631;
        Fri, 15 Oct 2021 09:00:16 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id nn14sm5397718pjb.27.2021.10.15.09.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 09:00:16 -0700 (PDT)
Date:   Fri, 15 Oct 2021 09:00:15 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Jens Axboe <axboe@kernel.dk>, Coly Li <colyli@suse.de>,
        Mike Snitzer <snitzer@redhat.com>, Song Liu <song@kernel.org>,
        David Sterba <dsterba@suse.com>,
        Josef Bacik <josef@toxicpanda.com>,
        Theodore Ts'o <tytso@mit.edu>,
        OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
        Dave Kleikamp <shaggy@kernel.org>,
        Ryusuke Konishi <konishi.ryusuke@gmail.com>,
        Anton Altaparmakov <anton@tuxera.com>,
        Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
        Phillip Lougher <phillip@squashfs.org.uk>,
        Jan Kara <jack@suse.com>, linux-block@vger.kernel.org,
        dm-devel@redhat.com, drbd-dev@lists.linbit.com,
        linux-bcache@vger.kernel.org, linux-raid@vger.kernel.org,
        linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org,
        target-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
        jfs-discussion@lists.sourceforge.net, linux-nfs@vger.kernel.org,
        linux-nilfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
        ntfs3@lists.linux.dev, reiserfs-devel@vger.kernel.org,
        Jan Kara <jack@suse.cz>, Chaitanya Kulkarni <kch@nvidia.com>
Subject: Re: [PATCH 09/30] fs: use bdev_nr_bytes instead of open coding it in
 blkdev_max_block
Message-ID: <202110150900.71DDE55E1B@keescook>
References: <20211015132643.1621913-1-hch@lst.de>
 <20211015132643.1621913-10-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015132643.1621913-10-hch@lst.de>
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Fri, Oct 15, 2021 at 03:26:22PM +0200, Christoph Hellwig wrote:
> Use the proper helper to read the block device size.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
