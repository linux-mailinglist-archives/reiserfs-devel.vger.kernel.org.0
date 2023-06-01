Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98EEF71F3FB
	for <lists+reiserfs-devel@lfdr.de>; Thu,  1 Jun 2023 22:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232235AbjFAUim (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 1 Jun 2023 16:38:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbjFAUil (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 1 Jun 2023 16:38:41 -0400
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E91A0134
        for <reiserfs-devel@vger.kernel.org>; Thu,  1 Jun 2023 13:38:39 -0700 (PDT)
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-33b50b22030so10445605ab.3
        for <reiserfs-devel@vger.kernel.org>; Thu, 01 Jun 2023 13:38:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685651919; x=1688243919;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=abFcT4+hDaiL7vl8OJ3SqlfajtLNvtNMMTdrV5w1YEs=;
        b=g0DYZnlz7fa+DGEh9rWSQRKZxEnRbnh8W1mD5qRW2a+KM3ae88TYGE7d1QE+72HZfn
         pO7HCcNdRcGQ/rnNZIeeSErjYqfdGEcu/SOPrV2Tkjv+7WzML6MqfrRfYFQ1hsfptzM0
         uofcBtI4vm9zvIIT9oQmKW3HMJ1INJFYgTCU+D30sf8XyaQYbcRsSNsb6V+E/i40q6ay
         Wp1OZKyNDFoUWnBhZh578QHtyRjeFAHB4mfVN/IqaBpJ7v0nO/n27fKrlqOBYIGJot4e
         QCVmUKNGAjcMqQ6gmKRloVtCy+WMRPpiTbxUjNJSUakXml0Xc51Zo/XYeW/P/5FDAw1A
         Lx0g==
X-Gm-Message-State: AC+VfDxf3KquxfOfp4e1Vd2G3nn3g0k2souMEtpuywqb6mdUiIP31caw
        BC8kjVGhNagFWVbDsipgm0AL+5OjJt4mCCsJSuN1NoVJIxO8
X-Google-Smtp-Source: ACHHUZ4mES9mMqLcqY4/ltDAP65fIJ5pUXbWdR7w/ZbmJ03JHOgDKUP6/2iyiQFWhfCdpZ/4HP7e6dMELDh8utjSqjE5gqzNQOjd
MIME-Version: 1.0
X-Received: by 2002:a92:d581:0:b0:331:9a82:33f8 with SMTP id
 a1-20020a92d581000000b003319a8233f8mr3146924iln.3.1685651919186; Thu, 01 Jun
 2023 13:38:39 -0700 (PDT)
Date:   Thu, 01 Jun 2023 13:38:39 -0700
In-Reply-To: <8a48ede1-3a45-7c3c-39e9-36001ac09283@huaweicloud.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000dbb63805fd176bc6@google.com>
Subject: Re: [syzbot] [reiserfs?] possible deadlock in open_xa_dir
From:   syzbot <syzbot+8fb64a61fdd96b50f3b8@syzkaller.appspotmail.com>
To:     hdanton@sina.com, jack@suse.cz, jeffm@suse.com,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        paul@paul-moore.com, reiserfs-devel@vger.kernel.org,
        roberto.sassu@huawei.com, roberto.sassu@huaweicloud.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
checking file fs/reiserfs/namei.c
patch: **** unexpected end of file in patch



Tested on:

commit:         929ed21d Merge tag '6.4-rc4-smb3-client-fixes' of git:..
git tree:       upstream
dashboard link: https://syzkaller.appspot.com/bug?extid=8fb64a61fdd96b50f3b8
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10efc079280000

