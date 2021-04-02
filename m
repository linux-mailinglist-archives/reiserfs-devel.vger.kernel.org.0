Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD5FE352B8A
	for <lists+reiserfs-devel@lfdr.de>; Fri,  2 Apr 2021 16:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235626AbhDBOlF (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 2 Apr 2021 10:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235584AbhDBOlF (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 2 Apr 2021 10:41:05 -0400
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FC3FC061788
        for <reiserfs-devel@vger.kernel.org>; Fri,  2 Apr 2021 07:41:04 -0700 (PDT)
Received: by mail-qv1-xf2a.google.com with SMTP id j3so533800qvs.1
        for <reiserfs-devel@vger.kernel.org>; Fri, 02 Apr 2021 07:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=+vgejU4/JZadtPYENjNbyRGMVCzwVSPUxWwXTslt1q4=;
        b=XqzBy8GABaaVCHwtvbceZdyfltyfLjwIlZXmZ/QUkubphwR6CWfRdX/a1C39I4Zkfo
         XGajLD4Fk968nQubxVGmz89TpfR6vyc7Y4+PHLMkvkowHGbMwbSuTK9K8iAbe/WqgkAU
         GWlUWu045uerbz43w+ZUdr/QrTi+QR86kCcbIpP39UIMXvdw1ZcWdLMEZr2Q8EhfTjPF
         WooT9wm0dXegr5gcyBcAyOZ1RbJmvEMCRPMcVOvU7puc5j9GMRQNhTdW0qtA6gd5vCfb
         zGXoauqwnhzLvZnGKRIS00fx/1WaIGX3MynWv81gx01mc4NeouVHfWmtF1OI81+7lOLL
         YbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=+vgejU4/JZadtPYENjNbyRGMVCzwVSPUxWwXTslt1q4=;
        b=rpa0pIshm9+lTEtp43e/yrZWFmyvnhw97+RcQYlmugMBH6zqX6rNAMGnVDq1WfjmHK
         e5Ze3hU/0XdWIMNHLtqB4LxMeZ5HTKpQ2GvVNpLkyMRZgBp8g+1nqEKTDAkqnoGS+sft
         n10hMskpmJoa2mpyV5Ei0+0lLDTgvU9T9eJjaSbuAGjPSk4f3oDVH7+VPyhw09HA2ppo
         51SeMMgih7ceCJAMoGM15TSpVPiuslFm1n6+ubSOENy1ssCbx2w4O70HxWl2KK5gMmtZ
         uh+TNORtJme/sf6VWYXmXcC4WrXt3O/BjhoBEcPTKMcH+2RMUWHzuEaQ1CMIAEoKcC2y
         7f+A==
X-Gm-Message-State: AOAM532A9e098/9xXXNWAFj6MpMJowXYaKeoiZzyPQy9bBDYoI11lFge
        QUQVZI6FH80iMOiXw3PqY8/zbIuwaGJldOzP
X-Google-Smtp-Source: ABdhPJz4LErsUa6QJPvMHVW6+CLbNgfBrYTxFNjWtRJgCw1sc+1RbCj19wOKKQux/hPr712XfR/oIA==
X-Received: by 2002:a0c:a425:: with SMTP id w34mr13007510qvw.2.1617374463466;
        Fri, 02 Apr 2021 07:41:03 -0700 (PDT)
Received: from ?IPv6:2600:1700:6470:27a0:4e80:93ff:fe00:3ff7? ([2600:1700:6470:27a0:4e80:93ff:fe00:3ff7])
        by smtp.gmail.com with ESMTPSA id 18sm7663196qkr.90.2021.04.02.07.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 07:41:02 -0700 (PDT)
Message-ID: <76f176ce14bb469293e15172e6522081a3539126.camel@metztli.com>
Subject: Reiser4 -enabled Linux 5.10.26
From:   Metztli Information Technology <jose.r.r@metztli.com>
To:     ReiserFS Development List <reiserfs-devel@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Cc:     Edward Shishkin <edward.shishkin@gmail.com>
Date:   Fri, 02 Apr 2021 07:41:01 -0700
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Niltze [Hello], all-

We have just released a preliminary reiser4 -enabled Debian 11,
codenamed Bullseye, minimal USB/ISO AMD64 image with Debianized kernel
5.10.26-2. It has been tested lightly -- as Debian gives the finishing
touches to their upcoming operating system distribution.

If anyone wants to give it a spin, here are the download link(s):
https://metztli.it/bullseye/netboot/metztli-reiser4.iso
https://metztli.it/bullseye/netboot/metztli-reiser4.iso.SHA256SUM

If using USB device /dev/sdb,
dd if=metztli-reiser4.iso of=/dev/sdb bs=4M; sync

https://metztli.it/bullseye
*No warranties whatsoever*


Best Professional Regards.

-- 
-- 
Jose R R
http://metztli.it
-----------------------------------------------------------------------
----------------------
Download Metztli Reiser4: Debian Buster w/ Linux 5.10.20 AMD64
-----------------------------------------------------------------------
----------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-----------------------------------------------------------------------
----------------------
or SFRN 5.1.3, Metztli Reiser5 https://sf.net/projects/debian-reiser4/
-----------------------------------------------------------------------
--------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/


