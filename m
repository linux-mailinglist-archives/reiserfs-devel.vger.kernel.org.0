Return-Path: <reiserfs-devel+bounces-31-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C49958241DE
	for <lists+reiserfs-devel@lfdr.de>; Thu,  4 Jan 2024 13:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 743C5286D25
	for <lists+reiserfs-devel@lfdr.de>; Thu,  4 Jan 2024 12:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5AF22314;
	Thu,  4 Jan 2024 12:37:26 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4348222311
	for <reiserfs-devel@vger.kernel.org>; Thu,  4 Jan 2024 12:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-35fc6976630so2872775ab.0
        for <reiserfs-devel@vger.kernel.org>; Thu, 04 Jan 2024 04:37:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704371844; x=1704976644;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4HeOf5CMacP23XHb3eWXrmJA9q5akzC7PyDq4N2GXZo=;
        b=CslXVwQQ2qngWU95NDnqYC7EYkyGfoS12mhkfZvrbfxSIZO2UhlnFIUZilChDgdcni
         DBxV4NvabllqL9OT966hBjaNynL3ABEgjN4rfhtZd4JV7vbJIsPDZXlqQ4LwoblR9Lb7
         nF8CPUvPtDzIO+XbBC7lwx+yanR59Wa3UKX1tLeuEl7KDfQFrJBk956+zUpfG1c6+3b9
         MDA/dCyIon9ZlAUwDT4WkTCzie2I8WrM7RyZXei7Zir4uozLYJuPFlD6Fj09OYyEc65/
         qPEP0y/oANjL3D1ZCe0l66BFjLScQVKm8wP5FYz4FLYi9bEUYkGU/FlDeHslvrtVjsi/
         hwXA==
X-Gm-Message-State: AOJu0YxD8CBYYVnMr4fT27UfVtfaquaQLzB6Y5j2bqYPrh6hWGUVE/X+
	VvuiGWn0aCm5Wt273YC3GEfLGYEDczPJqcnMZcQJpfi7aHfV
X-Google-Smtp-Source: AGHT+IH8aqz0BiS5nOsqd+RpHG65AjBWEWpibgEChqgs5KHBu2gS6xbXU/HHoHB9sour9l68NmY9ddmEOI2KHRP+yZc3Yne/Pv1V
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:37a0:b0:46d:99c0:d7bf with SMTP id
 w32-20020a05663837a000b0046d99c0d7bfmr39086jal.2.1704371844508; Thu, 04 Jan
 2024 04:37:24 -0800 (PST)
Date: Thu, 04 Jan 2024 04:37:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005b7121060e1dfe82@google.com>
Subject: [syzbot] Monthly reiserfs report (Jan 2024)
From: syzbot <syzbot+liste925ad15d01465629cb2@syzkaller.appspotmail.com>
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello reiserfs maintainers/developers,

This is a 31-day syzbot report for the reiserfs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/reiserfs

During the period, 6 new issues were detected and 0 were fixed.
In total, 79 issues are still open and 18 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  40697   Yes   KASAN: null-ptr-deref Read in do_journal_end (2)
                   https://syzkaller.appspot.com/bug?extid=845cd8e5c47f2a125683
<2>  7232    Yes   possible deadlock in open_xa_dir
                   https://syzkaller.appspot.com/bug?extid=8fb64a61fdd96b50f3b8
<3>  1694    Yes   kernel BUG at fs/reiserfs/journal.c:LINE!
                   https://syzkaller.appspot.com/bug?extid=6820505ae5978f4f8f2f
<4>  1593    Yes   possible deadlock in mnt_want_write_file
                   https://syzkaller.appspot.com/bug?extid=1047e42179f502f2b0a2
<5>  1259    Yes   WARNING in reiserfs_lookup
                   https://syzkaller.appspot.com/bug?extid=392ac209604cc18792e5
<6>  490     Yes   WARNING in journal_end
                   https://syzkaller.appspot.com/bug?extid=d43f346675e449548021
<7>  490     Yes   possible deadlock in reiserfs_dirty_inode
                   https://syzkaller.appspot.com/bug?extid=c319bb5b1014113a92cf
<8>  440     Yes   possible deadlock in reiserfs_ioctl
                   https://syzkaller.appspot.com/bug?extid=79c303ad05f4041e0dad
<9>  317     Yes   KASAN: out-of-bounds Read in leaf_paste_entries (2)
                   https://syzkaller.appspot.com/bug?extid=38b79774b6c990637f95
<10> 303     Yes   KASAN: use-after-free Read in leaf_paste_in_buffer
                   https://syzkaller.appspot.com/bug?extid=55b82aea13452e3d128f

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

