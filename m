Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5507284311
	for <lists+reiserfs-devel@lfdr.de>; Tue,  6 Oct 2020 01:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726006AbgJEX4b (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 5 Oct 2020 19:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725861AbgJEX4b (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 5 Oct 2020 19:56:31 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE501C0613CE
        for <reiserfs-devel@vger.kernel.org>; Mon,  5 Oct 2020 16:56:30 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id v12so1199118wmh.3
        for <reiserfs-devel@vger.kernel.org>; Mon, 05 Oct 2020 16:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=1NxIQXJO0tTFu4Ykqp1w7Ajewk7sip+ivf3BQ8Otoq8=;
        b=BgrlcUJNDFT4m9WxhNQNkQL1b2doqUPRq+XiUDZIe54cO264PLmVE6+cIH3S1eVVZe
         6LUHiEOGG6OsWd0c1mwV+auCfCqrtwzvIpqttxOF42D9PHAbcUaKTQS9M8tgSWB3dWVs
         UOU3V8LS7KFI7PjJJR6Fklrxcgun13/9DVYpvk25Zt+qZ4N+t9nkKQ6U9lOrlpexOd2t
         BbidLJNfa3JQCptizuL7apTywnTANjiHXK4yVDwD/dMhc3iTvcOBtrsdKmwkY+aUz7Vu
         dSCtRZBxosj1DdI4mK1M0Yji/+kw+qeGUkgZ6iMukCDSavj0QpgImw7DHfLwIMNwR++S
         1gnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1NxIQXJO0tTFu4Ykqp1w7Ajewk7sip+ivf3BQ8Otoq8=;
        b=geyAghBO03rPfHexjc4oySmzWMtBeuTnE8AoFrAC9yTajTxfDzaZ9N5mc9VcIWdx7X
         iV76RKla9UJFr/ZsjwJcswUyQMcGKhIirP+WjRDY/lTdmBjUdk/D1XSPz1JWbwnM8/AV
         fOifZIAfP0wp/x+2V3LuVE9bbuiruAeNXHoVYTtYvFiRK1puLV2+8/rHt5VKujJVWM0C
         NDmOx1baUkrKonMsdiS5AAmHIW0Jef6u3CWvgKO4wIGJlS58d75OUucsMqRhw7Q34adw
         YMTjfRjrJjNW8wkSGDbLyejPxDPg88gDE3AiZNLDy7OlNIx3gbrFKvuTu/5a1xeKoOuo
         oZJw==
X-Gm-Message-State: AOAM532RmF5/8aOdVN9FyAAleZLZMKBzZAoCIGzxaDAliHzZ4zCq8ty3
        ZLVoiUJAZ+XC17FK3ImyTg8rPdjT7gE=
X-Google-Smtp-Source: ABdhPJzavYnz0Jc23eCo8yB4/RruxJYGAQ8aHN1nMpnsDuiy+KsOYdOnKyQylrwueXcr8bCDio6mOg==
X-Received: by 2002:a1c:3b8a:: with SMTP id i132mr143432wma.189.1601942189061;
        Mon, 05 Oct 2020 16:56:29 -0700 (PDT)
Received: from [192.168.0.48] (HSI-KBW-46-223-1-190.hsi.kabel-badenwuerttemberg.de. [46.223.1.190])
        by smtp.gmail.com with ESMTPSA id c132sm1309309wmf.25.2020.10.05.16.56.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 16:56:27 -0700 (PDT)
Subject: Re: Problems mounting a reiserfs partiton on the 5.8 kernel
To:     Madhu <enometh@meer.net>, reiserfs-devel@vger.kernel.org
References: <20201006.002952.1265255213313398815.enometh@meer.net>
From:   Edward Shishkin <edward.shishkin@gmail.com>
Message-ID: <923f0e85-68e9-4997-dcea-4d1970953e07@gmail.com>
Date:   Tue, 6 Oct 2020 01:56:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20201006.002952.1265255213313398815.enometh@meer.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On 10/05/2020 08:59 PM, Madhu wrote:
> Hello.
> 
> I'm using sys-fs/reiserfsprogs-3.6.27.  The 5.8 kernel refuses to
> mount a reiser partition:
> 
> $ /bin/mount /dev/mapper/5 /5
> 
> [  203.691395] REISERFS (device dm-1): found reiserfs format "3.6" with standard journal
> [  203.691429] REISERFS (device dm-1): using ordered data mode
> [  203.691431] reiserfs: using flush barriers
> [  203.719044] REISERFS (device dm-1): journal params: device dm-1, size 8192, journal first block 18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
> [  203.719364] REISERFS (device dm-1): checking transaction log (dm-1)
> [  203.732153] loop: Write error at byte offset 5402468352, length 4096.
> [  203.732167] blk_update_request: I/O error, dev loop5, sector 65936 op 0x1:(WRITE) flags 0x800 phys_seg 1 prio class 0
> [  203.732172] blk_update_request: I/O error, dev loop5, sector 65936 op 0x1:(WRITE) flags 0x800 phys_seg 1 prio class 0
> [  203.732190] Buffer I/O error on dev dm-1, logical block 8210, lost sync page write
> [  203.732213] REISERFS warning (device dm-1): journal-837 _update_journal_header_block: IO error during journal replay
> [  203.732219] REISERFS warning (device dm-1): reiserfs-2006 journal_init: Replay Failure, unable to mount
> [  203.732474] REISERFS warning (device dm-1): sh-2022 reiserfs_fill_super: unable to initialize journal space
> 
> This is the 5.8.12 kernel.
> 
> The file system is on a dmcrypt device
> $ dmsetup  status 5
> 0 167192565 crypt
> 
> which is mapped from a loopback device, which is mapped from an offset
> from a raw partition.
> 
> $ losetup -a /dev/loop5
> /dev/loop5: [0005]:6284 (/dev/sda5), offset 5368709120
> 
> $ fdisk | grep sda[45]
>     Device Boot      Start         End      Blocks   Id  System
> /dev/sda4       187655265   625137344   218741040    5  Extended
> /dev/sda5       187655328   365334164    88839418+  83  Linux
> 
> The reiser partition is over a decade old and has been very
> reliable. Running fsck finds no problems.  And the partition mounts
> fine and is usable with the 5.7 kernel.
> 
> Any ideas what the problem might be?  The dmesg output looks bogus and
> suggests to me that a write is failing somewhere.  I suspect it is the
> device layer which has changed.  If there is a bug to be filed where
> should I file it? I'd Appreciate any clues.

The problem goes from the block layer.
File a bug at https://bugzilla.kernel.org/
and provide all that description there.

Edward.
