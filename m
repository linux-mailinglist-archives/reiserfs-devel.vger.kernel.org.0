Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31DE13488FD
	for <lists+reiserfs-devel@lfdr.de>; Thu, 25 Mar 2021 07:21:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbhCYGUh (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 25 Mar 2021 02:20:37 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:56823 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbhCYGUB (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 25 Mar 2021 02:20:01 -0400
Received: from fsav110.sakura.ne.jp (fsav110.sakura.ne.jp [27.133.134.237])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 12P6Jmlb070830;
        Thu, 25 Mar 2021 15:19:48 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav110.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav110.sakura.ne.jp);
 Thu, 25 Mar 2021 15:19:48 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav110.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 12P6Jmpr070826
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 25 Mar 2021 15:19:48 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH (resend)] reiserfs: update reiserfs_xattrs_initialized()
 condition
To:     Jeff Mahoney <jeffm@suse.com>, Jan Kara <jack@suse.cz>
Cc:     reiserfs-devel@vger.kernel.org
References: <000000000000f5be7f05afcf862a@google.com>
 <20210221050957.3601-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <700fcc0a-0da7-6d70-620e-af0ed956cd85@i-love.sakura.ne.jp>
 <20210322153142.GF31783@quack2.suse.cz>
 <4852ceee-26b1-ff2c-ac33-602e82ff3db7@i-love.sakura.ne.jp>
 <7d7a884a-5a94-5b0e-3cf5-82d12e1b0992@suse.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <bf4bbfb6-17f2-4a57-e125-070e9e875888@i-love.sakura.ne.jp>
Date:   Thu, 25 Mar 2021 15:19:44 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7d7a884a-5a94-5b0e-3cf5-82d12e1b0992@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On 2021/03/25 0:20, Jeff Mahoney wrote:
> Tetsuo's patch is fine but it needs a similar fix in reiserfs_xattr_set,
> as you noted.  Whether it's required is another question.  ReiserFS is
> absolutely loaded with fuzzer bugs.

Can we apply this patch as-is? Since this is currently 5th top crasher,
applying this patch as soon as possible helps utilizing syzbot's resource
for finding further bugs.
