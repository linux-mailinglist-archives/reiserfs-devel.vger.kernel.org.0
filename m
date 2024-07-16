Return-Path: <reiserfs-devel+bounces-139-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C011E932EF5
	for <lists+reiserfs-devel@lfdr.de>; Tue, 16 Jul 2024 19:17:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2FF51C222FC
	for <lists+reiserfs-devel@lfdr.de>; Tue, 16 Jul 2024 17:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB261F171;
	Tue, 16 Jul 2024 17:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5q0sJ3u"
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDC1FC19;
	Tue, 16 Jul 2024 17:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721150231; cv=none; b=KU6sOH0yDzQW+7Fla/TEVO/RCAJwq4m6xr73rM4dILGKOvgxmQhRwSSu0Yph/WlEvH3PqruDE0OIcKyJbJEhw57YjwJb640h6F0G06OiEw11+eMf1vLlNiiV5yovqk94e7gqMZpaPahlLWNEmszGoL92yZ9o9KoJPZepzXVzGY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721150231; c=relaxed/simple;
	bh=8CGrJN7VMAaxXZ17NXTgQIpAQcE0yer5DiihunMH7jE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uPpc+qsyKf6z4vCYFG1rMYDM+/OxZnGKQK1MZC6opAI5ynDcvlA55SnGjQmnCg164Hn635n7pm8O/mehp2WzMqN1SOKm+BReXMKbR3EvwD4NJIRq3Cjgxjgit+PFNFbuL2HP2nvNS7PLgbo8h5zrVDyyVkMAu099/R8iQ2FR9lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5q0sJ3u; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a77e7a6cfa7so628123366b.1;
        Tue, 16 Jul 2024 10:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721150228; x=1721755028; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L9+CSyykIZdK3Bn4NjGqL4WiD9KkvAB7XWIG5/efHno=;
        b=l5q0sJ3uutP5A6ht2sJau6XvIXn5EoD+uYyyJy9nIkNnx8UiirPiUfLcptAdkyqfg4
         uEp/njYvXPt5Seid7isFPbJlNdbXzfTBqDHXzdhK9rfb1OI9bAjh9inlA9evALP+u6Wc
         ma57YfeZ1Ol2GnQhkhfnhU3xyTF4ArJYtC3tnpyJMBUGg47nHctv8v5hr4etUtPBblhF
         Vg4bbpuWCvWOiXgrNjskfGA4hdkrkxdsWjDCioj2psNNEi4+z8g9p4tTc/Fa29184FW/
         4cqrhPzvanAR1AZiQObLIg87yd5LyCI+FeAT/tGActL4RTlpZP8X/6vFsF3BYV5CIXp5
         GBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721150228; x=1721755028;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L9+CSyykIZdK3Bn4NjGqL4WiD9KkvAB7XWIG5/efHno=;
        b=h9Sft/KewVy6o3AMbSwD7MvaR15f4g+GLkBSdLHsppSNGwk0JeQBjGo6oCYG0vbdyH
         9dEgtdMTbx7wiG1ZR1aJlkEpnRxxvxWyjTB17zS/KQEBIaVU9dj/JszVjBv29oyzBpJn
         RfWZL+qm5T5hhvEEBt5YAao/jFw/nAwjdHZPioGHyAjUPyjUiRE/1StQY055pewnh0ZX
         31nhHCeFTGLgaoN6dUvlN0l89NiX6n6e+invWb/M5EWIBARdvPAsvwb8M2J6/Qq95g27
         29JnlD6Q8P58EUif6UBAYmY7H3Icial9Cy0I3jouX7kyzVikjPu4IK+19r4KT8JuhKiK
         +grQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQnIj4WZZ1V15H8352/ODi73ckXPOZD7RgtF62vUSdglx356830c42LTfgMBKMFDo8bdl6dNmZFR2dEwryxEQx6pZ7XBgC9c7jH6nlRE0=
X-Gm-Message-State: AOJu0YwdiwgvAPqdJ2+MFLCIdtVTRVqONa06T9zjd3Gom4E4D81QWfgx
	jxDN87jJOijVD+P4KtY/UszDkDBohaKbiOtUHvu1Mtvwm2K/URQh
