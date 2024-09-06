Return-Path: <reiserfs-devel+bounces-157-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3F496E7BB
	for <lists+reiserfs-devel@lfdr.de>; Fri,  6 Sep 2024 04:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46D641F22511
	for <lists+reiserfs-devel@lfdr.de>; Fri,  6 Sep 2024 02:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F901A28C;
	Fri,  6 Sep 2024 02:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfRVHBYE"
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D006DECF;
	Fri,  6 Sep 2024 02:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725589874; cv=none; b=LEPp6uNzl+oDYErXm6UFS6Y7XONqW6XDjbQ3R8UWaBT+zFjFjllYxMg9zmGDvL70A5PxEqaJ5cV6FSnrnkCvH1QOiQyzi6TKjNQoJdRLJmgHRD+W52e4k9TyxnRVJ4IgFTiAPlFS1xqMdOTptnhBnIl+1iYy9V8WK7CEvAB+sBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725589874; c=relaxed/simple;
	bh=y4ZfommhHi7WGzHR4IJkk1SGPIdAHfI8admoEDsFvGg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Qkgyp0htyQEar0SGzMbG4/IocBucYcMoLp8uE5/DxPIMG4FTDxZNOSgMiEqto/1iZT0089hNGLX2fuSbKIFfYKIYwwwQWbBGDnxmNAj9Mw+DDihQp6YWAEvgO/IytN8zHKy/VmsvJMCYJNAPu+jcpYEr/8g3Dskakz0+hRqLs2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfRVHBYE; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-501274e2c29so229326e0c.3;
        Thu, 05 Sep 2024 19:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725589870; x=1726194670; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GnOa3AzH8kywjN33Op/921fFg8KnkrXiEDjpBp3ljKU=;
        b=gfRVHBYEw4IS2OIn523+eKMqJzgPXSqBqwLZWOwgnKNuLF7ZmLuOayTZsejMLNyFKm
         6wy97Kj9bxsJVY/0kjYFAMcFVzevmhpoTbK6G83PnvQ5twc1JMzVplZOeXBGuf0kyR8l
         n6r0I3MpTV5s7WLm7jwU3wttJ5GsBJ71Zq4U686ZA7T/yhuYLRjOX7L7MTleOOqVHpAV
         onolDyCSxKEHx+hU0E2dgUNHy0QwB5iwLH/lWqcCquJp1XhGopVHPKG4TRBqpj99XRCa
         9uWmKI1jUWrzV5tNTqHMdlT0BdkIq6j7ug917R+u4VDrHfRpxj6RkU+yKKpeHAUKTjpY
         u8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725589870; x=1726194670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GnOa3AzH8kywjN33Op/921fFg8KnkrXiEDjpBp3ljKU=;
        b=HRQAJ9F/wEEyNlcM7u/TW3KjRTfwOf7o6qlJpxytFrw07nsvECYaW9OBeTKtZcfOt5
         n1OzgHUIealibWqpiiLNBuVpi8UQ1Dy4g3pKgP4LIiLjU3bCi0pXOkFWsUFizTuwF5UZ
         limXXxCB/0WGZDJvCcLv9IK1gM69ehIXTexeyLjolW/Dr7UOLtwxWB0tdQnpW2gFEUDE
         ehDWrnxvh9zmPVah0PJ3YP3oPVN8I8/6WjchaPCCCR7pqnk0nlFwNT/VZNanxqvoGcfG
         v4vY+xh5w8GU2AVxeX91UplIzrbG4VeKJkB6xFdS5hW1ID7djAlNZ6yQR48rU2wep3v2
         KUhg==
X-Forwarded-Encrypted: i=1; AJvYcCUVQ4He29gyEqSe79ZaaanMpfXJoPYG2kdK4QNTZ1PLf6Fq2qzoU8M/90wAN6x4tZhLeGuWCGkCQiEl2tY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi6e1PktpQqK4mH0Z+QU/pmOCsMRVYjEWjoRehvOEJ3N43dYJS
	3XoqhNulS12wmi/nXdFGfQq551dTaY24ue+aYI/qxYc3zEHS5JBbct/tEboXG/QDnRUuRbKRUCx
	9p8EDVeeEtkEJ6JYStJiHPbB1xrXPLLRJQ3iVfA==
