Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96D3B1FBE44
	for <lists+reiserfs-devel@lfdr.de>; Tue, 16 Jun 2020 20:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729173AbgFPSjF (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 16 Jun 2020 14:39:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgFPSjE (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 16 Jun 2020 14:39:04 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E738C06174E
        for <reiserfs-devel@vger.kernel.org>; Tue, 16 Jun 2020 11:39:04 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id h10so5872996pgq.10
        for <reiserfs-devel@vger.kernel.org>; Tue, 16 Jun 2020 11:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8RJK2syfb1UPJfcE04G7USvWkMzpU9ggu2GVyOrhih8=;
        b=mzlz8vzfLovPNfG+Ed5YF/HIguRWsjR3QNuf01Zt+vV/LN6FrwR9kRkYU4zOF2pH/K
         zVimmlH2LI3ykQvPr7+k3xzXnVNo/jxThzz7hStN49Y8UFXZ5EW7t76l3wmrQYe24sXF
         TGgQ8LRyLduDA4Jt1oAm5/gpCPEJ9z0DhTS+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8RJK2syfb1UPJfcE04G7USvWkMzpU9ggu2GVyOrhih8=;
        b=Pexzca+JB4XyFMb24chk/K3yIdgSFTnkprVNxOc8K5HVRCAKZ80KTGZi0KxIAOgqPV
         youiiwailnKT3tYJjWLPCwl0n2QEaFT9SnqCLNmG4mmTLuoEPOiMwhLQ8yLVxKr8WpGO
         PdT/OUoJJcINtwG6Tq212GMxJp/ICu2qkh3aCWH9YHgxnuhQx0/xp55n2ePcsjNoyMm0
         2mfAfrsoFeE5+5GBz07iWF1xUnDMJrfyDpg1QvMC9rWCknierE9BR8IHX4e7qW3pSPYV
         uJhcoL1KjS+wakKg4lpT3i9QB/MpBSfLJKZWizaWe5Udka0jQfr5DPpNf52Piwng/5Ut
         tgJA==
X-Gm-Message-State: AOAM530KLGK/sj5CUYbf4rfuI0ZNYRF5+uSg+MEREvf8gdgPX3SwTykB
        FC1GpuVoKT5Ld56JNFJaZTebog==
X-Google-Smtp-Source: ABdhPJzVzp7zqZA1PABD5+AMJmR2gC3GBlpl79fqxJ6mOA0ZmwS2QyqUlNxqXfXfGuMCMwwilwbhOQ==
X-Received: by 2002:a63:371d:: with SMTP id e29mr3125826pga.153.1592332743713;
        Tue, 16 Jun 2020 11:39:03 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u4sm3067312pjn.42.2020.06.16.11.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 11:39:02 -0700 (PDT)
Date:   Tue, 16 Jun 2020 11:39:02 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH][next] reiserfs: bitmap: Assign array_size() to a variable
Message-ID: <202006161139.1F50D42FB@keescook>
References: <20200616184118.GA1917@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200616184118.GA1917@embeddedor>
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Tue, Jun 16, 2020 at 01:41:18PM -0500, Gustavo A. R. Silva wrote:
> Assign array_size() to variable _size_ and use it in both vmalloc()
> and memset(). These sorts of multiplication factors need to be wrapped
> in array_size().
> 
> This issue was found with the help of Coccinelle and, audited and fixed
> manually.
> 
> Addresses-KSPP-ID: https://github.com/KSPP/linux/issues/83
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
