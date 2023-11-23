Return-Path: <reiserfs-devel+bounces-1-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B24B47F568C
	for <lists+reiserfs-devel@lfdr.de>; Thu, 23 Nov 2023 03:48:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 652BE2812D4
	for <lists+reiserfs-devel@lfdr.de>; Thu, 23 Nov 2023 02:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC4717C4;
	Thu, 23 Nov 2023 02:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hvSHAbny"
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFD5EDE
	for <reiserfs-devel@vger.kernel.org>; Thu, 23 Nov 2023 02:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1445C433C7;
	Thu, 23 Nov 2023 02:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700707683;
	bh=rRbIXqjq8DKBA6vW+7glleky65j8TQodsqrm6IeWtY0=;
	h=Date:From:To:Subject:From;
	b=hvSHAbnyp9T6fpoDuaknXqifiGvG5vj5v9VvT2DTPIpLVEXkm92wBGY/z+bGo0zbq
	 rVt4frVgbQ/2lU/fiE3gB8n4VqHp0t+vYetxpROs3lp4OQarTQClpMuQa8DMfVOUWg
	 oA1TwzVqltLlH0x4FATDKETL7X/9ejMDW5POmiD4=
Date: Wed, 22 Nov 2023 21:48:01 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: reiserfs-devel@vger.kernel.org
Subject: PSA: this list has moved to new vger infra (no action required)
Message-ID: <20231122-curvy-crouching-jackrabbit-5db49a@nitro>
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

This list has been migrated to the new vger infrastructure. No action is
required on your part and there should be no change in how you interact with
this list.

This message acts as a verification test that the archives are properly
updating.

If something isn't working or looking right, please reach out to
helpdesk@kernel.org.

Best regards,
-K