X-Google-Smtp-Source: AGHT+IEvuuWHbHHl/8Yvdkq9fHBJ0IqcKo8jx4+7qsMDOd9qjrTjuOQ540bMruhjsM/kBRivmf5o/CqxbdQ8cuibKQ4=
X-Received: by 2002:a05:6122:7c6:b0:4f5:cd00:e492 with SMTP id
 71dfb90a1353d-50214237825mr1406540e0c.7.1725589869955; Thu, 05 Sep 2024
 19:31:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Hui Guo <guohui.study@gmail.com>
Date: Fri, 6 Sep 2024 10:30:58 +0800
Message-ID: <CAHOo4gL8UJnY=zZOHVioLsemBfA7eZSK+utxWLd7TBCz89X=3w@mail.gmail.com>
Subject: kernel BUG in reiserfs_update_sd_size
To: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Jeff Layton <jlayton@kernel.org>, 
	Chengming Zhou <zhouchengming@bytedance.com>
Cc: syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kernel Maintainers,
we found a crash "kernel BUG in reiserfs_update_sd_size" in upstream,
and reproduced it successfully:
by this report "https://groups.google.com/g/syzkaller-bugs/c/3HUP6xnzjo0/m/=
bP0j4x9rBAAJ",
this bug have been triggered before and fixed, but it can still be
triggered now, .

HEAD Commit: 88fac17500f4ea49c7bac136cf1b27e7b9980075(Merge tag
'fuse-fixes-6.11-rc7')
kernel config: https://raw.githubusercontent.com/androidAppGuard/KernelBugs=
/main/6.11.config
console output:
https://github.com/androidAppGuard/KernelBugs/blob/main/88fac17500f4ea49c7b=
ac136cf1b27e7b9980075/331f477773da9111eed5fd0f8bb94f7655b2384c/log0
repro report: https://raw.githubusercontent.com/androidAppGuard/KernelBugs/=
main/88fac17500f4ea49c7bac136cf1b27e7b9980075/331f477773da9111eed5fd0f8bb94=
f7655b2384c/repro.report
syz reproducer:
https://raw.githubusercontent.com/androidAppGuard/KernelBugs/main/88fac1750=
0f4ea49c7bac136cf1b27e7b9980075/331f477773da9111eed5fd0f8bb94f7655b2384c/re=
pro.prog
C reproducer: https://raw.githubusercontent.com/androidAppGuard/KernelBugs/=
main/88fac17500f4ea49c7bac136cf1b27e7b9980075/331f477773da9111eed5fd0f8bb94=
f7655b2384c/repro.cprog


Please let me know if there is anything I can help.
Best,
Hui Guo

