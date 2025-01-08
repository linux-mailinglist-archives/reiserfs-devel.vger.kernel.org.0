Return-Path: <reiserfs-devel+bounces-171-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F680A06131
	for <lists+reiserfs-devel@lfdr.de>; Wed,  8 Jan 2025 17:12:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E1AD16084B
	for <lists+reiserfs-devel@lfdr.de>; Wed,  8 Jan 2025 16:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0571E1FC7E0;
	Wed,  8 Jan 2025 16:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uCNRkWdq"
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AF315B99E
	for <reiserfs-devel@vger.kernel.org>; Wed,  8 Jan 2025 16:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736352770; cv=none; b=fwxUlbFNBaCL2QS18JkeCLV3I3Bp2jCPHhPAYqY+fgazJYK0CdEcpA5FUaVt9GXohF/GTuvGnq1zULyCt1KhdzGInOoh4vF7mP3tJQtBy0zkjBDAbG33Cl0Wx4tGE1yIREBJHhlmRo3lqH6tpcB6zyGJujWnq7NTuBIVR4CT47s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736352770; c=relaxed/simple;
	bh=k9U/TOc2v82xZLrivhyV0wEqco4FYvpAt/c7qk353Kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VxkyQdU3VTPI1twiNiBz/wr5zOG8R7h1MKalrjwVhVLx6TpBLdqq0F/OeqZI2VvnnmMTrPC06FJGS8NRBfn/SKTOGkZ3YtmQEs3lwWA48hCOHp3QEyVFBjXMR930/UWRbZXZDgKyb5QJfy4d+XWYnnZxB/Unzghgu+dGIrVr6Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uCNRkWdq; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2efd81c7ca4so20482577a91.2
        for <reiserfs-devel@vger.kernel.org>; Wed, 08 Jan 2025 08:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736352769; x=1736957569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CMuQAytvWH0E7wlnhitx4rwvDBu2WEM6buz9oMJoZ9k=;
        b=uCNRkWdqPWE38RXBTOn4KUHMMjo28m3FyweJOGxXQ6YjCO34p6gPkVv/PK1MNIWIrR
         YrIoS+i8MK6h38lsnEB0pQH0ctUURkbovNHD9g5eet3n4KtWNn44M92Uv0VseZ76lgEg
         0edpC6vE0a/QEPPLkX0QU3FzWGdl57fTq4ZamEstxkaWKj6PlBExziO7mXCGQDe/pyNQ
         xFV5n+b8btHdn+eR9Jh2iWr3xqiTy1SX2/rVzZFXGYOf+ollRfCY6VkBhuOKOWoWivUY
         rY7J7A6iE/C2tgmAt5gF47bMYb7orTXGd6qyVDrFrPlp7TAY6JvI/9VwbgtgksgFB7Rd
         4ZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736352769; x=1736957569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CMuQAytvWH0E7wlnhitx4rwvDBu2WEM6buz9oMJoZ9k=;
        b=TYtLAn48avpOmacy0K21yhZ3BW4qdqik8QjHog6B4BWbyw7nwJSpB+Q7g0euJxZ8Eh
         j4weAOQiIIRdfTj6fGpyNp7VbR2TN2BkKibSO64dJeiwPWD9uyQdEA+Vg10bFkh6zmLY
         nyHrXi84WjJ76KpNJrzIr+KWRVawL0/pK+V5ECf31ozQ0j5YgjTT3DuGL2L+ronV1Qea
         f9Q4zSX30tIJ9iPyb8H60W5OEg1DmlY43Adj7tqWvXrOR+BtcxCx9DRWEiRvguvnClK8
         ZSnhUfg1UEikLov+sowlFPPJgXuEhJyNH3OVqZsHd0clOEJ22iMGFZ9wdDpmOO6VipE8
         /OKw==
