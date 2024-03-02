Return-Path: <reiserfs-devel+bounces-91-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4927B86EE79
	for <lists+reiserfs-devel@lfdr.de>; Sat,  2 Mar 2024 05:13:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2C142855D5
	for <lists+reiserfs-devel@lfdr.de>; Sat,  2 Mar 2024 04:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6803110A21;
	Sat,  2 Mar 2024 04:13:06 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEEC10A12
	for <reiserfs-devel@vger.kernel.org>; Sat,  2 Mar 2024 04:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709352786; cv=none; b=jIZW4/uC9sFEqWzBtx8N1C/lLh6JwBGnBbFt7ow/oYKhK2Yw4MwtqC+gIWjub3xY0xB+duBC/nVbMgaXA1xQRa3X/7fM0pfHXatW1JL+QjbHKpfWpeqyTU+XAkkqYB6dnf6Jdm9I7UCX/38hEk8l37k6YxCXQTfETKn/Wjh8sE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709352786; c=relaxed/simple;
	bh=xXL3eGNtx4fKbLGwUddCJ6Z89zxBZxOIhwZ1upx7U7o=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ZMhwv6iHl1v9ictgA9QSxDsZ/ppaR3sWb85m8q5T9C3MwnxTz15sxiHDrHywz0WnTYazL8VscpEaM8+xAcVQj/RgwDCpeW3hvd5wwkSYwag5pQ+BtYpWYgCrCUA11sOWGi+IetEf31WlkPNq5/fwh6nu8PQbpTB/glRaVsKvuMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-7c7857e6d5dso365482839f.1
        for <reiserfs-devel@vger.kernel.org>; Fri, 01 Mar 2024 20:13:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709352784; x=1709957584;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IdmhwINwWJtxlnecMtQfHBtNVjXurznaLwVzNHPbLS8=;
        b=lEqBs/Imkd21G/yfA3qO5v7DA1BYXkUBqjTJUPxBe0v7Pc3YqugT05/oLVG9CDTw2f
         SO/G0NSwgsGq2DcKNHWYRDkmC59O4PDvo04xydUTGFnly9K4vaTg0CrqNVnqSemEKyS6
         euzI06FmxCZumH5ApKvs74EAZ0PP89P2S89ThkfDU88aLIPqNuVjWO7SiFDje3cAz4MT
         ryH/9zZhNQpq03ItMcn2yM+G8fA36UnsaO9/kKEekbmrKJA4h+L14szchX3aq0pakydr
         N1Yx3POQLENK++sI2ksItwN3xjiZenMcoEbP0d6V3RVo0xkcDdRWn1c8EUxoPuOFW+qT
         BeBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgYMWuEEHNj62bxJ/2deekmfhYM/EYoYiotQycoQQhEH9rix288GmoELPbe5HfCs5OoYL4k/5CwVXUhVs0pLzVkNkao1kcoXOaNcg8I1k=
X-Gm-Message-State: AOJu0YwfI3ZdY1XncltyhvTKfuCGS6/0uIKnvb4Z+8i4/nRctDwQBGDE
	jg7PbUVqqYiIzZuwgM9fmL5GsEKOhRr426hTbP10SgWKTESfV/VQ6sUG6tlauixVL9OXNsw4Nrt
	Ba1EYvUCarV+HFoMA4duFH5H0ZYNqxm36Q90zo6TS87z4oJscQ+T76d0=
X-Google-Smtp-Source: AGHT+IFeNymewDoQQ2b72fsvKz5+EwmHM6NPkihOCvhrd4QX5nncJm2ScXvMMyOAUFsw2cegVJkFRege49tbor9AsksLq7WQhdRg
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:411c:b0:474:d1b9:10d9 with SMTP id
 ay28-20020a056638411c00b00474d1b910d9mr140269jab.2.1709352784115; Fri, 01 Mar
 2024 20:13:04 -0800 (PST)
Date: Fri, 01 Mar 2024 20:13:04 -0800
In-Reply-To: <0000000000009a7f2105ff02d381@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007e3d4a0612a5b5a7@google.com>
Subject: Re: [syzbot] [reiserfs?] [mm?] general protection fault in
 unlink_file_vma (2)
From: syzbot <syzbot+7fbdbd17a5bd6d01bc65@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, axboe@kernel.dk, brauner@kernel.org, 
	jack@suse.cz, linkinjeon@kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	reiserfs-devel@vger.kernel.org, sj1557.seo@samsung.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12d80bba180000
start commit:   547cc9be86f4 Merge tag 'perf_urgent_for_v6.4' of git://git..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=2cbd298d0aff1140
dashboard link: https://syzkaller.appspot.com/bug?extid=7fbdbd17a5bd6d01bc65
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13a58757280000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=134a0f1f280000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

