Return-Path: <reiserfs-devel+bounces-177-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W92ZAI3LVWrutQAAu9opvQ
	(envelope-from <reiserfs-devel+bounces-177-lists+reiserfs-devel=lfdr.de@vger.kernel.org>)
	for <lists+reiserfs-devel@lfdr.de>; Tue, 14 Jul 2026 07:39:25 +0200
X-Original-To: lists+reiserfs-devel@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A3C751373
	for <lists+reiserfs-devel@lfdr.de>; Tue, 14 Jul 2026 07:39:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=suksangroup.co.th header.s=default header.b=qcWFT3zb;
	spf=pass (mail.lfdr.de: domain of "reiserfs-devel+bounces-177-lists+reiserfs-devel=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="reiserfs-devel+bounces-177-lists+reiserfs-devel=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=inbox.org (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 804DD3037226
	for <lists+reiserfs-devel@lfdr.de>; Tue, 14 Jul 2026 05:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA2032B10D;
	Tue, 14 Jul 2026 05:28:59 +0000 (UTC)
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from ns1.suksangroup.com (ns1.suksangroup.com [103.13.31.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508DE327BFA
	for <reiserfs-devel@vger.kernel.org>; Tue, 14 Jul 2026 05:28:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784006939; cv=none; b=JbvVfVpZuxS040V1oB7DYd+JzwKh70HY+LmytH1OpQ5SOjPoOhRF70SwQIf6xP06VXDmr0u33eJLiN+rLYQceFQD1PHpkvLwPHByqTn65cXt1OLsqnS+kNu9y2UUbk6voQzV05nmGrVElSOO+5KoJ9QMXeXedLgaoxVIFz0oULU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784006939; c=relaxed/simple;
	bh=Y1tSWKGfI4lmtPDv+KvRkU5kE73kfvnU4qyp+0TaJTU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g/OkxQ4m2Uw3e8Nw7NS1UydI0Rnaec+YzhJDK5z9LjJZyBqCB3JoGU9S/riWi5nro92HPAsI92eNlX+opZQTFZkiLLarUN4XwjtzIza72NsiRUf+uENTjjaIrLyKEZspip7Y/r5eV/tdmJ4mYbAawmouVJR+p8US7SMdeCsxlxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=inbox.org; spf=fail smtp.mailfrom=inbox.org; dkim=pass (2048-bit key) header.d=suksangroup.co.th header.i=@suksangroup.co.th header.b=qcWFT3zb; arc=none smtp.client-ip=103.13.31.55
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=suksangroup.co.th; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Y1tSWKGfI4lmtPDv+KvRkU5kE73kfvnU4qyp+0TaJTU=; b=qcWFT3zb1nXEVf41481vv4soEc
	TAtEMSSTzyJpsRIPozmxBPN6d2f9EbwpBeuLq83Pvd1DRdgZDIH48sqkge4hqWxKCApY8c2UM1h/E
	QcF9i6ue/tZnPjLs9uri5H2/fA6Obp4NIkA1Vn4L/7jluJVreIg0U7qiPl2l3OIG9/hKjPqMbgi42
	mAJpCv5PIONBZrhONomIakwLT1+0DvZcfwENzgrOYID1S7uK65uwADpkaDrnoXing84TsasCEWY7T
	oZHgW00JMv49gPIoSqx2EeTpLj6MyMm1++MRxvVWX9/A5EosRJpC8RIEFA1E48P8jQA7xSkqtql2N
	pDyA14KQ==;
Received: from [207.189.26.187] (port=64610)
	by ns1.suksangroup.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <info@inbox.org>)
	id 1wjVhR-0000000G0Iu-0sIV
	for reiserfs-devel@vger.kernel.org;
	Tue, 14 Jul 2026 12:28:56 +0700
Reply-To: hanns.schofield@lexcapitalgrowth.com
From: Harry Schofield ESQ <info@inbox.org>
To: reiserfs-devel@vger.kernel.org
Subject: Dear reiserfs-devel@vger.kernel.org, project stage
Date: 14 Jul 2026 00:28:52 -0500
Message-ID: <20260714002852.2BA2C00C92C0B361@inbox.org>
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - ns1.suksangroup.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - inbox.org
X-Get-Message-Sender-Via: ns1.suksangroup.com: authenticated_id: smtp@suksangroup.co.th
X-Authenticated-Sender: ns1.suksangroup.com: smtp@suksangroup.co.th
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.94 / 15.00];
	ABUSE_SURBL(5.00)[lexcapitalgrowth.com:replyto];
	R_DKIM_REJECT(1.00)[suksangroup.co.th:s=default];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[inbox.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:reiserfs-devel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-177-lists,reiserfs-devel=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	HAS_X_AS(0.00)[smtp@suksangroup.co.th];
	GREYLIST(0.00)[pass,body];
	HAS_X_SOURCE(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_X_GMSV(0.00)[smtp@suksangroup.co.th];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER(0.00)[info@inbox.org,reiserfs-devel@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[suksangroup.co.th:-];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[info@inbox.org,reiserfs-devel@vger.kernel.org];
	HAS_REPLYTO(0.00)[hanns.schofield@lexcapitalgrowth.com];
	TAGGED_RCPT(0.00)[reiserfs-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_X_ANTIABUSE(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	MISSING_XM_UA(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[inbox.org:from_mime,inbox.org:mid,lexcapitalgrowth.com:replyto,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57A3C751373


Re:Good day reiserfs-devel,

Please let me know if this is best email to send you the project=20
info.

Kind regards,

Harry Schofield, ceMBA



