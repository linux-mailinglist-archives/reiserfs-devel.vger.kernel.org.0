Return-Path: <reiserfs-devel+bounces-40-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB68830AE6
	for <lists+reiserfs-devel@lfdr.de>; Wed, 17 Jan 2024 17:20:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0D701C262D8
	for <lists+reiserfs-devel@lfdr.de>; Wed, 17 Jan 2024 16:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6810C2232C;
	Wed, 17 Jan 2024 16:20:08 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E04E22301
	for <reiserfs-devel@vger.kernel.org>; Wed, 17 Jan 2024 16:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705508408; cv=none; b=cKinSC+FyGoEcKNJQb8nkUHx+UgM/9XbE+8KPC8nyiTVXYFqWExWxjpR26h0yOF/9nJ+ZP3WZ7Qr1FG21s0Hb8f5tnaTbeZjtFdvZV1wRPJe1TD22d4ijfwrw1CBPb8OXSu80a9VR5JeIFS6HLLhEGO9/R+XK8eBoO+wdMZtu5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705508408; c=relaxed/simple;
	bh=X9Tc8QKWPDLmksAWuVVFK0oDVNUWOymTX5v/tPTp/6w=;
	h=Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Google-Smtp-Source:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:
	 Message-ID:Subject:From:To:Content-Type; b=CyC/+JHzlYLrLqCoV4jz9X81yY90IwCVt7jTn7dcXjqghZ88UPyRExOGZWcjcCTYfwpy8lOTPbmF0Jh5M2JHvqbcDvp2M9PDQn6OUEPcFU5Cy1iSkHwHh5tqHHG+yRyIy3dMAwZts0MG0OuIxeL9VVEpWaJ3MDDG9qpHHmBpw34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3610073a306so23757315ab.0
        for <reiserfs-devel@vger.kernel.org>; Wed, 17 Jan 2024 08:20:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705508406; x=1706113206;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CmRaJpPgBsO0jKDNyPLfd6NWiflAW4VynA5h/LQ9l80=;
        b=ObC21h4jE1RAOXKvdKzxTw19ldmNHcKXqtRRqS+iUQSRtWjxGYUBxs1g3oEwe5qq/J
         WK2K6IBhc4UIZmMkyX5cp4HnjFixCGxcqilX291KfIw94P0fkM5J6zsvn3Qc7JuDcNxu
         OkEd8b6eZtau0/6EAfyU8nT060BN7v/OjLa1TXm5UTHqOCQYoQYer5OxLqBrpX0vZXnT
         jFkhGYeUJ9qlK+RMur9cqS3B2G0+vbG+HseMoXi3YQPtwGwLYYOW6G9aGoKfUtjf1i/m
         sZltnsM7E4GdvibRh6Fx78LAsMOgWdyFc/veRteHhCRsItaBEhYVUR656p2unWcSxKGY
         ux4w==
X-Gm-Message-State: AOJu0YxP3RiQWssyam775vDLjNjSXQkEP5GTOveNXr+0MY7vgYiczYCA
	D+4Qp5PwtuftFDJzX9qprGlCPxtFzL5JRjw7CnqJzXPY+rsb
X-Google-Smtp-Source: AGHT+IGX33jfAR+ozaz9MIu9nM7Eu3lo1Imr5ETdadokM97tBJl+NUXFtldShbDVPwhuIfi/hlO665PnGpajP6nGijPWQP5CBM+x
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:18ca:b0:360:2a3:7dc0 with SMTP id
 s10-20020a056e0218ca00b0036002a37dc0mr1332355ilu.2.1705508406145; Wed, 17 Jan
 2024 08:20:06 -0800 (PST)
Date: Wed, 17 Jan 2024 08:20:06 -0800
In-Reply-To: <0000000000006308a805eaa57d87@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b5b973060f269eb3@google.com>
Subject: Re: [syzbot] [reiserfs?] possible deadlock in chown_common
From: syzbot <syzbot+3abaeed5039cc1c49c7c@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, jack@suse.cz, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14ecbc83e80000
start commit:   2bca25eaeba6 Merge tag 'spi-v6.1' of git://git.kernel.org/..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=9df203be43a870b5
dashboard link: https://syzkaller.appspot.com/bug?extid=3abaeed5039cc1c49c7c
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1539e7b8880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16c6cb32880000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

