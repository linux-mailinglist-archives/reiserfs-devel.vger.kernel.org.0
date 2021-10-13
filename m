Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E48342B699
	for <lists+reiserfs-devel@lfdr.de>; Wed, 13 Oct 2021 08:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237763AbhJMGQY (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 13 Oct 2021 02:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237777AbhJMGQW (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 13 Oct 2021 02:16:22 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B390FC061764
        for <reiserfs-devel@vger.kernel.org>; Tue, 12 Oct 2021 23:14:15 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 66so1294841pgc.9
        for <reiserfs-devel@vger.kernel.org>; Tue, 12 Oct 2021 23:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ohUOQyC8vv5S9fFmDSqrC2HGxb4XvUeywx+2/I7KWZo=;
        b=frRmuaPa3nXR7lxMr1CNNPYB3c6MDWaV+IHcoR+XuNXpKLmcDJudjmJiNd/vJuYFPn
         yeOjEGluCsqDt4qWvY1oHVWaypcD/6hEY+cvzA7LDBwWjS32G63Wnxe8e0GGmx9dGa0p
         xQzhoygleJQrWshzo5X8hdFcW2UVxu2kZRAXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ohUOQyC8vv5S9fFmDSqrC2HGxb4XvUeywx+2/I7KWZo=;
        b=YbAmgkS76C0qicRAvk7W13nWaPoDyS2qiK6x8Ey1HeDjiPPrqEcWTCQeh9jH/4PeBG
         e8uvreDKS03Xj6/VXA1Ky+1mxtsJW/exPaQdivd2OzZPfNW8PZpXyyv6PFc2O04DC4R1
         TccIKxFeKGaiGKfTdgpZumL1qwzKupv7t5PJ2TepjHgM8peXu3w23M5AfgBDVhzdS1Uy
         on8K6sgmt0Q/UE7Ur6AuRxODEwFm+OZ99S7OmWoYvpl4VRfMbWb/GReFGYNYy+/5dAnc
         f3U6F9gT77N1TAEB/ddTPcAEuUrOlRmeQTbbRrHiiMM5kJMifB2EMSbbuukJCuBmN+XJ
         z34Q==
X-Gm-Message-State: AOAM533HE8/iwgn+cte6wSl20BmgI13Bzc3y/fn9nCfhPz5jt7UAqAby
        F3SX/GipLHD2+gknP7HLWUefhA==
X-Google-Smtp-Source: ABdhPJwNMNbppcyyaPyGGktYQSHeAypT2bIkLVBhhieDA7TSPn60W6m8F7nQfgJZ/E5a6hMyK4Ynow==
X-Received: by 2002:a63:e00b:: with SMTP id e11mr26380948pgh.190.1634105655240;
        Tue, 12 Oct 2021 23:14:15 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t8sm10813622pgk.66.2021.10.12.23.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 23:14:15 -0700 (PDT)
Date:   Tue, 12 Oct 2021 23:14:14 -0700
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
Subject: Re: [PATCH 09/29] fs: simplify init_page_buffers
Message-ID: <202110122314.664187AA@keescook>
References: <20211013051042.1065752-1-hch@lst.de>
 <20211013051042.1065752-10-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013051042.1065752-10-hch@lst.de>
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Wed, Oct 13, 2021 at 07:10:22AM +0200, Christoph Hellwig wrote:
> No need to convert from bdev to inode and back.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
