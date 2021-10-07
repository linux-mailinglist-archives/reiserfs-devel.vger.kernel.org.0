Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2B21424E62
	for <lists+reiserfs-devel@lfdr.de>; Thu,  7 Oct 2021 09:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240316AbhJGIAK (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 7 Oct 2021 04:00:10 -0400
Received: from artemis.server.nucleus.it ([51.89.16.243]:59497 "EHLO
        artemis.server.nucleus.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240212AbhJGIAI (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 7 Oct 2021 04:00:08 -0400
X-Greylist: delayed 468 seconds by postgrey-1.27 at vger.kernel.org; Thu, 07 Oct 2021 04:00:08 EDT
Received: by artemis.server.nucleus.it (Postfix, from userid 257)
        id 840F819C798; Thu,  7 Oct 2021 09:50:24 +0200 (CEST)
X-Nucleus-Antivirus-policy: No
X-Nucleus-Antispam-policy:  No
X-Nucleus-IsRelay:         F
X-Nucleus-SourceIP:        151.82.5.210
X-Nucleus-Id:              49C9A19C789
X-Nucleus-From:            marco@nucleus.it
X-Nucleus-Date:            2021-10-07 09:50:24 CEST
X-Nucleus-IsFetchMail:     F
Received: from lobo.localdomain (unknown [151.82.5.210])
        by artemis.server.nucleus.it (Postfix) with ESMTPA id 49C9A19C789
        for <reiserfs-devel@vger.kernel.org>; Thu,  7 Oct 2021 09:50:24 +0200 (CEST)
Received: from lobo.lobo.dom (lobo.lobo.dom [127.0.0.1])
        by lobo.localdomain (Postfix) with ESMTP id 06D4C762AD7
        for <reiserfs-devel@vger.kernel.org>; Thu,  7 Oct 2021 09:50:25 +0200 (CEST)
Date:   Thu, 7 Oct 2021 09:50:19 +0200
From:   Marco Felettigh <marco@nucleus.it>
To:     reiserfs-devel@vger.kernel.org
Subject: reiserfs acl and cp wrong permissions
Message-ID: <20211007095019.78aec97e@lobo.lobo.dom>
Organization: Nucleus s.r.l.
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NJ/ldtgkNKGNTnq9y0PQblx";
 protocol="application/pgp-signature"; micalg=pgp-sha1
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

--Sig_/NJ/ldtgkNKGNTnq9y0PQblx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,
there is some a remote possibility to solve this issue with reiserfs +
acl and cp permissions ?

Here the bug reported more then 1 year ago:
https://bugzilla.kernel.org/show_bug.cgi?id=3D207971

Thanks
Marco

--Sig_/NJ/ldtgkNKGNTnq9y0PQblx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRgs4moDz/kAc8JPxco+KAxdHlzYQUCYV6mvAAKCRAo+KAxdHlz
YUWgAKCifFYq33MC5v94m+hnx5/Oi1+IVQCgvklfbdWYBxX6UvF7S1AuHHNDxIw=
=NXk7
-----END PGP SIGNATURE-----

--Sig_/NJ/ldtgkNKGNTnq9y0PQblx--
