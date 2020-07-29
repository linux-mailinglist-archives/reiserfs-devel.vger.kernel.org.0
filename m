Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C8C82317BD
	for <lists+reiserfs-devel@lfdr.de>; Wed, 29 Jul 2020 04:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731141AbgG2CmW (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 28 Jul 2020 22:42:22 -0400
Received: from nl101-3.vfemail.net ([149.210.219.33]:12625 "EHLO
        nl101-3.vfemail.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730407AbgG2CmW (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 28 Jul 2020 22:42:22 -0400
X-Greylist: delayed 402 seconds by postgrey-1.27 at vger.kernel.org; Tue, 28 Jul 2020 22:42:22 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=vfemail.net; h=date:from
        :to:cc:subject:message-id:in-reply-to:references:mime-version
        :content-type:content-transfer-encoding; s=2018; bh=FmncsGltNbBm
        9DrnbETpoZufhhj5tXE7ZJm+sjYOeS8=; b=ZG+6AwQc6INJ7Yvl7GWEGEP4II9M
        fDCwnVelBLcnc4pGN2JabiybdrfNdyMwVFe3i43sw05IjTIpQ0vibjCv8hbjPhmp
        9Wg015n64hilK9h/df02sLQtriemcY1/ZUovJ9qN2Vmt4A0rvR3aJpysiirSz0ug
        yOUI21M8LE8jBPA=
Received: (qmail 93195 invoked from network); 29 Jul 2020 02:35:42 -0000
Received: by simscan 1.4.0 ppid: 93122, pid: 93191, t: 0.2773s
         scanners:none
Received: from unknown (HELO d3d3MTkyLnZmZW1haWwubmV0) (aGdudGt3aXNAdmZlbWFpbC5uZXQ=@MTkyLjE2OC4xLjE5Mg==)
  by nl101.vfemail.net with ESMTPA; 29 Jul 2020 02:35:41 -0000
Date:   Tue, 28 Jul 2020 22:34:40 -0400
From:   David Niklas <Hgntkwis@vfemail.net>
To:     reiserfs-devel@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Subject: Re: PROBLEM: IO lockup on reiserfs FS.
Message-ID: <20200728223440.0fd8681e@Phenom-II-x6.niklas.com>
In-Reply-To: <20200728222041.5d88b2e1@Phenom-II-x6.niklas.com>
References: <20200728222041.5d88b2e1@Phenom-II-x6.niklas.com>
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

I should add that in chasing down this bug I have tried all the IO
schedulers available (noop deadline and cfq). Cfq is the one I'm now
using to reproduce this.

Also, I don't know if it makes a difference, but when the system first
starts up it takes 20m to get from the login manager to having my web
browsers restart and get all their pages from online. It might be because
there is a lot of IO going on or it might be that there are several
stalls in the scheduling; just not bad enough to cause a hung task
problem like above.
