Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E59B065A8B4
	for <lists+reiserfs-devel@lfdr.de>; Sun,  1 Jan 2023 04:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbjAADP3 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sat, 31 Dec 2022 22:15:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbjAADP2 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sat, 31 Dec 2022 22:15:28 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFDA463ED
        for <reiserfs-devel@vger.kernel.org>; Sat, 31 Dec 2022 19:15:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5819260C6E
        for <reiserfs-devel@vger.kernel.org>; Sun,  1 Jan 2023 03:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4168C433F0
        for <reiserfs-devel@vger.kernel.org>; Sun,  1 Jan 2023 03:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672542926;
        bh=/HUlvnw6+1qrAmG337GtPrlFgjJtz+47jERx9tN97eo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ow9M/3S4ehIX//edEQ4SdL2ya2rELcrmDChyjY4ApcZTwUacVM05+vdhbxGBl8uFF
         u3K6u+hJYX5c56M7625QjTIOwRCRJxgClZbjOv7SIE7ZCgZamlzzu04gC4UTr9fZD8
         tNW/TVXwIsnMZ+OgZkRS1+XChT98H49JMlemjb+gA1EYvFzg+xwvutIE1lY2wvTSVM
         miBFfjZJQNRkWU21gp4WPvoO6A/Fpkx0FNr4awb+pue7wUMwOlKnj9HtJLNdFFM8i7
         HJjtnWsXmPCXp3LevxhyMkcDe32n1eiTcJb9Abbed55lmE4dUtvuGyys1qMA1FvBML
         EfOuP4oZuTAAA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A31ACC43141; Sun,  1 Jan 2023 03:15:26 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     reiserfs-devel@vger.kernel.org
Subject: [Bug 216871] bug: use after free when journal read failed
Date:   Sun, 01 Jan 2023 03:15:26 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-216871-695-43ZCneJAHz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216871-695@https.bugzilla.kernel.org/>
References: <bug-216871-695@https.bugzilla.kernel.org/>
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

eriri (1527030098@qq.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|use after free when journal |bug: use after free when
                   |read failed                 |journal read failed

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
