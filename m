Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F841382B48
	for <lists+reiserfs-devel@lfdr.de>; Mon, 17 May 2021 13:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236901AbhEQLjN (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 17 May 2021 07:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236897AbhEQLjM (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 17 May 2021 07:39:12 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 729E2C061573;
        Mon, 17 May 2021 04:37:56 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id x19so8319209lfa.2;
        Mon, 17 May 2021 04:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Lk6lRGGKDk8jVlYh4Ia7bVfcb10zvdejQe0GtRSIxQ=;
        b=E5we09gZggsfQun+UMNQ3JGiCMz0ShV/NUTjPlxP05wZxJxBRvOu8YbZkuZMgzBG1M
         JtAfhLMGolE9cUKfXW+p03gtLyoPGl/GRGgix38tZcAAPY7KApBuJxhctqh/hNPVbTIn
         ysIchEluEPlC63O8qrSyhAjWEQBTyx2g0hO5e/QfsSBdlHJSLzyk5jioJFpOmB/9fFpH
         3q14rG7udOLMDsYKt20gr48gqui1i0qrP4ndzJBhYhlF+cSlXWeECZpecfLMuqk40eRU
         iLcpBo0aojtYKXN4B99yEUzE6VZ8ddSzvZ+YPwwCV46/e4pL9eDlEHIZomJ1cwdflT80
         Q0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Lk6lRGGKDk8jVlYh4Ia7bVfcb10zvdejQe0GtRSIxQ=;
        b=F3x8YK2UM/hs+fjULn63ExGmpPnHMimTd/Wbif+U6eDeESYzu+W0UYPR8cuiRVna0+
         M8dClVoC0MgSxUsxG495VLDrO8cQvr+Y2btFLd5RkNfzYyD3r2knkaC7YP3jtgnLGtH+
         RlKzaueW4zgOL5gFUgMmk4Gk2MnvxgD/+jvLDpFyJBH50e7IXU6HLnABbastjtBuyr8o
         kBe4zHoPp4joajNrFZyG3OL9Y2Gbdw6araxe7IEa78UrUTdtpcR9N+vbHOwtnvVtgAGV
         +tufz+9SKIjFQ+jje1dRs2eCmo8/8RznrXIt1F6A+488Bvi9pVLrlZplImXQosPNxhx3
         jWRA==
X-Gm-Message-State: AOAM530J0R8j//qCi0bTzAQmYZ/bkDlbAB0QJAn/Fgt/8XyfGTQ7HPKs
        uBR1kyhmGyqBx29hn+MSAUI=
X-Google-Smtp-Source: ABdhPJwZGbuiLpQgn5GG4nKwhrBTowYlbmASzqDnX4JEOY3PnpTNgwGt2jkboLcYOoNuJ72NadMfBw==
X-Received: by 2002:a19:c182:: with SMTP id r124mr8390855lff.653.1621251474878;
        Mon, 17 May 2021 04:37:54 -0700 (PDT)
Received: from localhost.localdomain ([94.103.227.227])
        by smtp.gmail.com with ESMTPSA id p21sm1929669lfg.97.2021.05.17.04.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 04:37:54 -0700 (PDT)
Date:   Mon, 17 May 2021 14:37:52 +0300
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     Jan Kara <jack@suse.cz>
Cc:     tiantao6@hisilicon.com, rdunlap@infradead.org,
        reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot+0ba9909df31c6a36974d@syzkaller.appspotmail.com
Subject: Re: [PATCH] reiserfs: add check for invalid 1st journal block
Message-ID: <20210517143752.2f43af03@gmail.com>
In-Reply-To: <20210517101523.GB31755@quack2.suse.cz>
References: <20210514212335.9709-1-paskripkin@gmail.com>
        <20210517101523.GB31755@quack2.suse.cz>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Mon, 17 May 2021 12:15:23 +0200
Jan Kara <jack@suse.cz> wrote:
> On Sat 15-05-21 00:23:35, Pavel Skripkin wrote:
> > syzbot reported divide error in reiserfs.
> > The problem was in incorrect journal 1st block.
> > 
> > Syzbot's reproducer manualy generated wrong superblock
> > with incorrect 1st block. In journal_init() wasn't
> > any checks about this particular case.
> > 
> > For example, if 1st journal block is before superblock
> > 1st block, it can cause zeroing important superblock members
> > in do_journal_end().
> > 
> > Reported-and-tested-by:
> > syzbot+0ba9909df31c6a36974d@syzkaller.appspotmail.com
> > Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> 
> Thanks for the patch. One comment below:
> 
> > diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
> > index 9edc8e2b154e..d58f24a08385 100644
> > --- a/fs/reiserfs/journal.c
> > +++ b/fs/reiserfs/journal.c
> > @@ -2758,6 +2758,19 @@ int journal_init(struct super_block *sb,
> > const char *j_dev_name, goto free_and_return;
> >  	}
> >  
> > +	/*
> > +	 * Sanity check to see is journal first block correct.
> > +	 * If journal first block is invalid it can cause
> > +	 * zeroing important superblock members.
> > +	 */
> > +	if (SB_ONDISK_JOURNAL_1st_BLOCK(sb) <
> > SB_JOURNAL_1st_RESERVED_BLOCK(sb)) {
> 
> I guess this check is valid only if !SB_ONDISK_JOURNAL_DEVICE(sb),
> isn't it? Otherwise you are comparing block numbers from two
> different devices...
> 

Hi!

Indeed. Thanks for pointing it out! I'll send v2 soon

> 									Honza
> 
> > +		reiserfs_warning(sb, "journal-1393",
> > +			"journal 1st super block is invalid: 1st
> > reserved block %d, but actual 1st block is %d",
> > +			SB_JOURNAL_1st_RESERVED_BLOCK(sb),
> > +			SB_ONDISK_JOURNAL_1st_BLOCK(sb));
> > +		goto free_and_return;
> > +	}
> > +
> >  	if (journal_init_dev(sb, journal, j_dev_name) != 0) {
> >  		reiserfs_warning(sb, "sh-462",
> >  				 "unable to initialize journal
> > device"); -- 
> > 2.31.1
> > 




With regards,
Pavel Skripkin
