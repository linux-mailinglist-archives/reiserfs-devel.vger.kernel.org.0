Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3452767ADA4
	for <lists+reiserfs-devel@lfdr.de>; Wed, 25 Jan 2023 10:19:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235168AbjAYJTL (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 25 Jan 2023 04:19:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235221AbjAYJTI (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 25 Jan 2023 04:19:08 -0500
X-Greylist: delayed 459 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 25 Jan 2023 01:19:05 PST
Received: from mail.gluegivebiz.com (mail.gluegivebiz.com [94.177.230.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ED4349429
        for <reiserfs-devel@vger.kernel.org>; Wed, 25 Jan 2023 01:19:05 -0800 (PST)
Received: by mail.gluegivebiz.com (Postfix, from userid 1001)
        id 9CFEE82C3C; Wed, 25 Jan 2023 09:11:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gluegivebiz.com;
        s=mail; t=1674637882;
        bh=5n0LayKpRHsZMclE7BidCW6LDGRdzRVHcrHQCq8kNN4=;
        h=Date:From:To:Subject:From;
        b=K3ZTonghlVAwluU3nUOVQ8y+D2xAGX4MzHrr91lYkpQQLoQzq35vTP2UI+5rJ1nc1
         JhFhYjEtARlM16pzJ/MzWxtZWgz85f5GJ1w56LjxMrbL85OjPvUzR45OGHqG8T+iXe
         9spy7vyPBowvtSBcSz0NMkKmLLoeyDvtXTnKDAsXXz4vN/qG44Tqc5YwsPk35cg7Ij
         NoVUiQP+2YwHM6o0cuB+BgNYAM0v5ru8SQYGr4Epdi6+Vi2WKP+gYazpb/olW0YFj3
         y+KRrGBmhUAkaFEHS6y3oG39OdFr5mSyJ99/vAyIS38YKt2IMHso9p+oqOngw6M1Ia
         ugdUS4XzcdaUQ==
Received: by mail.gluegivebiz.com for <reiserfs-devel@vger.kernel.org>; Wed, 25 Jan 2023 09:11:10 GMT
Message-ID: <20230125074500-0.1.y.2bfn.0.8m6q0a12hb@gluegivebiz.com>
Date:   Wed, 25 Jan 2023 09:11:10 GMT
From:   =?UTF-8?Q? "Vil=C3=A9m_Du=C5=A1ek" ?= 
        <vilem.dusek@gluegivebiz.com>
To:     <reiserfs-devel@vger.kernel.org>
Subject: =?UTF-8?Q?Tepeln=C3=A9_obr=C3=A1b=C4=9Bn=C3=AD_=E2=80=93_objedn=C3=A1vka?=
X-Mailer: mail.gluegivebiz.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Dobr=C3=BD den,

m=C3=A1te z=C3=A1jem o vyu=C5=BEit=C3=AD velmi kvalitn=C3=AD slu=C5=BEby =
tepeln=C3=A9ho obr=C3=A1b=C4=9Bn=C3=AD kov=C5=AF?

M=C5=AF=C5=BEeme v=C3=A1m nab=C3=ADdnout velmi v=C3=BDhodn=C3=A9 podm=C3=AD=
nky spolupr=C3=A1ce, technick=C3=A9 poradenstv=C3=AD, s=C3=A9riovou v=C3=BD=
robu a testov=C3=A1n=C3=AD prototyp=C5=AF.

Specializujeme se na tradi=C4=8Dn=C3=AD a vakuov=C3=A9 technologie: cemen=
tov=C3=A1n=C3=AD, nitrocementov=C3=A1n=C3=AD, kalen=C3=AD v plynu, zu=C5=A1=
lecht=C4=9Bn=C3=AD, =C5=BE=C3=ADh=C3=A1n=C3=AD, p=C3=A1jen=C3=AD, normali=
za=C4=8Dn=C3=AD =C5=BE=C3=ADh=C3=A1n=C3=AD (s p=C5=99ekrystalizac=C3=AD).

M=C3=A1me k dispozici rozs=C3=A1hl=C3=A9 strojn=C3=AD vybaven=C3=AD, velk=
=C3=BD t=C3=BDm odborn=C3=ADk=C5=AF, a proto jsme schopni se p=C5=99izp=C5=
=AFsobit va=C5=A1im po=C5=BEadavk=C5=AFm.

Pracujeme v souladu s na=C5=A1imi certifik=C3=A1ty v rozsahu norem platn=C3=
=BDch v oblasti automobilov=C3=A9ho pr=C5=AFmyslu (IATF 16949; CQI 9) a t=
ak=C3=A9 letectv=C3=AD (akreditace NADCAP).

Pokud m=C3=A1te po=C5=BEadavky v t=C3=A9to oblasti, r=C3=A1d v=C3=A1m p=C5=
=99edstav=C3=ADm na=C5=A1e mo=C5=BEnosti.

Mohl bych v=C3=A1m zatelefonovat?


Vil=C3=A9m Du=C5=A1ek
