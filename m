Return-Path: <reiserfs-devel+bounces-175-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E48BC7F77
	for <lists+reiserfs-devel@lfdr.de>; Thu, 09 Oct 2025 10:14:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3832E4F5DC3
	for <lists+reiserfs-devel@lfdr.de>; Thu,  9 Oct 2025 08:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC221DF26A;
	Thu,  9 Oct 2025 08:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=commetrax.com header.i=@commetrax.com header.b="f7HhEZrl"
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail.commetrax.com (mail.commetrax.com [141.95.18.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31662AD16
	for <reiserfs-devel@vger.kernel.org>; Thu,  9 Oct 2025 08:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.95.18.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759997483; cv=none; b=bKnyWKPXEu8XgNEO09D3zuWqT5OBh+WR0bSxD6H/SjnCE2qO8J3QJbFi6iLmcjHl6mzIkjLBCDgSiuZ7xH2h3Sw+0oYH42wt0ZiVzGLksYGr+WiPyj27Ffm41OJ/VXaqVCmubKBmuG1H8zyxjwZ9G87ez5easb6yjCR6/5B1Z6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759997483; c=relaxed/simple;
	bh=M2z+nFeXqIRcbI6rcgrOtIQjqLLid9ZQ1XheJsIeFLM=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type; b=Amn86CGcE84ULVYLo87cjqr+w1bZxH0//pxLmRtEMIKs4ZDx9o3uKQFoBWaoPL4A64NXeH5VullVUv9tW7uvbm1FgNYczqAAeb/o4S5IN36AVoEyXrRAVm3UVVSqEhs+SyF/Ajp5Ouwl0TuECZAmD5H3zSdp93bgmptf0pwNUBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=commetrax.com; spf=pass smtp.mailfrom=commetrax.com; dkim=pass (2048-bit key) header.d=commetrax.com header.i=@commetrax.com header.b=f7HhEZrl; arc=none smtp.client-ip=141.95.18.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=commetrax.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=commetrax.com
Received: by mail.commetrax.com (Postfix, from userid 1002)
	id 958842463A; Thu,  9 Oct 2025 10:10:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commetrax.com;
	s=mail; t=1759997473;
	bh=M2z+nFeXqIRcbI6rcgrOtIQjqLLid9ZQ1XheJsIeFLM=;
	h=Date:From:To:Subject:From;
	b=f7HhEZrlcmOkEBPS4eRjlkRCgp0EjdosWicKx+oPu4jWOwFDmaRGLsYPRHLKr1oHy
	 zEIpUYWN4hw6rsvjhwg4BVcde47yqlkTlKVb0Y65ibdY3bgsVPlngEByLC2uAqaOk3
	 MhZIeTM2nJD/tFEE+GS6hP0sWsFBEaqn/2R8WJimp+ir9ALI2avdyXjpmjPGVd1t5Y
	 ZpvSGRM4D//VzaTmu2qMHEWh2rHEudaTgUp8JoT0gwM6m93/0TeH34XQl58zLNaIqj
	 7E+/4hinXBQbPdKBbOrerAyigImYLaK6p1FIPVjCuoOJlR5UjJNE6kK65Xa0qndDQe
	 IdzxrvqC1ocIQ==
Received: by mail.commetrax.com for <reiserfs-devel@vger.kernel.org>; Thu,  9 Oct 2025 08:10:38 GMT
Message-ID: <20251009084501-0.1.c6.15xsa.0.ekv9xh8pe7@commetrax.com>
Date: Thu,  9 Oct 2025 08:10:38 GMT
From: "Luke Walsh" <luke.walsh@commetrax.com>
To: <reiserfs-devel@vger.kernel.org>
Subject: Welders ready to work
X-Mailer: mail.commetrax.com
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

we support companies in carrying out industrial projects by providing wel=
ding and assembly of steel structures =E2=80=93 both on-site and in-house=
=2E

In practice, this means we enter with a ready team of welders and fitters=
, take responsibility for preparing the components, their installation an=
d quality control.=20

The client receives a complete, safe and timely delivered structure.

If you have projects that require steel solutions, we would be happy to t=
alk about how we can take over this part of the work and relieve your tea=
m.

Would you be open to a short conversation?


Best regards
Luke Walsh

