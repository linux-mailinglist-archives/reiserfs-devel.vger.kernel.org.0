Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8212BFB0D
	for <lists+reiserfs-devel@lfdr.de>; Sun, 22 Nov 2020 22:53:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgKVVun (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sun, 22 Nov 2020 16:50:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726136AbgKVVun (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 22 Nov 2020 16:50:43 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E1A3C0613CF
        for <reiserfs-devel@vger.kernel.org>; Sun, 22 Nov 2020 13:50:43 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id i19so20590761ejx.9
        for <reiserfs-devel@vger.kernel.org>; Sun, 22 Nov 2020 13:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:sender:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=holMzMixu6L4mPkY4KLX0AXrH3B7KLU6Q1+gVZ1hbDo=;
        b=KmGRCJe2Iq5zsBvbpEs85A0Ip1jA2MzlhDsG4K1a6Gkq3+yTqcLGZVXqruyThXv1Sh
         HNAq7imbo69mfcdOXSukJIpPUAtaIeiTXm3610ElYmxo1rYPbNXi5axDTVAG5zt3C/g2
         qwR91BKApEq7k3nu2MafyoKDqpKpe+EcAQi1Bgt4ZebU1FfCC13BMTqb9tfh3ZoEwmB9
         mKsDOZkvfMSHNfOxafSGgTarShnzJ6ovw44jl2OmYw0i/DqOQ1N37laqOJAYvlEF8R56
         AuwbfJ8PtkCCQ0MhuuyTACLhzr6uauYXTjaZfSJPamnQY2h2/NEyZ+2YyRZWKC/4MHpo
         jrUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:sender:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=holMzMixu6L4mPkY4KLX0AXrH3B7KLU6Q1+gVZ1hbDo=;
        b=gu+nnNU4Ivu7eIma1MqwwsE4fvGNqqOPict01LKxoNe7owOLakNldcAWHFJNeQ9BJu
         A4rQbgzinpdyoQYmBTF8okHenaCZXujqQDynPSeOfiojYQUkGCOZVsGM2u+RoIb40zSF
         cEr0FrnmUo0IrZGa8Nj+PGZITa3rHGDG9+W24WoJME2Ac1LrWGTKDDqFGZ1LLAO+bKbj
         Hqexz/oQJNZHPi3r4ZLbGfL7u+SoCCsbReW2g90APruQxjrVk8he24blyELnmet8hTyS
         dpk+ZnU2qcBetUM79Z1BK0SLDAF07Q8IU3lZ70KX9AwAlno3XTOdQsdk6MAp5h6fZX8e
         gY1w==
X-Gm-Message-State: AOAM530QAu2Sg+7GxMifJ3xGvixWiz0oMAFtTpkks9UiHNdK3Y57Zp8/
        7BCw+Kq5mDISOQiziOQMpno=
X-Google-Smtp-Source: ABdhPJzP/42THW9Eyh88Nsw/ixHa927FQYNx2f7NXcw97LpRiWB5/mFPkCDR6ojgNFs5YAaslfvf4A==
X-Received: by 2002:a17:906:d1c3:: with SMTP id bs3mr6433250ejb.306.1606081841912;
        Sun, 22 Nov 2020 13:50:41 -0800 (PST)
Received: from [192.168.43.48] ([197.210.35.67])
        by smtp.gmail.com with ESMTPSA id e17sm4016232edc.45.2020.11.22.13.50.37
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 22 Nov 2020 13:50:41 -0800 (PST)
Message-ID: <5fbadd31.1c69fb81.8dfc7.11d7@mx.google.com>
Sender: Baniko Diallo <banidiallo23@gmail.com>
From:   Adelina Zeuki <adelinazeuki@gmail.com>
X-Google-Original-From: "Adelina Zeuki" <  adelinazeuki@gmail.comm >
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Hello !!
To:     Recipients <adelinazeuki@gmail.comm>
Date:   Sun, 22 Nov 2020 21:50:30 +0000
Reply-To: adelinazeuki@gmail.com
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hi dear,

Can i talk with you ?
