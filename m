Return-Path: <reiserfs-devel+bounces-133-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0049092D801
	for <lists+reiserfs-devel@lfdr.de>; Wed, 10 Jul 2024 20:09:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F12128155E
	for <lists+reiserfs-devel@lfdr.de>; Wed, 10 Jul 2024 18:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4956619580B;
	Wed, 10 Jul 2024 18:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXGrubxP"
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887E619539C;
	Wed, 10 Jul 2024 18:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720634975; cv=none; b=oVALqAr5jqXc1GutoHrkWftuwUvgl2CbE/rdT5kwfn6uhUjdx7pdLmqIaiQkiwX0su46YHPFuC568KCkE43D4rpmJy+O8l/iq13yNVkWByjKwQ6hyzikv8kQgtyh7Zk0xvc46Q7QMCFoQXsVLUTS8FPBH497jyChB04wJroM8MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720634975; c=relaxed/simple;
	bh=0ErVS7yZLYWCt1aSBS9Fx3wUrfmXerilAr7NyFGObLY=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Cc:Content-Type; b=lVe3HrRI0sbXaeKbsQLAjD8SaCz21XpUFWZLlFBuhucooIGQzER7C+dTCQFVAUmc7lK8JbfCo+iUCA7IGIA5w/MDn7HlT4K8LFElYAEmxklquKU65rO8A4tCdeMbjdcmPcofAVq+WScW66X/0y1jLBIlGr5HlFIg96/x12tS2BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXGrubxP; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4267300145eso332885e9.3;
        Wed, 10 Jul 2024 11:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720634969; x=1721239769; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:subject:to:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRc7kVPxPxWBryve4UMcZ5IVEwCC1yKQQQVNTj+ryGE=;
        b=IXGrubxPuZ/NAEHNLGlBx0gzVKmmp8O2wB3LpH8qiNZkrUSkt3+YEGbsKFmJCgGS9Q
         aAF8R4mZOSmohkIpHboVBB9lEkK4WnqqCFFYAsXs00sKH1tKLZE9wZxx8jNDJNNgZkn6
         mEvmYa9MZ9BS3EYBLFop3kUN3Ytn1+CVTpMG6+CL/Q/R3jRLWlCKuQlaEu8fvHlmG263
         sXfwzVk2yTj/268uqM6gOHGcPhvaHOSMK0A1Ga2jf+serPYVE0A/8kJl0Spvja9lPBjE
         cnktOvipqHgvLljI3flhIOcFA+P0K+ZYycdO2kgo1+rPlt8tWtwzlX/ZYlune7bFGNNs
         iA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720634969; x=1721239769;
        h=content-transfer-encoding:cc:subject:to:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lRc7kVPxPxWBryve4UMcZ5IVEwCC1yKQQQVNTj+ryGE=;
        b=kAN0pCX5BVz8KQ3ytLHLsD3Qbu0LUpWl6freA6KmaWYFHKtpMd2je+0N8aO0HjxiFQ
         AE00aEt3lxEWOJn9ndKqUKJKN3OZ9ewp1RktEIuXxGGuUli01RI0MMMVrfpgV72oJSQW
         46odH2V4doHv/RDswsrN88s8zNlCY4EM0HloBZPUd23uQj+/hX+WF5zGcpBzOoE5/SkZ
         zjHMMiuW/wJcYNVlHfJAOJRo6qa3H+wIpcULjiK+zFjgOSDUrbogAfwjWtk++0tLHR/j
         Zgc0zYtIVO1+snYOLaPXzB8tQrhf/88PN2IiNv8sZisB2lknU9NI5bftX0OyrqtyKJBB
         /UcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkl0cmIKoI3w+7aApGIrOp9K8mM3wXGvBIiXD88cjGdENu7y63+areLjwifwfty9Fl5flhEd3e93UUK9MEvZ8wuKxPzTvMNrjnuZ/+mak=
X-Gm-Message-State: AOJu0YwNnAGtIZZRUSiyDDUsqp69Z8xZMohoP7ZLNeimkvli/ZdEkn4Y
	8hd8Utbb7oJlvPfMeL88WiePSZgBcebi4d3RaolOYlGAwTgzFZriAmdxvg==
X-Google-Smtp-Source: AGHT+IEJ/uwJejZbGmHQ9FmssBXn21INIib8vm/uDOvoeXcXGoSuxRwSJmopFMCW7Wi18dcKZBB5QA==
X-Received: by 2002:a7b:cb92:0:b0:426:61fc:fc1a with SMTP id 5b1f17b1804b1-426706c6399mr46338645e9.3.1720634968973;
        Wed, 10 Jul 2024 11:09:28 -0700 (PDT)
