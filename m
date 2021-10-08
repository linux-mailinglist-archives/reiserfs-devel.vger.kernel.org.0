Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B5C9426DB3
	for <lists+reiserfs-devel@lfdr.de>; Fri,  8 Oct 2021 17:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243195AbhJHPne (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 8 Oct 2021 11:43:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:47116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243155AbhJHPnW (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 8 Oct 2021 11:43:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0969660F6F
        for <reiserfs-devel@vger.kernel.org>; Fri,  8 Oct 2021 15:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633707687;
        bh=uyfImF8k27iVyXyiJjcEeVa6Op+B3tyE5j4ZLQdQLaw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WXCsUGp90hozhvAkHX5E6SXaX8NNn3OEDCMrG7UwrUTWmu9Uqy+N6KQMPYKBx5RiM
         r90P8lAackmo/BwvR8MiEWVkTCsT1hMw/XPJ6apt/7JG6kzv5mnVXwJF9hufFHb/Au
         Jq06wsnaDI5WwrDSBFdEbh88qz/6JTJ7YQKBc1E092PI6pn8jEbEhxoWmg79vA7fJt
         R6xfYUpEdgx8vWyl2EhuuL2OqOtXk5cpGL+gEGSn/MXWQds6K/eHwWR6xsTRbK99wL
         0+LauDpAli3P7pKEAkdLb1HeOAJiv3yJRs0SIBVTYARjxJQ3daldP+h7Z95CN5j1VY
         CxFLe9d3E2GtA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id EE51860FA0; Fri,  8 Oct 2021 15:41:26 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     reiserfs-devel@vger.kernel.org
Subject: [Bug 207971] Wrong permissions with cp -a and reiserfs mounted with
 acl
Date:   Fri, 08 Oct 2021 15:41:26 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: File System
X-Bugzilla-Component: ReiserFS
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: marco@nucleus.it
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: reiserfs-devel@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207971-695-sJHJUuieM5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207971-695@https.bugzilla.kernel.org/>
References: <bug-207971-695@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D207971

--- Comment #1 from Marco (marco@nucleus.it) ---
I also tried with kernel:
5.14.10
5.15-rc4

but the problem persists.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
