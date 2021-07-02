Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 341183BA27C
	for <lists+reiserfs-devel@lfdr.de>; Fri,  2 Jul 2021 17:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231865AbhGBPIT (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 2 Jul 2021 11:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231791AbhGBPIS (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 2 Jul 2021 11:08:18 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2D06C061762;
        Fri,  2 Jul 2021 08:05:46 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id v7so9827111pgl.2;
        Fri, 02 Jul 2021 08:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=lzeTdJJkCqv5mk9Gasn/+NrDrHS7Qalj8jBb3up29Zc=;
        b=Kkbk7AWBs4JpZjwH9Qna4U1kLDZHzbIKcEdUCwdclmma4xfgkw9rq2K8pbvLWKorca
         76RDSResPlYstHCyQPuJisbSgEj7jbNFqBy2XF7EUdwM5fUyCN8SsWZGkN7G0KMYh3sa
         TlBMDGe1IB8CrqwesdFF7eVIdiPjpScQAkuOA61S56E44VJHuh3Vcp7buwQAwV4LVpLj
         O/fJo+TANtvdK8hZSeMp3eB6jnUuS0/kDaKFJUUM1c0rzYbxSPZk5RgPHn+fgarzzWSP
         9QhY8AT0VSzbPusqZy7cOhEaL/neNMAwB7A5S4SQFd1n/sRI+8YudT1al6eUWLmKfxTb
         h5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=lzeTdJJkCqv5mk9Gasn/+NrDrHS7Qalj8jBb3up29Zc=;
        b=YGG3Ppp4WREHFXf26NVQKTt3o0TvOMTjqguhoOqBSgq7Xqdv93f6MpDawUAcPlFN5i
         58z9kYwHi1uSPg/rL+UaKCA6ftbW1mD5laY5St4RhYl8cyWRuSa5rK1bcz+ZH/R5WXMG
         H/xJvxQiQ+UmtEL8/oFrh2xfxBvk1/eblEU0Ki1QhL9mzy3+iIyuBpb1ywbcv+FcgVY+
         nBj3eYkqPYFRN82TvlMC8LJd5nDzBEg/r/oM1it6wJvrNkK2ueeLP5drIc0+qcVPh7V/
         jrHr55M9Wfef0XsqxamuaOjewnvwHA9lNq4VFtqUSo53jNGgwXDlG752qbdwixCX1LYW
         OUpg==
X-Gm-Message-State: AOAM532s0ibOWZQG2E4ZpvZhJKERxZQtT9pYmgPAvPPj8VbmOxyWApa9
        kaneh1kSWRWvYU6o1vz0czw=
X-Google-Smtp-Source: ABdhPJyEoV6BglneJZH8oaLFEYu1M4e9vr0Bt06inDSQr09mdE5PBYFr4BT9k/ihahZJ01yu8Ov7bg==
X-Received: by 2002:a63:4e05:: with SMTP id c5mr445037pgb.151.1625238346129;
        Fri, 02 Jul 2021 08:05:46 -0700 (PDT)
Received: from fedora ([2405:201:6008:6ce2:9fb0:9db:90a4:39e2])
        by smtp.gmail.com with ESMTPSA id y7sm3551508pfi.204.2021.07.02.08.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 08:05:45 -0700 (PDT)
Date:   Fri, 2 Jul 2021 20:35:41 +0530
From:   Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
To:     jack@suse.cz, rkovhaev@gmail.com
Cc:     reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Verify the items that we read from blocks
Message-ID: <YN8rRYxhZvAa+VxU@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hi,

I was trying to work on this[1] bug. After a lot of reading the code and
running it under gdb, I found out that the error happens because
syzkaller creates a segment with raw binary data in the reproducer[2],
that has the wrong deh_location for the `..` directory item. (The value
is 0x5d (93), where as it should have been 0x20 (32).)

I think that the solution would involve checking the items that we read,
and verify that they are actually valid. But this check could actually
happen in two places:

- First idea would be to check as soon as we read a
  block, and one way of doing that would be adding a wrapper around
  ll_rw_block that validates the leaf node blocks that we read. The
  benifits to this would be that since we're solving the problem at it's
  root, very few functions would have to be changed. But I don't know
  how much of a performance hit would it be.

- Second idea would be to do these validation checks lazily. This should
  be faster than the first idea, but this would involve changing the
  code at more places than in the first idea.

For how the validation happens, the first idea that comes to mind is
reading the item headers from the block that we read and verifying if
the header is valid, and if the items themselves are valid according to
the header.

It's very likely that better approaches to this problem exist, that I
wasn't able to think of. I wanted to discuss about this before pursuing
the solution any further. Would such a change be accepted?

If there are better approaches, or if I am looking at this bug from an
incorrect perspective, please let me know.

Thank you,
Shreyansh Chouhan

--

[1] https://syzkaller.appspot.com/bug?id=d8c00bae1644df59696f2d74d1955fd286691234
[2] https://syzkaller.appspot.com/text?tag=ReproC&x=13f9f338d00000

(PS: In the reproducer, the segment partition with data at 0x20011100 in
the execute_once function has the faulty directory item.)
