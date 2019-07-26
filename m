Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15992774B9
	for <lists+reiserfs-devel@lfdr.de>; Sat, 27 Jul 2019 00:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727643AbfGZWyS (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 26 Jul 2019 18:54:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:54894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727483AbfGZWyS (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 26 Jul 2019 18:54:18 -0400
Received: from localhost.localdomain (c-73-223-200-170.hsd1.ca.comcast.net [73.223.200.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 66CEC218B0;
        Fri, 26 Jul 2019 22:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564181657;
        bh=0I8ibO4ILGJpL8erC1yuBP5LAOpyh2rkqKPnbsCnLuY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=pK1MW8MvICaSKOlCQqHnQ9l6nuLWH6z5U/EVYmUGTyLWaJMRR5LGPnmkHYCxsAgVO
         blFDeY2cL9fAqNHU9VjvQ4Kfda8QxzbtCF2lQT8kJ+rUUblKp5A13I2P6xwKeiY4qq
         zxEv6sAEkwCslSXWueRrCDWR7IN/4kpH6j9BxHnE=
Date:   Fri, 26 Jul 2019 15:54:16 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Jia-Ju Bai <baijiaju1990@gmail.com>
Cc:     jack@suse.cz, arnd@arndb.de, linux.bhar@gmail.com,
        hariprasad.kelam@gmail.com, reiserfs-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fs: reiserfs: Fix possible null-pointer dereferences in
 remove_from_transaction()
Message-Id: <20190726155416.86f1b96302273b91129e6dc3@linux-foundation.org>
In-Reply-To: <20190726083838.8301-1-baijiaju1990@gmail.com>
References: <20190726083838.8301-1-baijiaju1990@gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Fri, 26 Jul 2019 16:38:38 +0800 Jia-Ju Bai <baijiaju1990@gmail.com> wrote:

> In remove_from_transaction(), there is an if statement on line 3447 to
> check whether bh is NULL:
>     if (bh)

We already know that bh != NULL here.

	cn = get_journal_hash_dev(sb, journal->j_hash_table, blocknr);
	if (!cn || !cn->bh) {
		return ret;
	}
	bh = cn->bh;


Please prepare a patch to remove the unneeded test?
