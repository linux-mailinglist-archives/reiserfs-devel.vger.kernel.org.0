Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1411432B63
	for <lists+reiserfs-devel@lfdr.de>; Tue, 19 Oct 2021 03:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233660AbhJSBHW (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 18 Oct 2021 21:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233343AbhJSBHS (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 18 Oct 2021 21:07:18 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C496C06161C
        for <reiserfs-devel@vger.kernel.org>; Mon, 18 Oct 2021 18:05:04 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id s17so18404999ioa.13
        for <reiserfs-devel@vger.kernel.org>; Mon, 18 Oct 2021 18:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=W5z0exFABNpBPX1hRqcH8nqG0V53/7e/1qraB3crDBc=;
        b=vB+wFpSQtfAUhwdXcfynbmYwp0hdBEQZvbX6X9F6PNzCrR7jlF3UU0FKlXz+m74FXo
         fYCfnp+UOHId9lQV8O9fyEh4YEI0b538At136V3n0vh4OZ/YzMev/Q7gmlb/eOGGE5cU
         0c1i9lZ2acvXLmYa878iz+lCi3R78xqn0ZDpYtIVtZNxoFJsKdSEsj9/YVhugl90Ar3H
         SoUxghi0wJ6VSD6JvL3P+s/JM6f3Wm0mmMYFgaEag1ojhi+wlEeYXumrYWwARkL2eroz
         Ue9QqS/6wvsrqGxlajrxCGxhjXwobZTI+icumh8oCIQgK1Jfr75Nwh+NZuFxcTfoqOvP
         WcvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W5z0exFABNpBPX1hRqcH8nqG0V53/7e/1qraB3crDBc=;
        b=8QJRdAEH48sYLhK8W4/gqVUJ6td6oU/QbhVuVbV8y7xuKO2hnoiNcu4Mu+oSc7zCrO
         ff1wwfZ3TdlYXMtnRkfR/ggnd7hhF6TEumoFgJClOHePyLVEvzL1OgK5uRcEuB6lOcdg
         zmStORaqQRyh2kH6HnP4bqyksXlocbPAczFFdqToxPnpEeFfScAi46zoZtJ5vWOaPubU
         vwkpxoBwVrnGcYg8jqBc+XiVQyJRQZ/NyKqcBp4l+dU/XcHR4ASLGcEdujrW8NZKgpY0
         ITc2Eqq7soNv4FGQRE2IB6v9oWxhIGO+7cXciU6ItWXVuYZnKunsuSOhMNiGmBnGT5WL
         ldbQ==
X-Gm-Message-State: AOAM533oyYzWSxUylS5BVjSfvpPWlNP6MGHFmQcCUvD3k/tbGuIZmo6n
        VPIzUHnjCjxTYcNdi9N+S9kJ49fvznq6Sw==
X-Google-Smtp-Source: ABdhPJxThXMAcCMjPpDBYOBzNUVp6z4TAqcvNSoJJDW60phmikuRtzHD4NR4koFPUymcotmxVpLHsA==
X-Received: by 2002:a6b:102:: with SMTP id 2mr16592131iob.185.1634605499259;
        Mon, 18 Oct 2021 18:04:59 -0700 (PDT)
Received: from [192.168.1.116] ([66.219.217.159])
        by smtp.gmail.com with ESMTPSA id g13sm116963ilf.60.2021.10.18.18.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 18:04:58 -0700 (PDT)
Subject: Re: don't use ->bd_inode to access the block device size v3
To:     Kari Argillander <kari.argillander@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>, Coly Li <colyli@suse.de>,
        Mike Snitzer <snitzer@redhat.com>, Song Liu <song@kernel.org>,
        David Sterba <dsterba@suse.com>,
        Josef Bacik <josef@toxicpanda.com>,
        Theodore Ts'o <tytso@mit.edu>,
        OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
        Dave Kleikamp <shaggy@kernel.org>,
        Ryusuke Konishi <konishi.ryusuke@gmail.com>,
        Anton Altaparmakov <anton@tuxera.com>,
        Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
        Kees Cook <keescook@chromium.org>,
        Phillip Lougher <phillip@squashfs.org.uk>,
        Jan Kara <jack@suse.com>, linux-block@vger.kernel.org,
        dm-devel@redhat.com, drbd-dev@lists.linbit.com,
        linux-bcache@vger.kernel.org, linux-raid@vger.kernel.org,
        linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org,
        target-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
        jfs-discussion@lists.sourceforge.net, linux-nfs@vger.kernel.org,
        linux-nilfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
        ntfs3@lists.linux.dev, reiserfs-devel@vger.kernel.org
References: <20211018101130.1838532-1-hch@lst.de>
 <4a8c3a39-9cd3-5b2f-6d0f-a16e689755e6@kernel.dk>
 <20211018171843.GA3338@lst.de>
 <2f5dcf79-8419-45ff-c27c-68d43242ccfe@kernel.dk>
 <20211018174901.GA3990@lst.de>
 <e0784f3e-46c8-c90c-870b-60cc2ed7a2da@kernel.dk>
 <20211019010416.vgecxu6wnvwi7fii@kari-VirtualBox>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <81f9ad59-4c15-b265-1274-62c987ad879b@kernel.dk>
Date:   Mon, 18 Oct 2021 19:04:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20211019010416.vgecxu6wnvwi7fii@kari-VirtualBox>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On 10/18/21 7:04 PM, Kari Argillander wrote:
> On Mon, Oct 18, 2021 at 11:53:08AM -0600, Jens Axboe wrote:
> 
> snip..
> 
>> diff --git a/include/linux/genhd.h b/include/linux/genhd.h
>> index 7b0326661a1e..a967b3fb3c71 100644
>> --- a/include/linux/genhd.h
>> +++ b/include/linux/genhd.h
>> @@ -236,14 +236,14 @@ static inline sector_t get_start_sect(struct block_device *bdev)
>>  	return bdev->bd_start_sect;
>>  }
>>  
>> -static inline loff_t bdev_nr_bytes(struct block_device *bdev)
>> +static inline sector_t bdev_nr_sectors(struct block_device *bdev)
>>  {
>> -	return i_size_read(bdev->bd_inode);
>> +	return bdev->bd_nr_sectors;
>>  }
>>  
>> -static inline sector_t bdev_nr_sectors(struct block_device *bdev)
>> +static inline loff_t bdev_nr_bytes(struct block_device *bdev)
>>  {
>> -	return bdev_nr_bytes(bdev) >> SECTOR_SHIFT;
>> +	return bdev_nr_setors(bdev) << SECTOR_SHIFT;
> 
> setors -> sectors

Yep, did catch that prior.

-- 
Jens Axboe

