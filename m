Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93004A72AB
	for <lists+reiserfs-devel@lfdr.de>; Tue,  3 Sep 2019 20:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbfICSm0 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 3 Sep 2019 14:42:26 -0400
Received: from mout.web.de ([212.227.17.12]:41877 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726090AbfICSmZ (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 3 Sep 2019 14:42:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1567536134;
        bh=3IcwgWfePYuRvZdhAhTPFnsEeC4pHahDVAulfsv8+/s=;
        h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
        b=WcjriP/9xdtN+GN4rVegSIynHSBCV0p8sPR6eapV3Mlv6QC95g2fyjFtQEfYyFFWz
         SnQxwVZqqVQui/8sW3f+ZLQjdl8SqNtheyyleZwLxyihFsddVKXAVxhxkRmwyMJEQ3
         XNs3hvKmR8QSanJYIaXjGjI03HwwC3uER8IXFSI0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.133.133.43]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M7KN0-1iPTxw1sCU-00x0fh; Tue, 03
 Sep 2019 20:42:14 +0200
To:     reiserfs-devel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
        "Darrick J. Wong" <darrick.wong@oracle.com>,
        Deepa Dinamani <deepa.kernel@gmail.com>,
        Jeff Layton <jlayton@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
From:   Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] reiserfs: Delete an unnecessary check before brelse()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <b3b79aaf-279b-4f5a-b9ee-3a38b74da98e@web.de>
Date:   Tue, 3 Sep 2019 20:42:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FgPz5Y25Kl9Ov+158itoVTDquuBdr4ympyzcpvUNQ4spL4AlCIx
 BG5qoczVG+wURrQcLsE7+eNXxsHergrUCNmiidU6oL0Z9I+hOGBUec0vFimQTmr14UfoWq2
 bg3S28/CYStye1RfD65q+/iYG/cmSZlUQIEnSBN303VNBJOC7GyYncWlRlbednRT409T5mg
 5FHj6SyfArd4XFSeKQOnQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+GrEmTzxDqY=:sKrY3r/LaEsNnh2ho5BYdX
 /jSkeANyW8SfGxl+9FziAmBcU9BXF8p9PBHwB8TjDeWZF/gcEab+x5XHoYTQ/CJoQsv0WVRL7
 +gMEjO8oBjS61JoCn8O1c6e9TZPrCJKXNox8YHxmo9u7O0cEjW+MJw+PgRZ9ym9TGkbMnCMP1
 CeS6qwVhPQ64ADQXqMhL2Yq7Z9nUvsPw7ZdmhM2fJyTWKy9z2e1RIpDCpgq4Vg8MPzezFIHd0
 k34G11NBl0XlW5bAxyWDqp1Qq9hCc3xns8lOLK0zI8IPkXWbsoj11AFrm60bIiiKmlue3h+iy
 lt3dq3To3McvPxR7iRDMaXS2Bg3VydCgHSaSoj2XguRqBe73uPn57zbJgKMYgxlnac+Y/XbSB
 d3mPsdkhUiH/Uk9YELCfX/eV9o86FkNIY3Xug0N5dBc5rb+esP27TODbRswU3P3P+vnVxG7Mj
 JW1BLl4/nSh9378S0YMuij8v3E2rnoVmFhz+t/PvVoLlriayIiJnfBl9z8a64t/zOn15/pE5B
 J88YpWh8lXvWYU/+73B5KWJ841dmYxp2RMxcAr9GWDw4NqxyXaBmIEOLT/cCWVclyMx5B5ezv
 USG3FD9Vrkr+RcsTGcK5thAai1vmXgn9EY+7WRSCwbpLtZdmiZbZEnheqj7r/8MdYIPUqOFzV
 ceHUxyQ0iRcdYQ3+DYYjbhnud5H8mdSVBwvxoi85nRp5q6vzO9B11Xe2AhlIqpYsA+MO/DgDQ
 wf6IHtF1HXxqHcYuNQQfJTnN7L8aVpGzQcBSxGuTA3bHjsa64XHfJ1fsdnGSP9ydncRZ5pvif
 d9sL46+hqqp9RvWixyCC84v5qzdyu3O+e4oWKphyq/0GQ55GtjeX+/KcGh3aL80/+h0iwM9YK
 hmmIFOMedmxlbo7JPov5iixNWd9zVhPA0js3u3cs6abMBbpcPVQxhZVlq8HT2bbgDTbk4mx4M
 obtRlICgUdgr+uWHZ/e4ROrJEszySK8h5VwvadF0RP3vU6NISI2L1S6Le2URUk1LkoNnNUMIp
 VtfDyaH+H0aehGao4q32C7vCIueKQPGusN1Lr6KDWYvDf9/KFgNrDyAk3q2RI1UOEyEBIBmHJ
 pBMTBCRh96dDyybzJtkesbZZbilkUo8OuUstxBMKUmAuHvDizetJzJz6yjcz1/6+a7VOQ2N1O
 O59QvDLIgMWRQi2YqTLiwcJ6A5eWMXGbZhZzJ4nibl4iHCZA==
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 3 Sep 2019 20:00:16 +0200

The brelse() function tests whether its argument is NULL
and then returns immediately.
Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 fs/reiserfs/super.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index d69b4ac0ae2f..b412ef9a24a6 100644
=2D-- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -2229,8 +2229,7 @@ static int reiserfs_fill_super(struct super_block *s=
, void *data, int silent)
 	reiserfs_cancel_old_flush(s);

 	reiserfs_free_bitmap_cache(s);
-	if (SB_BUFFER_WITH_SB(s))
-		brelse(SB_BUFFER_WITH_SB(s));
+	brelse(SB_BUFFER_WITH_SB(s));
 #ifdef CONFIG_QUOTA
 	{
 		int j;
=2D-
2.23.0

