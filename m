Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7347E65A3E5
	for <lists+reiserfs-devel@lfdr.de>; Sat, 31 Dec 2022 13:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231802AbiLaMNv (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sat, 31 Dec 2022 07:13:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiLaMNu (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sat, 31 Dec 2022 07:13:50 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68998BCA5
        for <reiserfs-devel@vger.kernel.org>; Sat, 31 Dec 2022 04:13:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 24F29B8006F
        for <reiserfs-devel@vger.kernel.org>; Sat, 31 Dec 2022 12:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BCF46C433D2
        for <reiserfs-devel@vger.kernel.org>; Sat, 31 Dec 2022 12:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672488826;
        bh=lpEmogGHuf5QhhLyGxuwMpgBpZ7bHSyo4ePOCoIhhYQ=;
        h=From:To:Subject:Date:From;
        b=fma5Qft9P9ITZw14CA9IJb1a9FPs8XH4c4+5JWxxfaKzJCZ/tEAKCMD6cJoT9GQbk
         wmgDyvsghgMOP1T39kpZ6jQa0RcuaJqk48aLNAsRT3nHJwyr1yS1abMrsuLf1VS68V
         kEN5BgMQh0UWDrnMmw1raCInmTGLy2bC2tN+0PRffxeN38OkCQqSiqsf5ZMRb8M8jJ
         t/83WzvcTCuIbaHc8anXPVunx0A6n4uO7cS2SDsA+45KuggfkZ8gSxlXl7GaJY1JAj
         6nwte9XA2TeXBIYAr+OLfVghSKpU4O9BR74gvDfqetVbah+QZGECeIQRVrqW/WBlqa
         6nYTOoFZxetlg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A9FA9C43143; Sat, 31 Dec 2022 12:13:46 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     reiserfs-devel@vger.kernel.org
Subject: [Bug 216871] New: use after free when journal read failed
Date:   Sat, 31 Dec 2022 12:13:46 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: File System
X-Bugzilla-Component: ReiserFS
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: 1527030098@qq.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: reiserfs-devel@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216871-695@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216871

            Bug ID: 216871
           Summary: use after free when journal read failed
           Product: File System
           Version: 2.5
    Kernel Version: 6.0
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: ReiserFS
          Assignee: reiserfs-devel@vger.kernel.org
          Reporter: 1527030098@qq.com
        Regression: No

When reading the journal header block failed, journal_read return 1. But the
caller journal_init ignores the value and doesn't handle this case. It will
cause a UAF bug at fs unmount.

https://elixir.bootlin.com/linux/v6.0.1/source/fs/reiserfs/journal.c#L2399

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
