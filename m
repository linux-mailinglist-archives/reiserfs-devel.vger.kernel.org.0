Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9B113495C5
	for <lists+reiserfs-devel@lfdr.de>; Thu, 25 Mar 2021 16:37:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbhCYPg6 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 25 Mar 2021 11:36:58 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:60181 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231572AbhCYPgd (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 25 Mar 2021 11:36:33 -0400
Received: from fsav304.sakura.ne.jp (fsav304.sakura.ne.jp [153.120.85.135])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 12PFaJW8089021;
        Fri, 26 Mar 2021 00:36:19 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav304.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav304.sakura.ne.jp);
 Fri, 26 Mar 2021 00:36:19 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav304.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 12PFaJcC089018
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 26 Mar 2021 00:36:19 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH (resend)] reiserfs: update reiserfs_xattrs_initialized()
 condition
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
To:     Jeff Mahoney <jeffm@suse.com>, Jan Kara <jack@suse.cz>
Cc:     reiserfs-devel@vger.kernel.org
References: <000000000000f5be7f05afcf862a@google.com>
 <20210221050957.3601-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <700fcc0a-0da7-6d70-620e-af0ed956cd85@i-love.sakura.ne.jp>
 <20210322153142.GF31783@quack2.suse.cz>
 <4852ceee-26b1-ff2c-ac33-602e82ff3db7@i-love.sakura.ne.jp>
 <7d7a884a-5a94-5b0e-3cf5-82d12e1b0992@suse.com>
 <bf4bbfb6-17f2-4a57-e125-070e9e875888@i-love.sakura.ne.jp>
Message-ID: <fa9f373a-a878-6551-abf1-903865a9d21f@i-love.sakura.ne.jp>
Date:   Fri, 26 Mar 2021 00:36:15 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <bf4bbfb6-17f2-4a57-e125-070e9e875888@i-love.sakura.ne.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On 2021/03/25 15:19, Tetsuo Handa wrote:
> On 2021/03/25 0:20, Jeff Mahoney wrote:
>> Tetsuo's patch is fine but it needs a similar fix in reiserfs_xattr_set,
>> as you noted.  Whether it's required is another question.  ReiserFS is
>> absolutely loaded with fuzzer bugs.
> 
> Can we apply this patch as-is? Since this is currently 5th top crasher,
> applying this patch as soon as possible helps utilizing syzbot's resource
> for finding further bugs.
> 

Will you explain why we need a similar fix in reiserfs_xattr_set() ?

Debug print patch ( https://syzkaller.appspot.com/x/patch.diff?x=1112d621d00000 ) and
console output ( https://syzkaller.appspot.com/x/log.txt?x=13e76921d00000 ) says
"reiserfs_xattr_init returns -95" which indicates that reiserfs_fill_super() from
mount attempts for such crafted filesystem images fails with -EOPNOTSUPP error.

Given that such crafted filesystem images cannot be mounted,
how can reiserfs_xattr_set() be called and cause problems?

