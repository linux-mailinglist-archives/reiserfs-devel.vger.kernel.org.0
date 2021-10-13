Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6DD42B69E
	for <lists+reiserfs-devel@lfdr.de>; Wed, 13 Oct 2021 08:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237903AbhJMGQc (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 13 Oct 2021 02:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237883AbhJMGQ1 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 13 Oct 2021 02:16:27 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22BC9C061746
        for <reiserfs-devel@vger.kernel.org>; Tue, 12 Oct 2021 23:14:25 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id g9so1068378plo.12
        for <reiserfs-devel@vger.kernel.org>; Tue, 12 Oct 2021 23:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cU/dcevRRiOMyYUwUWALBmXmlvE8es1M77S7S7Vy3hg=;
        b=V/PklmmvmwB6oF28+X9W5oSqUy3MEBQUnBb4J2bRKEg/eIXO/xXpeqqwQGZrKIWhNv
         T8ctXe4hPipGRmAP9ugd0bC7MXlyH2K83qjMXuuXIhufHwq0vvnSHMGq1LP/1SN2Yv7x
         bKng84M/wOhI7OL1CmIwsfNERqhd12BkP84hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cU/dcevRRiOMyYUwUWALBmXmlvE8es1M77S7S7Vy3hg=;
        b=mICh1jcoHxP4XzG+gMIO2vbnq+kxUzj8X/NG3HvsVidLAP7aTlWbrlI1O1uhhrI86w
         gQx2bpiwiOH8gJG9cpK+2PW3X5s1wgxwIlTcM7ci+7t+FEXZ1jiwacrD/CDUnC9sZUVP
         jkHyhM7pGg95Uf3UVKxiiCaACozr3av15VT1ppDJ/7I4XISEOYMMFJG3isASwA50hA0n
         k3qz9NF00Gv+U0rSeVIudABMzvigFWbES7SdkomuaGcPILZQhRhJoFOyZ7e5iuiRgZQb
         rumVA0e2ltRjbMX0INv00pW4j6cP5vq+wUTmfLrwl3u4+0Cn/NJQfT/2T9zDhweT8tdq
         Z4TQ==
X-Gm-Message-State: AOAM532wTV/0chGrUaFSyulImTMA2YZ5aPzKLmRMO+pHD3sAI2F5GkuZ
        aw+oiHvI2QXYQtq0YXntgs7ZJA==
X-Google-Smtp-Source: ABdhPJzB9T5WPRLBzlHsv86tToIXEU4uRcFKAiECkCtvwz0iUp/WDY5ZssCw0V4lwGrfF5Bgew0Phw==
X-Received: by 2002:a17:90a:8912:: with SMTP id u18mr10958091pjn.69.1634105664752;
        Tue, 12 Oct 2021 23:14:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o6sm12981960pfp.79.2021.10.12.23.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 23:14:24 -0700 (PDT)
Date:   Tue, 12 Oct 2021 23:14:23 -0700
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
Subject: Re: [PATCH 10/29] affs: use bdev_nr_sectors instead of open coding it
Message-ID: <202110122314.6BE3F05AA3@keescook>
References: <20211013051042.1065752-1-hch@lst.de>
 <20211013051042.1065752-11-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013051042.1065752-11-hch@lst.de>
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Wed, Oct 13, 2021 at 07:10:23AM +0200, Christoph Hellwig wrote:
> Use the proper helper to read the block device size.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