X-Forwarded-Encrypted: i=1; AJvYcCVqvVGT2n1PFio+mAafRXga7tXL0S+KGV9qYmS36um5Z+Io/7p8TJ4JHWv6q+tlvKIAOUCkb6jDMJTHwPYI7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfK2prJuL+2RXzgIlyiDutSHmZsxK5fF3/DiIy8q1OseDuw6uq
	22L+DJeF/9cU4+WMTiPzTu4VU81aBhC2xIGMbdZY/iK2NYhsimLZlXceWo4t18nDRQw+6rd6Nz6
	ma5XYdX3Zpv30IX0Whin8gWEMaudmi5zkT2iJ1VHeNXN6M73l1g==
X-Gm-Gg: ASbGncuYeyiomxhfeQr8dbLua2j7N673kx7tgwN36f7Q8tauHQfs6gW+kaz5yMjUjMu
	uiqpdrMeS+RWEIaF1BZRqXVoUt8ewx9XqCifFv4++IMzDNpYVA66nDS32Q+dz6VqIfdkc
X-Google-Smtp-Source: AGHT+IGc0ARsV3zfaUMxQCnvImMKawv6ORQ+W15pshqt3V/bxZOmO7+tGJOy1cDYf7oIdDD4e0sXHDoQx5Oizn6rHDw=
X-Received: by 2002:a17:90b:4d04:b0:2ee:aa95:6de9 with SMTP id
 98e67ed59e1d1-2f548f71e2bmr4836033a91.33.1736352768724; Wed, 08 Jan 2025
 08:12:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <670030bd.050a0220.49194.0497.GAE@google.com> <677e4dd0.050a0220.3b3668.02e2.GAE@google.com>
 <extrhc27tkgqmoiqzlhtdild4y5ijtmlebf3mnljtvftf3azeq@zw4jnnwmmza2>
In-Reply-To: <extrhc27tkgqmoiqzlhtdild4y5ijtmlebf3mnljtvftf3azeq@zw4jnnwmmza2>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Wed, 8 Jan 2025 17:12:36 +0100
X-Gm-Features: AbW1kvaRG_MiRS4dkt4aQn9W2Pgo9bteeC_0eLrzcoW1XdrLdj3FASk2kgPn23k
Message-ID: <CANp29Y4iVThLsSFS43sbGdS9vWLG0x8VkPsXOL89xWnp8HFQtQ@mail.gmail.com>
Subject: Re: [syzbot] [reiserfs?] KASAN: use-after-free Read in
 reiserfs_fill_super (3)
To: Jan Kara <jack@suse.cz>
Cc: syzbot <syzbot+d796ad2656d5b38910ee@syzkaller.appspotmail.com>, 
	brauner@kernel.org, djwong@kernel.org, linux-kernel@vger.kernel.org, 
	reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Wed, Jan 8, 2025 at 3:45=E2=80=AFPM Jan Kara <jack@suse.cz> wrote:
>
> On Wed 08-01-25 02:05:04, syzbot wrote:
> > syzbot suspects this issue was fixed by commit:
> >
> > commit fb6f20ecb121cef4d7946f834a6ee867c4e21b4a
> > Author: Jan Kara <jack@suse.cz>
> > Date:   Thu Oct 17 10:28:23 2024 +0000
> >
> >     reiserfs: The last commit
> >
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D168c7edf=
980000
> > start commit:   59b723cd2adb Linux 6.12-rc6
> > git tree:       upstream
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D921b01cbfd8=
87a9b
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3Dd796ad2656d5b=
38910ee
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D1765c7405=
80000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D12a786a7980=
000
> >
> > If the result looks correct, please mark the issue as fixed by replying=
 with:
>
> Well, obviously :). As well as all the other reiserfs bugs. Syzkaller guy=
s,
> perhaps you can do some management action and close all reiserfs bugs in
> one big sweep?
>
> #syz fix: reiserfs: The last commit

Judging by the web dashboard, there are actually already no open reiserfs b=
ugs.
Thanks for closing the last one! :)

--=20
Aleksandr

>
>                                                                 Honza
> --
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
>

