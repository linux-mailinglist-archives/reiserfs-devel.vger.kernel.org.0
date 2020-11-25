Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 617D82C36D6
	for <lists+reiserfs-devel@lfdr.de>; Wed, 25 Nov 2020 03:52:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726392AbgKYCcd (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 24 Nov 2020 21:32:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgKYCcc (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 24 Nov 2020 21:32:32 -0500
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46FBEC0613D4;
        Tue, 24 Nov 2020 18:32:32 -0800 (PST)
Received: by mail-qk1-x741.google.com with SMTP id l2so1876413qkf.0;
        Tue, 24 Nov 2020 18:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=JEPiuMrPJZvgNKBeeTCRwyAYWsEFmPf+TK0tbHJS5mc=;
        b=LpIxvNuUq244Agb5jF2Kbw6O6BipshY1kd31EcrgzUTDZuopG5Qmfw5YW9vgOmXlyv
         /Fzbp3cZNd3o0GKVjLfTdgaSu55hjdmmaYbZvChF0pV9guEzT4eJGJez6l4Kxmz2c5c4
         5qHXXnZpooSGfR8GjdxpKVxnTNYctXYjj+yxknF1YXlmTwtHFH2AdhgcWtznjjrcX7Id
         k3edVwZYzU6cqt6232ybCJ4D06LDCRHHY5Kctn/1pMdmkNWzcGjMjWvvXs2ZcJD/b+pH
         XgepNSANuLJxAEXFv18Y30JrmVmgrvgFSOfxLyIqh7H6xDm1po+vU+Xy4VbSGLdpzOIN
         TQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=JEPiuMrPJZvgNKBeeTCRwyAYWsEFmPf+TK0tbHJS5mc=;
        b=nsR+XBY5WMbt01xIo5wBn6K8BP42rKuZLM/fYoWfZA1mFzGQh5BNtn2m06Y/hK6Osf
         VDdp1xLhJvnvupaV39kBPtekD1kGiquPPqES2KRzVuHaACuE8IXqp/wsalOfsyR/ZfzN
         wN0dR90HZ+FMEMl5yKf5E02YIvG1gWOJzGOuXh0fOG6XeTTPjSfbUIvFarBHH0yk9lnt
         ALmHlFw5WTq2G1/4sJIJCvZpMe1q+5tPhWjKT1k6JXoZWuZSg2TxCOhFaGw/DL3fFjxm
         UN/JIVrCsWNL8h0UZVTJRMMLXGzKfTsNiMnjDxtp3YsVbwOXKkc0bwpm867BZM4VF541
         utuA==
X-Gm-Message-State: AOAM5304MiOA465wUNjb+BfvpS7kQOKkZ0m126VxRQv49o6wvILqzV3D
        iiDnY+kvfED9pY2VHKuwamiARYE+2Q9psK4gUWklqE0joARQlBqv
X-Google-Smtp-Source: ABdhPJwrC+gTvIE+cHBs+bQWe1ZwkF1RRREjYyVcJ1UyoKit2TnCr9wy2NcDoO0IEDO65XIn8MFU1GsVUe7n0f8Y1E4=
X-Received: by 2002:a25:2e0d:: with SMTP id u13mr1310032ybu.247.1606271551478;
 Tue, 24 Nov 2020 18:32:31 -0800 (PST)
MIME-Version: 1.0
From:   =?UTF-8?B?5oWV5Yas5Lqu?= <mudongliangabcd@gmail.com>
Date:   Wed, 25 Nov 2020 10:32:05 +0800
Message-ID: <CAD-N9QVE_eYTrdp0c6q+c_kHUXk+i54BKhHR_0=qwr5xEu_k=w@mail.gmail.com>
Subject: Re: general protection fault in reiserfs_security_init
To:     baolin.wang7@gmail.com, gregkh@linuxfoundation.org,
        linhua.xu@unisoc.com, linus.walleij@linaro.org,
        linux-kernel <linux-kernel@vger.kernel.org>, rafael@kernel.org,
        reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Monday, September 21, 2020 at 5:32:22 PM UTC+8 syzbot wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit: 325d0eab Merge branch 'akpm' (patches from Andrew)
> git tree: upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=1671c0e3900000
> kernel config: https://syzkaller.appspot.com/x/.config?x=b12e84189082991c
> dashboard link: https://syzkaller.appspot.com/bug?extid=690cb1e51970435f9775
> compiler: gcc (GCC) 10.1.0-syz 20200507
> syz repro: https://syzkaller.appspot.com/x/repro.syz?x=15705a3d900000
> C reproducer: https://syzkaller.appspot.com/x/repro.c?x=117b3281900000
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+690cb1...@syzkaller.appspotmail.com
>
> REISERFS (device loop0): journal params: device loop0, size 15748, journal first block 18, max trans len 256, max batch 225, max commit age 30, max trans age 30
> REISERFS (device loop0): checking transaction log (loop0)
> REISERFS (device loop0): Using tea hash to sort names
> REISERFS (device loop0): using 3.5.x disk format
> general protection fault, probably for non-canonical address 0xdffffc000000000d: 0000 [#1] PREEMPT SMP KASAN
> KASAN: null-ptr-deref in range [0x0000000000000068-0x000000000000006f]
> CPU: 0 PID: 6874 Comm: syz-executor834 Not tainted 5.9.0-rc5-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> RIP: 0010:d_really_is_negative include/linux/dcache.h:472 [inline]
> RIP: 0010:reiserfs_xattr_jcreate_nblocks fs/reiserfs/xattr.h:78 [inline]
> RIP: 0010:reiserfs_security_init+0x285/0x4d0 fs/reiserfs/xattr_security.c:70
> Code: 48 c1 ea 03 80 3c 02 00 0f 85 2b 02 00 00 4d 8b ad a0 05 00 00 48 b8 00 00 00 00 00 fc ff df 49 8d 7d 68 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 23 02 00 00 49 83 7d 68 00 0f 84 62 01 00 00 48
> RSP: 0018:ffffc90005827980 EFLAGS: 00010202
> RAX: dffffc0000000000 RBX: 0000000000000036 RCX: 000000000000006c
> RDX: 000000000000000d RSI: ffffffff82009dd3 RDI: 0000000000000068
> RBP: ffff88807d8441d0 R08: ffffc90005827a10 R09: ffffc90005827a18
> R10: 0000000000000000 R11: 0000000000000000 R12: 00000000000005fa
> R13: 0000000000000000 R14: ffff888094e60000 R15: 0000000000000000
> FS: 0000000001036880(0000) GS:ffff8880ae400000(0000) knlGS:0000000000000000
> CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f5a6fb90ab4 CR3: 000000009a1ab000 CR4: 00000000001506f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
> reiserfs_mkdir+0x2c9/0x980 fs/reiserfs/namei.c:821
> create_privroot fs/reiserfs/xattr.c:882 [inline]
> reiserfs_xattr_init+0x4de/0xb52 fs/reiserfs/xattr.c:1004


int reiserfs_xattr_init(struct super_block *s, int mount_flags)
{
        int err = 0;
        struct dentry *privroot = REISERFS_SB(s)->priv_root;

        err = xattr_mount_check(s);
        if (err)
                goto error;

        if (d_really_is_negative(privroot) && !(mount_flags & SB_RDONLY)) {
                inode_lock(d_inode(s->s_root));
                err = create_privroot(REISERFS_SB(s)->priv_root);
                inode_unlock(d_inode(s->s_root));
        }

        if (d_really_is_positive(privroot)) {
                inode_lock(d_inode(privroot));
                if (!REISERFS_SB(s)->xattr_root) {
                        struct dentry *dentry;

                        dentry = lookup_one_len(XAROOT_NAME, privroot,
                                                strlen(XAROOT_NAME));
                        if (!IS_ERR(dentry)) {
                                pr_alert("assign xattr_root with
dentry = 0x%lx", dentry);
                                REISERFS_SB(s)->xattr_root = dentry;
                        }else
                                err = PTR_ERR(dentry);
                }
                inode_unlock(d_inode(privroot));
        }
        ......
}
From the implementation of reiserfs_xattr_init, only when
d_really_is_positive(privroot) is true, xattr_root could be assigned
with a dentry obtained from lookup_one_len. In other words,
create_privroot is executed with REISERFS_SB(s)->xattr_root as NULL
pointer. With improper implementation of mkdir operation in reiserfs
filesystem or accessing the xattr_root in reiserfs_mkdir , it can lead
to NULL pointer dereference. If you remove the red code in
reiserfs_xattr_jcreate_nblocks, the crash never occurs, but it may
affect nblocks calculation in the reiserfs filesystem.

static inline size_t reiserfs_xattr_jcreate_nblocks(struct inode *inode)
{
        size_t nblocks = JOURNAL_BLOCKS_PER_OBJECT(inode->i_sb);

        pr_alert("5: inode = 0x%lx", inode);
        if ((REISERFS_I(inode)->i_flags & i_has_xattr_dir) == 0) {
                nblocks += JOURNAL_BLOCKS_PER_OBJECT(inode->i_sb);
                if (d_really_is_negative(REISERFS_SB(inode->i_sb)->xattr_root))
                      nblocks += JOURNAL_BLOCKS_PER_OBJECT(inode->i_sb);
        }

        return nblocks;
}

--
My best regards to you.

     No System Is Safe!
     Dongliang Mu
