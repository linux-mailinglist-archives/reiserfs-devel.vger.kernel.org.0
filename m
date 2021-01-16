Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3BF2F8B08
	for <lists+reiserfs-devel@lfdr.de>; Sat, 16 Jan 2021 04:49:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725923AbhAPDtI (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 15 Jan 2021 22:49:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbhAPDtI (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 15 Jan 2021 22:49:08 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98AF2C0613D3
        for <reiserfs-devel@vger.kernel.org>; Fri, 15 Jan 2021 19:48:27 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id g10so9243079wmh.2
        for <reiserfs-devel@vger.kernel.org>; Fri, 15 Jan 2021 19:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:sender:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=ox+6SXPMgEqz4oz2SA0bstlaBqQuOI9G89aQD18OlQE=;
        b=jn6IXkSEK60mOBnKpt7Z9HfKT4PoEbZT6CyyM5seAE8RJIxV1KIfX120hgmAK9qPky
         xwqoTdeJDaLSn2HxCtwF9qK0nBm57lQac3QKKDXHcB7OvOTlWpkPLw7fH1FcDtiP3qA2
         yBqxntb10xhPnjlaJGODoCysF6uXCMr6GsEnyC/ZkQ+J191BukmSV5Vp8hUhiD5PTvDU
         hEz69WsGWSUVqeGQGJoKExM03vxzH4zT7NlGytckeoJzlTxotCmGv9cFLZ1VDCX1QNPP
         qZscREm7t1smebiDB6y5v2pHY0jSs2g1rDK5A9GOboP7iGGW56QfmaJC/Skb9FPPzPVp
         kvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:sender:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=ox+6SXPMgEqz4oz2SA0bstlaBqQuOI9G89aQD18OlQE=;
        b=iSpy/ube8+iA/sOzRn69x6dKV9sDUcV/hnS3qzLmV+8fXnYHOqMy/1btUqScz48pME
         TT7h6cFMzuRCoNcE/z2LSBtdLkKcF7+iAyoj/6k8eTws58n123jl+w7hm0SrXv2mBUnS
         SHVUN6BoVXSdcY/ozzjL4LTAugz7K7ZwiM9F2m70Dt4Jm92ea/jQIyQpJ/setKSKOtU7
         uM/44zodsKe5fJfIVDXBTqKn+8kUgX2nAlC3+3uoPclP3F9ICbDJzSxAA61fi3vMjY/0
         ttL3ogEfBNZyK4DRLVIu1ZBuLMoPB5SAa60erDhEckA9ggSQSAdHdFqw2vCaBJ1ffj7j
         5O4Q==
X-Gm-Message-State: AOAM532ixvwlpDrln2Q02iVMPr+85JPx3FHFnJn7tNJ67+xyKWpHYTGr
        XXeti122NOUyXFgvhFKeCfA=
X-Google-Smtp-Source: ABdhPJyL+9W4GYmUw3GnjJrfGEoMG2DwYdpOUzJlo+fCTjhM1dtMDNvMJ5Tf6tKU2ITIXQZZ8ixKAA==
X-Received: by 2002:a1c:356:: with SMTP id 83mr11750542wmd.31.1610768906442;
        Fri, 15 Jan 2021 19:48:26 -0800 (PST)
Received: from [192.168.1.8] ([154.124.21.107])
        by smtp.gmail.com with ESMTPSA id a184sm2461206wme.35.2021.01.15.19.48.23
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2021 19:48:25 -0800 (PST)
Message-ID: <60026209.1c69fb81.1c240.99c2@mx.google.com>
Sender: Anderson skylar <seckt0223@gmail.com>
From:   Skylar Anderson <sgtandersonskylar1@gmail.com>
X-Google-Original-From: Skylar Anderson
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: hello
To:     Recipients <Skylar@vger.kernel.org>
Date:   Sat, 16 Jan 2021 03:48:18 +0000
Reply-To: sgt.skylaranderson876@gmail.com
X-Mailer: cdcaafe51be8cdb99a1c85906066cad3d0e60e273541515a58395093a7c4e1f0eefb01d7fc4e6278706e9fb8c4dad093c3263345202970888b6b4d817f9e998c032e7d59
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

I have important issue to tell.
