Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A82973C26E9
	for <lists+reiserfs-devel@lfdr.de>; Fri,  9 Jul 2021 17:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232437AbhGIPhV (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 9 Jul 2021 11:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232415AbhGIPhV (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 9 Jul 2021 11:37:21 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C864C0613DD;
        Fri,  9 Jul 2021 08:34:38 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id m83so1362116pfd.0;
        Fri, 09 Jul 2021 08:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:mime-version
         :content-disposition;
        bh=U9h1S56hNKKk2cU+ZFfbrBy2KFpOOYwxQwTzjnZy34Q=;
        b=UFSzO2N3dVir/1+6/YHEPkmvSMQj7F6tUiY8f5FhcL7/gWw2uojL3E3hF7Vtr72B2G
         rzGEdzCZ+b3qPI1AYxTT3XAPH5dZ/PazedW2d97kA3B6YtSobEA59BrLStiJy2hSgSA7
         SEV5DdLvwnbJK/3DMbHKVGAXbaAAljGA1bOI1EIkKyAY/3UOUcpeMjAUWUKPxe3Ilgdn
         ib/R82tUfArGjfDhjHzSIbk4TfnoGc/bzIbA6LbT6SA8lYmATzixHssbX2505GjkWK+9
         Rpscl6XFH9JFb801bhUH/fTUOjzygWO73z4NSJvMlws0SjymAEjGN+z6NF+Mb8GZsnpT
         SkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :mime-version:content-disposition;
        bh=U9h1S56hNKKk2cU+ZFfbrBy2KFpOOYwxQwTzjnZy34Q=;
        b=rupr/WqoMkR90XI1sPWRH58TEkfRwuUrMoHQI3YO+VcVKpwG6Lz1Y8kbLUXdJ9wJ+M
         J6uIaQVz+IYqlSZP93RtbCpWKDM0Rvm0AG4Whn+JPS7s99IG6XmxdmUOfbQpVHIPqcsQ
         sw6LgN1+YImgyjv3H2Sa/VvsbcYnkDja3Sft5GnZeaL3BZYDYFyJqPozyBfEfTAWYU8R
         GAcnHUOnyp7FE0lI4xx5/FccOChIcdZP7ypvwT6lXubEr/fevu/duYV/NjWK5o80rcYv
         a4J3u3aG90+9ITV0XPYxCwrOEMfxEX+kRScl37egIgDog1tToAVjw3qV8wEMnASSdZb7
         LmaA==
X-Gm-Message-State: AOAM530FcUyMmkytJB1rxwXJv8tmcR7PF+0FVswByoDiM+4khkaZq8YD
        DLUmULnAYflZBeHrOZt9uZs=
X-Google-Smtp-Source: ABdhPJwTl1l1HppSSCZfrPOiskVqTI+UPzK6XqQCTQRrMIjnpxJP/C1YYHQeA3Yj6Yxe3Bz6CxpvPA==
X-Received: by 2002:a63:470d:: with SMTP id u13mr23010946pga.318.1625844877539;
        Fri, 09 Jul 2021 08:34:37 -0700 (PDT)
Received: from fedora ([2405:201:6008:6ce2:9fb0:9db:90a4:39e2])
        by smtp.gmail.com with ESMTPSA id f31sm7278628pgm.1.2021.07.09.08.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 08:34:37 -0700 (PDT)
Date:   Fri, 9 Jul 2021 21:04:32 +0530
From:   Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
To:     jack@suse.cz
Cc:     rkovhaev@gmail.com, reiserfs-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: Verify the items that we read from blocks
Message-ID: <YOhsiA2XnhQ8BX+U@fedora>
Reply-To: 20210705113329.GE15373@quack2.suse.cz
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hi,

Thanks a lot for your input. After investing this much time on the bug, I
thought I'd just send a patch. Hope that won't be a problem.

Thank you,
Shreyansh Chouhan
