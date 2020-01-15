Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A91913CB2A
	for <lists+reiserfs-devel@lfdr.de>; Wed, 15 Jan 2020 18:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728931AbgAORjg (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 15 Jan 2020 12:39:36 -0500
Received: from mx2.suse.de ([195.135.220.15]:55388 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728904AbgAORjg (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 15 Jan 2020 12:39:36 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 26E59ACA0;
        Wed, 15 Jan 2020 17:39:34 +0000 (UTC)
Subject: Re: reiserfs broke between 4.9.205 and 4.9.208
From:   Jeff Mahoney <jeffm@suse.com>
To:     Michael Brunnbauer <brunni@netestate.de>, Jan Kara <jack@suse.cz>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        reiserfs-devel@vger.kernel.org
References: <20200108193634.GA17390@netestate.de>
 <481c595b-46c9-0b4d-c618-a998ab6247c6@infradead.org>
 <20200109121216.GC22232@quack2.suse.cz> <20200109123041.GA14075@netestate.de>
 <20200114202112.GA23020@netestate.de>
 <67c8665a-25a4-72d1-7632-d2b84eb362fe@suse.com>
Organization: SUSE Labs Data & Performance
Message-ID: <72d4425c-a3a3-4369-fe19-b5673d73a02a@suse.com>
Date:   Wed, 15 Jan 2020 12:39:30 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <67c8665a-25a4-72d1-7632-d2b84eb362fe@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="HDZfwMmaWRfhNZEXbiFL8lmynpNKzaeUC"
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--HDZfwMmaWRfhNZEXbiFL8lmynpNKzaeUC
Content-Type: multipart/mixed; boundary="efIo4QREthbvMAa5E6X6zf5OGh4fyow6u"

--efIo4QREthbvMAa5E6X6zf5OGh4fyow6u
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Nevermind.  I just wasn't reproducing properly.  Jan's analysis is
right.  The -EOPNOTSUPP change is required so that we get the right
error when explicit xattr operations are performed on a file system
without them.  Prior to this change, we'd get -EOPNOTSUPP by sb->s_xattr
being NULL.

reiserfs_for_each_xattr needs to handle this the same way we already
handle -ENODATA.

-Jeff

On 1/15/20 12:03 PM, Jeff Mahoney wrote:
> Hi Michael -
>=20
> It looks like something must've gone sideways with the backport since
> 5.5-rc6 works as expected.  I'll dig into it a bit.
>=20
> -Jeff
>=20
> On 1/14/20 3:21 PM, Michael Brunnbauer wrote:
>>
>> hi all,
>>
>> is this been looked into? Do you need more information?
>>
>> Regards,
>>
>> Michael Brunnbauer
>>
>> On Thu, Jan 09, 2020 at 01:30:41PM +0100, Michael Brunnbauer wrote:
>>>
>>> Hello Jan,
>>>
>>> On Thu, Jan 09, 2020 at 01:12:16PM +0100, Jan Kara wrote:
>>>> Also Michael, I'd like to clarify: Does 'cp -a' return any error or =
is it
>>>> just that the kernel is spewing these annoying warnings?  Because fr=
om the
>>>> code reading I'd think that it is only the kernel spewing errors but=

>>>> userspace should be fine...
>>>
>>> Yes, 'cp -a' returns errors and files are owned by root instead of th=
e correct
>>> user after copying as root.
>>>
>>> Regards,
>>>
>>> Michael Brunnbauer
>=20
>=20


--=20
Jeff Mahoney
Director, SUSE Labs Data & Performance


--efIo4QREthbvMAa5E6X6zf5OGh4fyow6u--

--HDZfwMmaWRfhNZEXbiFL8lmynpNKzaeUC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE8wzgbmZ74SnKPwtDHntLYyF55bIFAl4fTlMACgkQHntLYyF5
5bIJIQ//TN3GAyI2ujEdkLF6zyknRga6kNbX6A0tBsszS3jDbo5x4M1oZk3Qv+4o
0OQ2GX2D3nAswX1rybAKlk/TbhKJwYb2kZPpvIFtvkiknNFAfLGLyj/2ADid5TDi
PprbYdLcZuxqJC4kX8RyEybuNFz7geKE8MESG5ZSVNlfxifNtpRM9KTtpaPrpwTQ
5EGInHv76a/Xx4ehkRqgP+UZWRtxH8K+swkUptynnv5tL5vXsnS5DaOqSBlHgnEU
YwSxZ7iNxxIbbkZBh5iT8QHAPvHM6v+9H2/KJm3SenUIsQ74h/67VrK2yNh9Tfgq
rMFNLO6RnHM+dC0U2hqDMgzCRIC/zD4aDgKBtBZ2ey4JcMWpWqEN0mDSrVvENA58
ivo4/jG1uJeQsc9jCKJlvHSFprYpO4L5YMY7HnuxkeiPbaX2Z9E7RVWX8R5pjzfZ
x5oQ7FgCHXJH9MN3FeCZsE0qlo1lt1+8o87xVHddAq/yKMRYiiSXU2tEbY01vwng
07rTIiCNsPGEDWVrh1EetfQAd5RJgoVNgno3vgJ+Fs/klt//TQHiw78cfrGdG6Is
0Pqjb2Kg2WY8jWio/bXZwioNFjWRKoOk0lEnClcMUQn9dsr8NTDKhjeReO0ZR4gz
GT1f7OKrB7MSIVu2eb2sCFwh55HbaVX9pcxVMz1oi50gwuhjuug=
=jeXb
-----END PGP SIGNATURE-----

--HDZfwMmaWRfhNZEXbiFL8lmynpNKzaeUC--
