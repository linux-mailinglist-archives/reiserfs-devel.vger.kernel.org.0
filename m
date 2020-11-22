Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07E452BC91C
	for <lists+reiserfs-devel@lfdr.de>; Sun, 22 Nov 2020 21:24:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727307AbgKVUYh (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sun, 22 Nov 2020 15:24:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727297AbgKVUYh (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 22 Nov 2020 15:24:37 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51635C0613CF;
        Sun, 22 Nov 2020 12:24:35 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 1so15465099wme.3;
        Sun, 22 Nov 2020 12:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=zgf/h76dlKVPgQTcqMTxlnGXFSKKSbDb08KBHH9xoBo=;
        b=VzltfJvyuWhCH1eHJvXEWMGlmjh+zONHmAP0UvUoy+HBVLK9EXzuz9by9iryq8/xU9
         2HW7T9fyAFiO54d8x8Xg5Kny48Sz4MesnFQ19mKrmm2gyVlqvm6CTsWNsWTxkcY6zU99
         jmnuZ9S7ZJzADD6EYgrVQ+RK2FC6kCAzMpTYfHMrUdIOFSgAAk8IXf4X1LWNNMCQ7bVQ
         XvMj05jFStMLRMe3D8tMiqh6NuCF6cO5t3Ws8Aq9Ox78WUy7T5FWaOziHKWM9/e1Qy+P
         p2oYebV9IuP009FiGNqT92ws4rFrFiVeAATRRUjU37tpvQAlnB+kFBaLjHBXDPk8b+uG
         R4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=zgf/h76dlKVPgQTcqMTxlnGXFSKKSbDb08KBHH9xoBo=;
        b=D29VYDQDW0/Jy9ZFVajM9lHylJDjX/ycNPvXgYIm6sEhunuk615pyPrBkuULfLCQB3
         bDM7CcQQbExplse4TqTFxuGBrBTwh/vDV/rVCx4ZlGaiE4K7Q++MT1v9G/OHGY49BuUq
         HS3Ci13ZkyQdwfKSY2bAk5rgyQXC/2RWHYH48mu9eO4GLLA6AZCNHEpcAJPT15NgLMAU
         ejONLCw+hnQ39sQDa1g6wXB0NrYj/ka7FMDT4tnF3Nn5qqUYb/w/9OrNA23OkaLWEkyy
         RcvR2DpLtVFgNnhzBU9argIfL3vE7+/rn82g+haEow9S+Z7iQgs+i8IH0B7rn5jpOuge
         uuAA==
X-Gm-Message-State: AOAM53190zlfVR0TaTN61qWKPn0OeMfYCi35nxj9rsA0nuCITmbWG+dp
        j/PcfHDdJoH71pkXq4o9G70GhE1KG/E=
X-Google-Smtp-Source: ABdhPJxxIzWPXTyWP7/Ecz4yr0bglQDdci+MeVNy7xvG6LJS1XESLEuvB5SvTv7c24GkdflY/8Mjvw==
X-Received: by 2002:a1c:f20e:: with SMTP id s14mr19850209wmc.126.1606076672547;
        Sun, 22 Nov 2020 12:24:32 -0800 (PST)
Received: from [192.168.0.48] (HSI-KBW-046-005-005-111.hsi8.kabel-badenwuerttemberg.de. [46.5.5.111])
        by smtp.gmail.com with ESMTPSA id k1sm14787310wrp.23.2020.11.22.12.24.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2020 12:24:31 -0800 (PST)
From:   Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser5 Logical Volume Management - Updates
To:     ReiserFS development mailing list 
        <reiserfs-devel@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Cc:     Pavel Machek <pavel@ucw.cz>
Message-ID: <ccc9ded7-ab36-ca36-99a7-21138e1c7ceb@gmail.com>
Date:   Sun, 22 Nov 2020 21:24:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

           Reiser5 Logical Volume Management - Updates


I am happy to inform, that Logical Volumes stuff has become more
stable. Also we introduce the following changes, which make logical
volumes administration more flexible and simple:


                  1. No balancing by default


Now all volume operations except brick removal don't invoke balancing
by default. Instead, they mark volume as "unbalanced". To complete any
operation with balancing specify option -B (--with-balance), or run
volume.reiser4(8) utility with the option -b (--balance) later.

This allows to speed up more than one operations over logical volume
being performed at once. For example, if you want to add more than one
brick to your volume at once, first add all the bricks, then run
balancing. There is no need to balance a volume between the addition
operations.


                    2. Removal completion


Operation of brick removal always includes balancing procedure as its
part. This procedure moves out all data block from the brick to be
removed to remaining bricks of the volume. Thus, brick removal is
usually a long operation, which may be interrupted for various reasons
In such cases the volume is automatically marked with an "incomplete
removal" flag.

It is not allowed to perform essential volume operations on a volume
marked as "with incomplete removal": first, user should complete
removal by running volume.reiser4 utility with option
-R (--finish-removal). Otherwise, the operation will return error
(-EBUSY).

There is no other restrictions: you are allowed to add a brick to
unbalanced volume, and even remove a brick from an unbalanced volume
(assuming it is not incomplete removal).

Comment. "--finish-removal" is a temporary option. In the future the
file system will detect incomplete removal and automatically perform
removal completion by itself.


                3. Balancing is always defined


Operation of volume balancing (regardless of its balanced status) is
always defined, and can be launched at any moment. If the volume is
balanced, then the balancing procedure just scans the volume without
any useful work.

It is allowed to run more than one balancing threads on the same
volume, however currently it will be inefficient: other threads will
be always going after the single leader without doing useful work.
Efficient volume balancing by many threads (true parallelism) is not a
trivial task. We estimate its complexity as 2/5.


          4. Restore regular distribution on the volume


Custom (defined by user) file migration can break fairness of data
distribution among the bricks. To restore regular (fair) distribution
on the volume, run volume.reiser4 utility with the option -S
(--restore-regular). It launches a balancing procedure, which performs
mandatory data migration of all files (including the ones marked as
"immobile") in accordance with regular distribution policy on the
volume. Moreover, when the balancing procedure encounters a file
marked as "immobile", its "immobile" flag is cleared up.


                         5. How to test


The new functionality is available starting with the kernel patch
reiser4-for-linux-5.10-rc3 and reiser4progs-2.0.4 (Software Framework
Release number of both is 5.1.3).

Links for download:

https://sourceforge.net/projects/reiser4/files/v5-unstable/kernel/
https://sourceforge.net/projects/reiser4/files/v5-unstable/progs/

Find updated documentation on getting started with logical volumes:

https://reiser4.wiki.kernel.org/index.php/Logical_Volumes_Administration
https://reiser4.wiki.kernel.org/index.php/Proxy_Device_Administration
https://reiser4.wiki.kernel.org/index.php/Transparent_File_Migration

Also see manual pages for volume.reiser4(8) utility.
