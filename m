Return-Path: <reiserfs-devel+bounces-59-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B028A848E0F
	for <lists+reiserfs-devel@lfdr.de>; Sun,  4 Feb 2024 14:30:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D2A11F226CF
	for <lists+reiserfs-devel@lfdr.de>; Sun,  4 Feb 2024 13:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5339B225CC;
	Sun,  4 Feb 2024 13:30:28 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB205224E3
	for <reiserfs-devel@vger.kernel.org>; Sun,  4 Feb 2024 13:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707053428; cv=none; b=OIW9/CyTJI4xAvxffUk2SBbqj820KBR8fu6SBvoXSqnMFbgy9uHdEFBJLAdoDO1k+Y7CGN8xqGPFeXsrTvylLV6CMzAMAo99GifN4297wIQ+VLJVhcYFjGau17LVjtjrsi4B2vcrft3Vs4RXgZrfpx0VvmLF3lhU0162bDvX5hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707053428; c=relaxed/simple;
	bh=3c25MrpNPqYaKgEVmj+KZMIXXjyRkcFqQ00/SVuN/Y8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=rpMOXxwsnQhtU0lScRIiA7l19qwvWZZQLUqK3qd69rsO5EhnbAsRK1w5hHaI1Df5q2QLfkg5QdpQvehzdVtiAV99p7SU6T++ILXkdNb/P7Ht8EIgD179r+F6KCPP/4BJ/4pyvBH0vhGBsc0R9iCV32JfgKyr0/rLUxbNPC3vXKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-363c2179337so5868855ab.1
        for <reiserfs-devel@vger.kernel.org>; Sun, 04 Feb 2024 05:30:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707053426; x=1707658226;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6TFqpW6dgI10Wg9gbBuvsp+dL9osWb3iohFtOwY/vQM=;
        b=FOfyxR8nQNqQcJIF1kpeIY7JlTWbcED8VpZrcJDJZ2GmDCExi4Z2cBpAwdDXps8Idn
         +9AKGkE4hfLo5zfn5NEAc7ofXcEL6jdgNHJkC/6R0LnNwN2hKkoSppuXhWqOnaSEeLCE
         ESN/Dl/Uybth3XLkcZbrL+BedwBh/IKcuwHh5gDeEoAxTmzwk+mZAHv+QPiptRMAGjjr
         vYgxkLrlpYC4lsq/ik5kh+n7kyix/UUHme/6UfkcVDtY//WGvEdNGBi4fz5gqkSrx7QY
         NPiw0EGgqe9sNqKXBtiIUm2/DoX5/JemhRqWjzRkNY81Y4LsJH3A+c/6MH/2Y+ypyduf
         WRSg==
X-Gm-Message-State: AOJu0YzKUA2M6oQ3oe3gRg410uSSn8msxtkcYOO+/LF1Vpk667ae4lQE
	Bsu4+Adg+aTtvkfQlhmFwJQBmrqFOM2lhy/pFSHg8HvVl5dOw+goSlxctzDRVBi7maWrasVwFdn
	66Frbd6XALivm8/O0NShCp2OS6wHbqKRAi4k7NrqEmrwieu+31rBuLik=
X-Google-Smtp-Source: AGHT+IEMb0FjEEZXwlb93fDJ1Vf5xs+uuKNu4bepE1hs9N8VlgmRhs6lMjw1WK88yLau+069VHBh39A4oSOwvRLYNJTAo6/YDlnc
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12c5:b0:363:c3d9:c10 with SMTP id
 i5-20020a056e0212c500b00363c3d90c10mr157976ilm.0.1707053425915; Sun, 04 Feb
 2024 05:30:25 -0800 (PST)
Date: Sun, 04 Feb 2024 05:30:25 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000107f6106108e5995@google.com>
Subject: [syzbot] Monthly reiserfs report (Feb 2024)
From: syzbot <syzbot+list63b3a3942997eecbf429@syzkaller.appspotmail.com>
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello reiserfs maintainers/developers,

This is a 31-day syzbot report for the reiserfs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/reiserfs

During the period, 2 new issues were detected and 0 were fixed.
In total, 68 issues are still open and 28 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  7667    Yes   possible deadlock in open_xa_dir
                   https://syzkaller.appspot.com/bug?extid=8fb64a61fdd96b50f3b8
<2>  1675    Yes   possible deadlock in mnt_want_write_file
                   https://syzkaller.appspot.com/bug?extid=1047e42179f502f2b0a2
<3>  1339    Yes   KMSAN: uninit-value in reiserfs_new_inode (2)
                   https://syzkaller.appspot.com/bug?extid=6450929faa7a97cd42d1
<4>  522     Yes   WARNING in journal_end
                   https://syzkaller.appspot.com/bug?extid=d43f346675e449548021
<5>  519     Yes   possible deadlock in reiserfs_dirty_inode
                   https://syzkaller.appspot.com/bug?extid=c319bb5b1014113a92cf
<6>  327     Yes   KASAN: out-of-bounds Read in leaf_paste_entries (2)
                   https://syzkaller.appspot.com/bug?extid=38b79774b6c990637f95
<7>  310     Yes   KASAN: use-after-free Read in leaf_paste_in_buffer
                   https://syzkaller.appspot.com/bug?extid=55b82aea13452e3d128f
<8>  305     Yes   possible deadlock in path_openat (2)
                   https://syzkaller.appspot.com/bug?extid=a844a888fbc0ba4829ce
<9>  278     No    KASAN: slab-use-after-free Read in __ext4_iget
                   https://syzkaller.appspot.com/bug?extid=5407ecf3112f882d2ef3
<10> 225     Yes   possible deadlock in vm_mmap_pgoff
                   https://syzkaller.appspot.com/bug?extid=f619f7c0a2a5f87694e6

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

