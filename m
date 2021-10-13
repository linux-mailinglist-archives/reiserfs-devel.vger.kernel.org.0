Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3009F42B68A
	for <lists+reiserfs-devel@lfdr.de>; Wed, 13 Oct 2021 08:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231264AbhJMGO6 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 13 Oct 2021 02:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237413AbhJMGO5 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 13 Oct 2021 02:14:57 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92F44C061767
        for <reiserfs-devel@vger.kernel.org>; Tue, 12 Oct 2021 23:12:54 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 75so1319537pga.3
        for <reiserfs-devel@vger.kernel.org>; Tue, 12 Oct 2021 23:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1H1JJFKjz05y5oj0p755Wd9Nps08CHOHEplJ5Y1g+2w=;
        b=FnlM9CdvccmU4HmqmwsZQ6mwcBwOhpuSMmvAcPJz12hGrzMLx0wE72HESKXT/FSdf4
         7+542Lua7V4TbazDGNap5DO9Pfw7c/uG+qyBy3qJkapOn+6ER85tMNMzt8DzCatnHQL8
         8qEBnbzhJGY53T8EWVA6JlX/GqGluU0pFlO7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1H1JJFKjz05y5oj0p755Wd9Nps08CHOHEplJ5Y1g+2w=;
        b=0rEo8Vlr+HBWa6bcA3EGmF33zVT7+aV1iyeaJCFQ9DvehEz8PcWpBbK/D3z62dwbU/
         iXSOvKkGk7oQCFzJ4kV/MBT7C1UnIeQ8X/rNNgdCrPMHTysNpB6WP56i2iQcbF9X43I3
         EEsDVldVZQCFvFXrgLtL3RP4kZUiLKkIkWC9fOXscimByDybkRacX+HwQd2wWw8n+ROs
         opmQO0yxtE65jlyJelEx0Z7Hc7a4f8DSsCL6mRze9cIbcdnfULhMpAqjEZi6l8jPrVTM
         dUNfIerSv29unE9V1QMg3xzNmOwwo0Fq+Oromcpahe2hN8Z6eG0OPUaZ2cWD65eFFuGQ
         GIbw==
X-Gm-Message-State: AOAM531XwUaevmEu+xGxjePemwdCJh2tNuLmp3tS1Gd5gOOXd7Bhgm3n
        cJKT3RPA3OqwoADb+ktg3NO+UQ==
X-Google-Smtp-Source: ABdhPJyo2VCUKF6kjMdrI9PCDmpBjFpUCoF94Pv9htxPPsmjtX3akcms7YpvLn8ozHxuI/GsrlutsQ==
X-Received: by 2002:aa7:91c2:0:b0:44c:a5a4:43d4 with SMTP id z2-20020aa791c2000000b0044ca5a443d4mr35433093pfa.20.1634105573663;
        Tue, 12 Oct 2021 23:12:53 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z124sm12774767pfb.108.2021.10.12.23.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 23:12:53 -0700 (PDT)
Date:   Tue, 12 Oct 2021 23:12:52 -0700
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
        linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org,
        linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org,
        linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
        linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
        linux-ntfs-dev@lists.sourceforge.net, ntfs3@lists.linux.dev,
        reiserfs-devel@vger.kernel.org
Subject: Re: [PATCH 04/29] md: use bdev_nr_sectors instead of open coding it
Message-ID: <202110122311.B43459E21@keescook>
References: <20211013051042.1065752-1-hch@lst.de>
 <20211013051042.1065752-5-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013051042.1065752-5-hch@lst.de>
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Wed, Oct 13, 2021 at 07:10:17AM +0200, Christoph Hellwig wrote:
> Use the proper helper to read the block device size.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

I think it might make sense, as you suggest earlier, to add a "bytes"
helper. This is the first user in the series needing:

	bdev_nr_sectors(...bdev) << SECTOR_SHIFT

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
