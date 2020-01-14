Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 884DC13B38F
	for <lists+reiserfs-devel@lfdr.de>; Tue, 14 Jan 2020 21:21:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgANUVP (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 14 Jan 2020 15:21:15 -0500
Received: from brunni.mail.netestate.de ([81.209.177.48]:36749 "EHLO
        brunni.mail.netestate.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727102AbgANUVP (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 14 Jan 2020 15:21:15 -0500
Received: (qmail 23714 invoked from network); 14 Jan 2020 20:21:12 -0000
Received: from localhost.netestate.de (HELO fiano.netestate.de) (127.0.0.1)
  by localhost.netestate.de with ESMTP; 14 Jan 2020 20:21:12 -0000
Received: from fiano.netestate.de (81.209.177.7)
  by brunni.mail.netestate.de with SMTP via TCP; Tue, 14 Jan 2020 21:21:12 +0100
Received: (qmail 23034 invoked by uid 503); 14 Jan 2020 20:21:12 -0000
Date:   Tue, 14 Jan 2020 21:21:12 +0100
From:   Michael Brunnbauer <brunni@netestate.de>
To:     Jan Kara <jack@suse.cz>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        reiserfs-devel@vger.kernel.org, jeffm@suse.com
Subject: Re: reiserfs broke between 4.9.205 and 4.9.208
Message-ID: <20200114202112.GA23020@netestate.de>
References: <20200108193634.GA17390@netestate.de>
 <481c595b-46c9-0b4d-c618-a998ab6247c6@infradead.org>
 <20200109121216.GC22232@quack2.suse.cz>
 <20200109123041.GA14075@netestate.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline
In-Reply-To: <20200109123041.GA14075@netestate.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


hi all,

is this been looked into? Do you need more information?

Regards,

Michael Brunnbauer

On Thu, Jan 09, 2020 at 01:30:41PM +0100, Michael Brunnbauer wrote:
>=20
> Hello Jan,
>=20
> On Thu, Jan 09, 2020 at 01:12:16PM +0100, Jan Kara wrote:
> > Also Michael, I'd like to clarify: Does 'cp -a' return any error or is =
it
> > just that the kernel is spewing these annoying warnings?  Because from =
the
> > code reading I'd think that it is only the kernel spewing errors but
> > userspace should be fine...
>=20
> Yes, 'cp -a' returns errors and files are owned by root instead of the co=
rrect
> user after copying as root.
>=20
> Regards,
>=20
> Michael Brunnbauer
>=20
> --=20
> ++  Michael Brunnbauer
> ++  netEstate GmbH
> ++  Geisenhausener Stra=DFe 11a
> ++  81379 M=FCnchen
> ++  Tel +49 89 32 19 77 80
> ++  Fax +49 89 32 19 77 89=20
> ++  E-Mail brunni@netestate.de
> ++  https://www.netestate.de/
> ++
> ++  Sitz: M=FCnchen, HRB Nr.142452 (Handelsregister B M=FCnchen)
> ++  USt-IdNr. DE221033342
> ++  Gesch=E4ftsf=FChrer: Michael Brunnbauer, Franz Brunnbauer
> ++  Prokurist: Dipl. Kfm. (Univ.) Markus Hendel



--=20
++  Michael Brunnbauer
++  netEstate GmbH
++  Geisenhausener Stra=DFe 11a
++  81379 M=FCnchen
++  Tel +49 89 32 19 77 80
++  Fax +49 89 32 19 77 89=20
++  E-Mail brunni@netestate.de
++  https://www.netestate.de/
++
++  Sitz: M=FCnchen, HRB Nr.142452 (Handelsregister B M=FCnchen)
++  USt-IdNr. DE221033342
++  Gesch=E4ftsf=FChrer: Michael Brunnbauer, Franz Brunnbauer
++  Prokurist: Dipl. Kfm. (Univ.) Markus Hendel

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTAkMfrYFFSaeacJ6u+j6gOLbYeuQUCXh4itgAKCRC+j6gOLbYe
ub1BAJ9l/SRPsAcw6hHlE5Pgez7AtXeAPACaAwKZvV73j3cfCl0+x9b5E1udY9o=
=RYN2
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--
