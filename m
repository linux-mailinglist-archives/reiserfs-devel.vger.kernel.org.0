Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D15EC722B4C
	for <lists+reiserfs-devel@lfdr.de>; Mon,  5 Jun 2023 17:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234636AbjFEPh1 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 5 Jun 2023 11:37:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234752AbjFEPhU (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 5 Jun 2023 11:37:20 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFE3EF9
        for <reiserfs-devel@vger.kernel.org>; Mon,  5 Jun 2023 08:37:11 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b1ba018d94so29174031fa.0
        for <reiserfs-devel@vger.kernel.org>; Mon, 05 Jun 2023 08:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685979430; x=1688571430;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Awfq8Xd+Z8kj5FwpCW1Z2TUbRd0RoPOUoRNrdS9suN8=;
        b=bxszVkssWdtYm1AsrrdIDbqntiRPUns/ojupu2RlTEfMsxnH9Hh7aL4rZ9dbTq7dfJ
         YFIrA9QKG2ld4hbamvi8bRILOrkfRhs67kPfzEBE39+TPLA6Edod4GFm+GlArgD559SJ
         +K+CwxFuvxZ7tdK3z1JWZpx9mSP6cQ3Qe/9YKIckI+9jhFaDTEgXA6bqNedV4cO3dSDl
         /U/x5lX1bvu3rPMDk0LucnJONa9Nl76seBSzCRmzsMVf8cAiTi8vlMF3o80siE/4Elnb
         ZaKF1cIyCc+n4p/qMcb9UTKASJaFEIPWGVb3vAote4vc7ik8Mm9SpAC3mDZ0kZHVYUuI
         5PUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685979430; x=1688571430;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Awfq8Xd+Z8kj5FwpCW1Z2TUbRd0RoPOUoRNrdS9suN8=;
        b=CzC2P1vRfZCky4tVQNKnIPVyvFB7LZN0gUGPvSVoW/F2NB+Upd8rBxeoPwDSzmHrpZ
         uf3T7uRYeOKRKz7cFh80b4HHUSZ6tjDefbPnJlKcpviT8JteDesAwhNqYPtBP/e5kAoK
         shFVlA6sdHnLH9BbxQmFDfSci5c/sqzodfnf3oZMtu1rHH0xgcDQ+r3wVmZmcHijugIG
         ntxFXdGeDPFJRm/SGSmm8ORDwz5MpSI8caKYp+TeuWZCZ39S3sovVdSTvIeXu7mibQKi
         fdC/BdrjVGJI8dhtxSyG+Quld53yuxCBLoTmWNaOpF2A3PiLDptM5LnQosQZrWFcsxrD
         qDTQ==
X-Gm-Message-State: AC+VfDyumX8bqW4ALesNOgT+oK17CHiqB94LIb/2YCKEUMI+Pb+D2rD4
        2scuSG9qhFQM86wYKOrhaVA=
X-Google-Smtp-Source: ACHHUZ71zg3I0LWOAE+OWm+41oVI7F+0M+HeuTiyypPYXN2dyoTnsPX3hjZU4QMsq39Ith2qk1I+2A==
X-Received: by 2002:a2e:9c0f:0:b0:2b1:c606:c0e2 with SMTP id s15-20020a2e9c0f000000b002b1c606c0e2mr2303652lji.14.1685979429882;
        Mon, 05 Jun 2023 08:37:09 -0700 (PDT)
Received: from ?IPV6:2a02:8070:a181:6100:aa7c:35c1:51b9:8b94? ([2a02:8070:a181:6100:aa7c:35c1:51b9:8b94])
        by smtp.gmail.com with ESMTPSA id w22-20020a170906185600b00977d02973e8sm2174610eje.0.2023.06.05.08.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 08:37:08 -0700 (PDT)
Message-ID: <4914c932-6d9a-a6a5-e98a-b1ded947f5d6@gmail.com>
Date:   Mon, 5 Jun 2023 17:37:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] reiserfs: Check the return value from __getblk()
Content-Language: en-US
To:     "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        reiserfs-devel@vger.kernel.org
Cc:     butt3rflyh4ck <butterflyhuangxx@gmail.com>
References: <20230605142335.2883264-1-willy@infradead.org>
From:   Edward Shishkin <edward.shishkin@gmail.com>
In-Reply-To: <20230605142335.2883264-1-willy@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org



On 6/5/23 16:23, Matthew Wilcox (Oracle) wrote:
> __getblk() can return a NULL pointer if we run out of memory or if
> we try to access beyond the end of the device; check it and handle it
> appropriately.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Link: https://lore.kernel.org/lkml/CAFcO6XOacq3hscbXevPQP7sXRoYFz34ZdKPYjmd6k5sZuhGFDw@mail.gmail.com/
> Tested-by: butt3rflyh4ck <butterflyhuangxx@gmail.com>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2") # probably introduced in 2002
> ---
>   fs/reiserfs/journal.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
> index 4d11d60f493c..dd58e0dca5e5 100644
> --- a/fs/reiserfs/journal.c
> +++ b/fs/reiserfs/journal.c
> @@ -2326,7 +2326,7 @@ static struct buffer_head *reiserfs_breada(struct block_device *dev,
>   	int i, j;
>   
>   	bh = __getblk(dev, block, bufsize);
> -	if (buffer_uptodate(bh))
> +	if (!bh || buffer_uptodate(bh))
>   		return (bh);
>   
>   	if (block + BUFNR > max_block) {
> @@ -2336,6 +2336,8 @@ static struct buffer_head *reiserfs_breada(struct block_device *dev,
>   	j = 1;
>   	for (i = 1; i < blocks; i++) {
>   		bh = __getblk(dev, block + i, bufsize);
> +		if (!bh)
> +			break;
>   		if (buffer_uptodate(bh)) {
>   			brelse(bh);
>   			break;

Acked-by: Edward Shishkin <edward.shishkin@gmail.com>
