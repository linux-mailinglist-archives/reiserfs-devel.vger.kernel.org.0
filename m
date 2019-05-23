Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6721C28DA7
	for <lists+reiserfs-devel@lfdr.de>; Fri, 24 May 2019 01:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388006AbfEWXK0 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 23 May 2019 19:10:26 -0400
Received: from mail7.static.mailgun.info ([104.130.122.7]:51997 "EHLO
        mail7.static.mailgun.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387997AbfEWXK0 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 23 May 2019 19:10:26 -0400
X-Greylist: delayed 300 seconds by postgrey-1.27 at vger.kernel.org; Thu, 23 May 2019 19:10:25 EDT
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1558653025; h=Content-Transfer-Encoding: MIME-Version:
 Reply-To: Message-Id: Date: Subject: To: From: Sender;
 bh=6frnhBRsddaY56BraBem0jxL5GcmLZ9B610EQKLsdeg=; b=pGmo9u8vxB5soZjrBAZW4MDuPIR73e7i5HwtXLAh2+1UBCq6uUD9reNyvMzBmk/UHnCdtIYw
 U3wMuwf3n1zEb9hMl4bofvcQWpSzWFaeUlpunbkEi1bSnouZ49PSU3BEPgx+eQ8BWmp+vM5b
 jLJOdpnu8JqGbQnBYFtb8jsOtq4=
X-Mailgun-Sending-Ip: 104.130.122.7
X-Mailgun-Sid: WyIxM2M2YSIsICJyZWlzZXJmcy1kZXZlbEB2Z2VyLmtlcm5lbC5vcmciLCAiMTdiNTQiXQ==
Received: from huitzilopochtli.metztli-it.com (99-130-254-3.lightspeed.sntcca.sbcglobal.net [99.130.254.3])
 by mxa.mailgun.org with ESMTP id 5ce72733.7f2cda7180c0-smtp-out-n03;
 Thu, 23 May 2019 23:05:23 -0000 (UTC)
Received: by huitzilopochtli.metztli-it.com (Postfix, from userid 1000)
        id BCE843C53E0A; Thu, 23 May 2019 16:05:21 -0700 (PDT)
From:   Metztli Information Technology <jose@metztli.it>
To:     reiserfs-devel@vger.kernel.org
Subject: PATCH: Updated Reiser4 probe enabled against GNU Parted git://git.sv.gnu.org/parted.git
Date:   Thu, 23 May 2019 16:05:01 -0700
Message-Id: <20190523230502.12152-1-jose@metztli.it>
X-Mailer: git-send-email 2.20.1
Reply-To: jose.r.r@metztli.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org


Niltze [Hello]-

Just updated Reiser for patch against GNU Parted
git clone git://git.sv.gnu.org/parted.git

apply patch

./bootstrap

./configure

make

make install


Huelmati [Enjoy]!


-- 

Jose R R

http://metztli.it

---------------------------------------------------------------------------------------------

Download Metztli Reiser4: Debian Stretch w/ Linux 5.0.10 AMD64

---------------------------------------------------------------------------------------------

feats ZSTD compression https://sf.net/projects/metztli-reiser4/

-------------------------------------------------------------------------------------------

Official current Reiser4 resources: https://reiser4.wiki.kernel.org/
