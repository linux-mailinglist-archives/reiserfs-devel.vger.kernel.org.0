Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6793E17A936
	for <lists+reiserfs-devel@lfdr.de>; Thu,  5 Mar 2020 16:49:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgCEPtp (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 5 Mar 2020 10:49:45 -0500
Received: from mail7.static.mailgun.info ([104.130.122.7]:23972 "EHLO
        mail7.static.mailgun.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726007AbgCEPtp (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 5 Mar 2020 10:49:45 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1583423384; h=From: Date: Message-Id: To: Subject: Sender;
 bh=2cS94RDIKMBihfeXkra6iSdP+ekTuIshR7t7TsD4qVo=; b=yTpIZ6ePZDZPlvMA2XdOI6hcS58d1LvaPOh9n72C0k5jCQ4aWfKKj0IoOHVsaV3qrNG6EBKO
 metr61xL7WG18Xl36tRFDsWsZ/sDfr0Vnu9kUOQYGYqcit1IUiGdogWjDvyeiZSEXZZz0+Nf
 ekVwBx8T33hwJK8tSRGSWgOHBt0=
X-Mailgun-Sending-Ip: 104.130.122.7
X-Mailgun-Sid: WyIxM2M2YSIsICJyZWlzZXJmcy1kZXZlbEB2Z2VyLmtlcm5lbC5vcmciLCAiMTdiNTQiXQ==
Received: from huitzilopochtli.metztli-it.com (99-130-254-3.lightspeed.sntcca.sbcglobal.net [99.130.254.3])
 by mxa.mailgun.org with ESMTP id 5e611f91.7fad629700c0-smtp-out-n01;
 Thu, 05 Mar 2020 15:49:37 -0000 (UTC)
Received: by huitzilopochtli.metztli-it.com (Postfix, from userid 1000)
        id 031CA525B567; Thu,  5 Mar 2020 07:49:30 -0800 (PST)
Subject: Reiser4, SFRN 5.1.3 formatting root fs to install linux distribution
To:     <edward.shishkin@gmail.com>, <reiserfs-devel@vger.kernel.org>
X-Mailer: mail (GNU Mailutils 3.5)
Message-Id: <20200305154933.031CA525B567@huitzilopochtli.metztli-it.com>
Date:   Thu,  5 Mar 2020 07:49:30 -0800 (PST)
From:   Metztli Information Technology <jose.r.r@metztli.com>
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Niltze Ed-

Regarding reiser4, software framework release number (SFRN) 5.1.3, version of reiser4progs-2.0.0 utilities, is
 mkfs.reiser4 -yo "create=reg40"
 still appropriate to formatting a rootfs (/) media and/or a partition prior to
installation of a GNU/Linux distribution, i.e., Debian Buster for AMD64?

I have already built/embedded the SFRN5 kernel into preliminary metztli-reiser4-sfrn5.iso, minimal netboot installation media
< https://metztli.it/buster-reiser5/metztli-reiser4-sfrn5.iso >
< https://metztli.it/buster-reiser5/metztli-reiser4-sfrn5.iso.SHA256SUM >
and, using the formatting command above, installed onto ~2TB and ~200GB VirtualBox instances with Reiser5 rootfs, i.e.,
< https://metztli.systems/system/media_attachments/files/000/000/161/original/ca7acd7030d7565b.png?1583319334 >
< https://metztli.systems/system/media_attachments/files/000/000/162/original/e3e043e640d5ee97.png?1583319358 >
as well as into a ~100GB physical partition with Reise5 rootfs. But I wanted to ascertain
the default format command for the hacked SFRN5 Debian installer (d-i) for Buster (stable) distribution prior to making the image public.


Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Buster w/ Linux 5.4.18 AMD64
---------------------------------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-------------------------------------------------------------------------------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/