This is the crash log I got by reproducing the bug based on the above
environment=EF=BC=8C
I have piped this log through decode_stacktrace.sh for better
understand the cause of the bug.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
2024/09/06 01:38:39 executed programs: 0
[ 683.192926][ T8481] Bluetooth: hci1: unexpected cc 0x0c03 length: 249 > 1
[ 683.195893][ T8481] Bluetooth: hci1: unexpected cc 0x1003 length: 249 > 9
[ 683.198219][ T8481] Bluetooth: hci1: unexpected cc 0x1001 length: 249 > 9
[ 683.201223][ T8481] Bluetooth: hci1: unexpected cc 0x0c23 length: 249 > 4
[ 683.204054][ T8481] Bluetooth: hci1: unexpected cc 0x0c25 length: 249 > 3
[ 683.205951][ T8481] Bluetooth: hci1: unexpected cc 0x0c38 length: 249 > 2
[ 683.376251][T14942] chnl_net:caif_netlink_parms(): no params data found
[ 683.462697][T14942] bridge0: port 1(bridge_slave_0) entered blocking stat=
e
[ 683.463612][T14942] bridge0: port 1(bridge_slave_0) entered disabled stat=
e
[ 683.464441][T14942] bridge_slave_0: entered allmulticast mode
[ 683.465813][T14942] bridge_slave_0: entered promiscuous mode
[ 683.468075][T14942] bridge0: port 2(bridge_slave_1) entered blocking stat=
e
[ 683.468929][T14942] bridge0: port 2(bridge_slave_1) entered disabled stat=
e
[ 683.469872][T14942] bridge_slave_1: entered allmulticast mode
[ 683.471199][T14942] bridge_slave_1: entered promiscuous mode
[ 683.520982][T14942] bond0: (slave bond_slave_0): Enslaving as an
active interface with an up link
[ 683.526567][T14942] bond0: (slave bond_slave_1): Enslaving as an
active interface with an up link
[ 683.580532][T14942] team0: Port device team_slave_0 added
[ 683.585273][T14942] team0: Port device team_slave_1 added
[ 683.629086][T14942] batman_adv: batadv0: Adding interface: batadv_slave_0
[ 683.629913][T14942] batman_adv: batadv0: The MTU of interface
batadv_slave_0 is too small (1500) to handle the transport of
batman-adv packets. Packets going over this interface will be
fragmented on layer2 which could impact the performance. Setting the
MTU to 1560 would solve the problem.
[ 683.633024][T14942] batman_adv: batadv0: Not using interface
batadv_slave_0 (retrying later): interface not active
[ 683.635746][T14942] batman_adv: batadv0: Adding interface: batadv_slave_1
[ 683.636554][T14942] batman_adv: batadv0: The MTU of interface
batadv_slave_1 is too small (1500) to handle the transport of
batman-adv packets. Packets going over this interface will be
fragmented on layer2 which could impact the performance. Setting the
MTU to 1560 would solve the problem.
[ 683.639365][T14942] batman_adv: batadv0: Not using interface
batadv_slave_1 (retrying later): interface not active
[ 683.642514][ T85] Bluetooth: hci0: command tx timeout
[ 683.691138][T14942] hsr_slave_0: entered promiscuous mode
[ 683.692989][T14942] hsr_slave_1: entered promiscuous mode
[ 683.694372][T14942] debugfs: Directory 'hsr0' with parent 'hsr'
already present!
[ 683.695420][T14942] Cannot create hsr debugfs directory
[ 684.271349][T14942] netdevsim netdevsim0 netdevsim0: renamed from eth0
[ 684.276016][T14942] netdevsim netdevsim0 netdevsim1: renamed from eth1
[ 684.280518][T14942] netdevsim netdevsim0 netdevsim2: renamed from eth2
[ 684.284741][T14942] netdevsim netdevsim0 netdevsim3: renamed from eth3
[ 684.356209][T14942] 8021q: adding VLAN 0 to HW filter on device bond0
[ 684.370383][T14942] 8021q: adding VLAN 0 to HW filter on device team0
[ 684.377190][T11305] bridge0: port 1(bridge_slave_0) entered blocking stat=
e
[ 684.378168][T11305] bridge0: port 1(bridge_slave_0) entered forwarding st=
ate
[ 684.385531][T11305] bridge0: port 2(bridge_slave_1) entered blocking stat=
e
[ 684.386565][T11305] bridge0: port 2(bridge_slave_1) entered forwarding st=
ate
[ 684.544722][T14942] 8021q: adding VLAN 0 to HW filter on device batadv0
[ 684.581029][T14942] veth0_vlan: entered promiscuous mode
[ 684.585972][T14942] veth1_vlan: entered promiscuous mode
[ 684.604990][T14942] veth0_macvtap: entered promiscuous mode
[ 684.608466][T14942] veth1_macvtap: entered promiscuous mode
[ 684.616148][T14942] batman_adv: The newly added mac address
(aa:aa:aa:aa:aa:3e) already exists on: batadv_slave_0
[ 684.617444][T14942] batman_adv: It is strongly recommended to keep
mac addresses unique to avoid problems!
[ 684.619483][T14942] batman_adv: batadv0: Interface activated: batadv_slav=
e_0
[ 684.625191][T14942] batman_adv: The newly added mac address
(aa:aa:aa:aa:aa:3f) already exists on: batadv_slave_1
[ 684.626479][T14942] batman_adv: It is strongly recommended to keep
mac addresses unique to avoid problems!
[ 684.628458][T14942] batman_adv: batadv0: Interface activated: batadv_slav=
e_1
[ 684.632383][T14942] netdevsim netdevsim0 netdevsim0: set [1, 0] type
2 family 0 port 6081 - 0
[ 684.633521][T14942] netdevsim netdevsim0 netdevsim1: set [1, 0] type
2 family 0 port 6081 - 0
[ 684.634619][T14942] netdevsim netdevsim0 netdevsim2: set [1, 0] type
2 family 0 port 6081 - 0
[ 684.635713][T14942] netdevsim netdevsim0 netdevsim3: set [1, 0] type
2 family 0 port 6081 - 0
[ 684.669845][ T94] wlan0: Created IBSS using preconfigured BSSID
50:50:50:50:50:50
[ 684.671662][ T94] wlan0: Creating new IBSS network, BSSID 50:50:50:50:50:=
50
[ 684.685104][T11451] wlan1: Created IBSS using preconfigured BSSID
50:50:50:50:50:50
[ 684.686146][T11451] wlan1: Creating new IBSS network, BSSID 50:50:50:50:5=
0:50
[ 684.759342][T15978] loop0: detected capacity change from 0 to 8192
[ 684.763131][T15978] REISERFS warning: read_super_block: reiserfs
filesystem is deprecated and scheduled to be removed from the kernel
in 2025
[ 684.764879][T15978] REISERFS (device loop0): found reiserfs format
"3.6" with non-standard journal
[ 684.766145][T15978] REISERFS (device loop0): using ordered data mode
[ 684.767026][T15978] reiserfs: using flush barriers
[ 684.768944][T15978] REISERFS (device loop0): journal params: device
loop0, size 512, journal first block 18, max trans len 256, max batch
225, max commit age 30, max trans age 30
[ 684.771427][T15978] REISERFS (device loop0): checking transaction log (lo=
op0)
[ 684.815148][T15978] REISERFS (device loop0): Using tea hash to sort names
[ 684.817613][T15978] REISERFS panic (device loop0): vs-13065
update_stat_data: key [1 2 0x0 SD], found item *3.5*[1 2 0(0) DIR],
item_len 80, item_location 3972, free_space(entry_count) 3
[ 684.822115][T15978] ------------[ cut here ]------------
[ 684.823561][T15978] kernel BUG at fs/reiserfs/prints.c:390!
[ 684.825009][T15978] Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOP=
TI
[ 684.827201][T15978] CPU: 1 UID: 0 PID: 15978 Comm: syz.0.15 Not
tainted 6.11.0-rc6-00026-g88fac17500f4-dirty #1
[ 684.830348][T15978] Hardware name: QEMU Standard PC (i440FX + PIIX,
1996), BIOS 1.15.0-1 04/01/2014
[684.833199][T15978] RIP: 0010:__reiserfs_panic
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/reiserfs/print=
s.c:390)
[ 684.834855][T15978] Code: 54 ff 4d 89 e8 4c 89 f1 4c 89 e2 48 8d b3
68 06 00 00 49 c7 c1 60 7e 6b 94 48 c7 c7 00 0e 04 8b e8 b2 38 35 ff
e8 ed 4e 54 ff <0f> 0b 49 c7 c6 a0 0c 04 8b 4d 89 f4 eb c5 e8 da 4e 54
ff 4d 85 e4
All code
=3D=3D=3D=3D=3D=3D=3D=3D
0: 54 push %rsp
1: ff 4d 89 decl -0x77(%rbp)
4: e8 4c 89 f1 4c call 0x4cf18955
9: 89 e2 mov %esp,%edx
b: 48 8d b3 68 06 00 00 lea 0x668(%rbx),%rsi
12: 49 c7 c1 60 7e 6b 94 mov $0xffffffff946b7e60,%r9
19: 48 c7 c7 00 0e 04 8b mov $0xffffffff8b040e00,%rdi
20: e8 b2 38 35 ff call 0xffffffffff3538d7
25: e8 ed 4e 54 ff call 0xffffffffff544f17
2a:* 0f 0b ud2 <-- trapping instruction
2c: 49 c7 c6 a0 0c 04 8b mov $0xffffffff8b040ca0,%r14
33: 4d 89 f4 mov %r14,%r12
36: eb c5 jmp 0xfffffffffffffffd
38: e8 da 4e 54 ff call 0xffffffffff544f17
3d: 4d 85 e4 test %r12,%r12

