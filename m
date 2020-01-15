Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C108113CA36
	for <lists+reiserfs-devel@lfdr.de>; Wed, 15 Jan 2020 18:03:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728928AbgAORDq (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 15 Jan 2020 12:03:46 -0500
Received: from mx2.suse.de ([195.135.220.15]:40130 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726574AbgAORDq (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 15 Jan 2020 12:03:46 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 42056AD88;
        Wed, 15 Jan 2020 17:03:44 +0000 (UTC)
Subject: Re: reiserfs broke between 4.9.205 and 4.9.208
To:     Michael Brunnbauer <brunni@netestate.de>, Jan Kara <jack@suse.cz>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        reiserfs-devel@vger.kernel.org
References: <20200108193634.GA17390@netestate.de>
 <481c595b-46c9-0b4d-c618-a998ab6247c6@infradead.org>
 <20200109121216.GC22232@quack2.suse.cz> <20200109123041.GA14075@netestate.de>
 <20200114202112.GA23020@netestate.de>
From:   Jeff Mahoney <jeffm@suse.com>
Organization: SUSE Labs Data & Performance
Message-ID: <67c8665a-25a4-72d1-7632-d2b84eb362fe@suse.com>
Date:   Wed, 15 Jan 2020 12:03:40 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200114202112.GA23020@netestate.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TVCnj3kdLxRKQjDQIGSbf14fIjvdWEvCh"
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TVCnj3kdLxRKQjDQIGSbf14fIjvdWEvCh
Content-Type: multipart/mixed; boundary="SDcbxPRT9QOmZtzMvAyqygIKNOrkbOzms"

--SDcbxPRT9QOmZtzMvAyqygIKNOrkbOzms
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Michael -

It looks like something must've gone sideways with the backport since
5.5-rc6 works as expected.  I'll dig into it a bit.

-Jeff

On 1/14/20 3:21 PM, Michael Brunnbauer wrote:
>=20
> hi all,
>=20
> is this been looked into? Do you need more information?
>=20
> Regards,
>=20
> Michael Brunnbauer
>=20
> On Thu, Jan 09, 2020 at 01:30:41PM +0100, Michael Brunnbauer wrote:
>>
>> Hello Jan,
>>
>> On Thu, Jan 09, 2020 at 01:12:16PM +0100, Jan Kara wrote:
>>> Also Michael, I'd like to clarify: Does 'cp -a' return any error or i=
s it
>>> just that the kernel is spewing these annoying warnings?  Because fro=
m the
>>> code reading I'd think that it is only the kernel spewing errors but
>>> userspace should be fine...
>>
>> Yes, 'cp -a' returns errors and files are owned by root instead of the=
 correct
>> user after copying as root.
>>
>> Regards,
>>
>> Michael Brunnbauer


--=20
Jeff Mahoney
Director, SUSE Labs Data & Performance


--SDcbxPRT9QOmZtzMvAyqygIKNOrkbOzms--

--TVCnj3kdLxRKQjDQIGSbf14fIjvdWEvCh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE8wzgbmZ74SnKPwtDHntLYyF55bIFAl4fRewACgkQHntLYyF5
5bJ1ehAAsAURu9jCm+igaHx5Nz7b/mxRoA3LyZAieAoXBO/Hl1C6NgjR8OCXcNDD
UfXqDAjSJAt63HBpxeu1BEYkNh9BP1Q2sW5eoRhUDC3N5LTSfJnpd5EDl5rtQ28g
9HRv1zrTKsI6+MMheTBFstiZY2pZbqzQV00ZBoFUm00SoUt86F5NwbwAI6ru3mwT
z7F4R/I9lwtpctxP6h8+dDHMmmufGDV4gdyyEUKafWsfpwqupCxMytbcyjN2RHxR
YG+DOsGVpyuESdY9kfvqpWoDJRQE8ea/SnI3TRiasHv8yg1m+DQndAxJ2Y25JrR7
0XlrgZf9FApmHdYmkGhiXZhYuFU57ppRoCwA62HPS/asFlvHxEzE0PCLhHFh5XcH
yp1S8pTt/QJlCFL+99Z9ji8YOI5yPz2myVQAbMCF+4iC3EgAhf4UCI0vUa+FNF2C
3qJ63UQLnZf9NpiCb+R02GP4EwGGUo8lOhIPNsNFE51qULOmyjFTOD/PpAiR4ShZ
cwvi1kLw/cyc2mbfWfVlG6Z9DaRpbU/qfPzc1H+zVF4R1mdJqHyAZYZMwEcM+zLu
Wn7is8p/tPCldnoBmqh4ssugB2AaibFu7Y4mRWkx75VSPaXoO+IbY0emQdhMTbJd
1jBcDCBOQt12X11Z0KHg8BaPeUjNWfIgWU3Br4pBXoqtB8yAGi8=
=vwMe
-----END PGP SIGNATURE-----

--TVCnj3kdLxRKQjDQIGSbf14fIjvdWEvCh--
