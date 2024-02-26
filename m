Return-Path: <reiserfs-devel+bounces-84-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B203A8681F7
	for <lists+reiserfs-devel@lfdr.de>; Mon, 26 Feb 2024 21:36:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CF7F28EFB3
	for <lists+reiserfs-devel@lfdr.de>; Mon, 26 Feb 2024 20:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802BA130AC2;
	Mon, 26 Feb 2024 20:36:04 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A93405CE
	for <reiserfs-devel@vger.kernel.org>; Mon, 26 Feb 2024 20:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708979764; cv=none; b=ILZO1oD8QTrbu7/U7acmuia9cTqi9vmiFr67q8U0tFaV1xZtCAxaGrFf6AmR4zxU52qZA5Reic8a+J/bXnC9SvU/hNqa42R+Jk1sXbspL0DqSdJRK0KN/UrJ6Ly8eI9GL5T4gyLhPViA8DHVeEEigrHXDB+SVjRG90V2R17+/Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708979764; c=relaxed/simple;
	bh=BOEgMivz/1Rmd9k9sx91BXGVLpMCPHRTptOTwKap2IE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=EfWXeZkzFtPnEY9SsjWXk5kxKjlUd6NR27UOdCqn3rBWKrYY7Eh/937g4uZKiyB1BOp31u14OHt6fFtu04rxXdWfl1jmT/eywVGWYZLpgRLuf/og5Wl2UY0x9AXGOiGykMPD9x2cplBicGPkmEnvmwe0FCROuqHnhYLt6k/PZ9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-36424431577so31495585ab.3
        for <reiserfs-devel@vger.kernel.org>; Mon, 26 Feb 2024 12:36:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708979762; x=1709584562;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SHBxOxrj9OB5gH5hKB3+4qa+fyj8XGTAPshoc6v4MfM=;
        b=I7Asw1f96aaFbSolUEBZHysZzRnhFToCoFHu9ns2liBsjeNkrgDWYuff94DMMJcjUY
         ldhpttISHexa9RDNtrWBd7Vud4b9Te8C/eBtagQQbc7NNUQxt1TvGqHXBgzelKI16J/y
         5PuKEbNpYmrC2jVfRXNPInx1s++RMnu2PahgGl0MyzylAd64ABF4fWCh21q1BXGf9E2X
         lZeIL2r+BeHKHO5Ni+pjnjsnJxjg7uBOjpMo8PdFqfohuJZpqersTbAVeCf9D4E1Glsi
         cAVq/d9hIck9rOhv20qJREpJadSt0XJ0kOaectJ146ToVGMzFXgQG4ZCDg1Tbsspg5G5
         LdvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/f9ZVBz5t4+gEtrbfkmoI1B3r46AKq64DyD57pADg5213sbbNG5+9SSJuyZfoyB8W+Anf0ks7RNfXR9wUoK9kJZ69H2er6AWuU+r+tx4=
X-Gm-Message-State: AOJu0YxaKxWbt6zkjyPJA64lhv7CUpy6uL8NiBDAtLyAmnlBbOyJCYUf
	MQYB6FxkJnNoJcS5pdXCUWLet36j/yWGArPzxzVgrCydss65hCkpu2CaEpUgrxHplr/AD0hDhM7
	Wn+LzaixKCP9MESgbyCU45YUu6dROwBilnRXi2qNDRQw6Txs6+y5tX+4=
X-Google-Smtp-Source: AGHT+IGtnwxp3RnWyZGGR7Do0uKiVSBxo/NJeOMseplwOOWIl3jc0RvUIkBUNaLcVHUV1PEvQjpqhCWQHN4lOAuyylN+vXTAD3Ei
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c24a:0:b0:365:23c5:1bf7 with SMTP id
 k10-20020a92c24a000000b0036523c51bf7mr404754ilo.0.1708979762213; Mon, 26 Feb
 2024 12:36:02 -0800 (PST)
Date: Mon, 26 Feb 2024 12:36:02 -0800
In-Reply-To: <00000000000065139305f0564e37@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a7bb7506124edb52@google.com>
Subject: Re: [syzbot] [reiserfs?] INFO: task hung in reiserfs_sync_fs
From: syzbot <syzbot+4dadbee41d087d9c6234@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, hdanton@sina.com, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	longman@redhat.com, penguin-kernel@i-love.sakura.ne.jp, 
	reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=111c20ca180000
start commit:   692b7dc87ca6 Merge tag 'hyperv-fixes-signed-20230619' of g..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=24ce1b2abaee24cc
dashboard link: https://syzkaller.appspot.com/bug?extid=4dadbee41d087d9c6234
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1208ab97280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1359d897280000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