Code starting with the faulting instruction
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
0: 0f 0b ud2
2: 49 c7 c6 a0 0c 04 8b mov $0xffffffff8b040ca0,%r14
9: 4d 89 f4 mov %r14,%r12
c: eb c5 jmp 0xffffffffffffffd3
e: e8 da 4e 54 ff call 0xffffffffff544eed
13: 4d 85 e4 test %r12,%r12
[ 684.840498][T15978] RSP: 0018:ffffc9000c05f650 EFLAGS: 00010293
[ 684.842101][T15978] RAX: 0000000000000000 RBX: ffff88807daaa000 RCX:
ffffffff816af049
[ 684.844484][T15978] RDX: ffff88802f129cc0 RSI: ffffffff8235abd3 RDI:
0000000000000005
[ 684.846937][T15978] RBP: ffffc9000c05f720 R08: 0000000000000001 R09:
ffffed1047785179
[ 684.849278][T15978] R10: 0000000080000000 R11: 0000000000000001 R12:
ffffffff8b039ee0
[ 684.851698][T15978] R13: ffffffff8b03aba0 R14: ffffffff8b040c60 R15:
ffff888073e536a8
[ 684.854093][T15978] FS: 00007f8329000640(0000)
GS:ffff88823bc00000(0000) knlGS:0000000000000000
[ 684.856853][T15978] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 684.858846][T15978] CR2: 00007f8328367a8c CR3: 000000005b9f4000 CR4:
00000000000006f0
[ 684.861297][T15978] Call Trace:
[ 684.862298][T15978] <TASK>
[684.863253][T15978] ? show_regs
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/arch/x86/kernel/d=
umpstack.c:479)
[684.864580][T15978] ? die
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/arch/x86/kernel/d=
umpstack.c:421
/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/arch/x86/kernel/du=
mpstack.c:434
/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/arch/x86/kernel/du=
mpstack.c:447)
[684.865738][T15978] ? do_trap
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/arch/x86/kernel/t=
raps.c:114
/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/arch/x86/kernel/tr=
aps.c:155)
[684.867020][T15978] ? __reiserfs_panic
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/reiserfs/print=
s.c:390)
[684.868583][T15978] ? do_error_trap
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/./arch/x86/includ=
e/asm/traps.h:58
/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/arch/x86/kernel/tr=
aps.c:176)
[684.870074][T15978] ? __reiserfs_panic
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/reiserfs/print=
s.c:390)
[684.871617][T15978] ? __reiserfs_panic
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/reiserfs/print=
s.c:390)
[684.873167][T15978] ? handle_invalid_op
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/arch/x86/kernel/t=
raps.c:214)
[684.874679][T15978] ? __reiserfs_panic
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/reiserfs/print=
s.c:390)
[684.876222][T15978] ? exc_invalid_op
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/arch/x86/kernel/t=
raps.c:267)
[684.877685][T15978] ? asm_exc_invalid_op
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/./arch/x86/includ=
e/asm/idtentry.h:621)
[684.879259][T15978] ? __wake_up_klogd.part.0
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/kernel/printk/pri=
ntk.c:4011)
[684.880688][T15978] ? __reiserfs_panic
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/reiserfs/print=
s.c:390)
[684.881968][T15978] ? __reiserfs_panic
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/reiserfs/print=
s.c:390)
[684.883218][T15978] ? __pfx___reiserfs_panic
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/reiserfs/print=
s.c:377)
[684.884570][T15978] reiserfs_update_sd_size
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/reiserfs/reise=
rfs.h:1487
/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/reiserfs/reiser=
fs.h:1484
/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/reiserfs/reiser=
fs.h:1556
/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/reiserfs/reiser=
fs.h:1577
/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/reiserfs/inode.=
c:1417
/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/reiserfs/inode.=
c:1491)
[684.885910][T15978] ? __pfx_reiserfs_update_sd_size
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/reiserfs/inode=
.c:1433)
[684.887352][T15978] ? reiserfs_mkdir
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/reiserfs/namei=
.c:870)
[684.888568][T15978] reiserfs_mkdir
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/reiserfs/namei=
.c:870)
[684.889691][T15978] ? __pfx_reiserfs_mkdir
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/reiserfs/namei=
.c:780)
[684.890953][T15978] ? __pfx_down_write
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/kernel/locking/rw=
sem.c:1577)
[684.891730][T15978] reiserfs_xattr_init
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/reiserfs/xattr=
.c:892
/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/reiserfs/xattr.=
c:1007)
[684.892412][T15978] reiserfs_fill_super
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/reiserfs/super=
.c:2173
(discriminator 1))
[684.893099][T15978] ? __pfx_reiserfs_fill_super
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/reiserfs/super=
.c:1888)
[684.893814][T15978] ? snprintf
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/lib/vsprintf.c:29=
54)
[684.894375][T15978] ? __pfx_snprintf
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/lib/vsprintf.c:29=
54)
[684.895014][T15978] ? do_raw_spin_lock
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/./arch/x86/includ=
e/asm/atomic.h:107
/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/./include/linux/at=
omic/atomic-arch-fallback.h:2170
/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/./include/linux/at=
omic/atomic-instrumented.h:1302
/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/./include/asm-gene=
ric/qspinlock.h:111
/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/kernel/locking/spi=
nlock_debug.c:116)
[684.895653][T15978] ? set_blocksize
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/block/bdev.c:175)
[684.896273][T15978] ? setup_bdev_super
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/super.c:1595)
[684.896935][T15978] mount_bdev
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/super.c:1680)
[684.897496][T15978] ? __pfx_reiserfs_fill_super
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/reiserfs/super=
.c:1888)
[684.898260][T15978] ? __pfx_mount_bdev
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/super.c:1657)
[684.898894][T15978] ? apparmor_capable
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/security/apparmor=
/lsm.c:208)
[684.899534][T15978] ? __pfx_get_super_block
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/reiserfs/super=
.c:2599)
[684.900220][T15978] legacy_get_tree
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/fs_context.c:6=
64)
[684.900852][T15978] vfs_get_tree
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/super.c:1801)
[684.901421][T15978] path_mount
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/namespace.c:34=
73
/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/namespace.c:379=
9)
[684.901988][T15978] ? __pfx_path_mount
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/namespace.c:37=
26)
[684.902624][T15978] ? putname
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/namei.c:281)
[684.903152][T15978] ? putname
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/namei.c:281)
[684.903703][T15978] __x64_sys_mount
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/namespace.c:38=
13
/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/namespace.c:402=
0
/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/namespace.c:399=
7
/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/namespace.c:399=
7)
[684.904368][T15978] ? __pfx___x64_sys_mount
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/namespace.c:39=
97)
[684.905035][T15978] do_syscall_64
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/arch/x86/entry/co=
mmon.c:52
/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/arch/x86/entry/com=
mon.c:83)
[684.905630][T15978] entry_SYSCALL_64_after_hwframe
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/arch/x86/entry/en=
try_64.S:130)
[ 684.906398][T15978] RIP: 0033:0x7f832819e49e
[ 684.906946][T15978] Code: 48 c7 c0 ff ff ff ff eb aa e8 5e 20 00 00
66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 f3 0f 1e fa 49 89 ca b8 a5
00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8
64 89 01 48
All code
=3D=3D=3D=3D=3D=3D=3D=3D
0: 48 c7 c0 ff ff ff ff mov $0xffffffffffffffff,%rax
7: eb aa jmp 0xffffffffffffffb3
9: e8 5e 20 00 00 call 0x206c
e: 66 2e 0f 1f 84 00 00 cs nopw 0x0(%rax,%rax,1)
15: 00 00 00
18: 0f 1f 40 00 nopl 0x0(%rax)
1c: f3 0f 1e fa endbr64
20: 49 89 ca mov %rcx,%r10
23: b8 a5 00 00 00 mov $0xa5,%eax
28: 0f 05 syscall
2a:* 48 3d 01 f0 ff ff cmp $0xfffffffffffff001,%rax <-- trapping instructio=
n
30: 73 01 jae 0x33
32: c3 ret
33: 48 c7 c1 a8 ff ff ff mov $0xffffffffffffffa8,%rcx
3a: f7 d8 neg %eax
3c: 64 89 01 mov %eax,%fs:(%rcx)
3f: 48 rex.W

