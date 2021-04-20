Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E72436611D
	for <lists+reiserfs-devel@lfdr.de>; Tue, 20 Apr 2021 22:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234014AbhDTUsc (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 20 Apr 2021 16:48:32 -0400
Received: from gateway22.websitewelcome.com ([192.185.47.79]:37180 "EHLO
        gateway22.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234008AbhDTUsb (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 20 Apr 2021 16:48:31 -0400
X-Greylist: delayed 1493 seconds by postgrey-1.27 at vger.kernel.org; Tue, 20 Apr 2021 16:48:31 EDT
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
        by gateway22.websitewelcome.com (Postfix) with ESMTP id E6CB615EC
        for <reiserfs-devel@vger.kernel.org>; Tue, 20 Apr 2021 15:23:05 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id YwtllPxWsmJLsYwtllmy1P; Tue, 20 Apr 2021 15:23:05 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=DZ090SxDoGdMYGqbAjNFB8PVCnl3MoSQpnbnHmBu+Ag=; b=f7HrEhWpFsSYH4zMbxWzVvLy6n
        Oi1yHPIZXYhiWETl64O7ddxoYLW4bd8kuylCOee9yyUx64foK2/qGLKRGXh9aFyznlVidxsPtaq4j
        qVnpLRh+0zpKXJzLvXMNTwzLU1OGmwJYEj6c3NfkXfhClU0Pd+yH5UgwV1pbkxfS0gUdglhCGcc2d
        3+3oOYsqC57M+HdUtyuO/Yema7KtHZGitQrogy1rnTVP0MF6YFVHz6b1er7sSHYXPXozY7wAcVwJP
        k/9LDMB0MNkBfjaqpJXXTrHJApQQajX/XHiqe3ucTlm0ckhkIyhZsntHChoOuE2lNSYg469X+ZRAP
        KP05+IkA==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:49018 helo=[192.168.15.8])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94)
        (envelope-from <gustavo@embeddedor.com>)
        id 1lYwtj-002zpB-B1; Tue, 20 Apr 2021 15:23:03 -0500
Subject: Re: [PATCH 051/141] reiserfs: Fix fall-through warnings for Clang
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <6859fecccd96f79612f9650fdba7a66bbff70560.1605896059.git.gustavoars@kernel.org>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <7229aa6e-9943-9568-faf2-7c8cd81e6890@embeddedor.com>
Date:   Tue, 20 Apr 2021 15:23:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <6859fecccd96f79612f9650fdba7a66bbff70560.1605896059.git.gustavoars@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1lYwtj-002zpB-B1
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8]) [187.162.31.110]:49018
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 139
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hi all,

Friendly ping: who can take this, please?

Thanks
--
Gustavo

On 11/20/20 12:32, Gustavo A. R. Silva wrote:
> In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
> by explicitly adding a break statement instead of letting the code fall
> through to the next case.
> 
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  fs/reiserfs/namei.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/reiserfs/namei.c b/fs/reiserfs/namei.c
> index 1594687582f0..90bb49bfdba0 100644
> --- a/fs/reiserfs/namei.c
> +++ b/fs/reiserfs/namei.c
> @@ -132,6 +132,7 @@ int search_by_entry_key(struct super_block *sb, const struct cpu_key *key,
>  			return IO_ERROR;
>  		}
>  		PATH_LAST_POSITION(path)--;
> +		break;
>  
>  	case ITEM_FOUND:
>  		break;
> 
