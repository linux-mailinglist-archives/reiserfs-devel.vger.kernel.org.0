Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3711E99E4
	for <lists+reiserfs-devel@lfdr.de>; Sun, 31 May 2020 20:34:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726081AbgEaSe4 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sun, 31 May 2020 14:34:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbgEaSez (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 31 May 2020 14:34:55 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8868EC061A0E;
        Sun, 31 May 2020 11:34:55 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id j10so9244965wrw.8;
        Sun, 31 May 2020 11:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bdBmKyLMgyuSYHluLaPWhpBjUBM5iB5qL+jjoSfvNLc=;
        b=IFwh45aJIHiUdXpnhbN2j6fgO4LZZLQuDrlbKE3QlSWYbyfc/fy+sWUop5+ZiKAbPu
         q71sC8PqSUnLUKaT4iII8Mbw7LCHRZVYblIp1GFzr9ie8eCwnL1RuEDTAxNRCFT+0Hip
         rfaXbM+9h4Wl5SlBRx1c/AI9b+mL8yszp1wUP0I+jN53od36CQYN9AgjbMF7ManDAsep
         aVIvuPx4A8JzyKXmVk7d/n4RNnIYqm2fCknUHoEtOBSPmp+LMlANGWiNJhTf45xxRPSf
         plsNmQjTLjzrVsT1D27OUKvZHKiFQ8BXNfScnmmzlfco0QxM/XrqO8AostdysiB17V8x
         eOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bdBmKyLMgyuSYHluLaPWhpBjUBM5iB5qL+jjoSfvNLc=;
        b=gD8pWttnQg4pIftrPYhYhAE0u1/uOlAKB9DAa3dJEKndgXEfvNwXEPNRpESprG5oPl
         Hero0z+1iSS1TIM1FGT0X/rzSSWVcMqhCgzkDxycAiVkXz9ntYUm/eFbYGqQBmu/z5o/
         UEopBYM1Ehmkcl33o65kKgJLHdbvmthBFdEpykQJM2oWKHNsm9F2YixcOdUVDmeSbUzD
         /hp+cxxTN1kr0riEoNBN2T59KlaEMl3QTVCH016eHPy9anzWkJPrzpr5ycuN/kx9QXjs
         WxaQoJB8o96+Kdd+f37xQkQXZIhdJC9VGaUJITquYT2okE7yc2sBcyWsVlbv9b1Lf8DL
         mxWQ==
X-Gm-Message-State: AOAM530gK38AA4s5ej2LOnpRlOrfJ4Xy0gEpWXXIffHI5iBMTpTF9WLw
        EotfyCZXE9U3c3hMwyWcT7KAJ7d8
X-Google-Smtp-Source: ABdhPJykgahQqgC2zBMTNa5U43ZXIR0AvHyFDZAKYAt2WfwvDUxssYRl8Zt7sLEbet4vJ4Jhd4OfVA==
X-Received: by 2002:adf:f28f:: with SMTP id k15mr18063086wro.283.1590950066820;
        Sun, 31 May 2020 11:34:26 -0700 (PDT)
Received: from [192.168.0.48] (HSI-KBW-46-223-1-216.hsi.kabel-badenwuerttemberg.de. [46.223.1.216])
        by smtp.gmail.com with ESMTPSA id j190sm9297076wmb.33.2020.05.31.11.34.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 31 May 2020 11:34:26 -0700 (PDT)
Subject: Re: [ANNOUNCE] Reiser5: Data Tiering. Burst Buffers. Speedup
 synchronous modifications
To:     Pavel Machek <pavel@ucw.cz>
Cc:     ReiserFS development mailing list 
        <reiserfs-devel@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <4f919dee-5b72-9269-2bd0-6818a7167864@gmail.com>
 <20200530101354.GA630@duo.ucw.cz>
From:   Edward Shishkin <edward.shishkin@gmail.com>
Message-ID: <a0a2176a-9abc-ed26-6f6c-726936f90607@gmail.com>
Date:   Sun, 31 May 2020 20:34:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20200530101354.GA630@duo.ucw.cz>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On 05/30/2020 12:13 PM, Pavel Machek wrote:
> Hi!
> 
> 
>> For example, you can use proxy device to store hot data only. With
>> such strategy new logical blocks (which are always "cold") will always
>> go to the main storage (in contrast with Burst Buffers, where new
>> logical blocks first get written to the proxy disk). Once in a while
>> you need to scan your volume in order to push colder data out, and
>> pull hotter data in the proxy disk. Reiser5 contains a common
>> interface for this. It is possible to maintain per-file, or even per-
>> blocks-extent "temperature" of data (e.g. as a generation counter),
> 
> Would it be possible to offer userland interface for this? I can
> probably say that mp3/video files should be cold, while some source
> files should be hot, etc...
> 
> Best regards,
> 									Pavel
> 

Hi Pavel,

Yes, it is possible. One just needs to add an ioctl handler for regular
files managed by a plugin with STRIPED_FILE_PLUGIN_ID. That handler is
to set user-defined "temperature" to a file.

Also we'll need an additional on-disk file attribute (32 (or 64?)-bit
field in the private part of inode) to store the "temperature" in. It
can be added by standard way via implementation of respective stat-data
extension in the file reiser4/plugin/item/static_stat.c

Finally, we'll need to handle temperature in the common migration
procedure balance_volume_asym(), which is responsible for clearing up
the proxy device. It should look like this:

...

if (!IS_ERR(inode) && inode_file_plugin(inode)->balance &&
     file_is_cold_enough(inode)) {
		reiser4_iget_complete(inode);
		/*
		 * migrate data blocks of this file
		 */
...

Currently it works as if all files are "cold" (i.e. migrates
everything).

Once I find the current stuff more-or-less stable I'll add temperature
support and send the patch.

Thanks,
Edward.