Code starting with the faulting instruction
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
0: 48 3d 01 f0 ff ff cmp $0xfffffffffffff001,%rax
6: 73 01 jae 0x9
8: c3 ret
9: 48 c7 c1 a8 ff ff ff mov $0xffffffffffffffa8,%rcx
10: f7 d8 neg %eax
12: 64 89 01 mov %eax,%fs:(%rcx)
15: 48 rex.W
[ 684.909428][T15978] RSP: 002b:00007f8328fffda8 EFLAGS: 00000246
ORIG_RAX: 00000000000000a5
[ 684.910471][T15978] RAX: ffffffffffffffda RBX: 00000000000010f2 RCX:
00007f832819e49e
[ 684.911528][T15978] RDX: 0000000020001100 RSI: 0000000020001140 RDI:
00007f8328fffe00
[ 684.912521][T15978] RBP: 00007f8328fffe40 R08: 00007f8328fffe40 R09:
0000000000000000
[ 684.913548][T15978] R10: 0000000000000000 R11: 0000000000000246 R12:
0000000020001100
[ 684.914583][T15978] R13: 0000000020001140 R14: 00007f8328fffe00 R15:
0000000020001180
[ 684.915585][T15978] </TASK>
[ 684.915988][T15978] Modules linked in:
[ 684.916687][T15978] ---[ end trace 0000000000000000 ]---
[684.917396][T15978] RIP: 0010:__reiserfs_panic
(/data/ghui/docker_data/linux_kernel/upstream/linux_v6.11/fs/reiserfs/print=
s.c:390)
[ 684.918146][T15978] Code: 54 ff 4d 89 e8 4c 89 f1 4c 89 e2 48 8d b3
68 06 00 00 49 c7 c1 60 7e 6b 94 48 c7 c7 00 0e 04 8b e8 b2 38 35 ff
e8 ed 4e 54 ff <0f> 0b 49 c7 c6 a0 0c 04 8b 4d 89 f4 eb c5 e8 da 4e 54
ff 4d 85 e4
All code
=3D=3D=3D=3D=3D=3D=3D=3D
0: 54 push %rsp
1: ff 4d 89 decl -0x77(%rbp)
4: e8 4c 89 f1 4c call 0x4cf18955
9: 89 e2 mov %esp,%edx
b: 48 8d b3 68 06 00 00 lea 0x668(%rbx),%rsi
12: 49 c7 c1 60 7e 6b 94 mov $0xffffffff946b7e60,%r9
19: 48 c7 c7 00 0e 04 8b mov $0xffffffff8b040e00,%rdi
20: e8 b2 38 35 ff call 0xffffffffff3538d7
25: e8 ed 4e 54 ff call 0xffffffffff544f17
2a:* 0f 0b ud2 <-- trapping instruction
2c: 49 c7 c6 a0 0c 04 8b mov $0xffffffff8b040ca0,%r14
33: 4d 89 f4 mov %r14,%r12
36: eb c5 jmp 0xfffffffffffffffd
38: e8 da 4e 54 ff call 0xffffffffff544f17
3d: 4d 85 e4 test %r12,%r12

