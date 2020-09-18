Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD2326F8AD
	for <lists+reiserfs-devel@lfdr.de>; Fri, 18 Sep 2020 10:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbgIRIvl (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 18 Sep 2020 04:51:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgIRIvl (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 18 Sep 2020 04:51:41 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03C0FC06174A
        for <reiserfs-devel@vger.kernel.org>; Fri, 18 Sep 2020 01:51:41 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id q13so7018094ejo.9
        for <reiserfs-devel@vger.kernel.org>; Fri, 18 Sep 2020 01:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=Go4Y0oQGI9fDxIkaAC9hBKVS9kFfqDt77SgkSrHjbVc=;
        b=ORhewLVstT+2pAwcskkaQ6ODa22cVQo4oLqBvMDHlcQ20eH0hgcA2++ZYkglxWaw+f
         SHX4gQeeb2591spLYd1CrgBsJMHANNDX2+DdEGjAe4yb6ULtIXgLfKk7/yT7fFcNxHi7
         V/5PJhGsOxTuN5nh1xcECIpI2BBAeUH7eH2U5xzqvt/oNepP+1zBdk4T0+eEGWLBfWXh
         b8twD8IP/8aV/HIItSC4vXAeQo9DAueyd2FdiL1cozTOuXyB6vVjllhJu8czjAINLoRk
         7hJTl4ruCbXT+kzjKVKxzqoGR58do/iE9Jck0yRHKya7+e2B9D6x2LaZxuwBIrJrH3D8
         5UEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Go4Y0oQGI9fDxIkaAC9hBKVS9kFfqDt77SgkSrHjbVc=;
        b=f9Af8PzaTRc4PT72hGniPWrAF95m9EwqO1Ixt0JivltghD7fAt6bU9jDulj2HT6E0p
         m+Qh2G43HM45hfx3K5ejmK+4PDOVC851hUqes9WKFstlqeF95ZYC6zToU0KiDK2erah4
         m3nPsiH7bMjIKyw0NDqZJzIJJxDW+eynxrsKEACDGYsqbip5B8rpz3K0YJtn1d432BSy
         UUtSbnzbysu/i4t4Ggo4H8bHix61gY9fQqmq7y4UrH+2nFxIoLn+SsR2yE63iCFxm5ew
         C7cnAozBWut31MgI5JpB3LFxD4u/iZVlv8ZTLIrpVD5tYAWV0Ml0bKo2a6icPfMmplsn
         Ki2w==
X-Gm-Message-State: AOAM532Zw+gSZMyZKp6yZB8JgQGOhMmjQgXi96UttHpDqC2ftfLC0hyM
        cfKtMeZppo/+02VC0V/sYmNvDRTbiw8=
X-Google-Smtp-Source: ABdhPJwjFQMo62UPnV3y+GJ2ih6hX6aD1P/kyuCrQ220DceiWJRzWH2/ChVrOCM0AeNu9IwO17TJcQ==
X-Received: by 2002:a17:906:8401:: with SMTP id n1mr33902196ejx.215.1600419099371;
        Fri, 18 Sep 2020 01:51:39 -0700 (PDT)
Received: from [192.168.0.48] (HSI-KBW-046-005-005-158.hsi8.kabel-badenwuerttemberg.de. [46.5.5.158])
        by smtp.gmail.com with ESMTPSA id f10sm1780104edk.34.2020.09.18.01.51.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Sep 2020 01:51:38 -0700 (PDT)
Subject: Re: sparse-file archive on GFS2 corrupts Reiser4
To:     Pierre-Philipp Braun <pbraun@nethence.com>,
        reiserfs-devel@vger.kernel.org
References: <712d2a21-8873-4373-16aa-78fd9dbf3b07@nethence.com>
From:   Edward Shishkin <edward.shishkin@gmail.com>
Message-ID: <3cb90d5c-194a-2d8c-f0a6-f8019c928cb7@gmail.com>
Date:   Fri, 18 Sep 2020 10:51:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <712d2a21-8873-4373-16aa-78fd9dbf3b07@nethence.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On 09/18/2020 08:44 AM, Pierre-Philipp Braun wrote:
> Hello
> 
> I am experiencing a weird and unexpected issue.  When archiving a sparse 
> file virtual disk and file-system that is Reiser4, with the `tar -S` 
> option accordingly, to actually keep the sparse, I get a corrupted 
> file-system as a result.  This does not happen when the Reiser4 sparse 
> file lives on EXT4, don't worry.  But it happens on GFS2 *1 and my guess 
> is that it is not something that is supposed to happen.  I am not sure 
> it's a bug, and even so, I am not sure whether it affects Reiser4 --OR-- 
> Redhat GFS2.  I ping here at Reiser4 first, to have your advise.
> 
> Here's how to reproduce.  On a GFS2 file-system, creating a raw sparse 
> file and a Reiser4 file-system on it.
> 
> dd if=/dev/zero of=dummy.reiser4 bs=1G count=0 seek=1
> mkfs.reiser4 -fy dummy.reiser4
> fsck.reiser4 -y dummy.reiser4
> 
> The result is fine, as expected.
> 
> *******************************************************************
> This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
> *******************************************************************
> 
> Fscking the dummy.reiser4 block device.
> Will check the consistency of the Reiser4 SuperBlock.
> Will check the consistency of the Reiser4 FileSystem.
> ***** fsck.reiser4 started at Fri Sep 18 09:22:01 2020
> Reiser4 fs was detected on dummy.reiser4.
> Master super block (16):
> magic:          ReIsEr4
> blksize:        4096
> format:         0x0 (format40)
> uuid:           51b8c5a3-ffd3-4528-9d0b-d5be985231e4
> label:          <none>
> 
> Format super block (17):
> plugin:         format40
> description:    Disk-format plugin.
> version:        2
> magic:          ReIsEr40FoRmAt
> mkfs id:        0x4934ef80
> flushes:        0
> blocks:         262144
> free blocks:    262107
> root block:     23
> tail policy:    0x2 (smart)
> next oid:       0x10000
> file count:     1
> tree height:    2
> key policy:     LARGE
> 
> 
> CHECKING THE STORAGE TREE
>          Read nodes 2
>          Nodes left in the tree 2
>                  Leaves of them 1, Twigs of them 1
>          Time interval: Fri Sep 18 09:22:01 2020 - Fri Sep 18 09:22:01 2020
> CHECKING EXTENT REGIONS.
>          Read twigs 1
>          Time interval: Fri Sep 18 09:22:01 2020 - Fri Sep 18 09:22:01 2020
> CHECKING THE SEMANTIC TREE
>          Found 1 objects (some could be encountered more then once).
>          Time interval: Fri Sep 18 09:22:01 2020 - Fri Sep 18 09:22:01 2020
> ***** fsck.reiser4 finished at Fri Sep 18 09:22:01 2020
> Closing fs...done
> 
> FS is consistent.
> 
> Then archiving and extracting it with `-S`.
> 
> tar czSf dummy.reiser4.tar.gz dummy.reiser4
> rm -f dummy.reiser4
> tar xzSf dummy.reiser4.tar.gz
> fsck.reiser4 -y dummy.reiser4
> 
> and here it comes
> 
> *******************************************************************
> This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
> *******************************************************************
> 
> Fscking the dummy.reiser4 block device.
> Will check the consistency of the Reiser4 SuperBlock.
> Will check the consistency of the Reiser4 FileSystem.
> ***** fsck.reiser4 started at Fri Sep 18 09:23:23 2020
> FSCK: backup.c: 485: repair_backup_open: Only 4 of 5 backup blocks are 
> found.
> Fatal: Failed to open the reiser4 backup.
> Fatal: Cannot open the FileSystem on (dummy.reiser4).
> 
> 1 fatal corruptions were detected in SuperBlock. Run with --build-sb 
> option to fix them.
> 
> 
> What angle should I take to this problem?


Try to find out why a sequence of packing/extracting changes the content
of dummy.reiser4. In your case it was detected by fsck.reiser4, but it
also could be confirmed by some other tool (e.g. compare sha1 before and
after). There shouldn't be any questions to reiser4: its driver haven't
been even called :)

Thanks,
Edward.
