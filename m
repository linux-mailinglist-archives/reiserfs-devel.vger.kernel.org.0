Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9679E3020F
	for <lists+reiserfs-devel@lfdr.de>; Thu, 30 May 2019 20:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbfE3SjS (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 30 May 2019 14:39:18 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35235 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbfE3SjS (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 30 May 2019 14:39:18 -0400
Received: by mail-wm1-f68.google.com with SMTP id c6so1489666wml.0
        for <reiserfs-devel@vger.kernel.org>; Thu, 30 May 2019 11:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=WRcUsjAGqogU4bs95KE19iff44yHEESLVDNCj8Mus4A=;
        b=TvMs9PePIAdXJxRJBtP8VnWvrBGz/wcc5e9X7SGhAce9xUVlTSMuzifs2CHhTGHbb0
         6914QKGxSjY34F4zG2kSNe2NYdurAtwHP4VRNQfqd7+0l6lJ2Zh/xoFoD26YVRR13aeT
         mivVworLT5yJCVUFpnLxP1/OXMUa7PRFwCFSJ7pLA0FJDLQFEvjiJ2VAykY2ggIFvlJt
         aImSZ0HZdjd6PO9zbgbBPhr0Gk6QyOfBuL+HunaqHZSaUzL6gS3MGDlKnk1mTd/MZ0ol
         tZ9rpqD2pZSHx0P1NeFT2cSk+GnQRap0XdN3Z/gFPeatJ6tlPPktZh8wm5dROVebpS8K
         Fjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=WRcUsjAGqogU4bs95KE19iff44yHEESLVDNCj8Mus4A=;
        b=qjQZzqcW2taMzyz3gHKfYHjAEN7BRzi66jcykbNNkNo93CZ/Yyqv9Gy0+tdze1zIbq
         X4colg7dS4MXVIZq1K+6A/V7iGLnjKbznnI5djbAgsErlGObm/Anevf1O0IXsFBY26RC
         z7DaNwF9luuw9euzvMhka09EyJeJruzNWFogeXze6/NN0K4v3gdAlfrEUjxXUXQw8H0Q
         5oo7ov4r5cbHoF+QQD7Fvv7lt0MoGF0nbKjE32NttC/4iz/UHLBt4c1GrClxZNttm627
         aY2ZEZwr2n9JxVdNLL2WLLzehww2Ymck/w1/hirAlE3udrDiGgxQywDW13xnVooNB6jt
         Ev6w==
X-Gm-Message-State: APjAAAWigCHxU0xUee5BeeVPTnG4d1BvzJoCIWFHUi1xVRhGE+xDH4HD
        GWG7u4vHxQWTEcsMcl5fiG3jkMBs
X-Google-Smtp-Source: APXvYqxHQ2CtXdhq7/sdgM5RUd3vZTYGJKrrXmL9HUiP7cvoO/vmbLwZZRc5vbtFosKtzQ8c65HLQQ==
X-Received: by 2002:a1c:b041:: with SMTP id z62mr3303740wme.113.1559241554757;
        Thu, 30 May 2019 11:39:14 -0700 (PDT)
Received: from [192.168.0.48] (ip5f5ac601.dynamic.kabel-deutschland.de. [95.90.198.1])
        by smtp.gmail.com with ESMTPSA id 32sm8200440wra.35.2019.05.30.11.39.12
        for <reiserfs-devel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 11:39:13 -0700 (PDT)
To:     ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>
From:   Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 in new Elive alpha versions
Message-ID: <148f2b57-6ce5-3066-d598-a57bf2f25d2b@gmail.com>
Date:   Thu, 30 May 2019 20:39:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On 05/28/2019 06:26 PM, Thanatermesis wrote:
 > Hello Edward,

Hello.

 >
 > I was thinking since then about the "du" issue, and i still trying to 
understand myself how much relevant could be that the "du" tool doesn't 
reports the correct information, so I have a lot of tools (scripts) that 
relies on this information, for example:
 >
 > * video & audio converters (shrinkers) that if the converted file is 
bigger than the original (info give by "du"), it will copy back the 
original one

Actually, it is very-very strange that they rely on "implementation" 
rather than on size reported by standard tools (stat(2), etc).
Please, double check it, if possible.
Also we need to strongly discourage users from placing ISO images as 
well as other large "media-files" to compressed reiser4 partitions. For 
other ones (with disabled compression) du(1) reports correct values.

 > * report tools, like downloading an ISO and verifying its correct size

Ditto.
Who is really needs to know how much space a file occupied on disk is 
quota(1) and friends..

 >
 > so, is there a way to make "du" to give the correct information? 
maybe as a mount option for reiser4? mmh...

Yes, it possible - we need to update i_blocks and i_bytes right after 
the moment when compression happened and
make inode dirty (the last one leads to performance drop).

 >
 > Apart of that, I have sucessfully integrated reiser4 natively in the 
alpha versions of elive :), everything seems to work pretty well, 
included in the installer by default and can be used to install on 
reiser4, if you want to play with the Live iso you can get it from here: 
https://eliveisos.elivecd.org/betatest/ so you can use it as a 
"recovery" reiser4 tool or just to make "debian buster" installs with a 
default FS in reiser4, with optimized settings for different hardware 
profiles / ssd / etc  whohooo!

Cool, I have cc-ed the mailing list for this news.

 >
 > Now, I have a bug report about reiser4, I have seen it after one of 
common users of elive used reiser4 for its installs, and had a problem 
trying to make working dropbox (if you didn't know, dropbox only accepts 
ext4 filesystem to run), so i wrote for him a howto about how to create 
a file image on his system, format it to ext4, and mount it to be used 
for dropbox... everything worked correctly, but it failed after his 
reiser4 install
 >
 > More exactly, seems like reiser4 is unable to mount loopback devices 
in RW mode, I have attached you a screenshot of some commands and 
results of this behaviour

Ok, I'll try to reproduce it and to have a look..

 >
 > By other side, you may problably know that grub doesn't get the UUID 
of the reiser4 devices, and fallbacks to non-uuid assigned values like: 
root=/dev/sda3, this ends in a non-booting system sometimes (installed 
in live mode, where the HD is sdb and the live device is sda, then the 
system boots without the live mode and so sdb turns to be sda, boot fails)
 >
 > So I was able to fix this grub issue with a very simple and small 
patch, that gets correctly the UUID in case its not get, you may 
probably want to publish it in the wiki :)