Code starting with the faulting instruction
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
0: 0f 0b ud2
2: 49 c7 c6 a0 0c 04 8b mov $0xffffffff8b040ca0,%r14
9: 4d 89 f4 mov %r14,%r12
c: eb c5 jmp 0xffffffffffffffd3
e: e8 da 4e 54 ff call 0xffffffffff544eed
13: 4d 85 e4 test %r12,%r12
[ 684.920604][T15978] RSP: 0018:ffffc9000c05f650 EFLAGS: 00010293
[ 684.921405][T15978] RAX: 0000000000000000 RBX: ffff88807daaa000 RCX:
ffffffff816af049
[ 684.922419][T15978] RDX: ffff88802f129cc0 RSI: ffffffff8235abd3 RDI:
0000000000000005
[ 684.923460][T15978] RBP: ffffc9000c05f720 R08: 0000000000000001 R09:
ffffed1047785179
[ 684.924446][T15978] R10: 0000000080000000 R11: 0000000000000001 R12:
ffffffff8b039ee0
[ 684.925462][T15978] R13: ffffffff8b03aba0 R14: ffffffff8b040c60 R15:
ffff888073e536a8
[ 684.926492][T15978] FS: 00007f8329000640(0000)
GS:ffff88823bc00000(0000) knlGS:0000000000000000
[ 684.927600][T15978] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 684.928444][T15978] CR2: 00007f8328367a8c CR3: 000000005b9f4000 CR4:
00000000000006f0
[ 684.929474][T15978] Kernel panic - not syncing: Fatal exception
[ 684.930460][T15978] Kernel Offset: disabled
[  684.930979][T15978] Rebooting in 86400 seconds..

