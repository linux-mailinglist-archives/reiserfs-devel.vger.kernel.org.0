Return-Path: <reiserfs-devel+bounces-135-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB9E92D8DE
	for <lists+reiserfs-devel@lfdr.de>; Wed, 10 Jul 2024 21:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 253062831D3
	for <lists+reiserfs-devel@lfdr.de>; Wed, 10 Jul 2024 19:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15255197556;
	Wed, 10 Jul 2024 19:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ItckB6X9"
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185B51EB2B;
	Wed, 10 Jul 2024 19:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720638854; cv=none; b=LVODMtEMJ6P4DVAljfw8ZaFrLMAhPyWBvw+lUmaiOpsaGBk8L9fv8OxW+SWdifdXQj32qNfusoYETpd4TEh9HFrKRkIQK0OEd7wYWZBFE2RnOMb2+xaVvMDeizJI34hG2qnUKFwr5c4AfJKB4/M8ZakbRwsr8K/5cLOsz6CzfbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720638854; c=relaxed/simple;
	bh=eZ6cjGi8o+Aj/PSz/XB/OWeEExB9LzZmO8Q1/j80HBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SFZM0WTv9rhq6RbxdSOne/2wKj3kHgVqRDBsrhvCj//FPNpo6WD0mfi5KAT6NUfr3caOu6DUlSrla7Q6xyiZhKErLTX18mEQmi+WIUpYP2WmYlL83K3v4/wKYpygMZrKLjKx4OBuzcrgPYq/Rpq8k9omKySCsHIyFCnKjU4GCLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ItckB6X9; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52ea7d2a039so118534e87.3;
        Wed, 10 Jul 2024 12:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720638850; x=1721243650; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jqC5gDqtTmXfZHUqyPfhS4E8CKyUJdF2TbkOhkf7BJY=;
        b=ItckB6X9AOx/JhhYPqTCQC5O2MmrMCAG84DJubmWsvbWMbSpV55Vo3d1Wg08NaDQK8
         U64XQ7WvQjAJ4+MeE+VPH0JBPRu/OT7P1eYR9nQn5w8OQ0FC0ehqXjm9krrjtcdC2HkU
         kmBRTx327BG/Yxnmo0mQy5CJmDk+Xdk0NgPK8EEt23v6N64K33EMebiGw6sK67NAPsfc
         JbbxkT2C7SGsiu3vf96bnXAkbbZY6fhOaNDboCQe3VUImx3dDCUbwtkLlQiE5K1r1AvV
         RcbnTkw2mKdgG+LHpJqgv9vgaWadQdtfq4PD3b3NMxan1VDu13it8ONGUUcn055pB7wE
         amhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720638850; x=1721243650;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jqC5gDqtTmXfZHUqyPfhS4E8CKyUJdF2TbkOhkf7BJY=;
        b=IMkGu1RFw+Mf2bq7JBv2THEuA2mN5Hv3bCzlZanrbiGWfkLtf0SQHOXqFEDtUtRyeU
         p88P5duN+x9Oi5jRfZ5tQzaDreOWYRcpbbZpyfeSzteyIF1I5ngyUF/r+7xE0yAF/ue9
         WXuBMd9rNXf97udJr7yNGZ5Vm1I5xZxnW/XV/mJkUDiYsSVDPEid9abNlUrDDGrpBf3L
         6gC0vVkxvLgc8BufxmRGw20ehrr8dGwCNJGzhWyTa6bl4A0mtidvFr2rOHEUZO7ZKr6J
         CY/5JRIA1dISYNzeNL7Q23m5eYYPyGin9jrcJjS++UVBQKMzxPXmZh72UlmwupSD/7xH
         4gRA==
X-Forwarded-Encrypted: i=1; AJvYcCWdWEnl3vaDKdRbbJNAkpkvMtxezUFAsXQ2qq/f2m1xMoQwFl3v3GJeGELKABq+B3gg6Br3gLlp8135wA/6sj5wN/Uxev0sM6z2501HdBo=
X-Gm-Message-State: AOJu0Yy9NzYfc8qQSO7/ZUbHjASsehIMwRZ8eAO1Zbmp8h25emDoiiaP
	UJmy8PDkyb6Gv51vqoCW8ol6+7jDiPDu3QZmaBFzzSyZZwsan3VM
X-Google-Smtp-Source: AGHT+IGPDPNSQEjxd6w8tf5TVTm5GzmLNNo/cyNFG/eo2qPeQzqS2qn8Pfr/lThRwWCKrqS9gQ/L8Q==
X-Received: by 2002:a19:4302:0:b0:52c:9906:fa33 with SMTP id 2adb3069b0e04-52eb99d4cc8mr3283512e87.43.1720638849892;
        Wed, 10 Jul 2024 12:14:09 -0700 (PDT)
