Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEAAF2777CF
	for <lists+reiserfs-devel@lfdr.de>; Thu, 24 Sep 2020 19:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728694AbgIXR3V (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 24 Sep 2020 13:29:21 -0400
Received: from nl101-3.vfemail.net ([149.210.219.33]:59432 "EHLO
        nl101-3.vfemail.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727555AbgIXR3V (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 24 Sep 2020 13:29:21 -0400
X-Greylist: delayed 401 seconds by postgrey-1.27 at vger.kernel.org; Thu, 24 Sep 2020 13:29:21 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=vfemail.net; h=date:from
        :to:cc:subject:message-id:in-reply-to:references:mime-version
        :content-type:content-transfer-encoding; s=2018; bh=rsbrzNBJkacP
        pVJwOelaXLkQSRipjzlA+7XC0ZOCUpQ=; b=aV25gztyX36Z/DMduFCmAiowPMkC
        zq7tbpDSijeIcOoMITFdcRnSU3EdmbN5tjIq53VdMqGwhbTPGi7i2nLj+4Xm0pYb
        st8GQ3bTsE4cHJ+kt/cKxPbxzNfVMXlUSUBUNJAo3uSx+orV3JjaE69gICTyM6YX
        ZxavqimR5U2TinU=
Received: (qmail 97887 invoked from network); 24 Sep 2020 17:22:39 -0000
Received: by simscan 1.4.0 ppid: 97826, pid: 97879, t: 0.2845s
         scanners:none
Received: from unknown (HELO d3d3MTkyLnZmZW1haWwubmV0) (aGdudGt3aXNAdmZlbWFpbC5uZXQ=@MTkyLjE2OC4xLjE5Mg==)
  by nl101.vfemail.net with ESMTPA; 24 Sep 2020 17:22:39 -0000
Date:   Thu, 24 Sep 2020 13:21:58 -0400
From:   David Niklas <Hgntkwis@vfemail.net>
To:     reiserfs-devel@vger.kernel.org
Cc:     Edward Shishkin <edward.shishkin@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: PATCH reiser4 support for Linux 5.8.10
Message-ID: <20200924132158.38fa279f@Phenom-II-x6.niklas.com>
In-Reply-To: <20200817105604.454981dd@Phenom-II-x6.niklas.com>
References: <20200728222041.5d88b2e1@Phenom-II-x6.niklas.com>
        <20200728223440.0fd8681e@Phenom-II-x6.niklas.com>
        <20200805125317.10bf1d34@Phenom-II-x6.niklas.com>
        <CAHk-=wiGsj_R7pspFegPgtT4on1iYk5MmBz8uZZ3338EH3HO+Q@mail.gmail.com>
        <20200817105604.454981dd@Phenom-II-x6.niklas.com>
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

I'm a kernel dev newbie. Please double check my work if in doubt.

The patch for reiser4 support for Linux 5.8.1 didn't apply to 5.8.10. It
needed only a one line change, but because of all the fuzzy matching and
offset matching I thought I'd make a new one.
The file that failed to patch is fs/fs-writeback.c. A struct got one of
it's members removed. As the entire struct was removed by the patch I
thought it good to ignore the missing member instead of trying to dig up
what it was used for and why it was removed.

Thanks,
David
