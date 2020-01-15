Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82C3013CB8D
	for <lists+reiserfs-devel@lfdr.de>; Wed, 15 Jan 2020 19:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbgAOSC0 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 15 Jan 2020 13:02:26 -0500
Received: from mx2.suse.de ([195.135.220.15]:60610 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728921AbgAOSC0 (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 15 Jan 2020 13:02:26 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id E839EAEA7;
        Wed, 15 Jan 2020 18:02:23 +0000 (UTC)
Subject: Re: reiserfs broke between 4.9.205 and 4.9.208
To:     Jan Kara <jack@suse.cz>, Randy Dunlap <rdunlap@infradead.org>
Cc:     Michael Brunnbauer <brunni@netestate.de>,
        linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org
References: <20200108193634.GA17390@netestate.de>
 <481c595b-46c9-0b4d-c618-a998ab6247c6@infradead.org>
 <20200109121216.GC22232@quack2.suse.cz>
From:   Jeff Mahoney <jeffm@suse.com>
Organization: SUSE Labs Data & Performance
Message-ID: <96be232a-94c9-87ad-16c9-18eb32149e19@suse.com>
Date:   Wed, 15 Jan 2020 13:02:21 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200109121216.GC22232@quack2.suse.cz>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="a4rZm46Z1dtwr0bxi6Nli88ZYKlg7rV21"
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--a4rZm46Z1dtwr0bxi6Nli88ZYKlg7rV21
Content-Type: multipart/mixed; boundary="r6nCrV9Cg9A7JctM2W3kaaMeill81n14Q"

--r6nCrV9Cg9A7JctM2W3kaaMeill81n14Q
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 1/9/20 7:12 AM, Jan Kara wrote:
>=20
> Hello,
>=20
> On Wed 08-01-20 15:42:58, Randy Dunlap wrote:
>> On 1/8/20 11:36 AM, Michael Brunnbauer wrote:
>>> after upgrading from 4.9.205 to 4.9.208, I get errors on two differen=
t
>>> reiserfs filesystems when doing cp -a (the chown part seems to fail) =
and
>>> on other occasions:
>>>
>>>  kernel: REISERFS warning (device sda1): jdm-20004 reiserfs_delete_xa=
ttrs: Couldn't delete all xattrs (-95)
>>>
>>>  kernel: REISERFS warning (device sdc1): jdm-20004 reiserfs_delete_xa=
ttrs: Couldn't delete all xattrs (-95)
>>>
>>> This behaviour disappeared after a downgrade to 4.9.205.
>>>
>>> I understand there have been changes to the file system code but I'm =
not
>>> sure they affect reiserfs, e.g.
>>>
>>>  https://bugzilla.kernel.org/show_bug.cgi?id=3D205433
>>>
>>> Any Idea?
>>>
>>> Regards,
>>>
>>> Michael Brunnbauer
>>>
>>
>> Looks to me like 4.9.207 contains reiserfs changes.
>>
>> Adding CC's.
>=20
> Looks like a regression from commit 60e4cf67a582 "reiserfs: fix extende=
d
> attributes on the root directory". We are getting -EOPNOTSUPP from
> reiserfs_for_each_xattr() likely originally from open_xa_root(). Previo=
usly
> we were returning -ENODATA from there which error reiserfs_for_each_xat=
tr()
> converted to 0. I don't understand reiserfs xattrs enough to quickly te=
ll
> what should actually be happening after the Jeff's change - naively I'd=

> think we should just silence the bogus warning in case of EOPNOTSUPP. J=
eff,
> can you have a look?
>=20
> Also Michael, I'd like to clarify: Does 'cp -a' return any error or is =
it
> just that the kernel is spewing these annoying warnings?  Because from =
the
> code reading I'd think that it is only the kernel spewing errors but
> userspace should be fine...

This error occurs when extended attributes are not enabled on the file
system *and* the module is not built with extended attributes enabled.
I've sent out the fix for it just now.

-Jeff

--=20
Jeff Mahoney
Director, SUSE Labs Data & Performance


--r6nCrV9Cg9A7JctM2W3kaaMeill81n14Q--

--a4rZm46Z1dtwr0bxi6Nli88ZYKlg7rV21
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE8wzgbmZ74SnKPwtDHntLYyF55bIFAl4fU60ACgkQHntLYyF5
5bJ9DxAArJ4JFl+V3VqJwcVGW1Dt49Tolal19rG8EgewbEsIxs1CJ4PDnSfZyp19
/5WjnnffKXTdrYxrBMD1Q3O9vPnWaeYft3uES/3VNaQoosVFBw1B0JpFT1TW13cs
Zr2m/PUHAA+BO+UC+hbNzQL5g/aGbDXhh3KAYTtF3N/tiE7Snngcagu7lNa+1WFR
n7aXu5IGTIpFfC+ySdONoClwSOBHFgL+mBqdmr1qjXAh4nwW/waLl9w6XsqlCQ0Q
Dx3/HSnGY3733JMd9fzcn4YOotJGUy0bBqAmCXahD9oTLQoxhcynQKgGmmpti5/N
S9f91moRsIi3e7ubmalYtg7Xss5RH8/trYqUe2LpnbSwYA8g0U8Z+3DFtU4k9zD0
lTKWJUB/I2Nvmty6+RAy4NlgiKV1dQY4n80yLr3zwUDA+p1khP2Hjbco6ax+Hc3S
CKZSO8skO1/BBOD1meP45YcWyqCGUXAaOPX1tTVPXlB/LAoTlWfL5/O1ifAWZV2x
sm8E8MhsUlv93p8ydjgDw/tHx+CqRVrThnxfnO4sUvrtPLrBZlgbvY9nQ30l5YOE
C3OeQ3W6FZ2VR48ypZT83KcRoHgsAyJFsjaDrCT26xRpGjFUimLij9rUjozzzfE5
W1Gts2Jz1xxXjEq6MGxeaay9DjuZsSVm+o46eZqcw8b5sO5CH5s=
=1li/
-----END PGP SIGNATURE-----

--a4rZm46Z1dtwr0bxi6Nli88ZYKlg7rV21--
