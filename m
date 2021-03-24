Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15990347B1B
	for <lists+reiserfs-devel@lfdr.de>; Wed, 24 Mar 2021 15:48:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236258AbhCXOry (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 24 Mar 2021 10:47:54 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:50905 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236211AbhCXOru (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 24 Mar 2021 10:47:50 -0400
Received: from fsav301.sakura.ne.jp (fsav301.sakura.ne.jp [153.120.85.132])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 12OElZk6017973;
        Wed, 24 Mar 2021 23:47:35 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav301.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav301.sakura.ne.jp);
 Wed, 24 Mar 2021 23:47:35 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav301.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 12OElYhR017967
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Wed, 24 Mar 2021 23:47:35 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH (resend)] reiserfs: update reiserfs_xattrs_initialized()
 condition
To:     Jan Kara <jack@suse.cz>
Cc:     reiserfs-devel@vger.kernel.org, jeffm@suse.com
References: <000000000000f5be7f05afcf862a@google.com>
 <20210221050957.3601-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <700fcc0a-0da7-6d70-620e-af0ed956cd85@i-love.sakura.ne.jp>
 <20210322153142.GF31783@quack2.suse.cz>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <4852ceee-26b1-ff2c-ac33-602e82ff3db7@i-love.sakura.ne.jp>
Date:   Wed, 24 Mar 2021 23:47:34 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210322153142.GF31783@quack2.suse.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On 2021/03/23 0:31, Jan Kara wrote:
> Thanks for the patch Tetsuo! I'd prefer if Jeff had a look since he has
> written this code back then. But let me provide my view: I agree that for a
> corrupted filesystem it can happen that xattr_root remains NULL although
> priv_root is set. So your change makes sense. But then
> reiserfs_xattrs_initialized() seems to be used really minimally? Only once
> in fs/reiserfs/xattr_security.c and e.g. reiserfs_xattr_set() is prone to
> the same problem? Do I miss something?

As far as tested with assertion patch
( https://syzkaller.appspot.com/text?tag=Patch&x=13186fe6d00000 ) applied,
syzbot did not trigger the BUG_ON() added by this patch, which means that
reiserfs_fill_super() always fails if reiserfs_xattrs_initialized() returned false.

And console log ( https://syzkaller.appspot.com/text?tag=CrashLog&x=177b30bad00000 ) contains

  jdm-20006 create_privroot: xattrs/ACLs enabled and couldn't find/create .reiserfs_priv. Failing mount.

messages, which means that e.g. reiserfs_xattr_set() will not be called on
this corrupted filesystem image because mount operation itself fails.

Despite there are other bugs remaining, I think that applying this patch as-is is OK.

