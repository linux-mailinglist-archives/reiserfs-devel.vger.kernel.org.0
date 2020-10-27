Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9AC329C90D
	for <lists+reiserfs-devel@lfdr.de>; Tue, 27 Oct 2020 20:36:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504084AbgJ0Tgp (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 27 Oct 2020 15:36:45 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:48203 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2504087AbgJ0Tgo (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 27 Oct 2020 15:36:44 -0400
Received: from callcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net [72.74.133.215])
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 09RJaXEt029645
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 27 Oct 2020 15:36:34 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id CB01F420107; Tue, 27 Oct 2020 15:36:33 -0400 (EDT)
Date:   Tue, 27 Oct 2020 15:36:33 -0400
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     Edward Shishkin <edward.shishkin@gmail.com>
Cc:     David Niklas <Hgntkwis@vfemail.net>,
        reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: PROBLEM: Reiser4 hard lockup
Message-ID: <20201027193633.GE5691@mit.edu>
References: <20201025090422.D80F56FB40E1@huitzilopochtli.metztli-it.com>
 <20201025210758.034aa947@Phenom-II-x6.niklas.com>
 <2e2f8dc4-a48e-f09c-3f41-5dfa7f9a6387@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e2f8dc4-a48e-f09c-3f41-5dfa7f9a6387@gmail.com>
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Tue, Oct 27, 2020 at 01:53:31AM +0100, Edward Shishkin wrote:
> > > reiser4progs 1.1.x Software Framework Release Number (SFRN) 4.0.1 file
> > > system utilities should not be used to check/fix media formatted 'a
> > > priori' in SFRN 4.0.2 and vice-versa.
> > 
> > Honestly, this is the first time I've heard about a Linux FS having
> > versioning other than a major one
> 
> This is because, unlike other Linux file systems, reiser4 is a
> framework.
> 
> In vanilla kernel having a filesystem-as-framework is discouraged for
> ideological reasons. As they explained: "nobody's interested in
> plugins". A huge monolithic mess without any internal structure -
> welcome :)

I wouldn't call it an ideological problem, but more about wanting to
assure interoperability issues and wanting to reduce confusion on the
part of users, especially if images get moved between systems.  There
is also plenty of way of introducing internal structure and code
cleanliness without going completely undisciplined with respect to
on-disk format extensions.  :-)

Finally, I'll note that ext 2/3/4 does have a rather fine-grained set
of feature flags, with specific rules about what the kernel --- and
e2fsck --- should do if it finds a feature bit it doesn't understand
in the incompat, ro_compat, and compat feature flags set.  This is
especially helpful since we have multiple implementations of ext 2/3/4
out there (in FreeBSD, the GRUB bootloader, GNU HURD, Fuchsia, etc.)
and so using feature bits allow for safe and reliable interoperability
with the user being warned if they can safely only mount the file
system read-only, or not at all, if the file system has some new
feature that their current OS version does not support.  We can also
give appropriate warnings if they are using an insufficiently recent
version of the userspace tools.

Cheers,

					- Ted
