Return-Path: <reiserfs-devel+bounces-168-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 701BD9F0479
	for <lists+reiserfs-devel@lfdr.de>; Fri, 13 Dec 2024 06:58:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D52A188B095
	for <lists+reiserfs-devel@lfdr.de>; Fri, 13 Dec 2024 05:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A7B6F30F;
	Fri, 13 Dec 2024 05:58:08 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from arara2.ipen.br (arara2.ipen.br [200.136.52.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB2C18A6B7
	for <reiserfs-devel@vger.kernel.org>; Fri, 13 Dec 2024 05:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=200.136.52.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734069488; cv=none; b=EZPG87i6mizLFat4NBnuqeQVCLDpPlejQTbrCryO2LXHBfP7Mgk+TT7QW+tVZf8xzX+WRfxALl5Rws560UFWVAwmVakPNvvzZ0+HU/9p107RfgqTtZf1MCHvd9aMUOoUqCyGAkuybj5mx4P9G/8yz49Vs4KoIq8yaLyv3m0V9UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734069488; c=relaxed/simple;
	bh=Cgr97JBiSX1QIcd2ZZZsKVChGTY1ZlWJ/4AhaVFA7Wc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j0OV6Jch9jRLFZhW2VD5osiUAb0OTCxUs44GoA08DDCWz94aeGWEcS5zqlPC1sVBkW5A51Nu94mfzN6bqPIlF8KR1m0zx5wmcotrmMxgRQl7gscHi0eDoXOceBEbbOpKtH/61zpf9FsB2Ax9nJNl8f9b0J3YKK/iojuf6PP140c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ipen.br; spf=pass smtp.mailfrom=ipen.br; arc=none smtp.client-ip=200.136.52.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ipen.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ipen.br
X-ASG-Debug-ID: 1734069445-055fc729ec14861e0006-ahqbFZ
Received: from arara.ipen.br (webmail.ip.ipen.br [10.0.10.11]) by arara2.ipen.br with ESMTP id siDH7iKN87zfd2jc for <reiserfs-devel@vger.kernel.org>; Fri, 13 Dec 2024 02:57:58 -0300 (BRT)
X-Barracuda-Envelope-From: TCWM179891@ipen.br
X-Barracuda-RBL-Trusted-Forwarder: 10.0.10.11
Received: from ipen.br (unknown [102.129.145.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by arara.ipen.br (Postfix) with ESMTPSA id ADEF9FBE764
	for <reiserfs-devel@vger.kernel.org>; Fri, 13 Dec 2024 01:26:15 -0300 (-03)
Reply-To: t.mazowieckie@mazowieckie.org
X-Barracuda-Effective-Source-IP: UNKNOWN[102.129.145.191]
X-Barracuda-Apparent-Source-IP: 102.129.145.191
X-Barracuda-RBL-IP: 102.129.145.191
From: <TCWM179891@ipen.br>
To: reiserfs-devel@vger.kernel.org
Subject:  I urge you to understand my viewpoint accurately.
Date: 13 Dec 2024 12:26:11 +0800
X-ASG-Orig-Subj: I urge you to understand my viewpoint accurately.
Message-ID: <20241213122611.D6AEF5768A4F3B7D@ipen.br>
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Barracuda-Connect: webmail.ip.ipen.br[10.0.10.11]
X-Barracuda-Start-Time: 1734069477
X-Barracuda-URL: https://10.40.40.18:443/cgi-mod/mark.cgi
X-Barracuda-Scan-Msg-Size: 512
X-Virus-Scanned: by bsmtpd at ipen.br
X-Barracuda-BRTS-Status: 1
X-Barracuda-BRTS-Evidence: 34fbb5788938ad5710ad28835fd12206-499-txt
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=1000.0 tests=NO_REAL_NAME
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.45577
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------
	0.00 NO_REAL_NAME           From: does not include a real name

I am Tomasz Chmielewski, a Portfolio Manager and Chartered=20
Financial Analyst affiliated with Iwoca Poland Sp. Z OO in=20
Poland. I have the privilege of working with distinguished=20
investors who are eager to support your company's current=20
initiatives, thereby broadening their investment portfolios. If=20
this proposal aligns with your interests, I invite you to=20
respond, and I will gladly share more information to assist you.

=20
Yours sincerely,=20
Tomasz Chmielewski Warsaw, Mazowieckie,
=20
Poland.

