Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FF1D182472
	for <lists+reiserfs-devel@lfdr.de>; Wed, 11 Mar 2020 23:09:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729795AbgCKWJe (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 11 Mar 2020 18:09:34 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43562 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729506AbgCKWJe (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 11 Mar 2020 18:09:34 -0400
Received: by mail-wr1-f68.google.com with SMTP id v9so4748362wrf.10
        for <reiserfs-devel@vger.kernel.org>; Wed, 11 Mar 2020 15:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language;
        bh=YhopsbV+pNm+/nJMqxgY9xpG1JU3KRl2r6TPv0QWzMo=;
        b=RTxDkLYlALGdjgu67zIIyw3MsCzE/SU7DzBw0KM8hJcGTxSNc2W2/ezS+s2qcHr/Ky
         Gny4etXPHb0Zc5mZDTNqLZrs2BQP6ykzXCalbnD8Ih1fnXVS7OdmVVakEl3NXZpbPO6B
         DVz6j5Ykv2YmW5Q4+w8ZUJJvDKCA0nsXxTTvda6KrUs3RDw6owIW1Udo0fTtYkRa0KkH
         TYlx3W1Uyk/SZJHE6ch7RdWrdGWvMEUC4QEpHw/sAqvYU0QlHfFV3wzryJKT9K8FKjRy
         KAzKfAVaag7Flf7LUSZS2EFHtyMhe2ZLzjryJ7lAvhPBQfpOBzyroQap7WawaFZb4SUt
         Crmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=YhopsbV+pNm+/nJMqxgY9xpG1JU3KRl2r6TPv0QWzMo=;
        b=EvQ8VRQB+U+Rl/oFp3gprJA3fDtlGlexb5RvJorDnSIwdxm8+DNLF0LE6a5YbjjKDi
         iacQO8QZvtm6GVbjDcaxdkexGlu3bvbecc9RioVCQf/IHyl0A3drqZ/dOUt3rMz9Qnvt
         yIyTEKxTPgBogjXPyQl2QTDglyaEYnprhW/KHujWPxOITlvvknWcNXWcwgpt3qJD84PX
         EI/ifPywxhZtbYYhgq+qygAQimyatPyIhUv0L5A5dA/o9na1hUEHzvFOBROsHH9tSh0v
         +kAPptKHX6KYfIEyyMpnalt9bm6K3pSAOOXR81NqdR91r4hPSnhfPaxSJmKBQADpT5DV
         59mg==
X-Gm-Message-State: ANhLgQ2cx8Y7snYdR9mS1+PgoyPy8UN21RYA6yGd916lGqE2yeeTl9bJ
        xrqFKqWDP7F5Y8tHgv5HpF2X24Qxop0=
X-Google-Smtp-Source: ADFU+vtDj1YyOyBIKD+LQsBV+ZJIEj14FIk6gXrZYXlpFgSqvHvlBh7znURVXOtSHt+7mdY11pG8Dw==
X-Received: by 2002:adf:aa0a:: with SMTP id p10mr6469486wrd.159.1583964570467;
        Wed, 11 Mar 2020 15:09:30 -0700 (PDT)
Received: from [192.168.0.48] (HSI-KBW-046-005-005-168.hsi8.kabel-badenwuerttemberg.de. [46.5.5.168])
        by smtp.gmail.com with ESMTPSA id q5sm25549113wrc.68.2020.03.11.15.09.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Mar 2020 15:09:29 -0700 (PDT)
Subject: Re: Feedback: segfault on Reiser4 SFRN 5.1.3
From:   Edward Shishkin <edward.shishkin@gmail.com>
To:     Metztli Information Technology <jose.r.r@metztli.com>,
        reiserfs-devel@vger.kernel.org
References: <20200310053627.DFFE0532075B@huitzilopochtli.metztli-it.com>
 <0fa237ec-665a-033b-2b3f-10b793c9076d@gmail.com>
 <101dfacb-9e1d-5ef0-a856-2014d3ea47bd@gmail.com>
Message-ID: <db885f16-15b4-ae4e-642c-e83b8f5e6102@gmail.com>
Date:   Wed, 11 Mar 2020 23:09:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <101dfacb-9e1d-5ef0-a856-2014d3ea47bd@gmail.com>
Content-Type: multipart/mixed;
 boundary="------------475E918EA4D34C1054B80E7B"
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

This is a multi-part message in MIME format.
--------------475E918EA4D34C1054B80E7B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/10/2020 11:24 PM, Edward Shishkin wrote:
> On 03/10/2020 09:25 PM, Edward Shishkin wrote:
>> On 03/10/2020 06:36 AM, Metztli Information Technology wrote:
>>> Niltze, Ed-
>>>
>>>
>>> I am experiencing segfault when using dpkg (package manager for 
>>> debian) utility to unpack software.
>>>
>>> It happens *both* during reiser4 sfrn 5.1.3 -enabled Debian Installer 
>>> (d-i) *and* in a pure sfrn 5.1.3 Debian Buster environment,
>>> i.e., formatted in sfrn 5.1.3 and running reiser4progs 2.0.0 and 
>>> corresponding kernel. It happens in VirtualBox 6.1.4
>>
>> Do you have any bootable image I could download and reproduce that 
>> oops on my virtual machine?
> 
> Ah, I see a mistake, which most likely causes that oops.
> Will provide a fixup soon..


Please, apply the attached patch (from the directory ./fs/reiser4)

Thanks,
Edward.

> 
>>
>>   as well as in actual
>>> physical hardware, same BUG line.
>>>
>>> This BUG makes it impossible to carry out a native Debian Buster 
>>> installation onto a default reiser4 SFRN 5.1.3 -formatted
>>> partition, i.e., reg42, with or without specifying a stripe, i.e., -t 
>>> 256K. Accordingly, even if a user uses cp -a back-and-forth
>>> to hack a pure SFRN5 Debian system whenever a software upgrade occurs 
>>> a segmentation fault will follow.
>>>
>>> Unaware if other package managers, like RPM/YUM utilities, etc., will 
>>> cause a segfault as well.
>>>
>>>
>>> Mar  8 20:20:19 debootstrap: Selecting previously unselected package 
>>> base-passwd.
>>> Mar  8 20:20:19 debootstrap: (Reading database ... 0 files and 
>>> directories currently installed.)
>>> Mar  8 20:20:19 debootstrap: Preparing to unpack 
>>> .../base-passwd_3.5.46_amd64.deb ...
>>> Mar  8 20:20:19 debootstrap: Segmentation fault
>>> Mar  8 20:20:19 kernel: [  794.378009] ------------[ cut here 
>>> ]------------
>>> Mar  8 20:20:19 kernel: [  794.378017] kernel BUG at 
>>> fs/reiser4/plugin/item/extent_stripe_ops.c:466!
>>> Mar  8 20:20:19 kernel: [  794.378031] invalid opcode: 0000 [#1] SMP PTI
>>> Mar  8 20:20:19 kernel: [  794.378044] CPU: 6 PID: 18587 Comm: dpkg 
>>> Tainted: G            E     5.5.0-1+reiser4-5.1.3-amd64 #1 Debian 
>>> 5.5.7-1+reiser4~5.1.3
>>> Mar  8 20:20:19 kernel: [  794.378048] Hardware name: Hewlett-Packard 
>>> HP Pavilion dv6 Notebook PC/17FC, BIOS F.1C 01/23/2013
>>> Mar  8 20:20:19 kernel: [  794.378103] RIP: 
>>> 0010:find_or_create_extent_stripe+0x169/0x1d0 [reiser4]
>>> Mar  8 20:20:19 kernel: [  794.378110] Code: 48 89 58 50 eb b3 4c 89 
>>> ef e8 43 40 fd ff eb 85 4c 89 e7 41 89 de e8 a6 2a d4 ee eb a2 4c 89 
>>> e7 e8 bc 3e d4 ee e9 11 ff ff ff <0f> 0b 48 89 df e8 bd 42 fb ff eb 
>>> 89 e8 26 1e be ee f0 ff 4b 0c 74
>>> Mar  8 20:20:19 kernel: [  794.378114] RSP: 0018:ffff9f90cd873c30 
>>> EFLAGS: 00010246
>>> Mar  8 20:20:19 kernel: [  794.378120] RAX: 0000000000000000 RBX: 
>>> ffff8ab298d12240 RCX: 0000000000000000
>>> Mar  8 20:20:19 kernel: [  794.378123] RDX: 0000000000000000 RSI: 
>>> ffff8ab2a5b366f8 RDI: ffff8ab2a5b36600
>>> Mar  8 20:20:19 kernel: [  794.378127] RBP: ffff9f90cd873d20 R08: 
>>> 0000000000000001 R09: 000000000000000c
>>> Mar  8 20:20:19 kernel: [  794.378130] R10: 0000000000000024 R11: 
>>> ffff8ab29f350a82 R12: ffffd75c5061c1c0
>>> Mar  8 20:20:19 kernel: [  794.378134] R13: ffff8ab298d8a418 R14: 
>>> 0000000000000000 R15: ffff8ab2b2905800
>>> Mar  8 20:20:19 kernel: [  794.378139] FS:  00007fc29b9f4380(0000) 
>>> GS:ffff8ab2bfb80000(0000) knlGS:0000000000000000
>>> Mar  8 20:20:19 kernel: [  794.378143] CS:  0010 DS: 0000 ES: 0000 
>>> CR0: 0000000080050033
>>> Mar  8 20:20:19 kernel: [  794.378147] CR2: 00005616aa3b0a81 CR3: 
>>> 00000004187d4002 CR4: 00000000000606e0
>>> Mar  8 20:20:19 kernel: [  794.378150] Call Trace:
>>> Mar  8 20:20:19 kernel: [  794.378211]  ? shorten_stripe+0x39b/0x4d0 
>>> [reiser4]
>>> Mar  8 20:20:19 kernel: [  794.378221]  ? _cond_resched+0x15/0x30
>>> Mar  8 20:20:19 kernel: [  794.378266]  shorten_stripe+0x39b/0x4d0 
>>> [reiser4]
>>> Mar  8 20:20:19 kernel: [  794.378317] 
>>> reiser4_setattr_generic+0x150/0x200 [reiser4]
>>> Mar  8 20:20:19 kernel: [  794.378362]  ? shorten_stripe+0x4d0/0x4d0 
>>> [reiser4]
>>> Mar  8 20:20:19 kernel: [  794.378371]  notify_change+0x339/0x4a0
>>> Mar  8 20:20:19 kernel: [  794.378378]  do_truncate+0x74/0xc0
>>> Mar  8 20:20:19 kernel: [  794.378386]  do_sys_ftruncate+0x130/0x180
>>> Mar  8 20:20:19 kernel: [  794.378395]  do_syscall_64+0x52/0x170
>>> Mar  8 20:20:19 kernel: [  794.378401] 
>>> entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>> Mar  8 20:20:19 kernel: [  794.378406] RIP: 0033:0x7fc29bb81947
>>> Mar  8 20:20:19 kernel: [  794.378412] Code: 77 01 c3 48 8b 15 49 85 
>>> 0c 00 f7 d8 64 89 02 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 
>>> 0f 1f 40 00 b8 4d 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 8b 
>>> 15 19 85 0c 00 f7 d8 64 89 02 b8
>>> Mar  8 20:20:19 kernel: [  794.378416] RSP: 002b:00007fff8148a888 
>>> EFLAGS: 00000206 ORIG_RAX: 000000000000004d
>>> Mar  8 20:20:19 kernel: [  794.378421] RAX: ffffffffffffffda RBX: 
>>> 00005616aa3ad4f0 RCX: 00007fc29bb81947
>>> Mar  8 20:20:19 kernel: [  794.378425] RDX: 0000000000000000 RSI: 
>>> 0000000000000098 RDI: 0000000000000009
>>> Mar  8 20:20:19 kernel: [  794.378428] RBP: 00005616aa3ac260 R08: 
>>> 00005616aa3ac340 R09: 00007fc29b9f4380
>>> Mar  8 20:20:19 kernel: [  794.378432] R10: 0000000000000000 R11: 
>>> 0000000000000206 R12: 0000000000000098
>>> Mar  8 20:20:19 kernel: [  794.378435] R13: 00007fff8148b2f0 R14: 
>>> 00005616aa3b32a5 R15: 0000000000000000
>>> Mar  8 20:20:19 kernel: [  794.378440] Modules linked in: dm_mod(E) 
>>> md_mod(E) xfs(E) reiser4(E) jfs(E) btrfs(E) xor(E) raid6_pq(E) 
>>> libcrc32c(E) zstd_compress(E) zstd_decompress(E) ext4(E) crc16(E) 
>>> mbcache(E) jbd2(E) crc32c_generic(E) r8169(E) realtek(E) libphy(E) 
>>> ctr(E) ccm(E) iwldvm(E) mac80211(E) libarc4(E) iwlwifi(E) cfg80211(E) 
>>> rfkill(E) nls_ascii(E) nls_cp437(E) vfat(E) fat(E) hid_generic(E) 
>>> usbhid(E) hid(E) sr_mod(E) cdrom(E) sd_mod(E) uas(E) usb_storage(E) 
>>> ahci(E) libahci(E) xhci_pci(E) ehci_pci(E) xhci_hcd(E) sdhci_pci(E) 
>>> ehci_hcd(E) cqhci(E) libata(E) rtsx_pci_sdmmc(E) sdhci(E) usbcore(E) 
>>> mmc_core(E) scsi_mod(E) rtsx_pci(E) mfd_core(E) usb_common(E) wmi(E) 
>>> battery(E) video(E) [last unloaded: libphy]
>>> Mar  8 20:20:19 kernel: [  794.378508] ---[ end trace 
>>> c7be9d76279fc2ea ]---
>>> Mar  8 20:20:19 kernel: [  794.378544] RIP: 
>>> 0010:find_or_create_extent_stripe+0x169/0x1d0 [reiser4]
>>> Mar  8 20:20:19 kernel: [  794.378550] Code: 48 89 58 50 eb b3 4c 89 
>>> ef e8 43 40 fd ff eb 85 4c 89 e7 41 89 de e8 a6 2a d4 ee eb a2 4c 89 
>>> e7 e8 bc 3e d4 ee e9 11 ff ff ff <0f> 0b 48 89 df e8 bd 42 fb ff eb 
>>> 89 e8 26 1e be ee f0 ff 4b 0c 74
>>> Mar  8 20:20:19 kernel: [  794.378554] RSP: 0018:ffff9f90cd873c30 
>>> EFLAGS: 00010246
>>> Mar  8 20:20:19 kernel: [  794.378558] RAX: 0000000000000000 RBX: 
>>> ffff8ab298d12240 RCX: 0000000000000000
>>> Mar  8 20:20:19 kernel: [  794.378562] RDX: 0000000000000000 RSI: 
>>> ffff8ab2a5b366f8 RDI: ffff8ab2a5b36600
>>> Mar  8 20:20:19 kernel: [  794.378565] RBP: ffff9f90cd873d20 R08: 
>>> 0000000000000001 R09: 000000000000000c
>>> Mar  8 20:20:19 kernel: [  794.378568] R10: 0000000000000024 R11: 
>>> ffff8ab29f350a82 R12: ffffd75c5061c1c0
>>> Mar  8 20:20:19 kernel: [  794.378572] R13: ffff8ab298d8a418 R14: 
>>> 0000000000000000 R15: ffff8ab2b2905800
>>> Mar  8 20:20:19 kernel: [  794.378576] FS:  00007fc29b9f4380(0000) 
>>> GS:ffff8ab2bfb80000(0000) knlGS:0000000000000000
>>> Mar  8 20:20:19 kernel: [  794.378580] CS:  0010 DS: 0000 ES: 0000 
>>> CR0: 0000000080050033
>>> Mar  8 20:20:19 kernel: [  794.378584] CR2: 00005616aa3b0a81 CR3: 
>>> 00000004187d4002 CR4: 00000000000606e0
>>>
>>>
>>> Best Professional Regards.
>>>

--------------475E918EA4D34C1054B80E7B
Content-Type: text/x-patch;
 name="reiser4-fix-update_extent_stripe.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="reiser4-fix-update_extent_stripe.patch"

diff --git a/plugin/item/extent_stripe_ops.c b/plugin/item/extent_stripe_ops.c
index bc2dbcb..739de03 100644
--- a/plugin/item/extent_stripe_ops.c
+++ b/plugin/item/extent_stripe_ops.c
@@ -242,16 +242,16 @@ static int __update_extent_stripe(uf_coord_t *uf_coord, const reiser4_key *key,
 			JF_CLR(node, JNODE_OVRWR);
 		}
 		block = fake_blocknr_unformatted(1, subv);
+		jnode_set_block(node, &block);
+		jnode_set_subvol(node, subv);
 		if (hole_plugged)
 			*hole_plugged = 1;
 		JF_SET(node, JNODE_CREATED);
-	} else {
+		
+	} else if (*jnode_get_block(node) == 0) {
 		reiser4_extent *ext;
 		struct extent_coord_extension *ext_coord;
 
-		if (*jnode_get_block(node))
-			return 0;
-
 		ext_coord = ext_coord_by_uf_coord(uf_coord);
 		check_uf_coord(uf_coord, NULL);
 		ext = (reiser4_extent *)(zdata(uf_coord->coord.node) +
@@ -260,9 +260,9 @@ static int __update_extent_stripe(uf_coord_t *uf_coord, const reiser4_key *key,
 			return RETERR(-EIO);
 
 		block = extent_get_start(ext) + ext_coord->pos_in_unit;
+		jnode_set_block(node, &block);
+		jnode_set_subvol(node, subv);
 	}
-	jnode_set_block(node, &block);
-	jnode_set_subvol(node, subv);
 	/*
 	 * make sure that locked twig node contains jnode
 	 * we are about to capture

--------------475E918EA4D34C1054B80E7B--
