Return-Path: <reiserfs-devel+bounces-163-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDF69C7CF0
	for <lists+reiserfs-devel@lfdr.de>; Wed, 13 Nov 2024 21:31:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27A77B24D42
	for <lists+reiserfs-devel@lfdr.de>; Wed, 13 Nov 2024 20:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F46200B9B;
	Wed, 13 Nov 2024 20:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYV1xWbc"
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BFB18A6C5
	for <reiserfs-devel@vger.kernel.org>; Wed, 13 Nov 2024 20:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731529879; cv=none; b=gdQpJXqhzQ+tAhaHGbRmsT/FaXsc2l+Y/JSejPf4eCzVBT66yU4AVhMd46QbjlR+l6OKnK0cb1t1cK+qGqYHnL87puy4Ncdu+/tPXXf2DdiB0kN75nAf2/k6kPLDhJELGzXUAJ3Aivpfi7EEl+Ab9rbTLsNVnk+GAG+Wvx5WzSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731529879; c=relaxed/simple;
	bh=JT3Fnn+L8Ybz9D5+/h/C3NQ5E24435/lQ8oK2YfhJmI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SqiEA4DJEGUip9B4g/+U77fbV9OF01q6n9yT39mqhzQBHc6cE3mads2s1KQAzsmoY1RWSAy6sTwzny9NxzDewdJFtc9h93m9V3eybE6ukIJUF4+ZuqH7RMb42ktN4cGsJ1is9zbcv3OMJfBIcHsRYvKUE71/DQE8ZV7zG56JCp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYV1xWbc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9EB8FC4CED2
	for <reiserfs-devel@vger.kernel.org>; Wed, 13 Nov 2024 20:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731529876;
	bh=JT3Fnn+L8Ybz9D5+/h/C3NQ5E24435/lQ8oK2YfhJmI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iYV1xWbcI48oXHQJXlFA43nAP8lpXicyg4mrfxoaBi10M3Fw6oJMg2N8Nj6pzUPyI
	 Nb0D7j6CXpZkABaQXb9IEHWR5VH7RkjHkm8C1l5Z83EeSaPUcLJsn1xmMhrbcZGysU
	 +10/j8hEY6AUYlmJdwyZxBCiDIKuAUtjg1buiok56kkdEuRSbUl0VVGFTYxfHEvWyb
	 6+MppPmelEdK/ZFFdS9whFFL3PGXb7Vdd51bfxB+UWIEcL8Aowlmn/XIyQ8o9GEZYt
	 OVoCTHkm6srAUMuxdOFrQ0BEztL3zeNT9gFly0S2dPnq0KVT3zRJfKbfQjbHyjpRFF
	 srVluxLyi7Dbw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 94616CAB785; Wed, 13 Nov 2024 20:31:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: reiserfs-devel@vger.kernel.org
Subject: [Bug 219497] stress-ng file size stressor causes reiserfs panic
Date: Wed, 13 Nov 2024 20:31:16 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: File System
X-Bugzilla-Component: ReiserFS
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kernel@nerdbynature.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: reiserfs-devel@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219497-695-UADLrIVvfw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219497-695@https.bugzilla.kernel.org/>
References: <bug-219497-695@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D219497

Christian Kujau (kernel@nerdbynature.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kernel@nerdbynature.de

--- Comment #1 from Christian Kujau (kernel@nerdbynature.de) ---
duplicate of bug 204263?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=

