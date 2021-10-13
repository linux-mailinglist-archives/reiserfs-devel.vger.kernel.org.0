Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F14D42B6CD
	for <lists+reiserfs-devel@lfdr.de>; Wed, 13 Oct 2021 08:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237909AbhJMGSl (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 13 Oct 2021 02:18:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237914AbhJMGSi (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 13 Oct 2021 02:18:38 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B18F1C061767
        for <reiserfs-devel@vger.kernel.org>; Tue, 12 Oct 2021 23:16:35 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id d13-20020a17090ad3cd00b0019e746f7bd4so3645573pjw.0
        for <reiserfs-devel@vger.kernel.org>; Tue, 12 Oct 2021 23:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yoKDGyU1IKw4WZcPglkL9qCJyXlf9awotx8P2PTzBWs=;
        b=CfsfnomPleYW4GBsBhk8H6G76FqS7CJ1hCWsqRQNWdP3gBxNE2zoVJGIUrEHECfVKa
         v2cK96TEo8Mw5Ik4Y/ADCAfA/3y7sebWHT8J/KK4oeu3vgk08FAOGIJ4+lA7q9hiMA29
         r2H7qpegYylGn4mcpKE0+qgwtq9QgI8dolIgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yoKDGyU1IKw4WZcPglkL9qCJyXlf9awotx8P2PTzBWs=;
        b=y448t31zyjTHP8jNaTWmT23TVk3GC5lRdhqmhWsZMLgwmhiv6QGDuSVeGyjMbAOZPq
         /ycKtJWrlgWW06Biz2LONrrImHmyw9a+ZJPBboW9le22cbVX0asCByeSwFzV4xx/3AHO
         xCMhRtHpUTkiY1Mh6hOHDwPJvwWC9cTCPQrOlR6BsCiIScDDmYCG815+w7oKCDkGJxae
         fKNSMvhWlaNYfnn82t4ldqrTICiq+I2UHmEaKB1ByKp6iy0cIA2ZD7SJfQ5O8xJG4ypP
         DqwdzxyjzQ0tDvXVxcDbgLJFx/glBDUBm3dGa/Fud6V3NUwU8grboJAbfooYVHR9yYPN
         kd3Q==
X-Gm-Message-State: AOAM53332iQ7eT3i6w4QQdlYDjG+JBd+Ee1z7aQMnvfGWT3ZUT+csfxb
        9xoV1zbuLVHhuTE4/oqYyaQ/lQ==
X-Google-Smtp-Source: ABdhPJxLGyOml5lqe+K0AfHsTHYJz8Z1ysoHhzc/2/LGB5MqaATX0lTpa7QxWtRvvD8zMko7cBuZVA==
X-Received: by 2002:a17:90b:3850:: with SMTP id nl16mr11065306pjb.127.1634105795098;
        Tue, 12 Oct 2021 23:16:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c11sm4509497pji.38.2021.10.12.23.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 23:16:34 -0700 (PDT)
Date:   Tue, 12 Oct 2021 23:16:34 -0700
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
Subject: Re: [PATCH 13/29] fat: use bdev_nr_sectors instead of open coding it
Message-ID: <202110122316.8ED0742@keescook>
References: <20211013051042.1065752-1-hch@lst.de>
 <20211013051042.1065752-14-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013051042.1065752-14-hch@lst.de>
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Wed, Oct 13, 2021 at 07:10:26AM +0200, Christoph Hellwig wrote:
> Use the proper helper to read the block device size.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
