Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1829357686
	for <lists+reiserfs-devel@lfdr.de>; Wed,  7 Apr 2021 23:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231925AbhDGVQK (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 7 Apr 2021 17:16:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbhDGVQK (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 7 Apr 2021 17:16:10 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 988BCC061760
        for <reiserfs-devel@vger.kernel.org>; Wed,  7 Apr 2021 14:16:00 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a25so6956857ejk.0
        for <reiserfs-devel@vger.kernel.org>; Wed, 07 Apr 2021 14:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=tx47fhbhPlWUeE59U3Ur/v3UUGiiFnso4iDnaPxAMm0=;
        b=CC2CWx3YmR4W9Bzs1AhlV5ZRJnb2iCY0EVltkmBZRu797rf7qOTZsLxU6a/pXKMPvo
         hY4/M6lFpSG1DkYRf9zSSQD+8VOGb2Y7BuVvXeXi/1iK5ycKVu7e92u8kI4KzkGLW8DW
         c6E4wowhI4FIiPwVlpmTANZBbPt7CeLHVBREu4/bDWef0Ck0kWH2AZtWCUezG7LTbqgE
         LVkMPzX3rW7Lh7YmAtUJoRan+Uu35KMAgevke+2XANaG5TObWul38MoNA6iM/4b5cskw
         vy05hCB2jOsUvys8JgaO066u3w1H5AbNg6NEIPynUd0J6UEy/pqb9Ne8QIbWCH5NmQ7o
         YmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=tx47fhbhPlWUeE59U3Ur/v3UUGiiFnso4iDnaPxAMm0=;
        b=C9FS+JrPzYxkZaY3IpNsh4enuhAxhAlAJdOl87iUnxuBMo5nVDJYGRUUVomzBOsRvX
         RNuMg0edetw1KXW+jUmARqnlPJUcR7QOnGN8N6Z9A1z5RyAzSdXyN6Lvs4Tm2w6xeSE/
         y0QN7Y4T4TXwnfJoKl4BRfGlVyMr8KTI37HfL0qsvN4YJ4ShIJQOJQkSYFhdDNR+K7al
         3/QI2I+uH2mT5KHsuvLiv3tjZLcZu+ifEvc+Kqxy9159KG7mx39IEEt38IJDusr4BVD7
         /FUn5IPbx+iBvscfI1V7y8ELgedtkxzZQcKX6ZE0EW4qOHsGT2ypypTBXIqRIDThnsBM
         klCw==
X-Gm-Message-State: AOAM533hMUrF0Uv/B+YzqyF8JZ8SzjPtxfzQOu0bSUMla1IJevXcaikx
        yhREgcWhj6aw83f9n2NSnYqZ7p1BrSY=
X-Google-Smtp-Source: ABdhPJz0NoXPzXnbIlELhDb7c0Xm0sNM4tky5XetxCKw1jyhtTZBBVMyYEdBYGt221rg1jAnOiFtsw==
X-Received: by 2002:a17:906:c9d8:: with SMTP id hk24mr6147326ejb.480.1617830159246;
        Wed, 07 Apr 2021 14:15:59 -0700 (PDT)
Received: from [192.168.0.48] (HSI-KBW-46-223-1-191.hsi.kabel-badenwuerttemberg.de. [46.223.1.191])
        by smtp.gmail.com with ESMTPSA id c16sm2450677ejx.81.2021.04.07.14.15.58
        for <reiserfs-devel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Apr 2021 14:15:58 -0700 (PDT)
From:   Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4 for Linux-5.12
To:     ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>
Message-ID: <e3a3910f-6ae4-833f-e6c5-f560597cb2e1@gmail.com>
Date:   Wed, 7 Apr 2021 23:15:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

5.11 -> 5.12:

. Implement ->read_iter(), get rid of deprecated ->read() file operation
. Port for Linux-5.12
   . Macro BIO_MAX_PAGES has gone;
   . The following methods got a new argument struct user_namespace *:
     . reiser4_setattr_common
     . reiser4_getattr_common
     . reiser4_create_common
     . reiser4_symlink_common
     . reiser4_mkdir_common
     . reiser4_mknod_common
     . reiser4_permission_common
     . reiser4_rename2_common

Find at
https://sourceforge.net/projects/reiser4/files/reiser4-for-linux-5.x/
