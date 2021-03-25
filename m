Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85A9F349497
	for <lists+reiserfs-devel@lfdr.de>; Thu, 25 Mar 2021 15:51:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbhCYOui (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 25 Mar 2021 10:50:38 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:53273 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S230517AbhCYOuI (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 25 Mar 2021 10:50:08 -0400
Received: from cwcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net [72.74.133.215])
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 12PEnxns001035
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 25 Mar 2021 10:49:59 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
        id 0830015C39CC; Thu, 25 Mar 2021 10:49:59 -0400 (EDT)
Date:   Thu, 25 Mar 2021 10:49:58 -0400
From:   "Theodore Ts'o" <tytso@mit.edu>
To:     Metztli Information Technology <jose.r.r@metztli.com>
Cc:     debian-cloud@lists.debian.org,
        Edward Shishkin <edward.shishkin@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Subject: Re: Making a test version of Bullseye as a GCE image available?
Message-ID: <YFyjFt/lmE6ECGcS@mit.edu>
References: <YFjZS8DsVQQeE5Ov@mit.edu>
 <3502816731a314939e4dc04edd5c1ce2744bda11.camel@metztli.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3502816731a314939e4dc04edd5c1ce2744bda11.camel@metztli.com>
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Wed, Mar 24, 2021 at 10:38:33PM -0700, Metztli Information Technology wrote:
> Note, however, that when I built reiser4 SFRN 4 -enabled 5.10.23 kernel
> for Debian 11 Bullseye a few days ago, I had to use the guest
> environment for Debian 10 Buster since there was not even a repo for
> bullseye 
> < https://github.com/GoogleCloudPlatform/compute-image-packages > to
> include in /etc/apt/sources.list.d/google-cloud.list

I just checked, and while the documentation in:

   https://github.com/GoogleCloudPlatform/compute-image-packages

hasn't been updated to include Bullseye, but if you follow the pattern
given:

   Add a source list file /etc/apt/sources.list.d/google-cloud.list and
   change DIST to either stretch for Debian 9 or buster for Debian 10:

   DIST=stretch
   sudo tee /etc/apt/sources.list.d/google-cloud.list << EOM
   deb http://packages.cloud.google.com/apt google-compute-engine-${DIST}-stable main
   deb http://packages.cloud.google.com/apt google-cloud-packages-archive-keyring-${DIST} main
   EOM

And you use "bullseye" for DIST, it appears, that if you look at:

https://packages.cloud.google.com/apt/dists/...

the relevant subdirectories (e.g.,
google-compute-engine-bullseye-stable) do exist and appear to be
populated.

I haven't tried them using them, so I don't know how well they work,
but it looks like they do exist and are ready for people to test them
out and report issues.  (Insert standard caveat of using Debian
Testing in production environments, of course.  If it breaks, you get
to keep both pieces.  :-)

Cheers,

						- Ted
