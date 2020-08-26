Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C201425398F
	for <lists+reiserfs-devel@lfdr.de>; Wed, 26 Aug 2020 23:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbgHZVNv (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 26 Aug 2020 17:13:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726856AbgHZVNu (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 26 Aug 2020 17:13:50 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 598D2C061574;
        Wed, 26 Aug 2020 14:13:50 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id u1so3038919edi.4;
        Wed, 26 Aug 2020 14:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=XTi6fOUfRKcZjiiZjjXLNZRSEdh0rD+km7AF/L9eAoY=;
        b=JyJuVdzP36MrB9B8XqekEBFiFDnn6JvhSi6/bFWc/ezu0QCcOvm4KSOHVpM1X3AqvG
         jwTAv0GtVteyzZ14vI4HCLBnh7d9Wz2a96lLbEjsc+tLU3CCnkBMGl3yr1hQYt7dNl1D
         xJlKdFoWXmLPakXrWCwdy2YzUVAMU9Jd9uzQyU16N++Fjih1f0rV3llIMbsf1jPWFLPC
         ksa8ePm+bOedPIsI56kFOlIoPtg/wkoOJiN22hc6xGUqZUBtsc0XmmT07B93Kb3JPQfG
         eXv0jRUnJQVrLUAlYNm15pkxGyXM3dJau/9Josf+15Hgr9Ec921u2Nk2CciUx+k9v+b/
         j/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XTi6fOUfRKcZjiiZjjXLNZRSEdh0rD+km7AF/L9eAoY=;
        b=er6vl1yXvwOgdzXx9q9oKq+VCKfckIgcoVBQAbpGrc8JbT7q58XE2eUrxRNa64lxhR
         MY4oN7T7gLalCewybo4f0PVF0a5LylVa7oyA7PGAo+81Y1oJ0ghOy2XCGsQ8702iTMR8
         SSsDyZuP3yMaArdLMswPIdihFGoA/fxidgV4IMtpda0IGmnfyuJVfW5VQQ7KjFwkj/eA
         zEvZg9hlQofhBaeBpVB9sqG02msvZr+EPthShMyQFNTOkoDoYBlffc1WfYIN3qIM/u+E
         OlENuM1VxKR1Vs8ronuuRXajjJhBFMtuu+BhfHLz+ThHhjlspUO3VGmrsyxlhHtggsNL
         QALg==
X-Gm-Message-State: AOAM530p6VmvTexToFaRqeHJ1zkyiiyW04MG9uRu34ijip9VaXqTkuQD
        YRElW88iv5AjSh9uCqaKygG+77rGqTI=
X-Google-Smtp-Source: ABdhPJzFSb4ie+UjFYMyn4m3xisVraXzgAOVO+1FJ209t6n1wMzjiMpYcj7C7FI4e96EpaxPDZmhfQ==
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr17087309edt.134.1598476428548;
        Wed, 26 Aug 2020 14:13:48 -0700 (PDT)
Received: from [192.168.0.48] (HSI-KBW-046-005-005-126.hsi8.kabel-badenwuerttemberg.de. [46.5.5.126])
        by smtp.gmail.com with ESMTPSA id h19sm83508ejy.79.2020.08.26.14.13.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Aug 2020 14:13:47 -0700 (PDT)
Subject: Re: [ANNOUNCE] Reiser5: Selective File Migration - User Interface
To:     Metztli Information Technology <jose.r.r@metztli.com>,
        reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200826205216.07BC868EF679@huitzilopochtli.metztli-it.com>
From:   Edward Shishkin <edward.shishkin@gmail.com>
Message-ID: <4069a2ae-8b9c-9d9e-5b22-1b0984b0eba3@gmail.com>
Date:   Wed, 26 Aug 2020 23:13:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20200826205216.07BC868EF679@huitzilopochtli.metztli-it.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

[...]

> 
> FYI Although not officially, the Debian metaframework Buster AMD64 distribution might be the first to support native installation of Reiser4 SFRN 5.1.3, kernel and reiser4progs 2.0.3, file system utilities.
> 
> I have already made a couple of successful Metztli Reiser4 SFRN 5 native installations onto ~100 GB slices, which root file system is formatted in 'Reiser5' and 1 GB /boot in JFS.
> https://metztli.it/reiser5 (Screenshot 600x338 size)
> 
> The upgraded netboot installation media metztli-reiser4-sfrn5.iso is available at:
> https://sourceforge.net/projects/debian-reiser4/
> as well as
> https://metztli.it/buster-reiser5/metztli-reiser4-sfrn5.iso
> https://metztli.it/buster-reiser5/metztli-reiser4-sfrn5.iso.SHA256SUM
> 
> Likely the brick/volume feature(s) will be useful in Cloud fabric infrastructures, like Google's, where reiser4 excels.
> 
> The current SFRN 5.1.3 -patched Zstd -compressed kernel in the installation media is Debian's 5.7.10.


wow, reiser5 from the box? I might want to try..

> 
> The installer defaults to create the root system reiser5 -formatted partition as:
> mkfs.reiser4 -yo "create=reg42"


"reg42" is default profile in reiser4progs-2.0.3 (check by
"mkfs.reiser4 -p") - there is no need to specify it via option.

Have you had a chance to play with logical volumes (add/remove
bricks, etc)?

Thanks!
Edward.
