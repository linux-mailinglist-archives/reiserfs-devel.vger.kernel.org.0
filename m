Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A51AF3D4FBC
	for <lists+reiserfs-devel@lfdr.de>; Sun, 25 Jul 2021 21:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbhGYTJl (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sun, 25 Jul 2021 15:09:41 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:44850 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbhGYTJk (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 25 Jul 2021 15:09:40 -0400
Received: by mail-io1-f70.google.com with SMTP id p17-20020a5d9c910000b029050b6f9cfe31so6853608iop.11
        for <reiserfs-devel@vger.kernel.org>; Sun, 25 Jul 2021 12:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=s4NpxxARSUOT2Kkbngq9eWkM2T6xi75C+/ud6cUHweE=;
        b=h23hQCr7CAGgA/LkocPlMmZiLA3NTB9MLUO+GvICLMH0ShPXmgO1cuFO/fiwqrISOk
         Rz1PdLetGKw9dkM7qUy9R+sve5GksYboDaiPwgSG3qOx8+q4QMRae+8Y9UH2W29twT+0
         TTe/eX/X5UOGwgkfJOTlMZSDDNMpgoxshW4QdMGwMLeguluebDzLt9bE+VVNPjTYaU1M
         jOAb+MxOsC4va0me+n8FKS6NdYfQmogZj/8sxl+FrEORhvoyT3taCGRyVn2VeWJ6XFjn
         jy0XpXlUpau7O6vg1EkdiZbv+cZLWQVQDXfCgLqgDciAVglZKTw0UZGNO3wQ5Di2bLpP
         ETxg==
X-Gm-Message-State: AOAM531JXQUNGB1pggl9tIAuD2U+YPw3BY6c6o7y3XVDnCSuQBr0Rvek
        Sn8OI+59WJ1SRRPgMh127ZzeuXVIZzy8SYlXY4H7P6rSsz5m
X-Google-Smtp-Source: ABdhPJzvdk0gCs3sv6a/uew5SjkJxVC6fj6Wj/4AIou6xuglTYW7x1Fpf2qhjBhNkBJXPtoMUcPvy2O9+SowPVRwlNPloD0EuS0M
MIME-Version: 1.0
X-Received: by 2002:a5d:8b03:: with SMTP id k3mr11746205ion.203.1627242609917;
 Sun, 25 Jul 2021 12:50:09 -0700 (PDT)
Date:   Sun, 25 Jul 2021 12:50:09 -0700
In-Reply-To: <000000000000ebd6da05b00bcea6@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ba466405c7f7f1c7@google.com>
Subject: Re: [syzbot] WARNING in reiserfs_put_super
From:   syzbot <syzbot+fcdd69a8426baab36109@syzkaller.appspotmail.com>
To:     axboe@kernel.dk, ground_handling@unex-aviation.co.id, hare@suse.de,
        hch@lst.de, jack@suse.cz, jeffm@suse.com,
        linux-kernel@vger.kernel.org, mszeredi@redhat.com,
        reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
        yukuai3@huawei.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

syzbot has bisected this issue to:

commit f902b02600028dfc0c9df811eb711ac7d7fca09f
Author: Christoph Hellwig <hch@lst.de>
Date:   Thu Nov 14 14:34:32 2019 +0000

    block: refactor rescan_partitions

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=166889b2300000
start commit:   90d856e71443 Add linux-next specific files for 20210723
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=156889b2300000
console output: https://syzkaller.appspot.com/x/log.txt?x=116889b2300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=298516715f6ad5cd
dashboard link: https://syzkaller.appspot.com/bug?extid=fcdd69a8426baab36109
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=146b2066300000

Reported-by: syzbot+fcdd69a8426baab36109@syzkaller.appspotmail.com
Fixes: f902b0260002 ("block: refactor rescan_partitions")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
