Return-Path: <reiserfs-devel+bounces-146-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6FF94841A
	for <lists+reiserfs-devel@lfdr.de>; Mon,  5 Aug 2024 23:24:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81ECB1C21E47
	for <lists+reiserfs-devel@lfdr.de>; Mon,  5 Aug 2024 21:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B9D516C84B;
	Mon,  5 Aug 2024 21:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mbg4Q8Zo"
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F67216ABF3;
	Mon,  5 Aug 2024 21:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722893070; cv=none; b=HCXrA2NUw5SPLxpoVXnpwY9Kv11VuCYSboZdkbkuIQmN8ffIs0HaEhxaUeqYGFtODpkLjMOOGr0RiOKrxNcZpKBtUsVN57uFD0k7r/NFhWKwY9TQxl0NxRZHn/X3slKhf4yhtGfMwf9ytmZA8BhtecNpKYl1QklH6l6jFhCOx7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722893070; c=relaxed/simple;
	bh=WtLSg18x6ha0RSr8J2DREK42uYOUOHCGkAIR9iJTsMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GdFLaMKth2qX3TF4nHJ0L41ZYk+MReaBEAe3Aq1SkR5a/1/OC18YCXp46rf1na4SAbYVfr/mwUH50lY/ZCaOeHqAGCesxGf8vrz3OHvmJPQERgO/2IjRRrSDi0wkVnVe8wTPm+eYu8F/J0aliQ9qUrrZ5kwAhVvxLOJEf/TwIRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mbg4Q8Zo; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a7d26c2297eso5541266b.2;
        Mon, 05 Aug 2024 14:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722893066; x=1723497866; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x8/kZWq8UAWXE07EOv+W3BwbqxC1RibcaCo1Y6U9Jvo=;
        b=Mbg4Q8ZokEPvwuWn/12/fn8wamGVM0S62tKvXeIKTtlLDULJ1mzqyW5/qWvJFMAA92
         ELdiSqyT1ge83ltzzR1KTEXS2UViWJCXXUnDyY7dkAUFIwM3P2eY4R/Djika3az09tW+
         sf6I5L19zVpcZ2TNE3cJgiZqlbcb8fullfxyK7MIcJnAVbDC0+/5eCRpwbwEQ9qL83hZ
         9l3Avgrz6PdMVpmOK0PajiNOcUjo0+SOBeiMxdlxlo62W08eS7sxSojPLIp7NBXsEWlp
         uef8BeYfIEcPYnoytYtOr5I/ntezijf3DsdcFkVDKKCfJTyqpfy6Mv4hgCDtvENU1gps
         S4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722893066; x=1723497866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x8/kZWq8UAWXE07EOv+W3BwbqxC1RibcaCo1Y6U9Jvo=;
        b=sjN+7+a0votUmGqJ5xdbUwMODseEv154dh1gHP0cjpD0IM0z5EHl6EyGWCk0KLCzEK
         NJkO859d7yvjQJzuaFw4rmj3neyAi4BBhroXGEqjLGzUD+0RRgYlcyWZrcgyMUTIh9NH
         86Zw+jkBlPU0v1th50FYjsQeIkGxFljlyoumvlCvIQjtLknbMJ+JMm44HS6q0iCvB2C7
         l0zg56Pi+KX4exwMeKvEOfWUHsFEQpwq7LSwJsEwAGgpRyvQB2B/yY/vFsD/pFN59FLg
         QcHdi8VDriePFB/qvMoIAbe5Ulj5hC3RVZ394yjMB5dCL2b1dPhJimuQrkf5+5iqnKKJ
         zUdA==
X-Forwarded-Encrypted: i=1; AJvYcCXm61wdDbp/19ZQ1KsGDMLYbp1WffvmTXWLYxd5e4awoU7AoLcjLicACFA9VSu2kcTSlnwzNPbXQZonFbbsuF4Bznb+jij3/3O08i8F+yc=
X-Gm-Message-State: AOJu0YxOcVpB2dYzcobgQnVOFAvIzYfOUDrZjTsBrKzV+ae8Gu7PHDhg
	XtkecI77TBz7S4XrOCctyHLqKm/ADcBX05zg0HQ1fYGuVA46EvdUoOOkXw==
