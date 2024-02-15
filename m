Return-Path: <reiserfs-devel+bounces-66-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0EC855A09
	for <lists+reiserfs-devel@lfdr.de>; Thu, 15 Feb 2024 06:14:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D82FB28A15
	for <lists+reiserfs-devel@lfdr.de>; Thu, 15 Feb 2024 05:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8091A8F4E;
	Thu, 15 Feb 2024 05:14:07 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB867484
	for <reiserfs-devel@vger.kernel.org>; Thu, 15 Feb 2024 05:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707974047; cv=none; b=cPCyxb1RNlZIx71Ec4nYn2KFtW84DM8j/HJoit7U+8O6McsiqCp9ggDt0hGZhKgy5tSHpgmNJH5w+MHEmsFBkPU/ckQAj/sSDY7+fmIzuliJCmKBRN0whe3IY2VSPtfaG7lVZV0BOothmAEFV/1wFVfWSXXBCFhhyuqtPDepzCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707974047; c=relaxed/simple;
	bh=u2zTvaigkuJAkh2Bm7RwzFPDKiy8E7ZaQMlfwujq1to=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=OGIbVeUNCuLG5AIEK8gRCA6V5J7CuR20tprZppXQ2lTa+sTflvLDOEcrgkK5Vg3qvk+Q8qt1ul2n3ki9n859FFSH1ajtxqkotbsaLN5AU5c3mehxC2tvr0DcPxBbQgXG4ch+weWF2D/ycmBHPlBTnTuKwqA7l6mkImxY9+w3gIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-363bedeec4fso4594715ab.1
        for <reiserfs-devel@vger.kernel.org>; Wed, 14 Feb 2024 21:14:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707974045; x=1708578845;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=833iic8uS6oQb0u2s6ULb+vs6qVpUUqEMT9wxJUBre0=;
        b=DfGOuWz8LxlsFdYGkWHzjINfRqkW25EKFD78ISezkUlFhAG3YjPoexBSM3X95P3Y5p
         FFTmWj1UoSnQjfkynIIr2GbL2C+mm+7HiFklQmjvnzc6kxMLBRZfGROBHuH44hiGETL6
         NLtpOGSR3yNaSL8iqVM28QoL/coP51T9n7HoV9ILcSCMiPJfCb/XxgY775p+ZrbaFY4G
         EW//6ACeWTT2wRbBgVO+cswOphnu5VvtArxg0guKz/ZT9M7IhjbLWXH0zL74iDZIZFY0
         HjX6cP0kf4IvxXQX9t6ouGByHU3rbyyN/+ve4ECpfPAu7resvr2Tu0k0x7RE83TTIZoW
         PpVA==
X-Forwarded-Encrypted: i=1; AJvYcCUsnL+/H2AzRC5+QLFasVrXu5qJVMDR1UXTzlVSnrL7w98VEnRUZN1vJVI5yE1qSO+5Af4BgqA6W1wtcfXxKm84B1ETKo5XTMhj/k+Q8Yw=
X-Gm-Message-State: AOJu0YytyRwvGy9FNMNr3B9bOnRq5+r9DKCUuXk5w7O3LsNPp8WsAZaI
	NFdxh7EJCn7mkdmLxWqTuzoW1P5leBLbEVSTH50zb/6qBEXF1G4C6wWry4acD+euq4/3s3yXnlq
	80QYtIyf9EM/aVuaBU8bnzzCMMABQ+6c8s+bYRAeBLM2cM7j0yrmSq6A=
X-Google-Smtp-Source: AGHT+IGwo2Km0QbPqs+xCV/X1YBQCNiq02WGU+O3hroB+S6cLCUqdysdrb1ky+UxiUyUXtIsyMc0dCia1ge+gPgv8pa+molAyFdf
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:220b:b0:363:bc70:f1b1 with SMTP id
 j11-20020a056e02220b00b00363bc70f1b1mr55404ilf.2.1707974045245; Wed, 14 Feb
 2024 21:14:05 -0800 (PST)
Date: Wed, 14 Feb 2024 21:14:05 -0800
In-Reply-To: <000000000000caa956060ddf5db1@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000040a8cd061164b23a@google.com>
Subject: Re: [syzbot] [reiserfs?] general protection fault in __fget_files (2)
From: syzbot <syzbot+63cebbb27f598a7f901b@syzkaller.appspotmail.com>
To: axboe@kernel.dk, brauner@kernel.org, chouhan.shreyansh630@gmail.com, 
	eadavis@qq.com, jack@suse.cz, jeffm@suse.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, 
	rkovhaev@gmail.com, syzkaller-bugs@googlegroups.com, tglx@linutronix.de, 
	viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 6f861765464f43a71462d52026fbddfc858239a5
Author: Jan Kara <jack@suse.cz>
Date:   Wed Nov 1 17:43:10 2023 +0000

    fs: Block writes to mounted block devices

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16fbb3dc180000
start commit:   f5837722ffec Merge tag 'mm-hotfixes-stable-2023-12-27-15-0..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=da1c95d4e55dda83
dashboard link: https://syzkaller.appspot.com/bug?extid=63cebbb27f598a7f901b
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1230c7e9e80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=133d189ae80000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fs: Block writes to mounted block devices

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

