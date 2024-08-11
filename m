Return-Path: <reiserfs-devel+bounces-153-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B62D694E31C
	for <lists+reiserfs-devel@lfdr.de>; Sun, 11 Aug 2024 22:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16E2BB21B4C
	for <lists+reiserfs-devel@lfdr.de>; Sun, 11 Aug 2024 20:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 971FF15748B;
	Sun, 11 Aug 2024 20:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwbrUT8j"
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FF91537A7;
	Sun, 11 Aug 2024 20:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723409545; cv=none; b=nhuZvsezdMY7u6jbAx9SHFpi6a1X7SLhNm/Xh9ji96wyTKTI3H72yXFcG/vqJ4nX1iRHP+E3+lvpaV0nI8RapJlT0BgCjO8jhKKan7diGDnzVLz/Xs4W4Z2iUyFxFVv4H3P2chjSqoxiMcfZTJlUlr6FlutdA16hoRlUJanO8+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723409545; c=relaxed/simple;
	bh=8WbmyCPf3VlfZEhoqJ5vx4uTe2M61/kBG+nUwoRrPCw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=JjpOqSn3CJI3j+bX4RwD7RLHdlqMJjxlcHiBqEcQctVW+o0oqMVA4MWvZ3egtKJsZAwk3MLXajKV9rxtQ/f3CrwxWdnFpOU7l4Dvre8htNnaADK6425W1atp60PfJvGbCLBiTR0Qegj1YMIdBVUe3xz1Qp2Bpxpr9KaDcB8nTlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwbrUT8j; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ef2c56da6cso40703881fa.1;
        Sun, 11 Aug 2024 13:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723409541; x=1724014341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MyrUFfo8K2jX8LEjbxjN+n9pXykadX8FBg6rHtLOpYw=;
        b=NwbrUT8jBsMFQ/FPV3infl4l5i8CpmMTEtfw/lZRHgcY3e2lNSt/H08b6cUT94loe2
         ERmFLZvWpyhH+9gnneIFv7P8PO88u26By/c3gkUo/HVCEq+Qo6Xr2Rcd8jlpn03HOFE+
         cXawRF5bjPq4RGU8ErIDpYmTqL+vXxRADASqIDqTgl7t3bo35NVEAMUB4avXyjXly3xZ
         O0eADDjS0FGYfUyJPBjh6Kd/Z1f4nhg6v9epOdFFsi+TUs35w0IR7YudiVsnJwp9Io0+
         LrFcH8fIuoKACDmn/RX04570pgjmwFyko4DU5mPfEltAQtrzdulGcfjd3ssb4NgxhotY
         Sdfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723409541; x=1724014341;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MyrUFfo8K2jX8LEjbxjN+n9pXykadX8FBg6rHtLOpYw=;
        b=YTTXCjMv6zPpTfgkzcWomQ33fyLitQEw1c6nq6mRqnfuxP2JBIuncO8LWQpN5VYpBu
         g0W7BauxqDdf1bCYfo40MqWOBkv4eeIiKvyFq3OPkvota0oIdTCDKNvBS5YPawo8IYq3
         8t3XkmA8GoTB74PJFkDvJWicH7Ppeiyv871scJ4aUIuma62Y7dzokOUDeLWvCKcFqzjf
         d6ZlElzxxRTQ+RVFNSLozBY+AHgIECDHpecnGsr/3m/Vobg6JoN4ne7KfnNCHsfKBW7m
         6Uz/A6k0KDZKEQZAlXhHLc72LwhuqFIKn5DjyjaVQ72PCUzgzSD25Cu1wdazCkyyqVXw
         Cqjw==
X-Forwarded-Encrypted: i=1; AJvYcCUbN0q0xxGISrN6MQhLizUO6fZ0y5zenogowXcV4iu2nVAU2PtU7ZRsdZs4/DhiiRYRFmZADONReIAU1VWxVhkMbU/TmZQkqdfu7ObER4U=
X-Gm-Message-State: AOJu0YwkRbB3Np3Z3DvAsn6VP1v2PLNZtDkZFXcTsplospTB+86upOyt
	Ixl0G9EUiGhAsS3lvG81RpRni+aI++oQe8KOrh1yE8VjYAiqr4zk
X-Google-Smtp-Source: AGHT+IHYq2ZVgPEW1kTDK+1kmPOqSorU9+0nhPJEjM0oqhmhInyNXw42i+9s1a7Fnsrgldq1ddllfw==
X-Received: by 2002:a2e:2c05:0:b0:2ef:2b08:1742 with SMTP id 38308e7fff4ca-2f1a6d0dc7emr46560721fa.48.1723409540594;
        Sun, 11 Aug 2024 13:52:20 -0700 (PDT)