X-Google-Smtp-Source: AGHT+IG4RYF8McPc4HKKHVYQKxQjAqCBZEhENp4/CQ5Sq2EDam/fI5HAkFlcVloF1egqOTvFaVvkYw==
X-Received: by 2002:a17:907:8692:b0:a7a:a33e:47b7 with SMTP id a640c23a62f3a-a7dc512ca02mr822444566b.69.1722893065808;
        Mon, 05 Aug 2024 14:24:25 -0700 (PDT)
Received: from [192.168.178.20] (dh207-41-17.xnet.hr. [88.207.41.17])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9c61575sm489792666b.92.2024.08.05.14.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 14:24:25 -0700 (PDT)
Message-ID: <38de6ac2-a7d8-41dc-a065-68ce60d5b662@gmail.com>
Date: Mon, 5 Aug 2024 23:24:06 +0200
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
 <9aec9df8-ca82-4b2f-b227-5e318c66b97e@gmail.com>
 <20240717154434.jba66jupaf566tes@quack3>
 <83c22d71-8706-4779-8d20-6b18a75c95a5@gmail.com>
 <20240718093943.qtyc2bdt4oerjuek@quack3>
 <25a65d69-5f04-433b-a5a3-5fd8dbe787aa@gmail.com>
 <20240805130415.ws3t7sgvcg7cj5ev@quack3>
