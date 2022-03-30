Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3EC4ECA0F
	for <lists+reiserfs-devel@lfdr.de>; Wed, 30 Mar 2022 18:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349057AbiC3QzT (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 30 Mar 2022 12:55:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349069AbiC3QzS (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 30 Mar 2022 12:55:18 -0400
X-Greylist: delayed 2871 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 30 Mar 2022 09:53:29 PDT
Received: from zsmtp-out1.bppt.go.id (zsmtp-out1.bppt.go.id [103.224.137.202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F9EE326D1;
        Wed, 30 Mar 2022 09:53:29 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zsmtp-out1.bppt.go.id (Postfix) with ESMTP id 49CB587907;
        Wed, 30 Mar 2022 22:33:54 +0700 (WIB)
Received: from zsmtp-out1.bppt.go.id ([127.0.0.1])
        by localhost (zsmtp-out1.bppt.go.id [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id SvuAnPWPfT_U; Wed, 30 Mar 2022 22:33:53 +0700 (WIB)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zsmtp-out1.bppt.go.id (Postfix) with ESMTP id 98EF287A23;
        Wed, 30 Mar 2022 22:33:53 +0700 (WIB)
DKIM-Filter: OpenDKIM Filter v2.10.3 zsmtp-out1.bppt.go.id 98EF287A23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bppt.go.id;
        s=selector; t=1648654433;
        bh=VyNFlD7/cu41Triwpcp5Awv70tSUbdDqwtfboErdO+g=;
        h=Date:From:Message-ID:MIME-Version;
        b=FjA2GPlVanU6XCB4fNgr6fqnlF7zPLMyQsnEbfASVv2uDOz1vvPBXFARIhe1CJrKZ
         9kPNEvPm1VpWnNiULOdUVTx4Tj5kgBrbW/m63sBewkh3E7PiBVqMlQbEUhEoj7gq37
         JY5GJdla0RDyqBSrGvFvyCl/3Lbrsii+qm3tXweo=
X-Amavis-Modified: Mail body modified (using disclaimer) -
        zsmtp-out1.bppt.go.id
X-Virus-Scanned: amavisd-new at bppt.go.id
Received: from zsmtp-out1.bppt.go.id ([127.0.0.1])
        by localhost (zsmtp-out1.bppt.go.id [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id az3_cXtYEKld; Wed, 30 Mar 2022 22:33:53 +0700 (WIB)
Received: from mta1.bppt.go.id (mta1.bppt.go.id [10.10.180.6])
        by zsmtp-out1.bppt.go.id (Postfix) with ESMTPS id 3ECEC8790F;
        Wed, 30 Mar 2022 22:33:53 +0700 (WIB)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by mta1.bppt.go.id (Postfix) with ESMTP id 4B1FC253B4;
        Wed, 30 Mar 2022 22:33:52 +0700 (WIB)
Received: from mta1.bppt.go.id ([127.0.0.1])
        by localhost (mta1.bppt.go.id [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id XQeujsbkoFVk; Wed, 30 Mar 2022 22:33:51 +0700 (WIB)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by mta1.bppt.go.id (Postfix) with ESMTP id AC9BA253E6;
        Wed, 30 Mar 2022 22:33:48 +0700 (WIB)
X-Virus-Scanned: amavisd-new at mta1.bppt.go.id
Received: from mta1.bppt.go.id ([127.0.0.1])
        by localhost (mta1.bppt.go.id [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id h0shI-oMDUDW; Wed, 30 Mar 2022 22:33:48 +0700 (WIB)
Received: from mbox2.bppt.go.id (mbox2.bppt.go.id [10.10.180.5])
        by mta1.bppt.go.id (Postfix) with ESMTP id 29EBC24F4D;
        Wed, 30 Mar 2022 22:33:44 +0700 (WIB)
Date:   Wed, 30 Mar 2022 22:33:44 +0700 (WIB)
From:   Nadirah <nadirah@bppt.go.id>
Reply-To: huangjinping@winghang.info
Message-ID: <574501615.4895979.1648654424055.JavaMail.zimbra@bppt.go.id>
Subject: Aw:Dringende Antwort erforderlich
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.15_GA_4101 (zclient/8.8.15_GA_4101)
Thread-Index: DbgHpn3tY5Tji9DPipyi8yVjA/ds3Q==
Thread-Topic: Dringende Antwort erforderlich
X-Spam-Status: No, score=3.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MIME_QP_LONG_LINE,
        MISSING_HEADERS,REPLYTO_WITHOUT_TO_CC,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org



Es tut mir leid, dass ich Ihnen diese E-Mail, die in Ihrem Junk-Ordner eing=
egangen ist, als unerw=C3=BCnschte E-Mail gesendet habe. Ich hei=C3=9Fe Hua=
ng Jinping. Ich habe einen Gesch=C3=A4ftsvorschlag f=C3=BCr Sie. Ich wei=C3=
=9F, dass dieser Gesch=C3=A4ftsvorschlag f=C3=BCr Sie von Interesse sein w=
=C3=BCrde. F=C3=BCr weitere Informationen kontaktieren Sie mich bitte *****=
***************************************************************************=
**********#################################################################=
####################################
Isi e-mail ini mungkin bersifat rahasia dan penyalahgunaan, penyalinan, atau penyebaran dari e-mail ini dan semua attachment dari e-mail ini dilarang. Komunikasi internet tidak aman dan oleh karena itu Badan Pengkajian dan Penerapan Teknologi tidak menerima tanggung jawab hukum atas isi pesan ini atau untuk setiap kerusakan yang disebabkan oleh virus. Pendapat-pendapat yang diungkapkan di sini tidak selalu mewakili Badan Pengkajian dan Penerapan Teknologi.

