Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3EBB39F3F3
	for <lists+reiserfs-devel@lfdr.de>; Tue,  8 Jun 2021 12:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231777AbhFHKqx (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 8 Jun 2021 06:46:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231656AbhFHKqv (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 8 Jun 2021 06:46:51 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC69FC061787;
        Tue,  8 Jun 2021 03:44:47 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id i10so31349867lfj.2;
        Tue, 08 Jun 2021 03:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RQrvOOav2Bz07nagbQp4IaMsDtzS0SARmjf449xkKTE=;
        b=H0g5dE5ct2vfn54LljqsH3PsAAf+N6ccwBzPSpf9DiIR4UoSSp0hq1lHHrqjgU8c20
         gZqH5ZBnyvCui7JCt3M4Zidpva0ERHmoeinDerCeFS7q+KWNfNsaaKWcpXGME/Yh0b0s
         2Cn8hyAJCWl3pS3VEGy49+QUo5n84EpNSv9TpUIFm4hvrDdKOrlMGJpkXcOqRt9gUFAJ
         S5czwEhgTvZ11uvkOOK4dMxZprhF8QDZOklpZraQzfh5WIRwqmZhdSuzHGt7LTKGdpRw
         S9pkNLgTbugWUESxO1ls8oUTyYVh6BVnzTWgfsao3v5IiWvJAa8AZYEiArbNr7GpV9IS
         orgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RQrvOOav2Bz07nagbQp4IaMsDtzS0SARmjf449xkKTE=;
        b=VXkTiWJoikzN1ufCdi+LjQEje1UUdO9+rwU5jz8Xcc/NKEV28Nll7XtQ1UX36okGoF
         G5+8NL5B4wCjt47lBL+i9/Dz2yuVPQVhMv4Yp9i3dXiR8QM0SaHndf33M7EKCY+U8ncv
         AMTx6zYtHyraHEBJJqQqljeDWhR8VN3K3D1VSMvz6BEi0IamvhsmlCaVYLZ4Zs53bmkO
         2c4JwtjgnXPpRW48neM0G/cLaJl+FcXsYyDqWbVccS06pyyK8opOaVTUfXzo5OSX/14+
         BT7fRZbBafDVeeacoKYUT3AcSrNMlijwl1bL1nL4qtgAzLp9oeTCjoCBj02mYtocZcXn
         XbWg==
X-Gm-Message-State: AOAM531r74lb2YVytkY3bxc+7o4DgwLrcOvW3GTDGeWxwSuQ6LDe0niz
        5CwOD4XTHDIbl/G4hFvn0Is=
X-Google-Smtp-Source: ABdhPJy2HRmEgKYS9HCZg4uxWytp+lgVbuV9/1TOdiByYE73EUKYV/uLP2XoJsK1XlTYp7XieX0/QQ==
X-Received: by 2002:ac2:5053:: with SMTP id a19mr5311715lfm.383.1623149086006;
        Tue, 08 Jun 2021 03:44:46 -0700 (PDT)
Received: from localhost.localdomain ([94.103.224.40])
        by smtp.gmail.com with ESMTPSA id e21sm652966ljl.26.2021.06.08.03.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 03:44:45 -0700 (PDT)
Date:   Tue, 8 Jun 2021 13:44:43 +0300
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     Jan Kara <jack@suse.cz>
Cc:     tiantao6@hisilicon.com, rdunlap@infradead.org,
        reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot+0ba9909df31c6a36974d@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] reiserfs: add check for invalid 1st journal block
Message-ID: <20210608134443.022b3389@gmail.com>
In-Reply-To: <20210517130818.GB25760@quack2.suse.cz>
References: <20210517101523.GB31755@quack2.suse.cz>
        <20210517121545.29645-1-paskripkin@gmail.com>
        <20210517130818.GB25760@quack2.suse.cz>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Mon, 17 May 2021 15:08:18 +0200
Jan Kara <jack@suse.cz> wrote:

> On Mon 17-05-21 15:15:45, Pavel Skripkin wrote:
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
> > Reported-by: syzbot+0ba9909df31c6a36974d@syzkaller.appspotmail.com
> > Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> 
> Thanks! I've added the patch to my tree.
> 
> 								Honza
> 

Hi, Jan!

Is this patched got lost somehow? I did't find it in your tree here
https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git/.

Sorry to bother you, maybe Im missing something :)



With regards,
Pavel Skripkin