Received: from [192.168.178.20] (dh207-43-148.xnet.hr. [88.207.43.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42726c62ed2sm60072415e9.15.2024.07.10.12.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 12:14:09 -0700 (PDT)
Message-ID: <5dd0d3c9-6fc6-491a-9458-f372fe81af5a@gmail.com>
Date: Wed, 10 Jul 2024 21:14:08 +0200
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
To: Kees Cook <kees@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Jeff Layton <jlayton@kernel.org>,
 reiserfs-devel@vger.kernel.org
References: <39591663-9151-42f9-9906-4684acaa685c@gmail.com>
 <202407101116.2E9836EBAF@keescook>
Content-Language: en-US
From: Mirsad Todorovac <mtodorovac69@gmail.com>
In-Reply-To: <202407101116.2E9836EBAF@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/10/24 20:17, Kees Cook wrote:
> On Wed, Jul 10, 2024 at 08:09:27PM +0200, Mirsad Todorovac wrote:
>> Dear all,
>>
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
> 
> Can you prepare a patch to solve these? It should be possible to just
> wrap the offending variables as done for RFALSE itself:
> 
> #ifdef CONFIG_REISERFS_CHECK
> 	struct buffer_head *dest;
> #endif
> 
> etc...

Hi, Mr. Kees,

Well, i sort fo did it but I am not happy with it (it is not elegant like the original code):

-----><------------------
$ git diff fs/reiserfs
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
index 6c13a8d9a73c..0ad41751eca5 100644
--- a/fs/reiserfs/fix_node.c
+++ b/fs/reiserfs/fix_node.c
@@ -1926,6 +1926,7 @@ static int dc_check_balance_leaf(struct tree_balance *tb, int h)
 {
        struct virtual_node *vn = tb->tb_vn;
 
+#ifdef CONFIG_REISERFS_CHECK
        /*
         * Number of bytes that must be deleted from
         * (value is negative if bytes are deleted) buffer which
@@ -1935,21 +1936,32 @@ static int dc_check_balance_leaf(struct tree_balance *tb, int h)
        int levbytes;
 
        /* the maximal item size */
-       int maxsize, ret;
+       int maxsize;
+#endif
 
        /*
         * S0 is the node whose balance is currently being checked,
         * and F0 is its father.
         */
-       struct buffer_head *S0, *F0;
+
+#ifdef CONFIG_REISERFS_CHECK
+       struct buffer_head *S0;
+#endif
+       struct buffer_head *F0;
+
        int lfree, rfree /* free space in L and R */ ;
+       int ret;
 
+#ifdef CONFIG_REISERFS_CHECK
        S0 = PATH_H_PBUFFER(tb->tb_path, 0);
+#endif
        F0 = PATH_H_PPARENT(tb->tb_path, 0);
 
+#ifdef CONFIG_REISERFS_CHECK
        levbytes = tb->insert_size[h];
 
        maxsize = MAX_CHILD_SIZE(S0);   /* maximal possible size of an item */
+#endif
 
        if (!F0) {              /* S[0] is the root now. */
 
diff --git a/fs/reiserfs/lbalance.c b/fs/reiserfs/lbalance.c
index 7f868569d4d0..aa8d897368da 100644
--- a/fs/reiserfs/lbalance.c
+++ b/fs/reiserfs/lbalance.c
@@ -521,10 +521,14 @@ static void leaf_item_bottle(struct buffer_info *dest_bi,
 static int leaf_copy_items(struct buffer_info *dest_bi, struct buffer_head *src,
                           int last_first, int cpy_num, int cpy_bytes)
 {
+#ifdef CONFIG_REISERFS_CHECK
        struct buffer_head *dest;
+#endif
        int pos, i, src_nr_item, bytes;
 
+#ifdef CONFIG_REISERFS_CHECK
        dest = dest_bi->bi_bh;
+#endif
        RFALSE(!dest || !src, "vs-10210: !dest || !src");
        RFALSE(last_first != FIRST_TO_LAST && last_first != LAST_TO_FIRST,
               "vs-10220:last_first != FIRST_TO_LAST && last_first != LAST_TO_FIRST");
--

P.S.

I could not find a mitigation for these:

fs/reiserfs/prints.c: In function ‘prepare_error_buf’:
fs/reiserfs/prints.c:221:17: error: function ‘prepare_error_buf’ might be a candidate for ‘gnu_printf’ format attribute [-Werror=suggest-attribute=format]
  221 |                 p += vscnprintf(p, end - p, fmt1, args);
      |                 ^
fs/reiserfs/prints.c:260:9: error: function ‘prepare_error_buf’ might be a candidate for ‘gnu_printf’ format attribute [-Werror=suggest-attribute=format]
  260 |         p += vscnprintf(p, end - p, fmt1, args);
      |         ^

221                 p += vscnprintf(p, end - p, fmt1, args);

Hope this helps.

Best regards,
Mirsad Todorovac


