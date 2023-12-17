Return-Path: <reiserfs-devel+bounces-10-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37930815E56
	for <lists+reiserfs-devel@lfdr.de>; Sun, 17 Dec 2023 10:36:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68AFF1C21129
	for <lists+reiserfs-devel@lfdr.de>; Sun, 17 Dec 2023 09:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7596423C6;
	Sun, 17 Dec 2023 09:36:09 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46E51C33
	for <reiserfs-devel@vger.kernel.org>; Sun, 17 Dec 2023 09:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-35fae2befeaso2864465ab.1
        for <reiserfs-devel@vger.kernel.org>; Sun, 17 Dec 2023 01:36:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702805766; x=1703410566;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QYt+ikegC5rVi/qGr8IiLcMnutjmAb6NTg3JW6/hHH0=;
        b=PNkmUEyk2PFusG2MeYHeMsmyMNj92HtauRhB3ZHYtF55ITznCdEOi7+oQJMRtmNpCs
         FaEKYL5Nf4OlF+VGIEZBpKnSe5sYdeQvfNlF1IeqhAOBiO+qcF7mNhGftkiai2Wuaosu
         d+nWxM1qgNZT/Y5wVjB8bs36gaykTVp8vAtOXZe9Eaz99jEOutGjZybgeazvpi04ua8Y
         eF5wEz2qjPSfWACN/n5+kWmd4ZJBoMZAy0Jam9JCgWhTSMLiw9CSaSUvNDwpDQed0eGQ
         wUbP6rtVWO87ZpFbh+j/jXvkqQ3xPNQW8maaFnvgU8o8fy7kBCtB5G1tnlK7CFwQxE/d
         wCqw==
X-Gm-Message-State: AOJu0YwfCJpTi6XCKwz8SdBuKQPgVHtwgbWUQAn3Ek4JHHnwf4HmzGJz
	+5aq3NruWZaihFUEJNl0HtwJJVy65WbTmjtXBYEE1jhd9M+l
X-Google-Smtp-Source: AGHT+IEJAguZt+Gv2Y76sjvdueN6ZFAUUjgQ3bitOLfHS8oC6v8p3BLP5V9wsQgaUv5l1IktXBdwbNZHY16qZ2kMSl2kME9KRaTW
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:1e06:0:b0:35f:4dfd:c224 with SMTP id
 e6-20020a921e06000000b0035f4dfdc224mr473921ile.0.1702805765999; Sun, 17 Dec
 2023 01:36:05 -0800 (PST)
Date: Sun, 17 Dec 2023 01:36:05 -0800
In-Reply-To: <CAOQ4uxjjo=qwwWcRXhv_D+KFfnPa_CEOrPbbZtzLroiOO7eYDg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000cdd406060cb15c9c@google.com>
Subject: Re: [syzbot] [reiserfs?] [squashfs?] BUG: Dentry still in use in unmount
From: syzbot <syzbot+8608bb4553edb8c78f41@syzkaller.appspotmail.com>
To: amir73il@gmail.com, chao@kernel.org, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phillip@squashfs.org.uk, 
	reiserfs-devel@vger.kernel.org, squashfs-devel@lists.sourceforge.net, 
	syzkaller-bugs@googlegroups.com, terrelln@fb.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+8608bb4553edb8c78f41@syzkaller.appspotmail.com

Tested on:

commit:         79f938ea ovl: fix dentry reference leak after changes ..
git tree:       https://github.com/amir73il/linux ovl-fixes
console output: https://syzkaller.appspot.com/x/log.txt?x=171ae01ae80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=52c9552def2a0fdd
dashboard link: https://syzkaller.appspot.com/bug?extid=8608bb4553edb8c78f41
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.

