Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D8F97207C8
	for <lists+reiserfs-devel@lfdr.de>; Fri,  2 Jun 2023 18:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236232AbjFBQjg (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 2 Jun 2023 12:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236070AbjFBQjf (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 2 Jun 2023 12:39:35 -0400
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A61B1B8
        for <reiserfs-devel@vger.kernel.org>; Fri,  2 Jun 2023 09:39:33 -0700 (PDT)
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-7748b05ab49so115084439f.1
        for <reiserfs-devel@vger.kernel.org>; Fri, 02 Jun 2023 09:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685723972; x=1688315972;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jQGoC7vlZtXDhLEgYv1SxcnvHwW74JFQkSojIS2V8g0=;
        b=gkD7V0WZvnJ675zMTJHrb7iIoj2C2hs+Yz/gSpo8ShuUD/9sn1tuki/nXMk4NCgQos
         prugv5y+M3q0Awjz5s3IBierPMa5h1qfkhhdELHuUiJNAtOQyM1AvaBS7uQQhXHDRILZ
         e7nB6RgwDdtFfIwuUDE9WNw4t7wLAiM4qI8Bt7FVl73OxbkaC9S9rZDDxJa155GcAOJL
         A7DI5TULEYIz+kbL5kfeoPP9M8ksUmCV2N3IPmLdOinzvtcAvuCr4jiF+ltTKiu7L08p
         sYpn4FOn5l/IG28VEOEYdYtR+Xcy/NVIaDb3WanE+NhLZ9Qfrb8j25A0OTHNvep3iJjb
         ETLA==
X-Gm-Message-State: AC+VfDyY3izwrBaci/4Jv70o1iBWNoOwn4s2WLpYza2LQEofKpTukOxa
        f0XofrBlmS4pT0GDql8z8jUSL5+omYceJesNT7k1Xg/yHjdH
X-Google-Smtp-Source: ACHHUZ6HfjrvFZwBLUA1rgPFDPGlIB6ktQF0HD8+Jk0f0mP7NTLlW+yzUOsQpQQ1SxCI/wQRIIkKKwq6mZsV05N5tdLLaJF2T/rJ
MIME-Version: 1.0
X-Received: by 2002:a05:6638:10ea:b0:41d:77ab:bc2 with SMTP id
 g10-20020a05663810ea00b0041d77ab0bc2mr924254jae.4.1685723972618; Fri, 02 Jun
 2023 09:39:32 -0700 (PDT)
Date:   Fri, 02 Jun 2023 09:39:32 -0700
In-Reply-To: <4aa799a0b87d4e2ecf3fa74079402074dc42b3c5.camel@huaweicloud.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000093d48c05fd2832a7@google.com>
Subject: Re: [syzbot] [reiserfs?] possible deadlock in open_xa_dir
From:   syzbot <syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com>
To:     hdanton@sina.com, jack@suse.cz, jeffm@suse.com,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        mingo@redhat.com, paul@paul-moore.com, peterz@infradead.org,
        reiserfs-devel@vger.kernel.org, roberto.sassu@huawei.com,
        roberto.sassu@huaweicloud.com, syzkaller-bugs@googlegroups.com,
        will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com

Tested on:

commit:         4432b507 lsm: fix a number of misspellings
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git next
console output: https://syzkaller.appspot.com/x/log.txt?x=16b47dd1280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=178a8c28652084e1
dashboard link: https://syzkaller.appspot.com/bug?extid=8fb64a61fdd96b50f3b8
compiler:       Debian clang version 15.0.7, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=102f6ab6280000

Note: testing is done by a robot and is best-effort only.
