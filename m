Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CAA423D08E
	for <lists+reiserfs-devel@lfdr.de>; Wed,  5 Aug 2020 21:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbgHETuf (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 5 Aug 2020 15:50:35 -0400
Received: from nl101-3.vfemail.net ([149.210.219.33]:29121 "EHLO
        nl101-3.vfemail.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbgHEQxt (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 5 Aug 2020 12:53:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=vfemail.net; h=date:from
        :to:cc:subject:message-id:in-reply-to:references:mime-version
        :content-type:content-transfer-encoding; s=2018; bh=tYTZlfDivesu
        wi6sEO939lAeryFUt15mP3CTKxRkvYg=; b=XjkRWk2CAyjuwIB2PasUeibrCqn0
        oZQGGZh2d1cOJFoXN9VtHHOsD44G2F5k+LIKoY84qeEpsKAaiXYb5IRzgwJcv8yE
        YBx9Ac9QFJELvZN9dapV+4Bz67Lyghsc8ov5yBMLeiu1i7GytxQk9P7/iChTf1Qd
        NCJOufApk/g1R5g=
Received: (qmail 62778 invoked from network); 5 Aug 2020 16:53:32 -0000
Received: by simscan 1.4.0 ppid: 62756, pid: 62775, t: 0.2959s
         scanners:none
Received: from unknown (HELO d3d3MTkyLnZmZW1haWwubmV0) (aGdudGt3aXNAdmZlbWFpbC5uZXQ=@MTkyLjE2OC4xLjE5Mg==)
  by nl101.vfemail.net with ESMTPA; 5 Aug 2020 16:53:31 -0000
Date:   Wed, 5 Aug 2020 12:53:17 -0400
From:   Hgntkwis@vfemail.net
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org
Subject: Re: PROBLEM: IO lockup on reiserfs FS.
Message-ID: <20200805125317.10bf1d34@Phenom-II-x6.niklas.com>
In-Reply-To: <20200728223440.0fd8681e@Phenom-II-x6.niklas.com>
References: <20200728222041.5d88b2e1@Phenom-II-x6.niklas.com>
 <20200728223440.0fd8681e@Phenom-II-x6.niklas.com>
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

It's been over 1 week since I sent this into the reiserfs-devel mailing
list. I'm escalating this as the kernel docs recommend.
I'm still willing to help debug and test a fix for this problem.

"Given enough eyeballs, all bugs are shallow".
This bug is visible, could we please quash it?

Original message:
https://lkml.org/lkml/2020/7/28/1435
Filed bug:
https://bugzilla.kernel.org/show_bug.cgi?id=208719

Thanks,
David
