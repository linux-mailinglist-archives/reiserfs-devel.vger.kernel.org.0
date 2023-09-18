Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34D377A4ED1
	for <lists+reiserfs-devel@lfdr.de>; Mon, 18 Sep 2023 18:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbjIRQ1Y convert rfc822-to-8bit (ORCPT
        <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 18 Sep 2023 12:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbjIRQ1F (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 18 Sep 2023 12:27:05 -0400
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EF0F35253
        for <reiserfs-devel@vger.kernel.org>; Mon, 18 Sep 2023 09:24:21 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id E9AD862348B3;
        Mon, 18 Sep 2023 15:58:28 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id vDhG-KsmSMfP; Mon, 18 Sep 2023 15:58:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id 5C6516418DB1;
        Mon, 18 Sep 2023 15:58:28 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id tdtM0oZv5-6J; Mon, 18 Sep 2023 15:58:28 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
        by lithops.sigma-star.at (Postfix) with ESMTP id 38E346418DAD;
        Mon, 18 Sep 2023 15:58:28 +0200 (CEST)
Date:   Mon, 18 Sep 2023 15:58:28 +0200 (CEST)
From:   Richard Weinberger <richard@nod.at>
To:     Jan Kara <jack@suse.cz>
Cc:     Peter Lafreniere <peter@n8pjl.ca>,
        linux-um <linux-um@lists.infradead.org>,
        anton ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        reiserfs-devel@vger.kernel.org
Message-ID: <1673328726.54148.1695045508095.JavaMail.zimbra@nod.at>
In-Reply-To: <20230918132614.zmmuc72purc2psik@quack3>
References: <20230910232640.113938-1-peter@n8pjl.ca> <20230918125744.4342-1-peter@n8pjl.ca> <20230918132614.zmmuc72purc2psik@quack3>
Subject: Re: [PATCH RESEND] um: Remove CONFIG_REISERFS_FS from defconfig
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Remove CONFIG_REISERFS_FS from defconfig
Thread-Index: k6PfwRWfei8ynhM8ygGzkHIfTtkrDg==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        T_SPF_PERMERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

----- Ursprüngliche Mail -----
> On Mon 18-09-23 12:58:26, Peter Lafreniere wrote:
>> ReiserFS has been deprecated for a year and a half, yet is still built
>> as part of a defconfig UML kernel.
>> 
>> According to commit eb103a51640e ("reiserfs: Deprecate reiserfs"), the
>> filesystem is slated to be removed in 2025. Remove it from the defconfig
>> profile now, as part of its deprecation process.
>> 
>> Signed-off-by: Peter Lafreniere <peter@n8pjl.ca>
> 
> Makes sense but I've noticed there are many more architectures that define
> CONFIG_REISERFS_FS in their defconfig (sh, powerpc, mips, m68k, ia64, arm,
> alpha). So perhaps we should do this for all of them when we are at it?

Yes, a combined patch makes in this case more sense.

>> 
>>  arch/um/configs/i386_defconfig   | 1 -
>>  arch/um/configs/x86_64_defconfig | 1 -
>>  2 files changed, 2 deletions(-)

For UML:
Acked-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
