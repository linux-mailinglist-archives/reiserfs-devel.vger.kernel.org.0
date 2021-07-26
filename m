Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 688D03D66A4
	for <lists+reiserfs-devel@lfdr.de>; Mon, 26 Jul 2021 20:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231598AbhGZRkT (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 26 Jul 2021 13:40:19 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:54226 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230032AbhGZRkT (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 26 Jul 2021 13:40:19 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id CE00C21FC9;
        Mon, 26 Jul 2021 18:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1627323646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zvcca5rVCR4CoCExSBTtbcM2L1tcOj4RbRxvRtxzheU=;
        b=YvSRhrfwP2WTwokqIt9aSq5KQEOnDfqpq9pBO5ksujDwYmhn+0Mj/6aQJALg8hMiH1Z7PX
        27Etyy8H6Z2K4y3dE8SSSor2UuK+cqmPoqjcpBt98WfFbtsIF9rHSXweJ7afDg2VeEFdrV
        qE3zgKhExx83r8B0zecZwKCxK7uTeOc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1627323646;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zvcca5rVCR4CoCExSBTtbcM2L1tcOj4RbRxvRtxzheU=;
        b=gYUJmRUPS4hazKGJc8CitKYRTmfV4FjJ8TZ1OgdpyniMCi8oHPt0HSNhtsEmU42PlwGqgB
        ICj2LdVkT66gTYBQ==
Received: from quack2.suse.cz (unknown [10.100.200.198])
        by relay2.suse.de (Postfix) with ESMTP id B2F66A3B81;
        Mon, 26 Jul 2021 18:20:43 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
        id 823841E3B13; Mon, 26 Jul 2021 20:20:39 +0200 (CEST)
Date:   Mon, 26 Jul 2021 20:20:39 +0200
From:   Jan Kara <jack@suse.cz>
To:     syzbot <syzbot+fcdd69a8426baab36109@syzkaller.appspotmail.com>
Cc:     axboe@kernel.dk, ground_handling@unex-aviation.co.id, hare@suse.de,
        hch@lst.de, jack@suse.cz, jeffm@suse.com,
        linux-kernel@vger.kernel.org, mszeredi@redhat.com,
        reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
        yukuai3@huawei.com
Subject: Re: [syzbot] WARNING in reiserfs_put_super
Message-ID: <20210726182039.GP20621@quack2.suse.cz>
References: <000000000000ebd6da05b00bcea6@google.com>
 <000000000000ba466405c7f7f1c7@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000ba466405c7f7f1c7@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Sun 25-07-21 12:50:09, syzbot wrote:
> syzbot has bisected this issue to:
> 
> commit f902b02600028dfc0c9df811eb711ac7d7fca09f
> Author: Christoph Hellwig <hch@lst.de>
> Date:   Thu Nov 14 14:34:32 2019 +0000
> 
>     block: refactor rescan_partitions

Looks unlikely. Also because the first report of this problem was 307 days
ago - i.e., before this commit landed. I rather think the reproducer isn't
quite reliable...

								Honza

> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=166889b2300000
> start commit:   90d856e71443 Add linux-next specific files for 20210723
> git tree:       linux-next
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=156889b2300000
> console output: https://syzkaller.appspot.com/x/log.txt?x=116889b2300000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=298516715f6ad5cd
> dashboard link: https://syzkaller.appspot.com/bug?extid=fcdd69a8426baab36109
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=146b2066300000
> 
> Reported-by: syzbot+fcdd69a8426baab36109@syzkaller.appspotmail.com
> Fixes: f902b0260002 ("block: refactor rescan_partitions")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