X-Google-Smtp-Source: AGHT+IGkoQ1bSF/E61IIu5fC2kh3wnR+BPUhCenX4jQogjyvTZ8VQ7QXzhZcRHbeYR8TUyfyfUK7qw==
X-Received: by 2002:a17:906:8308:b0:a77:e2b2:8ef with SMTP id a640c23a62f3a-a79eaaa11a7mr168879266b.70.1721150227537;
        Tue, 16 Jul 2024 10:17:07 -0700 (PDT)
Received: from [192.168.178.20] (dh207-42-28.xnet.hr. [88.207.42.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc7f1ef5sm338398566b.134.2024.07.16.10.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 10:17:06 -0700 (PDT)
Message-ID: <9aec9df8-ca82-4b2f-b227-5e318c66b97e@gmail.com>
Date: Tue, 16 Jul 2024 19:17:05 +0200
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPROBLEM_linux-next=5D_fs/reiserfs/do=5Fbalan=2Ec?=
 =?UTF-8?B?OjExNDc6MTM6IGVycm9yOiB2YXJpYWJsZSDigJhsZWFmX21p4oCZIHNldCBidXQg?=
 =?UTF-8?Q?not_used_=5B-Werror=3Dunused-but-set-variable=5D?=
To: Jan Kara <jack@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Kees Cook <kees@kernel.org>,
 Christian Brauner <brauner@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Jeff Layton <jlayton@kernel.org>,
 reiserfs-devel@vger.kernel.org
References: <39591663-9151-42f9-9906-4684acaa685c@gmail.com>
 <20240715172826.wbmlg52ckdxze7sg@quack3>
Content-Language: en-US
From: Mirsad Todorovac <mtodorovac69@gmail.com>
In-Reply-To: <20240715172826.wbmlg52ckdxze7sg@quack3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jan!

On 7/15/24 19:28, Jan Kara wrote:
> Hello Mirsad!
> 
> On Wed 10-07-24 20:09:27, Mirsad Todorovac wrote:
>> On the linux-next vanilla next-20240709 tree, I have attempted the seed KCONFIG_SEED=0xEE7AB52F
>> which was known from before to trigger various errors in compile and build process.
>>
>> Though this might seem as contributing to channel noise, Linux refuses to build this config,
>> treating warnings as errors, using this build line:
>>
>> $ time nice make W=1 -k -j 36 |& tee ../err-next-20230709-01a.log; date
>>
>> As I know that the Chief Penguin doesn't like warnings, but I am also aware that there are plenty
>> left, there seems to be more tedious work ahead to make the compilers happy.
>>
>> The compiler output is:
>>
>> ---------------------------------------------------------------------------------------------------------
>> fs/reiserfs/do_balan.c: In function ‘balance_leaf_new_nodes_paste_whole’:
>> fs/reiserfs/do_balan.c:1147:13: error: variable ‘leaf_mi’ set but not used [-Werror=unused-but-set-variable]
>>  1147 |         int leaf_mi;
>>       |             ^~~~~~~
> 
> Frankly, I wouldn't bother with reiserfs. The warning is there for ages,
> the code is going to get removed in two releases, so I guess we can live
> with these warnings for a few more months...

In essence I agree with you, but for sentimental reasons I would like to keep it because
it is my first journaling Linux system on Knoppix 🙂

Patch is also simple and a no-brainer, as proposed by Mr. Cook:

-------------------------------><------------------------------------------
diff --git a/fs/reiserfs/do_balan.c b/fs/reiserfs/do_balan.c
index 5129efc6f2e6..fbe73f267853 100644
--- a/fs/reiserfs/do_balan.c
+++ b/fs/reiserfs/do_balan.c
@@ -1144,7 +1144,9 @@ static void balance_leaf_new_nodes_paste_whole(struct tree_balance *tb,
 {
 	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
 	int n = B_NR_ITEMS(tbS0);
+#ifdef CONFIG_REISERFS_CHECK
 	int leaf_mi;
+#endif
 	struct item_head *pasted;
 	struct buffer_info bi;
 
@@ -1157,7 +1159,6 @@ static void balance_leaf_new_nodes_paste_whole(struct tree_balance *tb,
 		reiserfs_panic(tb->tb_sb,
 			     "PAP-12235",
 			     "pos_in_item must be equal to ih_item_len");
-#endif
 
 	leaf_mi = leaf_move_items(LEAF_FROM_S_TO_SNEW, tb, tb->snum[i],
 				  tb->sbytes[i], tb->S_new[i]);
@@ -1165,6 +1166,7 @@ static void balance_leaf_new_nodes_paste_whole(struct tree_balance *tb,
 	RFALSE(leaf_mi,
 	       "PAP-12240: unexpected value returned by leaf_move_items (%d)",
 	       leaf_mi);
+#endif
 
 	/* paste into item */
 	buffer_info_init_bh(tb, &bi, tb->S_new[i]);
diff --git a/fs/reiserfs/fix_node.c b/fs/reiserfs/fix_node.c
index 6c13a8d9a73c..3cbc8e4491ee 100644
--- a/fs/reiserfs/fix_node.c
+++ b/fs/reiserfs/fix_node.c
@@ -1926,6 +1926,7 @@ static int dc_check_balance_leaf(struct tree_balance *tb, int h)
 {
 	struct virtual_node *vn = tb->tb_vn;
 
+#ifdef CONFIG_REISERFS_CHECK
 	/*
 	 * Number of bytes that must be deleted from
 	 * (value is negative if bytes are deleted) buffer which
@@ -1935,26 +1936,39 @@ static int dc_check_balance_leaf(struct tree_balance *tb, int h)
 	int levbytes;
 
 	/* the maximal item size */
-	int maxsize, ret;
+	int maxsize;
+#endif
 
 	/*
 	 * S0 is the node whose balance is currently being checked,
 	 * and F0 is its father.
 	 */
-	struct buffer_head *S0, *F0;
+
+#ifdef CONFIG_REISERFS_CHECK
+	struct buffer_head *S0;
+#endif
+	struct buffer_head *F0;
+
 	int lfree, rfree /* free space in L and R */ ;
+	int ret;
 
+#ifdef CONFIG_REISERFS_CHECK
 	S0 = PATH_H_PBUFFER(tb->tb_path, 0);
+#endif
 	F0 = PATH_H_PPARENT(tb->tb_path, 0);
 
+#ifdef CONFIG_REISERFS_CHECK
 	levbytes = tb->insert_size[h];
 
 	maxsize = MAX_CHILD_SIZE(S0);	/* maximal possible size of an item */
+#endif
 
 	if (!F0) {		/* S[0] is the root now. */
 
+#ifdef CONFIG_REISERFS_CHECK
 		RFALSE(-levbytes >= maxsize - B_FREE_SPACE(S0),
 		       "vs-8240: attempt to create empty buffer tree");
+#endif
 
 		set_parameters(tb, h, 0, 0, 1, NULL, -1, -1);
 		return NO_BALANCING_NEEDED;
diff --git a/fs/reiserfs/lbalance.c b/fs/reiserfs/lbalance.c
index 7f868569d4d0..6f431819fd5e 100644
--- a/fs/reiserfs/lbalance.c
+++ b/fs/reiserfs/lbalance.c
@@ -521,8 +521,9 @@ static void leaf_item_bottle(struct buffer_info *dest_bi,
 static int leaf_copy_items(struct buffer_info *dest_bi, struct buffer_head *src,
 			   int last_first, int cpy_num, int cpy_bytes)
 {
-	struct buffer_head *dest;
 	int pos, i, src_nr_item, bytes;
+#ifdef CONFIG_REISERFS_CHECK
+	struct buffer_head *dest;
 
 	dest = dest_bi->bi_bh;
 	RFALSE(!dest || !src, "vs-10210: !dest || !src");
@@ -532,6 +533,7 @@ static int leaf_copy_items(struct buffer_info *dest_bi, struct buffer_head *src,
 	       "vs-10230: No enough items: %d, req. %d", B_NR_ITEMS(src),
 	       cpy_num);
 	RFALSE(cpy_num < 0, "vs-10240: cpy_num < 0 (%d)", cpy_num);
+#endif
 
 	if (cpy_num == 0)
 		return 0;
--

Best regards,
Mirsad Todorovac

> 								Honza
> 
> 
>>   CC      fs/reiserfs/lbalance.o
>> fs/reiserfs/fix_node.c: In function ‘dc_check_balance_leaf’:
>> fs/reiserfs/fix_node.c:1938:13: error: variable ‘maxsize’ set but not used [-Werror=unused-but-set-variable]
>>  1938 |         int maxsize, ret;
>>       |             ^~~~~~~
>> fs/reiserfs/fix_node.c:1935:13: error: variable ‘levbytes’ set but not used [-Werror=unused-but-set-variable]
>>  1935 |         int levbytes;
>>       |             ^~~~~~~~
>> fs/reiserfs/prints.c: In function ‘prepare_error_buf’:
>> fs/reiserfs/prints.c:221:17: error: function ‘prepare_error_buf’ might be a candidate for ‘gnu_printf’ format attribute [-Werror=suggest-attribute=format]
>>   221 |                 p += vscnprintf(p, end - p, fmt1, args);
>>       |                 ^
>> fs/reiserfs/prints.c:260:9: error: function ‘prepare_error_buf’ might be a candidate for ‘gnu_printf’ format attribute [-Werror=suggest-attribute=format]
>>   260 |         p += vscnprintf(p, end - p, fmt1, args);
>>       |         ^
>> make[4]: Target 'arch/x86/kernel/' not remade because of errors.
>> make[3]: *** [scripts/Makefile.build:485: arch/x86/kernel] Error 2
>> make[3]: Target 'arch/x86/' not remade because of errors.
>> make[2]: *** [scripts/Makefile.build:485: arch/x86] Error 2
>> fs/reiserfs/lbalance.c: In function ‘leaf_copy_items’:
>> fs/reiserfs/lbalance.c:524:29: error: variable ‘dest’ set but not used [-Werror=unused-but-set-variable]
>>   524 |         struct buffer_head *dest;
>>       |                             ^~~~
>> cc1: all warnings being treated as errors
>> make[4]: *** [scripts/Makefile.build:244: fs/reiserfs/do_balan.o] Error 1
>> cc1: all warnings being treated as errors
>> make[4]: *** [scripts/Makefile.build:244: fs/reiserfs/prints.o] Error 1
>> cc1: all warnings being treated as errors
>> make[4]: *** [scripts/Makefile.build:244: fs/reiserfs/fix_node.o] Error 1
>> ---------------------------------------------------------------------------------------------------------
>>
>> In fs/reiserfs/fix_node.c:1938:13, fs/reiserfs/fix_node.c:1935:13, and fs/reiserfs/lbalance.c:524:29,
>> the problem seem to lie within the construct RFALSE(), like
>>
>>  521 static int leaf_copy_items(struct buffer_info *dest_bi, struct buffer_head *src,
>>  522                            int last_first, int cpy_num, int cpy_bytes)
>>  523 {
>>  524         struct buffer_head *dest;
>>  525         int pos, i, src_nr_item, bytes;
>>  526 
>>  527         dest = dest_bi->bi_bh;
>>  528         RFALSE(!dest || !src, "vs-10210: !dest || !src");
>>  529         RFALSE(last_first != FIRST_TO_LAST && last_first != LAST_TO_FIRST,
>>  530                "vs-10220:last_first != FIRST_TO_LAST && last_first != LAST_TO_FIRST");
>>  531         RFALSE(B_NR_ITEMS(src) < cpy_num,
>>  532                "vs-10230: No enough items: %d, req. %d", B_NR_ITEMS(src),
>>  533                cpy_num);
>>  534         RFALSE(cpy_num < 0, "vs-10240: cpy_num < 0 (%d)", cpy_num);
>>
>> Hope this helps.
>>
>> Best regards,
>> Mirsad Todorovac
>>

