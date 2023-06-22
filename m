Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6683E739385
	for <lists+reiserfs-devel@lfdr.de>; Thu, 22 Jun 2023 02:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230315AbjFVAFp (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 21 Jun 2023 20:05:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230270AbjFVAFm (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 21 Jun 2023 20:05:42 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B9641BF9
        for <reiserfs-devel@vger.kernel.org>; Wed, 21 Jun 2023 17:05:14 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1b4f95833c7so34590725ad.1
        for <reiserfs-devel@vger.kernel.org>; Wed, 21 Jun 2023 17:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687392239; x=1689984239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xq0dkv7azkvedb0KULWF4WuIbSO15dlwApz3MpULLXE=;
        b=AwtajXI8+J6DndfxRUIKzXCkBY8xGz60/k5sDcezJKwVGjGClzxX4hXpgteDe2dQ9h
         4d2HnnsDKY90T8y0a3ww96+rL99eVgWq1UXwqto72GaZgsChKyMxxDHywAY92C/ZdF6T
         X74yKEqM1f90KQ6KGhb8eT7QKMRkG+1RM2z/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687392239; x=1689984239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xq0dkv7azkvedb0KULWF4WuIbSO15dlwApz3MpULLXE=;
        b=H8Lewy/xKQK8VfvMJi3Pd6SFt7/2O/H/1aytFiIhY4GnHit7F076oKbrevqCdFdI6e
         F/bgvOlYkOLWalRKZdP6iVWhHSUrwnUy94SCCCPSpP3fyW8TcCeD6KElAZcADYDWhcrF
         PnGe6A7KKYfzt2ZH+jKwNXqOmk8ife+1WXMRv792idA3DpRXJpcaYPd461V9pKY+BX9i
         qqOWQEdaNyXGlRfY7scxRWD7FIICDCHEDGk7C44Z0pTzvhSFuftz7FN6zwKI+pfBqb0u
         Yib+4+hltc80F+aPbK3zi1yp1HhUuLlZcRAT3U+/VivCKq39RBof+y5Je3IcchPl5mpn
         TSdQ==
X-Gm-Message-State: AC+VfDw7colZKg4lesAOWHG7Wj+G2yO/Yx70fuyry7SNYcEfS+DYzaWX
        9fFDqSV0kXYhhaVzf1BfUDnAFA==
X-Google-Smtp-Source: ACHHUZ53xmAEhlIo0pgHgTU4ZsSk7xwA4q8JgCHr72rMOhDtXySNGOwMcP4W8fBuxFBj5os20ReXhQ==
X-Received: by 2002:a17:902:e544:b0:1b6:7c9a:3a53 with SMTP id n4-20020a170902e54400b001b67c9a3a53mr6912803plf.67.1687392239478;
        Wed, 21 Jun 2023 17:03:59 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id lg13-20020a170902fb8d00b0019aeddce6casm4013845plb.205.2023.06.21.17.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 17:03:58 -0700 (PDT)
Date:   Wed, 21 Jun 2023 17:03:58 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] reiserfs: Replace one-element array with
 flexible-array member
Message-ID: <202306211703.9AC418A@keescook>
References: <ZJN9Kqhcs0ZGET/8@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJN9Kqhcs0ZGET/8@work>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Wed, Jun 21, 2023 at 04:43:54PM -0600, Gustavo A. R. Silva wrote:
> One-element arrays are deprecated, and we are replacing them with flexible
> array members instead. So, replace one-element array with flexible-array
> member in direntry_uarea structure, and refactor the rest of the code,
> accordingly.
> 
> Worth mentioning is that before these changes, the original implementation
> was returning two-too many bytes in function direntry_create_vi():
> 
> fs/reiserfs/item_ops.c:464:     int size = sizeof(struct direntry_uarea);
> ...
> fs/reiserfs/item_ops.c-490-     size += (dir_u->entry_count * sizeof(short));
> ...
> fs/reiserfs/item_ops.c-517-     return size;
> 
> Link: https://github.com/KSPP/linux/issues/79
> Link: https://github.com/KSPP/linux/issues/290
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