I'll make a note in "getting started" section.

Thanks!
Edward.

 >
 > Patch attached too, tested and working, it should at least apply to 
the "grub-common" package from debian-buster, but is very easy to create 
a new one based on it, or used as a reference
 >
 >
 > Regards!
 > Thanatermesis
 >
 >
 >
 >
 > El dom., 19 may. 2019 a las 16:43, Edward Shishkin 
(<edward.shishkin@gmail.com>) escribió:
 >
 >     On 05/19/2019 01:57 PM, Thanatermesis wrote:
 >     > 1) this is because it shows the real size of the data (not 
compressed)
 >     > or because there's a kinda bug with that? i wonder why "du" doesn't
 >     > reports the correct value
 >
 >     du(1) relies on values stored in the fields i_bytes, i_blocks of 
vfs's
 >     struct inode.
 >     Reiser4 simply doesn't support those fields on-line and they contain
 >     garbage.
 >     Their proper on-line support leads to ~30% performance drop (for 
HDD disks).
 >
 >     Fsck supports it off-line however: you can unmount your 
partition, run
 >     fsck.reiser4 --fix /dev/xxx - it will set correct values for i_size,
 >     i_blocks,
 >     mount again (better read-only). Then du(1) will show correct 
statistics
 >     (based on sizes of squeezed files).
 >
 >     Thanks,
 >     Edward.

