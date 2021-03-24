Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44C6F347C68
	for <lists+reiserfs-devel@lfdr.de>; Wed, 24 Mar 2021 16:21:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236497AbhCXPUn (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 24 Mar 2021 11:20:43 -0400
Received: from mx2.suse.de ([195.135.220.15]:35378 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236574AbhCXPUR (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 24 Mar 2021 11:20:17 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1616599216; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=oLw8pXgAKo//kJYHzz19bDOhSpFDIdc/tbcDgpEPK5c=;
        b=FDNbbMAgVEnyB/US1odZLlsVv8NFx/RwGWQ3m0MQWA5pHvTflUqsrheJX6P2arsNmxTQiP
        SeUoCo062NgTO7Iz1pl2oncPPomI0HRjkmF0CIgWHuVDoDac1B87yBVCKNTZk7lmcnY4gX
        RcrOoV0Wb0SUtw0Qj8jgw6wT2e2tV/A=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 1A637AB8A;
        Wed, 24 Mar 2021 15:20:16 +0000 (UTC)
Subject: Re: [PATCH (resend)] reiserfs: update reiserfs_xattrs_initialized()
 condition
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Jan Kara <jack@suse.cz>
Cc:     reiserfs-devel@vger.kernel.org
References: <000000000000f5be7f05afcf862a@google.com>
 <20210221050957.3601-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <700fcc0a-0da7-6d70-620e-af0ed956cd85@i-love.sakura.ne.jp>
 <20210322153142.GF31783@quack2.suse.cz>
 <4852ceee-26b1-ff2c-ac33-602e82ff3db7@i-love.sakura.ne.jp>
From:   Jeff Mahoney <jeffm@suse.com>
Message-ID: <7d7a884a-5a94-5b0e-3cf5-82d12e1b0992@suse.com>
Date:   Wed, 24 Mar 2021 11:20:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <4852ceee-26b1-ff2c-ac33-602e82ff3db7@i-love.sakura.ne.jp>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="RVAMUPSi49jOYg5OqTExHOvN8xtu80bjw"
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RVAMUPSi49jOYg5OqTExHOvN8xtu80bjw
Content-Type: multipart/mixed; boundary="tknPBSxGc3nmniinCm60L7c4OPrPu03yN";
 protected-headers="v1"
From: Jeff Mahoney <jeffm@suse.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Jan Kara <jack@suse.cz>
Cc: reiserfs-devel@vger.kernel.org
Message-ID: <7d7a884a-5a94-5b0e-3cf5-82d12e1b0992@suse.com>
Subject: Re: [PATCH (resend)] reiserfs: update reiserfs_xattrs_initialized()
 condition
References: <000000000000f5be7f05afcf862a@google.com>
 <20210221050957.3601-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <700fcc0a-0da7-6d70-620e-af0ed956cd85@i-love.sakura.ne.jp>
 <20210322153142.GF31783@quack2.suse.cz>
 <4852ceee-26b1-ff2c-ac33-602e82ff3db7@i-love.sakura.ne.jp>
In-Reply-To: <4852ceee-26b1-ff2c-ac33-602e82ff3db7@i-love.sakura.ne.jp>

--tknPBSxGc3nmniinCm60L7c4OPrPu03yN
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 3/24/21 10:47 AM, Tetsuo Handa wrote:
> On 2021/03/23 0:31, Jan Kara wrote:
>> Thanks for the patch Tetsuo! I'd prefer if Jeff had a look since he ha=
s
>> written this code back then. But let me provide my view: I agree that =
for a
>> corrupted filesystem it can happen that xattr_root remains NULL althou=
gh
>> priv_root is set. So your change makes sense. But then
>> reiserfs_xattrs_initialized() seems to be used really minimally? Only =
once
>> in fs/reiserfs/xattr_security.c and e.g. reiserfs_xattr_set() is prone=
 to
>> the same problem? Do I miss something?
>=20
> As far as tested with assertion patch
> ( https://syzkaller.appspot.com/text?tag=3DPatch&x=3D13186fe6d00000 ) a=
pplied,
> syzbot did not trigger the BUG_ON() added by this patch, which means th=
at
> reiserfs_fill_super() always fails if reiserfs_xattrs_initialized() ret=
urned false.
>=20
> And console log ( https://syzkaller.appspot.com/text?tag=3DCrashLog&x=3D=
177b30bad00000 ) contains
>=20
>   jdm-20006 create_privroot: xattrs/ACLs enabled and couldn't find/crea=
te .reiserfs_priv. Failing mount.
>=20
> messages, which means that e.g. reiserfs_xattr_set() will not be called=
 on
> this corrupted filesystem image because mount operation itself fails.
>=20
> Despite there are other bugs remaining, I think that applying this patc=
h as-is is OK.
>=20

Ever wish you had a time machine and could go back and prevent your
former self from making a mistake?  The reiserfs xattr code would be my
first destination.

Tetsuo's patch is fine but it needs a similar fix in reiserfs_xattr_set,
as you noted.  Whether it's required is another question.  ReiserFS is
absolutely loaded with fuzzer bugs.

-Jeff


--=20
Jeff Mahoney
Director, SUSE Labs Data & Performance


--tknPBSxGc3nmniinCm60L7c4OPrPu03yN--

--RVAMUPSi49jOYg5OqTExHOvN8xtu80bjw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEE8wzgbmZ74SnKPwtDHntLYyF55bIFAmBbWK4FAwAAAAAACgkQHntLYyF55bIn
1A//eysSUzrhNjW3hIZdXnjVk55EQBVOUx1IRzzIo+5J2p0LvA4we/uVWL3KIitQGwz3KPz3voic
oE1r/CQsIw6ju3D2hImNZUUUsV56i9UHUVjbRGOD2MIeazwZ+IyHtw2NQeio5FMd4INV2+7WVlsV
OILOypKynqnXOArO7KMaFU8IO13hqEGaVeB4iQupJ7lJs/6Y3mSMGJJmUeZo0dxbVxJq4+v6wwQI
TRAXXvSCdPpyhwaAQw9VdHGInFXMvBoZl11hG+heC6gyfS5e7M7iY684TWWyYHNLqLhobNWyOMM4
t0iQHW7Ml2EYiRGZQuRqe+yt6mtSdV1FuA2T98G/5A5nKQxg43MXa+AS9LSkDBk3+2Sw++lVHPgb
AFBy4WwKqDC/YPT7ARRUW+89g4fnPIVIIvb2AyXA8wCAg+wHjhbQQ5pAiJ955kQkFFg4pg5aZFxW
fqLLSqvzNYkeOgfJGKA0jlakktf+GIXHhYjpJN8bHV92nXXYNIZwsRVGZakb0SJyZROSBPc1sStx
HmsNu7aWTfRvrUeviLU/ybtE9uRTAcv3iRdtnuYhTtcP/9B8jZT/WZEEritp93TcvUlnjjSwVV9t
Sx+566kQmOkEAnc5RilBwH2kPzYJxReRtVDVuGgr9TIb/Z+9vJCwEo+MitmDYrRhuM9X015owfFj
ZNc=
=j4mk
-----END PGP SIGNATURE-----

--RVAMUPSi49jOYg5OqTExHOvN8xtu80bjw--