Content-Language: en-US
From: Mirsad Todorovac <mtodorovac69@gmail.com>
In-Reply-To: <20240805130415.ws3t7sgvcg7cj5ev@quack3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/5/24 15:04, Jan Kara wrote:
> On Fri 02-08-24 18:31:46, Mirsad Todorovac wrote:
>> On 7/18/24 11:39, Jan Kara wrote:
>>> On Thu 18-07-24 00:14:24, Mirsad Todorovac wrote:
>>>>
>>>>
>>>> On 7/17/24 17:44, Jan Kara wrote:
>>>>> On Tue 16-07-24 19:17:05, Mirsad Todorovac wrote:
>>>>>> On 7/15/24 19:28, Jan Kara wrote:
>>>>>>> Hello Mirsad!
>>>>>>>
>>>>>>> On Wed 10-07-24 20:09:27, Mirsad Todorovac wrote:
>>>>>>>> On the linux-next vanilla next-20240709 tree, I have attempted the seed KCONFIG_SEED=0xEE7AB52F
>>>>>>>> which was known from before to trigger various errors in compile and build process.
>>>>>>>>
>>>>>>>> Though this might seem as contributing to channel noise, Linux refuses to build this config,
>>>>>>>> treating warnings as errors, using this build line:
>>>>>>>>
>>>>>>>> $ time nice make W=1 -k -j 36 |& tee ../err-next-20230709-01a.log; date
>>>>>>>>
>>>>>>>> As I know that the Chief Penguin doesn't like warnings, but I am also aware that there are plenty
>>>>>>>> left, there seems to be more tedious work ahead to make the compilers happy.
>>>>>>>>
>>>>>>>> The compiler output is:
>>>>>>>>
>>>>>>>> ---------------------------------------------------------------------------------------------------------
>>>>>>>> fs/reiserfs/do_balan.c: In function ‘balance_leaf_new_nodes_paste_whole’:
>>>>>>>> fs/reiserfs/do_balan.c:1147:13: error: variable ‘leaf_mi’ set but not used [-Werror=unused-but-set-variable]
>>>>>>>>  1147 |         int leaf_mi;
>>>>>>>>       |             ^~~~~~~
>>>>>>>
>>>>>>> Frankly, I wouldn't bother with reiserfs. The warning is there for ages,
>>>>>>> the code is going to get removed in two releases, so I guess we can live
>>>>>>> with these warnings for a few more months...
>>>>>>
>>>>>> In essence I agree with you, but for sentimental reasons I would like to
>>>>>> keep it because it is my first journaling Linux system on Knoppix 🙂
>>>>>
>>>>> As much as I understand your sentiment (I have a bit of history with that
>>>>> fs as well) the maintenance cost isn't really worth it and most fs folks
>>>>> will celebrate when it's removed. We have already announced the removal
>>>>> year and half ago and I'm fully for executing that plan at the end of this
>>>>> year.
>>>>>
>>>>>> Patch is also simple and a no-brainer, as proposed by Mr. Cook:
>>>>>>
>>>>>> -------------------------------><------------------------------------------
>>>>>> diff --git a/fs/reiserfs/do_balan.c b/fs/reiserfs/do_balan.c
>>>>>> index 5129efc6f2e6..fbe73f267853 100644
>>>>>> --- a/fs/reiserfs/do_balan.c
>>>>>> +++ b/fs/reiserfs/do_balan.c
>>>>>> @@ -1144,7 +1144,9 @@ static void balance_leaf_new_nodes_paste_whole(struct tree_balance *tb,
>>>>>>  {
>>>>>>  	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
>>>>>>  	int n = B_NR_ITEMS(tbS0);
>>>>>> +#ifdef CONFIG_REISERFS_CHECK
>>>>>>  	int leaf_mi;
>>>>>> +#endif
>>>>>
>>>>> Well, I would not like this even for actively maintained code ;) If you
>>>>> want to silence these warnings in this dead code, then I could live with
>>>>> something like:
>>>>>
>>>>> #if defined( CONFIG_REISERFS_CHECK )
>>>>> #define RFALSE(cond, format, args...) __RASSERT(!(cond), ....)
>>>>> #else
>>>>> - #define RFALSE( cond, format, args... ) do {;} while( 0 )
>>>>> + #define RFALSE( cond, format, args... ) do { (void)cond; } while( 0 )
>>>>> #endif
>>>>
>>>> Yes, one line change is much smarter than 107 line patch of mine :-)
>>>>
>>>> Verified, and this line solved all the warnings:
>>>>
>>>>   CC      fs/reiserfs/bitmap.o
>>>>   CC      fs/reiserfs/do_balan.o
>>>>   CC      fs/reiserfs/namei.o
>>>>   CC      fs/reiserfs/inode.o
>>>>   CC      fs/reiserfs/file.o
>>>>   CC      fs/reiserfs/dir.o
>>>>   CC      fs/reiserfs/fix_node.o
>>>>   CC      fs/reiserfs/super.o
>>>>   CC      fs/reiserfs/prints.o
>>>>   CC      fs/reiserfs/objectid.o
>>>>   CC      fs/reiserfs/lbalance.o
>>>>   CC      fs/reiserfs/ibalance.o
>>>>   CC      fs/reiserfs/stree.o
>>>>   CC      fs/reiserfs/hashes.o
>>>>   CC      fs/reiserfs/tail_conversion.o
>>>>   CC      fs/reiserfs/journal.o
>>>>   CC      fs/reiserfs/resize.o
>>>>   CC      fs/reiserfs/item_ops.o
>>>>   CC      fs/reiserfs/ioctl.o
>>>>   CC      fs/reiserfs/xattr.o
>>>>   CC      fs/reiserfs/lock.o
>>>>   CC      fs/reiserfs/procfs.o
>>>>   AR      fs/reiserfs/built-in.a
>>>>
>>>> Just FWIW, back then in year 2000/2001 a journaling file system on my
>>>> Knoppix box was a quantum leap - it would simply replay the journal if
>>>> there was a power loss before shutdown. No several minutes of fsck.
>>>
>>> Well, there was also ext3 at that time already :-) That's where I became
>>> familiar with the idea of journalling. Reiserfs was interesting to me
>>> because of completely different approach to on-disk format (b-tree with
>>> formatted items), packing of small files / file tails (interesting in 2000,
>>> not so much 20 years later) and reasonable scalability for large
>>> directories.
>>>
>>>> I think your idea is great and if you wish a patch could be submitted
>>>> after the merge window.
>>>
>>> I'll leave it up to you. If the warnings annoy you, send the patch along
>>> the lines I've proposed (BTW (void)cond should better be (void)(cond) for
>>> macro safety) and I'll push it to Linus.
>>>
>>> 								Honza
>>
>> Hi, Jan,
>>
>> After a short break, I just tried a full build with this hack against the vanilla
>> linux-next tree:
>>
>> #define RFALSE( cond, format, args... ) do { (void)(cond); } while( 0 )
>>
>> and it breaks at least here:
>>
>> In file included from fs/reiserfs/do_balan.c:15:
>> fs/reiserfs/do_balan.c: In function ‘balance_leaf_when_delete_del’:
>> fs/reiserfs/do_balan.c:86:28: error: ‘ih’ undeclared (first use in this function)
>>    86 |         RFALSE(ih_item_len(ih) + IH_SIZE != -tb->insert_size[0],
>>       |                            ^~
>> fs/reiserfs/reiserfs.h:919:54: note: in definition of macro ‘RFALSE’
>>   919 | #define RFALSE( cond, format, args... ) do { (void) (cond); } while( 0 )
>>       |                                                      ^~~~
>> ./include/linux/byteorder/generic.h:91:21: note: in expansion of macro ‘__le16_to_cpu’
>>    91 | #define le16_to_cpu __le16_to_cpu
>>       |                     ^~~~~~~~~~~~~
>> fs/reiserfs/do_balan.c:86:16: note: in expansion of macro ‘ih_item_len’
>>    86 |         RFALSE(ih_item_len(ih) + IH_SIZE != -tb->insert_size[0],
>>       |                ^~~~~~~~~~~
>> fs/reiserfs/do_balan.c:86:28: note: each undeclared identifier is reported only once for each function it appears in
>>    86 |         RFALSE(ih_item_len(ih) + IH_SIZE != -tb->insert_size[0],
>>       |                            ^~
>> fs/reiserfs/reiserfs.h:919:54: note: in definition of macro ‘RFALSE’
>>   919 | #define RFALSE( cond, format, args... ) do { (void) (cond); } while( 0 )
>>       |                                                      ^~~~
>> ./include/linux/byteorder/generic.h:91:21: note: in expansion of macro ‘__le16_to_cpu’
>>    91 | #define le16_to_cpu __le16_to_cpu
>>       |                     ^~~~~~~~~~~~~
>> fs/reiserfs/do_balan.c:86:16: note: in expansion of macro ‘ih_item_len’
>>    86 |         RFALSE(ih_item_len(ih) + IH_SIZE != -tb->insert_size[0],
>>       |                ^~~~~~~~~~~
>> fs/reiserfs/do_balan.c: In function ‘do_balance_starts’:
>> fs/reiserfs/do_balan.c:1800:16: error: implicit declaration of function ‘check_before_balancing’ [-Werror=implicit-function-declaration]
>>  1800 |         RFALSE(check_before_balancing(tb), "PAP-12340: locked buffers in TB");
>>       |                ^~~~~~~~~~~~~~~~~~~~~~
>> fs/reiserfs/reiserfs.h:919:54: note: in definition of macro ‘RFALSE’
>>   919 | #define RFALSE( cond, format, args... ) do { (void) (cond); } while( 0 )
>>       |                                                      ^~~~
>> cc1: some warnings being treated as errors
>> make[7]: *** [scripts/Makefile.build:244: fs/reiserfs/do_balan.o] Error 1
>>   CC [M]  fs/reiserfs/stree.o
>> In file included from fs/reiserfs/stree.c:15:
>> fs/reiserfs/stree.c: In function ‘reiserfs_delete_item’:
>> fs/reiserfs/stree.c:1283:24: error: ‘mode’ undeclared (first use in this function)
>>  1283 |                 RFALSE(mode != M_DELETE, "PAP-5320: mode must be M_DELETE");
>>       |                        ^~~~
>> fs/reiserfs/reiserfs.h:919:54: note: in definition of macro ‘RFALSE’
>>   919 | #define RFALSE( cond, format, args... ) do { (void) (cond); } while( 0 )
>>       |                                                      ^~~~
>> fs/reiserfs/stree.c:1283:24: note: each undeclared identifier is reported only once for each function it appears in
>>  1283 |                 RFALSE(mode != M_DELETE, "PAP-5320: mode must be M_DELETE");
>>       |                        ^~~~
>> fs/reiserfs/reiserfs.h:919:54: note: in definition of macro ‘RFALSE’
>>   919 | #define RFALSE( cond, format, args... ) do { (void) (cond); } while( 0 )
>>       |                                                      ^~~~
>>
>> Last time it compiled, but now it expects variables in (void)(cond) expressions to be defined.
>>
>> I have try to fix those warnings, submitting the patch for review:
> 
> Yeah, this looks ok to me.
> 
> 								Honza

Hi, Jan,

As I understood from the previous experiences, and the Code of Conduct, and explicit Reviwed-by:
or Acked-by: is required ...

Or otherwise, the Suggested-by: is used?

Thank you very much.

Best regards,
Mirsad Todorovac

>> -------------------><---------------------------------------
>> diff --git a/fs/reiserfs/do_balan.c b/fs/reiserfs/do_balan.c
>> index 5129efc6f2e6..c8fa3d71ef63 100644
>> --- a/fs/reiserfs/do_balan.c
>> +++ b/fs/reiserfs/do_balan.c
>> @@ -81,11 +81,11 @@ static void balance_leaf_when_delete_del(struct tree_balance *tb)
>>         struct buffer_info bi;
>>  #ifdef CONFIG_REISERFS_CHECK
>>         struct item_head *ih = item_head(tbS0, item_pos);
>> -#endif
>>  
>>         RFALSE(ih_item_len(ih) + IH_SIZE != -tb->insert_size[0],
>>                "vs-12013: mode Delete, insert size %d, ih to be deleted %h",
>>                -tb->insert_size[0], ih);
>> +#endif
>>  
>>         buffer_info_init_tbS0(tb, &bi);
>>         leaf_delete_items(&bi, 0, item_pos, 1, -1);
>> @@ -1797,8 +1797,8 @@ static inline void do_balance_starts(struct tree_balance *tb)
>>         print_tb(flag, PATH_LAST_POSITION(tb->tb_path),
>>                  tb->tb_path->pos_in_item, tb, "check");
>>         */
>> -       RFALSE(check_before_balancing(tb), "PAP-12340: locked buffers in TB");
>>  #ifdef CONFIG_REISERFS_CHECK
>> +       RFALSE(check_before_balancing(tb), "PAP-12340: locked buffers in TB");
>>         REISERFS_SB(tb->tb_sb)->cur_tb = tb;
>>  #endif
>>  }
>> diff --git a/fs/reiserfs/reiserfs.h b/fs/reiserfs/reiserfs.h
>> index f0e1f29f20ee..027e64853710 100644
>> --- a/fs/reiserfs/reiserfs.h
>> +++ b/fs/reiserfs/reiserfs.h
>> @@ -916,7 +916,7 @@ do {                                                                        \
>>  #if defined( CONFIG_REISERFS_CHECK )
>>  #define RFALSE(cond, format, args...) __RASSERT(!(cond), "!(" #cond ")", format, ##args)
>>  #else
>> -#define RFALSE( cond, format, args... ) do {;} while( 0 )
>> +#define RFALSE( cond, format, args... ) do { (void) (cond); } while( 0 )
>>  #endif
>>  
>>  #define CONSTF __attribute_const__
>> diff --git a/fs/reiserfs/stree.c b/fs/reiserfs/stree.c
>> index 5faf702f8d15..eed1a461169e 100644
>> --- a/fs/reiserfs/stree.c
>> +++ b/fs/reiserfs/stree.c
>> @@ -1280,7 +1280,9 @@ int reiserfs_delete_item(struct reiserfs_transaction_handle *th,
>>                                               &del_size,
>>                                               max_reiserfs_offset(inode));
>>  
>> +#ifdef CONFIG_REISERFS_CHECK
>>                 RFALSE(mode != M_DELETE, "PAP-5320: mode must be M_DELETE");
>> +#endif
>>  
>>                 copy_item_head(&s_ih, tp_item_head(path));
>>                 s_del_balance.insert_size[0] = del_size;
>> --
>>
>> Thanks.
>>
>> Best regards,
>> Mirsad Todorovac
>>

