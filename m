Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DACA28F17C
	for <lists+reiserfs-devel@lfdr.de>; Thu, 15 Oct 2020 13:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727923AbgJOLof (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 15 Oct 2020 07:44:35 -0400
Received: from mail.csu.ru ([195.54.14.68]:38829 "HELO mail.csu.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
        id S1729976AbgJOLoX (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 15 Oct 2020 07:44:23 -0400
X-Greylist: delayed 619 seconds by postgrey-1.27 at vger.kernel.org; Thu, 15 Oct 2020 07:44:12 EDT
Received: from webmail.csu.ru (webmail.csu.ru [195.54.14.80])
        (Authenticated sender: gmu)
        by mail.csu.ru (Postfix) with ESMTPA id A7626142671;
        Thu, 15 Oct 2020 16:33:31 +0500 (+05)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.csu.ru A7626142671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csu.ru; s=lso;
        t=1602761626; bh=3a87bqEECgzQlmJ1wGXY5qdbrcBb1wrajgfr+n2VLzw=;
        h=Date:Subject:From:Reply-To:From;
        b=rKdhlFPG1F6fGeBRsrAN+e7zQmCf/uH4isN/P0z6ijYC3TT6Au3xCoWA1/PknEwrZ
         3YseEJ5oKCKrkZASrMuulCW+/uz8FrEqDYxBb7fN1k0RPaGR3QxFc91JcWf8IYIovB
         qAvi4cu1qhjeifveGu2mnkiTjx+Ktlst6xQ8zbUQ=
Received: from 156.146.59.30
        (SquirrelMail authenticated user gmu)
        by webmail.csu.ru with HTTP;
        Thu, 15 Oct 2020 16:33:37 +0500
Message-ID: <c758165430a6bda9d96e3064af95a996.squirrel@webmail.csu.ru>
Date:   Thu, 15 Oct 2020 16:33:37 +0500
Subject: Vorschlag
From:   "Yi Huiman" <info@csu.ru>
Reply-To: info@huiman.cf
User-Agent: SquirrelMail/1.4.22
MIME-Version: 1.0
Content-Type: text/plain;charset=utf-8
X-Priority: 3 (Normal)
Importance: Normal
X-KLMS-Rule-ID: 1
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Lua-Profiles: 159201 [Oct 15 2020]
X-KLMS-AntiSpam-Version: 5.9.16.0
X-KLMS-AntiSpam-Envelope-From: info@csu.ru
X-KLMS-AntiSpam-Auth: dmarc=none header.from=csu.ru;spf=softfail smtp.mailfrom=csu.ru;dkim=none
X-KLMS-AntiSpam-Rate: 70
X-KLMS-AntiSpam-Status: not_detected
X-KLMS-AntiSpam-Method: none
X-KLMS-AntiSpam-Info: LuaCore: 381 381 faef97d3f9d8f5dd6a9feadc50ba5b34b9486c58, {rep_avail}, {Tracking_content_type, plain}, {Prob_reply_not_match_from}, {Prob_to_header_missing}, {Prob_Reply_to_without_To}, {Tracking_susp_macro_from_formal}, 195.54.14.80:7.1.2;csu.ru:7.1.1;webmail.csu.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;huiman.cf:7.1.1, ApMailHostAddress: 195.54.14.80
X-MS-Exchange-Organization-SCL: -1
X-KLMS-AntiSpam-Interceptor-Info: scan successful
X-KLMS-AntiPhishing: Clean, bases: 2020/10/15 10:36:00
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, bases: 2020/10/15 07:09:00 #15491089
X-KLMS-AntiVirus-Status: Clean, skipped
Content-Transfer-Encoding: quoted-printable
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

ich habe ein Gesch=C3=A4ft Vorschlag f=C3=BCr dich.