Received: from [192.168.178.20] (dh207-40-227.xnet.hr. [88.207.40.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd196a7d41sm1569243a12.57.2024.08.11.13.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Aug 2024 13:52:20 -0700 (PDT)
Message-ID: <0af43f41-7e63-453b-ad08-bf50b2a6e7a6@gmail.com>
Date: Sun, 11 Aug 2024 22:52:03 +0200
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
From: Mirsad Todorovac <mtodorovac69@gmail.com>
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
 <38de6ac2-a7d8-41dc-a065-68ce60d5b662@gmail.com>
 <20240806082558.ytq673mhuji32koz@quack3>
 <a0562a00-a45f-4df6-98cf-3087ea4af848@gmail.com>
Content-Language: en-US
In-Reply-To: <a0562a00-a45f-4df6-98cf-3087ea4af848@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/11/24 15:34, Mirsad Todorovac wrote:
> On 8/6/24 10:25, Jan Kara wrote:
>> On Mon 05-08-24 23:24:06, Mirsad Todorovac wrote:
>>> On 8/5/24 15:04, Jan Kara wrote:
>>>> On Fri 02-08-24 18:31:46, Mirsad Todorovac wrote:
>>>>> On 7/18/24 11:39, Jan Kara wrote:
>>>>>> On Thu 18-07-24 00:14:24, Mirsad Todorovac wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 7/17/24 17:44, Jan Kara wrote:
>>>>>>>> On Tue 16-07-24 19:17:05, Mirsad Todorovac wrote:
>>>>>>>>> On 7/15/24 19:28, Jan Kara wrote:
>>>>>>>>>> Hello Mirsad!
>>>>>>>>>>
>>>>>>>>>> On Wed 10-07-24 20:09:27, Mirsad Todorovac wrote:
>>>>>>>>>>> On the linux-next vanilla next-20240709 tree, I have attempted the seed KCONFIG_SEED=0xEE7AB52F
>>>>>>>>>>> which was known from before to trigger various errors in compile and build process.
>>>>>>>>>>>
>>>>>>>>>>> Though this might seem as contributing to channel noise, Linux refuses to build this config,
>>>>>>>>>>> treating warnings as errors, using this build line:
>>>>>>>>>>>
>>>>>>>>>>> $ time nice make W=1 -k -j 36 |& tee ../err-next-20230709-01a.log; date
>>>>>>>>>>>
>>>>>>>>>>> As I know that the Chief Penguin doesn't like warnings, but I am also aware that there are plenty
>>>>>>>>>>> left, there seems to be more tedious work ahead to make the compilers happy.
>>>>>>>>>>>
>>>>>>>>>>> The compiler output is:
>>>>>>>>>>>
>>>>>>>>>>> ---------------------------------------------------------------------------------------------------------
>>>>>>>>>>> fs/reiserfs/do_balan.c: In function ‘balance_leaf_new_nodes_paste_whole’:
>>>>>>>>>>> fs/reiserfs/do_balan.c:1147:13: error: variable ‘leaf_mi’ set but not used [-Werror=unused-but-set-variable]
>>>>>>>>>>>  1147 |         int leaf_mi;
>>>>>>>>>>>       |             ^~~~~~~
>>>>>>>>>>
>>>>>>>>>> Frankly, I wouldn't bother with reiserfs. The warning is there for ages,
>>>>>>>>>> the code is going to get removed in two releases, so I guess we can live
>>>>>>>>>> with these warnings for a few more months...
>>>>>>>>>
>>>>>>>>> In essence I agree with you, but for sentimental reasons I would like to
>>>>>>>>> keep it because it is my first journaling Linux system on Knoppix 🙂
>>>>>>>>
>>>>>>>> As much as I understand your sentiment (I have a bit of history with that
>>>>>>>> fs as well) the maintenance cost isn't really worth it and most fs folks
>>>>>>>> will celebrate when it's removed. We have already announced the removal
>>>>>>>> year and half ago and I'm fully for executing that plan at the end of this
>>>>>>>> year.
>>>>>>>>
>>>>>>>>> Patch is also simple and a no-brainer, as proposed by Mr. Cook:
>>>>>>>>>
>>>>>>>>> -------------------------------><------------------------------------------
>>>>>>>>> diff --git a/fs/reiserfs/do_balan.c b/fs/reiserfs/do_balan.c
>>>>>>>>> index 5129efc6f2e6..fbe73f267853 100644
>>>>>>>>> --- a/fs/reiserfs/do_balan.c
>>>>>>>>> +++ b/fs/reiserfs/do_balan.c
>>>>>>>>> @@ -1144,7 +1144,9 @@ static void balance_leaf_new_nodes_paste_whole(struct tree_balance *tb,
>>>>>>>>>  {
>>>>>>>>>  	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
>>>>>>>>>  	int n = B_NR_ITEMS(tbS0);
>>>>>>>>> +#ifdef CONFIG_REISERFS_CHECK
>>>>>>>>>  	int leaf_mi;
>>>>>>>>> +#endif
>>>>>>>>
>>>>>>>> Well, I would not like this even for actively maintained code ;) If you
>>>>>>>> want to silence these warnings in this dead code, then I could live with
>>>>>>>> something like:
>>>>>>>>
>>>>>>>> #if defined( CONFIG_REISERFS_CHECK )
>>>>>>>> #define RFALSE(cond, format, args...) __RASSERT(!(cond), ....)
>>>>>>>> #else
>>>>>>>> - #define RFALSE( cond, format, args... ) do {;} while( 0 )
>>>>>>>> + #define RFALSE( cond, format, args... ) do { (void)cond; } while( 0 )
>>>>>>>> #endif
>>>>>>>
>>>>>>> Yes, one line change is much smarter than 107 line patch of mine :-)
>>>>>>>
>>>>>>> Verified, and this line solved all the warnings:
>>>>>>>
>>>>>>>   CC      fs/reiserfs/bitmap.o
>>>>>>>   CC      fs/reiserfs/do_balan.o
>>>>>>>   CC      fs/reiserfs/namei.o
>>>>>>>   CC      fs/reiserfs/inode.o
>>>>>>>   CC      fs/reiserfs/file.o
>>>>>>>   CC      fs/reiserfs/dir.o
>>>>>>>   CC      fs/reiserfs/fix_node.o
>>>>>>>   CC      fs/reiserfs/super.o
>>>>>>>   CC      fs/reiserfs/prints.o
>>>>>>>   CC      fs/reiserfs/objectid.o
>>>>>>>   CC      fs/reiserfs/lbalance.o
>>>>>>>   CC      fs/reiserfs/ibalance.o
>>>>>>>   CC      fs/reiserfs/stree.o
>>>>>>>   CC      fs/reiserfs/hashes.o
>>>>>>>   CC      fs/reiserfs/tail_conversion.o
>>>>>>>   CC      fs/reiserfs/journal.o
>>>>>>>   CC      fs/reiserfs/resize.o
>>>>>>>   CC      fs/reiserfs/item_ops.o
>>>>>>>   CC      fs/reiserfs/ioctl.o
>>>>>>>   CC      fs/reiserfs/xattr.o
>>>>>>>   CC      fs/reiserfs/lock.o
>>>>>>>   CC      fs/reiserfs/procfs.o
>>>>>>>   AR      fs/reiserfs/built-in.a
>>>>>>>
>>>>>>> Just FWIW, back then in year 2000/2001 a journaling file system on my
>>>>>>> Knoppix box was a quantum leap - it would simply replay the journal if
>>>>>>> there was a power loss before shutdown. No several minutes of fsck.
>>>>>>
>>>>>> Well, there was also ext3 at that time already :-) That's where I became
>>>>>> familiar with the idea of journalling. Reiserfs was interesting to me
>>>>>> because of completely different approach to on-disk format (b-tree with
>>>>>> formatted items), packing of small files / file tails (interesting in 2000,
>>>>>> not so much 20 years later) and reasonable scalability for large
>>>>>> directories.
>>>>>>
>>>>>>> I think your idea is great and if you wish a patch could be submitted
>>>>>>> after the merge window.
>>>>>>
>>>>>> I'll leave it up to you. If the warnings annoy you, send the patch along
>>>>>> the lines I've proposed (BTW (void)cond should better be (void)(cond) for
>>>>>> macro safety) and I'll push it to Linus.
>>>>>>
>>>>>> 								Honza
>>>>>
>>>>> Hi, Jan,
>>>>>
>>>>> After a short break, I just tried a full build with this hack against the vanilla
>>>>> linux-next tree:
>>>>>
>>>>> #define RFALSE( cond, format, args... ) do { (void)(cond); } while( 0 )
>>>>>
>>>>> and it breaks at least here:
>>>>>
>>>>> In file included from fs/reiserfs/do_balan.c:15:
>>>>> fs/reiserfs/do_balan.c: In function ‘balance_leaf_when_delete_del’:
>>>>> fs/reiserfs/do_balan.c:86:28: error: ‘ih’ undeclared (first use in this function)
>>>>>    86 |         RFALSE(ih_item_len(ih) + IH_SIZE != -tb->insert_size[0],
>>>>>       |                            ^~
>>>>> fs/reiserfs/reiserfs.h:919:54: note: in definition of macro ‘RFALSE’
>>>>>   919 | #define RFALSE( cond, format, args... ) do { (void) (cond); } while( 0 )
>>>>>       |                                                      ^~~~
>>>>> ./include/linux/byteorder/generic.h:91:21: note: in expansion of macro ‘__le16_to_cpu’
>>>>>    91 | #define le16_to_cpu __le16_to_cpu
>>>>>       |                     ^~~~~~~~~~~~~
>>>>> fs/reiserfs/do_balan.c:86:16: note: in expansion of macro ‘ih_item_len’
>>>>>    86 |         RFALSE(ih_item_len(ih) + IH_SIZE != -tb->insert_size[0],
>>>>>       |                ^~~~~~~~~~~
>>>>> fs/reiserfs/do_balan.c:86:28: note: each undeclared identifier is reported only once for each function it appears in
>>>>>    86 |         RFALSE(ih_item_len(ih) + IH_SIZE != -tb->insert_size[0],
>>>>>       |                            ^~
>>>>> fs/reiserfs/reiserfs.h:919:54: note: in definition of macro ‘RFALSE’
>>>>>   919 | #define RFALSE( cond, format, args... ) do { (void) (cond); } while( 0 )
>>>>>       |                                                      ^~~~
>>>>> ./include/linux/byteorder/generic.h:91:21: note: in expansion of macro ‘__le16_to_cpu’
>>>>>    91 | #define le16_to_cpu __le16_to_cpu
>>>>>       |                     ^~~~~~~~~~~~~
>>>>> fs/reiserfs/do_balan.c:86:16: note: in expansion of macro ‘ih_item_len’
>>>>>    86 |         RFALSE(ih_item_len(ih) + IH_SIZE != -tb->insert_size[0],
>>>>>       |                ^~~~~~~~~~~
>>>>> fs/reiserfs/do_balan.c: In function ‘do_balance_starts’:
>>>>> fs/reiserfs/do_balan.c:1800:16: error: implicit declaration of function ‘check_before_balancing’ [-Werror=implicit-function-declaration]
>>>>>  1800 |         RFALSE(check_before_balancing(tb), "PAP-12340: locked buffers in TB");
>>>>>       |                ^~~~~~~~~~~~~~~~~~~~~~
>>>>> fs/reiserfs/reiserfs.h:919:54: note: in definition of macro ‘RFALSE’
>>>>>   919 | #define RFALSE( cond, format, args... ) do { (void) (cond); } while( 0 )
>>>>>       |                                                      ^~~~
>>>>> cc1: some warnings being treated as errors
>>>>> make[7]: *** [scripts/Makefile.build:244: fs/reiserfs/do_balan.o] Error 1
>>>>>   CC [M]  fs/reiserfs/stree.o
>>>>> In file included from fs/reiserfs/stree.c:15:
>>>>> fs/reiserfs/stree.c: In function ‘reiserfs_delete_item’:
>>>>> fs/reiserfs/stree.c:1283:24: error: ‘mode’ undeclared (first use in this function)
>>>>>  1283 |                 RFALSE(mode != M_DELETE, "PAP-5320: mode must be M_DELETE");
>>>>>       |                        ^~~~
>>>>> fs/reiserfs/reiserfs.h:919:54: note: in definition of macro ‘RFALSE’
>>>>>   919 | #define RFALSE( cond, format, args... ) do { (void) (cond); } while( 0 )
>>>>>       |                                                      ^~~~
>>>>> fs/reiserfs/stree.c:1283:24: note: each undeclared identifier is reported only once for each function it appears in
>>>>>  1283 |                 RFALSE(mode != M_DELETE, "PAP-5320: mode must be M_DELETE");
>>>>>       |                        ^~~~
>>>>> fs/reiserfs/reiserfs.h:919:54: note: in definition of macro ‘RFALSE’
>>>>>   919 | #define RFALSE( cond, format, args... ) do { (void) (cond); } while( 0 )
>>>>>       |                                                      ^~~~
>>>>>
>>>>> Last time it compiled, but now it expects variables in (void)(cond) expressions to be defined.
>>>>>
>>>>> I have try to fix those warnings, submitting the patch for review:
>>>>
>>>> Yeah, this looks ok to me.
>>>>
>>>> 								Honza
>>>
>>> Hi, Jan,
>>>
>>> As I understood from the previous experiences, and the Code of Conduct,
>>> and explicit Reviwed-by: or Acked-by: is required ...
>>>
>>> Or otherwise, the Suggested-by: is used?
>>
>> So I was waiting for you to submit official patch with proper changelog and
>> your Signed-off-by. Then I can pick up the patch into my tree and merge it. 
>>
>> 								Honza
> 
> Aaah, sorry I've just noticed your reply. I missed it this morning already.
> 
> Yes, at your request, I will proceed as you recommended.

Hi, Jan,

As the filesystem has problems with the "General Protection Fault", which I learned later and
I am really not qualified to deal with that, just fixing compiler warnings is indeed cosmetics and an
exercise for the little grey cells.

Es ist nicht meine ernst, as Germans would have said.

But I will trust your judgment on whether this is worth patching.

Best regards,
Mirsad Todorovac


