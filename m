Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 708DDCEE23
	for <lists+reiserfs-devel@lfdr.de>; Mon,  7 Oct 2019 23:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbfJGVDv (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 7 Oct 2019 17:03:51 -0400
Received: from ns1.tgtizmir.com ([217.116.196.59]:35646 "EHLO ns1.tgtizmir.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728330AbfJGVDv (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 7 Oct 2019 17:03:51 -0400
Received: from 127.0.0.1 (localhost [127.0.0.1])
        by ns1.tgtizmir.com (Postfix) with SMTP id 2B2FE54D64D;
        Mon,  7 Oct 2019 04:36:13 +0300 (+03)
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received-SPF: pass (ns1.tgtizmir.com: localhost is always allowed.) client-ip=127.0.0.1; envelope-from=dave@dbsoundfactory.com; helo=127.0.0.1;
Received: from [249.137.205.179] by 127.0.0.1 id <3282488-47297> for <regina.grimm@landkreishildesheim.de>; Mon, 07 Oct 2019 04:29:19 +0300
Message-ID: <12r4608v1-07-$--7$94c79$0@unmqcby>
From:   "Mr Barrister Hans Erich" <dave@dbsoundfactory.com>
Reply-To: "Mr Barrister Hans Erich" <dave@dbsoundfactory.com>
To:     regina.grimm@landkreishildesheim.de
Subject: RE:PERSONAL LETTER FROM MRS RASHIA AMIRA
Date:   Mon, 07 Oct 19 04:29:19 GMT
X-Mailer: eGroups Message Poster
MIME-Version: 1.0
Content-Type: multipart/alternative;
        boundary=".F.ED2A68C5DB75."
X-Priority: 3
X-MSMail-Priority: Normal
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org


--.F.ED2A68C5DB75.
Content-Type: text/plain;
Content-Transfer-Encoding: quoted-printable

Greetings

My name is Barrister Hans Erich.

I have a client who is interested to invest in your country, she is a well=
 known politician in her country and deserve a lucrative investment partne=
rship with you outside her country without any delay   Please can you mana=
ge such investment please Kindly reply for further details.

Your full names --------


Your urgent response will be appreciated

Thank you and God bless you.

Barrister Hans Erich

Yours sincerely,
Barrister Hans Erich
CONTACT: hanserich9helmut@gmail.com

--.F.ED2A68C5DB75.--