Received: from [192.168.178.20] (dh207-43-148.xnet.hr. [88.207.43.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a2fc9desm260900835e9.45.2024.07.10.11.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 11:09:28 -0700 (PDT)
Message-ID: <39591663-9151-42f9-9906-4684acaa685c@gmail.com>
Date: Wed, 10 Jul 2024 20:09:27 +0200
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Mirsad Todorovac <mtodorovac69@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?Q?=5BPROBLEM_linux-next=5D_fs/reiserfs/do=5Fbalan=2Ec=3A114?=
 =?UTF-8?B?NzoxMzogZXJyb3I6IHZhcmlhYmxlIOKAmGxlYWZfbWnigJkgc2V0IGJ1dCBub3Qg?=
 =?UTF-8?Q?used_=5B-Werror=3Dunused-but-set-variable=5D?=
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Kees Cook
 <kees@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Jeff Layton <jlayton@kernel.org>,
 reiserfs-devel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Dear all,

On the linux-next vanilla next-20240709 tree, I have attempted the seed KCONFIG_SEED=0xEE7AB52F
which was known from before to trigger various errors in compile and build process.

Though this might seem as contributing to channel noise, Linux refuses to build this config,
treating warnings as errors, using this build line:

$ time nice make W=1 -k -j 36 |& tee ../err-next-20230709-01a.log; date

As I know that the Chief Penguin doesn't like warnings, but I am also aware that there are plenty
left, there seems to be more tedious work ahead to make the compilers happy.

The compiler output is:

---------------------------------------------------------------------------------------------------------
fs/reiserfs/do_balan.c: In function ‘balance_leaf_new_nodes_paste_whole’:
fs/reiserfs/do_balan.c:1147:13: error: variable ‘leaf_mi’ set but not used [-Werror=unused-but-set-variable]
 1147 |         int leaf_mi;
      |             ^~~~~~~
  CC      fs/reiserfs/lbalance.o
fs/reiserfs/fix_node.c: In function ‘dc_check_balance_leaf’:
fs/reiserfs/fix_node.c:1938:13: error: variable ‘maxsize’ set but not used [-Werror=unused-but-set-variable]
 1938 |         int maxsize, ret;
      |             ^~~~~~~
fs/reiserfs/fix_node.c:1935:13: error: variable ‘levbytes’ set but not used [-Werror=unused-but-set-variable]
 1935 |         int levbytes;
      |             ^~~~~~~~
fs/reiserfs/prints.c: In function ‘prepare_error_buf’:
fs/reiserfs/prints.c:221:17: error: function ‘prepare_error_buf’ might be a candidate for ‘gnu_printf’ format attribute [-Werror=suggest-attribute=format]
  221 |                 p += vscnprintf(p, end - p, fmt1, args);
      |                 ^
fs/reiserfs/prints.c:260:9: error: function ‘prepare_error_buf’ might be a candidate for ‘gnu_printf’ format attribute [-Werror=suggest-attribute=format]
  260 |         p += vscnprintf(p, end - p, fmt1, args);
      |         ^
make[4]: Target 'arch/x86/kernel/' not remade because of errors.
make[3]: *** [scripts/Makefile.build:485: arch/x86/kernel] Error 2
make[3]: Target 'arch/x86/' not remade because of errors.
make[2]: *** [scripts/Makefile.build:485: arch/x86] Error 2
fs/reiserfs/lbalance.c: In function ‘leaf_copy_items’:
fs/reiserfs/lbalance.c:524:29: error: variable ‘dest’ set but not used [-Werror=unused-but-set-variable]
  524 |         struct buffer_head *dest;
      |                             ^~~~
cc1: all warnings being treated as errors
make[4]: *** [scripts/Makefile.build:244: fs/reiserfs/do_balan.o] Error 1
cc1: all warnings being treated as errors
make[4]: *** [scripts/Makefile.build:244: fs/reiserfs/prints.o] Error 1
cc1: all warnings being treated as errors
make[4]: *** [scripts/Makefile.build:244: fs/reiserfs/fix_node.o] Error 1
---------------------------------------------------------------------------------------------------------

In fs/reiserfs/fix_node.c:1938:13, fs/reiserfs/fix_node.c:1935:13, and fs/reiserfs/lbalance.c:524:29,
the problem seem to lie within the construct RFALSE(), like

 521 static int leaf_copy_items(struct buffer_info *dest_bi, struct buffer_head *src,
 522                            int last_first, int cpy_num, int cpy_bytes)
 523 {
 524         struct buffer_head *dest;
 525         int pos, i, src_nr_item, bytes;
 526 
 527         dest = dest_bi->bi_bh;
 528         RFALSE(!dest || !src, "vs-10210: !dest || !src");
 529         RFALSE(last_first != FIRST_TO_LAST && last_first != LAST_TO_FIRST,
 530                "vs-10220:last_first != FIRST_TO_LAST && last_first != LAST_TO_FIRST");
 531         RFALSE(B_NR_ITEMS(src) < cpy_num,
 532                "vs-10230: No enough items: %d, req. %d", B_NR_ITEMS(src),
 533                cpy_num);
 534         RFALSE(cpy_num < 0, "vs-10240: cpy_num < 0 (%d)", cpy_num);

Hope this helps.

Best regards,
Mirsad Todorovac

