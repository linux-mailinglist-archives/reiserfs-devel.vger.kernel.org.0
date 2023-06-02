Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40EBD7207E6
	for <lists+reiserfs-devel@lfdr.de>; Fri,  2 Jun 2023 18:47:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236840AbjFBQrO (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 2 Jun 2023 12:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235692AbjFBQrN (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 2 Jun 2023 12:47:13 -0400
Received: from frasgout13.his.huawei.com (unknown [14.137.139.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DF961B1;
        Fri,  2 Jun 2023 09:47:11 -0700 (PDT)
Received: from mail02.huawei.com (unknown [172.18.147.229])
        by frasgout13.his.huawei.com (SkyGuard) with ESMTP id 4QXpYY18RSz9y11c;
        Sat,  3 Jun 2023 00:36:49 +0800 (CST)
Received: from roberto-ThinkStation-P620 (unknown [10.204.63.22])
        by APP2 (Coremail) with SMTP id GxC2BwDnoEfnHHpkz+H8Ag--.3469S2;
        Fri, 02 Jun 2023 17:46:44 +0100 (CET)
Message-ID: <d1148a9e210dda23592d63ad64e7c1f9af23adea.camel@huaweicloud.com>
Subject: Re: [syzbot] [reiserfs?] possible deadlock in open_xa_dir
From:   Roberto Sassu <roberto.sassu@huaweicloud.com>
To:     Jeff Mahoney <jeffm@suse.com>, Paul Moore <paul@paul-moore.com>,
        syzbot <syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com>
Cc:     hdanton@sina.com, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org,
        roberto.sassu@huawei.com, syzkaller-bugs@googlegroups.com,
        peterz@infradead.org, mingo@redhat.com, will@kernel.org,
        Jan Kara <jack@suse.cz>
Date:   Fri, 02 Jun 2023 18:46:27 +0200
In-Reply-To: <07c825a21fb4c57f4290158e529d32f4e0e0fbf0.camel@huaweicloud.com>
References: <0000000000007bedb605f119ed9f@google.com>
         <00000000000000964605faf87416@google.com>
         <CAHC9VhTZ=Esk+JxgAjch2J44WuLixe-SZMXW2iGHpLdrdMKQ=g@mail.gmail.com>
         <1020d006-c698-aacc-bcc3-92e5b237ef91@huaweicloud.com>
         <29fcea18-d720-d5df-0e00-eb448e6bbfcf@suse.com>
         <07c825a21fb4c57f4290158e529d32f4e0e0fbf0.camel@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: GxC2BwDnoEfnHHpkz+H8Ag--.3469S2
X-Coremail-Antispam: 1UD129KBjvJXoW3XrWkXF1xuF47JFy7Xw4kCrg_yoWfCr17pr
        WrKa9rKr1vyrn5JF40g3WUWw1vq39xGryUXrn3GrWUZa1vqr97JFW0vrySkr47urZ7CF9r
        Jw4Dtw13Zrn8JwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
        6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
        vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7Cj
        xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxV
        AFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
        6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
        Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI
        7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
        Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY
        6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
        AIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280
        aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07UWE__UUUUU=
X-CM-SenderInfo: purev21wro2thvvxqx5xdzvxpfor3voofrz/1tbiAQAQBF1jj44KrgADsN
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        PDS_RDNS_DYNAMIC_FP,RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_L3,RDNS_DYNAMIC,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Fri, 2023-06-02 at 09:20 +0200, Roberto Sassu wrote:
> On Thu, 2023-06-01 at 17:22 -0400, Jeff Mahoney wrote:
> > On 5/31/23 05:49, Roberto Sassu wrote:
> > > On 5/5/2023 11:36 PM, Paul Moore wrote:
> > > > On Fri, May 5, 2023 at 4:51 PM syzbot
> > > > <syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com> wrote:
> > > > > syzbot has bisected this issue to:
> > > > > 
> > > > > commit d82dcd9e21b77d338dc4875f3d4111f0db314a7c
> > > > > Author: Roberto Sassu <roberto.sassu@huawei.com>
> > > > > Date:   Fri Mar 31 12:32:18 2023 +0000
> > > > > 
> > > > >      reiserfs: Add security prefix to xattr name in 
> > > > > reiserfs_security_write()
> > > > > 
> > > > > bisection log:  
> > > > > https://syzkaller.appspot.com/x/bisect.txt?x=14403182280000
> > > > > start commit:   3c4aa4434377 Merge tag 'ceph-for-6.4-rc1' of 
> > > > > https://githu..
> > > > > git tree:       upstream
> > > > > final oops:     
> > > > > https://syzkaller.appspot.com/x/report.txt?x=16403182280000
> > > > > console output: https://syzkaller.appspot.com/x/log.txt?x=12403182280000
> > > > > kernel config:  
> > > > > https://syzkaller.appspot.com/x/.config?x=73a06f6ef2d5b492
> > > > > dashboard link: 
> > > > > https://syzkaller.appspot.com/bug?extid=8fb64a61fdd96b50f3b8
> > > > > syz repro:      
> > > > > https://syzkaller.appspot.com/x/repro.syz?x=12442414280000
> > > > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=176a7318280000
> > > > > 
> > > > > Reported-by: syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com
> > > > > Fixes: d82dcd9e21b7 ("reiserfs: Add security prefix to xattr name in 
> > > > > reiserfs_security_write()")
> > > > > 
> > > > > For information about bisection process see: 
> > > > > https://goo.gl/tpsmEJ#bisection
> > > > 
> > > > I don't think Roberto's patch identified above is the actual root
> > > > cause of this problem as reiserfs_xattr_set_handle() is called in
> > > > reiserfs_security_write() both before and after the patch.  However,
> > > > due to some bad logic in reiserfs_security_write() which Roberto
> > > > corrected, I'm thinking that it is possible this code is being
> > > > exercised for the first time and syzbot is starting to trigger a
> > > > locking issue in the reiserfs code ... ?
> > > 
> > > + Jan, Jeff (which basically restructured the lock)
> > > 
> > > + Petr, Ingo, Will
> 
> Peter, clearly (sorry!)
> 
> > I involve the lockdep experts, to get a bit of help on this.
> > 
> > Yep, looks like that's been broken since it was added in 2009.  Since 
> > there can't be any users of it, it'd make sense to drop the security 
> > xattr support from reiserfs entirely.
> 
> Thanks, Jeff. Will make a patch to implement your suggestion.

Ok, I tried first to disable security xattr initialization and keep the
xattr handler.

Setting the security xattr manually triggers a lockdep warning. Even
worse, setting a trusted xattr manually triggers that too. So, not sure
how we should proceed.

Have you looked at:

https://lore.kernel.org/linux-kernel/8a48ede1-3a45-7c3c-39e9-36001ac09283@huaweicloud.com/

That silences the lockdep warning, but I'm far from saying that it
won't have any side effect...

Thanks

Roberto

> Meanwhile, I learned how to read lockdep a bit better. The following
> format could have helped me to understand it more quickly. The proposal
> is simply to change #n to CPU#n at the top of the trace, define labels
> L#n for the locks, and add them where effectively are held.
> 
> [   77.746561][ T5418] -> CPU1 (&sbi->lock){+.+.}-{3:3}:
> [   77.753772][ T5418]        lock_acquire+0x23e/0x630
> [   77.758792][ T5418]        __mutex_lock_common+0x1d8/0x2530
> [   77.764504][ T5418]   (L3) mutex_lock_nested+0x1b/0x20
> [   77.769868][ T5418]        reiserfs_write_lock+0x70/0xc0
> [   77.775321][ T5418]        reiserfs_mkdir+0x321/0x870
> [   77.780509][ T5418]   (L2) open_xa_dir+0x259/0x540
> [   77.785440][ T5418]        xattr_lookup+0x17/0x210
> [   77.790378][ T5418]        reiserfs_xattr_set_handle+0xda/0xc80
> [   77.796448][ T5418]        reiserfs_security_write+0x134/0x190
> [   77.802416][ T5418]        reiserfs_new_inode+0x13bf/0x1a90
> [   77.808124][ T5418]        reiserfs_create+0x3b1/0x680
> [   77.813399][ T5418]        path_openat+0xf1e/0x2c10
> [   77.818415][ T5418]        do_filp_open+0x22a/0x440
> [   77.823433][ T5418]        do_sys_openat2+0x10f/0x430
> [   77.828624][ T5418]        __x64_sys_creat+0x11e/0x160
> [   77.833905][ T5418]        do_syscall_64+0x41/0xc0
> [   77.838926][ T5418]        entry_SYSCALL_64_after_hwframe+0x63/0xcd
> [   77.845514][ T5418] 
> [   77.845514][ T5418] -> CPU0 (&type->i_mutex_dir_key#8/3){+.+.}-{3:3}:
> [   77.854118][ T5418]        validate_chain+0x166b/0x58e0
> [   77.859488][ T5418]        __lock_acquire+0x125b/0x1f80
> [   77.864853][ T5418]        lock_acquire+0x23e/0x630
> [   77.869909][ T5418]   (L4) down_write_nested+0x3d/0x50
> [   77.875186][ T5418]        open_xa_dir+0x134/0x540
> [   77.880117][ T5418]        xattr_lookup+0x17/0x210
> [   77.885050][ T5418]        reiserfs_xattr_get+0xe1/0x4a0
> [   77.890501][ T5418]        __vfs_getxattr+0x2fe/0x350
> [   77.895802][ T5418]        smk_fetch+0x98/0xf0
> [   77.900382][ T5418]        smack_d_instantiate+0x5d5/0xa20
> [   77.906018][ T5418]        security_d_instantiate+0x6b/0xb0
> [   77.911736][ T5418]        d_instantiate_new+0x5e/0xe0
> [   77.917013][ T5418]   (L1) reiserfs_create+0x5ee/0x680
> [   77.922293][ T5418]        path_openat+0xf1e/0x2c10
> [   77.927308][ T5418]        do_filp_open+0x22a/0x440
> [   77.932330][ T5418]        do_sys_openat2+0x10f/0x430
> [   77.937515][ T5418]        __x64_sys_creat+0x11e/0x160
> [   77.942874][ T5418]        do_syscall_64+0x41/0xc0
> [   77.947796][ T5418]        entry_SYSCALL_64_after_hwframe+0x63/0xcd
> [   77.954200][ T5418] 
> [   77.954200][ T5418] other info that might help us debug this:
> [   77.954200][ T5418] 
> [   77.964508][ T5418]  Possible unsafe locking scenario:
> [   77.964508][ T5418] 
> [   77.972034][ T5418]   CPU0                         CPU1
> [   77.977394][ T5418]   ----                         ----
> [   77.982748][ T5418]   L1: lock(&sbi->lock);
> [   77.986726][ T5418]                                L2: lock(&type->i_mutex_dir_key#8/3);
> [   77.994618][ T5418]                                L3: lock(&sbi->lock);
> [   78.001118][ T5418]   L4: lock(&type->i_mutex_dir_key#8/3);
> 
> Thanks
> 
> Roberto
> 
> > > First of all, the lockdep warning is trivial to reproduce:
> > > 
> > > # dd if=/dev/zero of=reiserfs.img bs=1M count=100
> > > # losetup -f --show reiserfs.img
> > > /dev/loop0
> > > # mkfs.reiserfs /dev/loop0
> > > # mount /dev/loop0 /mnt/
> > > # touch file0
> > > 
> > > In the testing system, Smack is the major LSM.
> > > 
> > > Ok, so the warning here is clear:
> > > 
> > > https://syzkaller.appspot.com/x/log.txt?x=12403182280000
> > > 
> > > However, I was looking if that can really happen. From this:
> > > 
> > > [   77.746561][ T5418] -> #1 (&sbi->lock){+.+.}-{3:3}:
> > > [   77.753772][ T5418]        lock_acquire+0x23e/0x630
> > > [   77.758792][ T5418]        __mutex_lock_common+0x1d8/0x2530
> > > [   77.764504][ T5418]        mutex_lock_nested+0x1b/0x20
> > > [   77.769868][ T5418]        reiserfs_write_lock+0x70/0xc0
> > > [   77.775321][ T5418]        reiserfs_mkdir+0x321/0x870
> > > 
> > > I see that the lock is taken in reiserfs_write_lock(), while lockdep says:
> > > 
> > > [   77.710227][ T5418] but task is already holding lock:
> > > [   77.717587][ T5418] ffff88807568d090 (&sbi->lock){+.+.}-{3:3}, at: 
> > > reiserfs_write_lock_nested+0x4a/0xb0
> > > 
> > > which is in a different place, I believe here:
> > > 
> > > int reiserfs_paste_into_item(struct reiserfs_transaction_handle *th,
> > >                               /* Path to the pasted item. */
> > > [...]
> > > 
> > >          depth = reiserfs_write_unlock_nested(sb);
> > >          dquot_free_space_nodirty(inode, pasted_size);
> > >          reiserfs_write_lock_nested(sb, depth);
> > >          return retval;
> > > }
> > > 
> > > This is called by reiserfs_add_entry(), which is called by 
> > > reiserfs_create() (it is in the lockdep trace). After returning to 
> > > reiserfs_create(), d_instantiate_new() is called.
> > > 
> > > I don't know exactly, I take the part that the lock is held. But if it 
> > > is held, how d_instantiate_new() can be executed in another task?
> > > 
> > > static int reiserfs_create(struct mnt_idmap *idmap, struct inode *dir,
> > >                          struct dentry *dentry, umode_t mode, bool excl)
> > > {
> > > 
> > > [...]
> > > 
> > >          reiserfs_write_lock(dir->i_sb);
> > > 
> > >          retval = journal_begin(&th, dir->i_sb, jbegin_count);
> > > 
> > > [...]
> > > 
> > >          d_instantiate_new(dentry, inode);
> > >          retval = journal_end(&th);
> > > 
> > > out_failed:
> > >          reiserfs_write_unlock(dir->i_sb);
> > > 
> > > If the lock is held, the scenario lockdep describes cannot happen. Any 
> > > thoughts?
> > 
> > It's important to understand that the reiserfs write lock was added as a 
> > subsystem-specific replacement for the BKL.  Given that reiserfs was 
> > dying already back then, it made more sense from a time management 
> > perspective to emulate that behavior internally rather than use new 
> > locking when practically nobody cared anymore.
> > 
> > See reiserfs_write_unlock_nested and reiserfs_write_lock_nested paired 
> > throughout the code.  It drops the lock when it passes a point where 
> > it's likely to schedule, just like the BKL would have.
> > 
> > Yes, it's a mess.  Just let it die quietly.
> > 
> > -Jeff
> > 

