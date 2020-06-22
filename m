Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7EE203C34
	for <lists+reiserfs-devel@lfdr.de>; Mon, 22 Jun 2020 18:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729334AbgFVQIG (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 22 Jun 2020 12:08:06 -0400
Received: from sonic309-21.consmr.mail.ne1.yahoo.com ([66.163.184.147]:36769
        "EHLO sonic309-21.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726328AbgFVQIG (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 22 Jun 2020 12:08:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1592842085; bh=cK2qy9Lv5SAgMg9nAvfVmkJPj46H3ss3vOVyjpHm6Nk=; h=Date:From:Reply-To:Subject:References:From:Subject; b=oWjuVc/83/ZaLlB5MZZhtWR0obVUGscxyzwfmtjhkeRdYqgpHIaelYd0WrATEEcV4yldgRXoxF9Spu57cT//IxRtjXxx7yhVNjAnmrOUPWwpCyKYwTm5/QGGjFtVF+hJ0OtZDQNHmr967KGf8b5cbNlsWlc2l4IWKHwYLyF9HpeoSOGX0uRUOrHyY10czgbWyn+KKeLlOssOfKOaqRd3xMiCBs2AjOGmTvOepLEUy3lnLEzDxhj0M3xFU2luuPJ55DXd5EbN5zVQ1cK4C9+xAeKvzg2jiLdrmeeImlSsVuyz/rflV6OVUxJ2BVB2ZHRJl0idkvORDU8ks19kioOzOw==
X-YMail-OSG: BohzbckVM1lpzcvU9Q3XUi3MkVmU7OnqDbwydfssOh3uDhkn11ZawgjN27kA9OT
 sfkG88PHJb7q12uCe2KPQ7IACdvHPvRVmiKUO0KNpGWk9Po3xHqx5R.NhqfZ4sOZOwqT6cOEobJV
 NDNlX4Uh6LxFF7ep9gV3srBS6QBJiWRVizCk7zSA0.TsEPbnMJonL9prRWsF0zejIpzceAoJ6YyK
 _qI9fwYTUQ6sbA7ahA5zEsIGgyfQRQgdwr0O3.7mo1BBpUdivojeR3KiCg1iJNekjOK4PbpY6ID3
 VZjlqtK4khg0YfJIlxvwn2zmbyot37eu09FU4WlFBODsGcsCAFtfjLwTbvkCXEe75b.GqupX8h2R
 WMlTJPNOdj1RQjDP9Gq6Y7ePLarXYjvnRHMtGE87f.Yy83.guNocHgjG4gwFLl4VRT4ujbjDwzCX
 ZW8RCEcca44lh50tALWhZEeSe38.krbmYKt6dtUInxl9FYYqkf0AxvnBMIkevNlswzPwHDg8c.G1
 C5CycQmjKC.DlZFMUVCdZjx7TLPstgiDEPPEAgYGTt2zKrf53y5OkeezNMnO0NlHt8setdEs0Hnp
 l0HoABGGD78aNn97yrzqVz_SCYSeV_YtedCUP4XsoDe3x9OwHyqeDboypyp4xTILPL38JmDr3yhS
 U8hR.zS4ZLs9F.TcuEUlbCle0wbJDyN2iZpmRvSVYwJ49UULoiBmYOOG0kJWAkr72GGNW6e2_B.H
 6WRNbIgOkR1jtGYgOyRV79o.jn_C1jkme3h.2EeVEyvPrV.MpPDnVEvc8U0ApgntlXstLt05eTaJ
 ymzcr2YxhvsX3ELdDE9QpXoTB6wMWs22PaeiQ6MoH1YOD7UOXzwEsXoWyIoVqK43cHk6a5wZ.mgM
 9iC0A6xD3z2wD1e2FSGl7bYOLx4nZqiXnvXHrlt0HWP7S31haya9jtLExPCLz4I8A0G2qV.3GYVS
 tGq6gaKUiXoaBsfCVjGeEl8FBnf5Q0KuppLThJoEmTHHBud2MCpdV9LGA3g8bBYhuuxi45U5Z_WQ
 xTDM7YbcxX1_JrbrUC1G4fa0UEoAp2coQKpctRvoRlTfKrvp0lvrQofckNu4eOd9.BDhZt5JAfB2
 QXhgeuAgwX6yw5d8RI6A8ZqpBwEBuxtVY9jBD7FTZxb0jRxfbmkUwNpvLe5_Z.MtD.KNVrnG1W73
 Z_ovkVWohYV4PO_EqztONO.MuXmTE61MrdwhRi11HIwSBpup7q1YRiSa5rKPpeiua3bne65BGIwx
 EiwzggRUYMT2qLZJckdlupKM.WP2eQ4K3XrY_WbvlgIZTYLxDfCqWdTLxbRZXaDYRfg--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.ne1.yahoo.com with HTTP; Mon, 22 Jun 2020 16:08:05 +0000
Date:   Mon, 22 Jun 2020 16:08:01 +0000 (UTC)
From:   Karim Zakari <kariim1960z@gmail.com>
Reply-To: kzakari04@gmail.com
Message-ID: <372454334.1871221.1592842081568@mail.yahoo.com>
Subject: URGENT REPLY.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <372454334.1871221.1592842081568.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16138 YMailNodin Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org



Good-Day Friend,

 Hope you are doing great Today. I have a proposed business deal worthy (US$16.5 Million Dollars) that will benefit both parties. This is legitimate' legal and your personality will not be compromised.

Waiting for your response for more details, As you are willing to execute this business opportunity with me.

Sincerely Yours,
Mr. Karim Zakari.
