Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3275C74CEC3
	for <lists+reiserfs-devel@lfdr.de>; Mon, 10 Jul 2023 09:44:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbjGJHoB (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 10 Jul 2023 03:44:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbjGJHny (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 10 Jul 2023 03:43:54 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8790D118
        for <reiserfs-devel@vger.kernel.org>; Mon, 10 Jul 2023 00:43:50 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f86840c45dso2982e87.1
        for <reiserfs-devel@vger.kernel.org>; Mon, 10 Jul 2023 00:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688975029; x=1691567029;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nS9m98kU7hDON5ryRvZOg6LMxfmYBsr98C/Sd1A13CI=;
        b=RRqBnnb//nW6t3nRLasnJxQx/GuIxdAwXp2wOP+BcyAvcthgWgkd+sTtfie/kr9sAd
         GEA+ScniPM6o+JkXSqNJOQPrsNrlUwGtSErq4Ck12+nVA1sryxW0D9j2QH2+W0Osm37g
         wWZ41cJxErNPAQerVielB8/hlK1eqCAna5mAUYY1dO3atmeeNXzMNhTCbb2V12JU+rhO
         VXztVnfWWTLxZRc43VtumJ69UvXhYIeU4FvO62r+Qk7YG3h679bl3vSofsRls4sGjdhb
         hQ9Nbyuq5rvLS3xQB2FtQOB4lM9k+CkCX9t940ApquPV0ZZfzq+i5NLGjwJvT9hbo8jm
         TpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688975029; x=1691567029;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nS9m98kU7hDON5ryRvZOg6LMxfmYBsr98C/Sd1A13CI=;
        b=MJfBX24ThGUqasjVhiAoW5wiHI0LvcgbMy6979J1gLcb9CGC7rbtd0V2KkYt1pZ4mG
         teqNaE1lyMYJra4h5oIIMsFMN8rWP5Eq6POQCME/MRQLhzxHhEHVrKT4jKIONZBOmG7a
         o8lAWZjGg8v2Xm2FcJhPjUpvEPGbkaunN7aGvkZHAlLtKEpO+XDBv8JVhw/+I5/3xTpu
         1DKaHC5ekbIMs5G05rHtKmC+xN/I7lq+b8O2QK9o4ZgNG2DbF4It6bnQTeEQsszvuOEi
         BJlNJ4F3BPXDT8nqykUMz0r9Ibo097Y1l3Zu2JcfFPcHylEd5iHYx8UMMOnaG7hXOg5k
         rZ1A==
X-Gm-Message-State: ABy/qLZxBX0Dw031OAQHj8f0x8XGGHwGcENFQDJJIx+MiqeegWcw5ajH
        61Rg2ZzHqDxMdrTlwOoPAceooSOHHp9crT3rUpDcZQ==
X-Google-Smtp-Source: APBJJlG5VAfVRlULynbvxJ7b5YEii6Bpwwntm0JXdb0Ee51roYMqD4NIWeivc+EFp+fX/qxqkVDlqpnoKHZ0tC3zfmY=
X-Received: by 2002:a05:6512:480d:b0:4ec:5157:bb37 with SMTP id
 eo13-20020a056512480d00b004ec5157bb37mr66299lfb.2.1688975028537; Mon, 10 Jul
 2023 00:43:48 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000002373f005ff843b58@google.com> <1bb83e9d-6d7e-3c80-12f6-847bf2dc865e@google.com>
 <CACT4Y+akPvTGG0WdPdSuUFU6ZuQkRbVZByiROzqwyPVd8Pz8fQ@mail.gmail.com> <61032955-4200-662b-ace8-bad47d337cdc@os.amperecomputing.com>
In-Reply-To: <61032955-4200-662b-ace8-bad47d337cdc@os.amperecomputing.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 10 Jul 2023 09:43:36 +0200
Message-ID: <CACT4Y+YAyK02ORyzS79ub+XOK6x5LV8_2k4aztwzjP=0dm--RQ@mail.gmail.com>
Subject: Re: [syzbot] [mm?] [reiserfs?] kernel panic: stack is corrupted in ___slab_alloc
To:     "Lameter, Christopher" <cl@os.amperecomputing.com>
Cc:     David Rientjes <rientjes@google.com>,
        syzbot <syzbot+cf0693aee9ea61dda749@syzkaller.appspotmail.com>,
        42.hyeyoo@gmail.com, Andrew Morton <akpm@linux-foundation.org>,
        iamjoonsoo.kim@lge.com, keescook@chromium.org,
        linux-fsdevel@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        penberg@kernel.org, reiserfs-devel@vger.kernel.org,
        roman.gushchin@linux.dev, syzkaller-bugs@googlegroups.com,
        Vlastimil Babka <vbabka@suse.cz>, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Thu, 6 Jul 2023 at 20:33, Lameter, Christopher
<cl@os.amperecomputing.com> wrote:
>
> On Mon, 3 Jul 2023, Dmitry Vyukov wrote:
>
> >> This is happening during while mounting reiserfs, so I'm inclined to think
> >> it's more of a reisterfs issue than a slab allocator issue :/
>
> Have you tried to run with the "slub_debug" kernel option to figure out
> what got corrupted?

Can slub_debug detect anything that KASAN can't?
I would assume KASAN can detect more bugs (e.g. stack/globals) and
report way better. And it was already enabled in the config.
