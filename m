Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0CE7A6EB4
	for <lists+reiserfs-devel@lfdr.de>; Wed, 20 Sep 2023 00:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233522AbjISWfl (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 19 Sep 2023 18:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233489AbjISWfl (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 19 Sep 2023 18:35:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE996BF
        for <reiserfs-devel@vger.kernel.org>; Tue, 19 Sep 2023 15:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695162896;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eQus7xN9bGIDtrSXQ5yUpeC9VO6X9bRJrGYUnimnUlQ=;
        b=UbbczSAYT3IJaOGkkw+JdE3xINA/c4dtLVRUdkkOxkNVaTRDDeUVctKMUx/tyuleT1OPbe
        IL92thowImt4XkZG0tgW0EMj6XtBQFyksM+gMfQSH+9zpAe8gBkHYiSVJtEuoYuKm09pG/
        l7zVJaCHo0i1H+MeDOO7NrENPfsg4XM=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-ALdnrJYDPPyhP0WczSnKWg-1; Tue, 19 Sep 2023 18:34:54 -0400
X-MC-Unique: ALdnrJYDPPyhP0WczSnKWg-1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1c0d58f127fso61194045ad.2
        for <reiserfs-devel@vger.kernel.org>; Tue, 19 Sep 2023 15:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695162893; x=1695767693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQus7xN9bGIDtrSXQ5yUpeC9VO6X9bRJrGYUnimnUlQ=;
        b=EBzX0FgAVuB+OTiNzcEyiiZ77IbRk/AKTCQBOpai12oPrC0kUIqiWNBLzvd2X6n/xc
         TQ5bR3ZajawUyik24XNK7qRDmj1WcKPGR7wYKzHIgmA7Nmj8tIg3Fb3K5vhOXeLpCoBP
         i9shlrJDlzNE1W/uw/xNGiNNxVAwSe8qvs4c/FVMCSf6JxqHOtPVPQ77EoshQQqHpEdx
         RevorcU60BWwu9yjXQjbaECEDpRUe1nUPdYbLLUxjoqkV5zo8uBeyTdr/0INmCde9ItF
         8M5q7nI8pomBnlZufuZdvBOfCL/fYOj7ky5FJkc70j7ysRr6jrloUvse/EnHNfQ7RZkI
         Y0JQ==
X-Gm-Message-State: AOJu0YzlH9gf7Nx980dOIsHQDREDKByHaBWaj0/qBiMzyRc0jTPDYKGw
        K5yyXmW1sASiAE8XnY8sRTcUjTrLNdwQ7rBlGZxogAhWw/6qGKYVXjg2URHjx5DkX5ocRDeg8wl
        1JejE5j930p1+y9zSVIPy96vpZedbUGsHqZKp0S3NbbE=
X-Received: by 2002:a17:902:b7c1:b0:1c5:76b6:d94f with SMTP id v1-20020a170902b7c100b001c576b6d94fmr670932plz.31.1695162893573;
        Tue, 19 Sep 2023 15:34:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu/S/lyzCqiFdVXm1k+F3+3GUX39OQdWtJW6vZV10el6lsOztHA7G1b8fJFoeMaNNk2ei0WeIxrr96YpLaY20=
X-Received: by 2002:a17:902:b7c1:b0:1c5:76b6:d94f with SMTP id
 v1-20020a170902b7c100b001c576b6d94fmr670921plz.31.1695162893309; Tue, 19 Sep
 2023 15:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230919045135.3635437-1-willy@infradead.org> <20230919045135.3635437-7-willy@infradead.org>
In-Reply-To: <20230919045135.3635437-7-willy@infradead.org>
From:   Andreas Gruenbacher <agruenba@redhat.com>
Date:   Wed, 20 Sep 2023 00:34:41 +0200
Message-ID: <CAHc6FU6JasO3-8VaOm3MieLEn599OTKPnZC5BwkNUMqNoJ+meA@mail.gmail.com>
Subject: Re: [PATCH 06/26] gfs2: Convert gfs2_getbuf() to folios
To:     "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-fsdevel@vger.kernel.org, gfs2@lists.linux.dev,
        linux-nilfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
        ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev,
        reiserfs-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
        Pankaj Raghav <p.raghav@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Tue, Sep 19, 2023 at 7:00=E2=80=AFAM Matthew Wilcox (Oracle)
<willy@infradead.org> wrote:
> Remove several folio->page->folio conversions.  Also use __GFP_NOFAIL
> instead of calling yield() and the new get_nth_bh().
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  fs/gfs2/meta_io.c | 39 +++++++++++++++++----------------------
>  1 file changed, 17 insertions(+), 22 deletions(-)
>
> diff --git a/fs/gfs2/meta_io.c b/fs/gfs2/meta_io.c
> index 924361fa510b..f1fac1b45059 100644
> --- a/fs/gfs2/meta_io.c
> +++ b/fs/gfs2/meta_io.c
> @@ -115,7 +115,7 @@ struct buffer_head *gfs2_getbuf(struct gfs2_glock *gl=
, u64 blkno, int create)
>  {
>         struct address_space *mapping =3D gfs2_glock2aspace(gl);
>         struct gfs2_sbd *sdp =3D gl->gl_name.ln_sbd;
> -       struct page *page;
> +       struct folio *folio;
>         struct buffer_head *bh;
>         unsigned int shift;
>         unsigned long index;
> @@ -129,36 +129,31 @@ struct buffer_head *gfs2_getbuf(struct gfs2_glock *=
gl, u64 blkno, int create)
>         bufnum =3D blkno - (index << shift);  /* block buf index within p=
age */
>
>         if (create) {
> -               for (;;) {
> -                       page =3D grab_cache_page(mapping, index);
> -                       if (page)
> -                               break;
> -                       yield();
> -               }
> -               if (!page_has_buffers(page))
> -                       create_empty_buffers(page, sdp->sd_sb.sb_bsize, 0=
);
> +               folio =3D __filemap_get_folio(mapping, index,
> +                               FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
> +                               mapping_gfp_mask(mapping) | __GFP_NOFAIL)=
;
> +               bh =3D folio_buffers(folio);
> +               if (!bh)
> +                       bh =3D folio_create_empty_buffers(folio,
> +                               sdp->sd_sb.sb_bsize, 0);
>         } else {
> -               page =3D find_get_page_flags(mapping, index,
> -                                               FGP_LOCK|FGP_ACCESSED);
> -               if (!page)
> +               folio =3D __filemap_get_folio(mapping, index,
> +                               FGP_LOCK | FGP_ACCESSED, 0);
> +               if (IS_ERR(folio))
>                         return NULL;
> -               if (!page_has_buffers(page)) {
> -                       bh =3D NULL;
> -                       goto out_unlock;
> -               }
> +               bh =3D folio_buffers(folio);
>         }
>
> -       /* Locate header for our buffer within our page */
> -       for (bh =3D page_buffers(page); bufnum--; bh =3D bh->b_this_page)
> -               /* Do nothing */;
> -       get_bh(bh);
> +       if (!bh)
> +               goto out_unlock;
>
> +       bh =3D get_nth_bh(bh, bufnum);
>         if (!buffer_mapped(bh))
>                 map_bh(bh, sdp->sd_vfs, blkno);
>
>  out_unlock:
> -       unlock_page(page);
> -       put_page(page);
> +       folio_unlock(folio);
> +       folio_put(folio);
>
>         return bh;
>  }
> --
> 2.40.1
>

Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>

Thanks,
Andreas

