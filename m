Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAA112466E8
	for <lists+reiserfs-devel@lfdr.de>; Mon, 17 Aug 2020 15:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728096AbgHQNEv (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 17 Aug 2020 09:04:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728022AbgHQNEt (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 17 Aug 2020 09:04:49 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4171C061389
        for <reiserfs-devel@vger.kernel.org>; Mon, 17 Aug 2020 06:04:48 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id c15so14882636wrs.11
        for <reiserfs-devel@vger.kernel.org>; Mon, 17 Aug 2020 06:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=rylnFXFRMsFq/M07NKRObHgqYvpKLkSpKB6ByDu7GGU=;
        b=GhL2BZcRUU40xKzdxzUyLqbwgFWRRbZAvr1JfzXZfmbOCV9QY0NFrWgU4dEvsD9xRb
         diiOB/i//qdGvKlqATDd8v9QB0lBluJhUuKClpfvyn3r+4/CIzPQw5YUwbWQpS9z5b2Z
         Xk9FRavlti/51U0gWjQ+t4Dw4tVgITQTGejDHa6nSk5VrB7vV/kUITezyHHPlbEkkRxg
         VSf41ZWZZmYI3iNsMmAhbVgdq7oc4/CTjiHfrAtVBo3PPE6AT1s0kOh1zZB0vQhZI8NN
         lcFETFX9OQXDWuC/u7jcRH3t22x2/I5L2ROffDmAxK6V0EIckNqeQiXhsPJ1myFxJb+V
         FHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=rylnFXFRMsFq/M07NKRObHgqYvpKLkSpKB6ByDu7GGU=;
        b=bs6UvwIw6fk2Brz7ETa/zz7XEORy6yG72ElCMFoaoS6LMhC+LP0gsLacifAH5L+HoH
         xw7owCqfAiiHg7WsdPQSwdn0B4BJO4/MpwAd25AZ2PY5l/FLItHCVqJZgPeh5uxAsLur
         OAWqIaQ57hc+/qFPy63Z7LWQXrYrkjjAcNIO1GPFsRkfcHQD9WZoZo/UXnf3cWkKC4op
         gpF00G6yxpr2KMyWlhEqBmTVaF9lrod/3Bt+zlYEI58rxn2csc1vHjhiGn2wrJ+EMano
         xg/Pw7/w7h5Fc9Isyuye9TSa9VSxpv/rLZJCx4KD8AwyTdXgW/lK6gCGFkkSZugJRnRw
         YqMA==
X-Gm-Message-State: AOAM530piVwnKdjmZeu9HYWdca3s4qsqmx+yCkdq4K9848iCZee3XLsS
        xI8TEvZlOdDnfJtMhqWe3up/W7AvkfY=
X-Google-Smtp-Source: ABdhPJwKWm6U8/Z4+pjXqiA+vt7Htoy6PKbCoR3YRhfaJGU7jcU0jTmbfBt9EiTz4OZ3fvFu71IXlg==
X-Received: by 2002:adf:cd91:: with SMTP id q17mr15645723wrj.5.1597669486302;
        Mon, 17 Aug 2020 06:04:46 -0700 (PDT)
Received: from [192.168.0.48] (HSI-KBW-046-005-005-057.hsi8.kabel-badenwuerttemberg.de. [46.5.5.57])
        by smtp.gmail.com with ESMTPSA id v16sm29288984wmj.14.2020.08.17.06.04.45
        for <reiserfs-devel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2020 06:04:45 -0700 (PDT)
From:   Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4 updates
To:     ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>
Message-ID: <179a498d-7ace-a9fc-6940-f5f8fbc94f73@gmail.com>
Date:   Mon, 17 Aug 2020 15:04:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

4.0.2 (stable - simple volumes):

- Port for Linux-5.8

Download at 
https://sourceforge.net/projects/reiser4/files/reiser4-for-linux-5.x/

5.1.3 (experimental - logical volumes):

   Kernel:

   - Fixups in common volume balancing procedure
   - Port for Linux-5.8

   Download at 
https://sourceforge.net/projects/reiser4/files/v5-unstable/kernel/

   Userspace:

   - Reiser4progs-2.0.3 release:

     . fixups in progs/volume/volume.c
     . fixed documentation
     . added manual page for volume.reiser4 utility

   Download at 
https://sourceforge.net/projects/reiser4/files/v5-unstable/progs/
