Return-Path: <reiserfs-devel+bounces-141-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 232BC9344AD
	for <lists+reiserfs-devel@lfdr.de>; Thu, 18 Jul 2024 00:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85662B23166
	for <lists+reiserfs-devel@lfdr.de>; Wed, 17 Jul 2024 22:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A583E4503B;
	Wed, 17 Jul 2024 22:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HvzE17QW"
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11D345026;
	Wed, 17 Jul 2024 22:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721254471; cv=none; b=koHAUpuseCWYhBb/2zyV9jn1UGhRBXs8Eq4s/CaEvkBhjf5KHpyYzBG7c2q9Ikh4m152MaSm2NugJ9lTgD96BvoQg3jQ7B6VaRB5p69/TvxzisM830LGGiLrLFxcMvigBx6YNcbGPmMRp252b/WHEcs+PcKjeYREUGGOyTCQj90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721254471; c=relaxed/simple;
	bh=dm0+CMHO7vKIDCf6wDjcneREGbdXXyD7ohw0dLHiqu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C7T1RmiPoctzDcfTG2QaPbM7DPjbFbfBUceF6xRu0RnVl9q6Dh/kfjlp6Q7HHizziriB6wDV5jlIchRzG6NUsbzwl98tiHK8bfFckfee9ZChEzFyVg0DruPet0dXjPOW+X0ELDSinT6eRPo0dYOobJsefPL7w39sVLx2Uo53TNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HvzE17QW; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-427b9dcbb09so1114815e9.3;
        Wed, 17 Jul 2024 15:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721254468; x=1721859268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LLz5794gZ8/392piIYnoSc6sMHNA/7j06OojRb1VlGY=;
        b=HvzE17QWw+0fimRRfr5NuwYzYhmP+u6dkuYFZyl9ejSMAawXIv3hj9qqyWG3TuldYN
         PM40ni+NbdBFr30PNKYIzBNVzQW5zMnwgg/SG7V9JTby5c6Ix8INFEthDT/iJAHhs0xz
         zbtZc2N7Zk59pd4hVZI15b4bmW3Iej9Nhm8HooUatJmsxsEZs12KUpod/cIppp9naXX3
         sX0TFHhpA5MrXBuOUw6IqzwbRGKMHEP/9wGIiMjjzBoVl8+BwM0HLxL7b4mglgOXSOYR
         oo/t2jfcRjCaHeBoZmqDBVnWpq95KfMaoXaQ8iBjv4lL/n3wfwLzyIhYTq9HQ3Nr4nAv
         D/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721254468; x=1721859268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LLz5794gZ8/392piIYnoSc6sMHNA/7j06OojRb1VlGY=;
        b=t7p88JV3oWafHba32sQdMTc2tzsvx/hmYlyLC1PtN+nPSOpKnKI0PzqyGxKVrH0ulh
         9hGY+Lg7iqKUgiCv9khNanmMMmmPY2/IvDFtb4oJxzIiFjPN4O6dMviqgawq6DdbeQ14
         SdVT7j5FGsZAnokCviwCbLpjKCM9baR4wiW6OEsL9ARrlpvmJtGzSOweA/RDRPienoU8
         hoBFwPGZZPMh9QyfjF+PhHj/I0leY33pOAI3cxM9sgYswf9de/XAGixTMKUkUnzIoOUM
         egCy1YlSIKTmjO/br68M7ToYyT+3OGaz0hSO4HIGFVjvM8wVwriofnr6fBZIWMP8ufZK
         jaZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXztdmnm6X5r7a0OOHSIqnGmtzIgHUee3+S8U6+aWbHjBeN9MmBLFd5yvVBMJ4xNtAjj8d8UorvjMLe3ZO4soZ2WxZ1KV6vvZ5TldRWwtw=
X-Gm-Message-State: AOJu0YyNTmpmkIdAqc20LppE56pRkIaXItvciSZyCENqXt7WVn7XkBsa
	N9NmXhIor6lOaPp1nlVn+p6QMZGB1Iv+hJ7EnVaxSFda+sGC2Qre
X-Google-Smtp-Source: AGHT+IG5JaNOfOAj63kQ49MnoDYHtwt810vNiivEruZB/wXTCYaKiEGsiHZIQRctcZrNz0izqUrtqw==
X-Received: by 2002:a05:600c:4690:b0:426:60d7:d299 with SMTP id 5b1f17b1804b1-427c2cb5d0bmr19077865e9.7.1721254467818;
        Wed, 17 Jul 2024 15:14:27 -0700 (PDT)
Received: from [192.168.178.20] (dh207-43-140.xnet.hr. [88.207.43.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427bb9988f6sm50425455e9.1.2024.07.17.15.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 15:14:27 -0700 (PDT)
Message-ID: <83c22d71-8706-4779-8d20-6b18a75c95a5@gmail.com>
Date: Thu, 18 Jul 2024 00:14:24 +0200
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
Content-Language: en-US
From: Mirsad Todorovac <mtodorovac69@gmail.com>
In-Reply-To: <20240717154434.jba66jupaf566tes@quack3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/17/24 17:44, Jan Kara wrote:
> On Tue 16-07-24 19:17:05, Mirsad Todorovac wrote:
>> On 7/15/24 19:28, Jan Kara wrote:
>>> Hello Mirsad!
>>>
>>> On Wed 10-07-24 20:09:27, Mirsad Todorovac wrote:
>>>> On the linux-next vanilla next-20240709 tree, I have attempted the seed KCONFIG_SEED=0xEE7AB52F
>>>> which was known from before to trigger various errors in compile and build process.
>>>>
>>>> Though this might seem as contributing to channel noise, Linux refuses to build this config,
>>>> treating warnings as errors, using this build line:
>>>>
>>>> $ time nice make W=1 -k -j 36 |& tee ../err-next-20230709-01a.log; date
>>>>
>>>> As I know that the Chief Penguin doesn't like warnings, but I am also aware that there are plenty
>>>> left, there seems to be more tedious work ahead to make the compilers happy.
>>>>
>>>> The compiler output is:
>>>>
>>>> ---------------------------------------------------------------------------------------------------------
>>>> fs/reiserfs/do_balan.c: In function ‘balance_leaf_new_nodes_paste_whole’:
>>>> fs/reiserfs/do_balan.c:1147:13: error: variable ‘leaf_mi’ set but not used [-Werror=unused-but-set-variable]
>>>>  1147 |         int leaf_mi;
>>>>       |             ^~~~~~~
>>>
>>> Frankly, I wouldn't bother with reiserfs. The warning is there for ages,
>>> the code is going to get removed in two releases, so I guess we can live
>>> with these warnings for a few more months...
>>
>> In essence I agree with you, but for sentimental reasons I would like to
>> keep it because it is my first journaling Linux system on Knoppix 🙂
> 
> As much as I understand your sentiment (I have a bit of history with that
> fs as well) the maintenance cost isn't really worth it and most fs folks
> will celebrate when it's removed. We have already announced the removal
> year and half ago and I'm fully for executing that plan at the end of this
> year.
> 
>> Patch is also simple and a no-brainer, as proposed by Mr. Cook:
>>
>> -------------------------------><------------------------------------------
>> diff --git a/fs/reiserfs/do_balan.c b/fs/reiserfs/do_balan.c
>> index 5129efc6f2e6..fbe73f267853 100644
>> --- a/fs/reiserfs/do_balan.c
>> +++ b/fs/reiserfs/do_balan.c
>> @@ -1144,7 +1144,9 @@ static void balance_leaf_new_nodes_paste_whole(struct tree_balance *tb,
>>  {
>>  	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
>>  	int n = B_NR_ITEMS(tbS0);
>> +#ifdef CONFIG_REISERFS_CHECK
>>  	int leaf_mi;
>> +#endif
> 
> Well, I would not like this even for actively maintained code ;) If you
> want to silence these warnings in this dead code, then I could live with
> something like:
> 
> #if defined( CONFIG_REISERFS_CHECK )
> #define RFALSE(cond, format, args...) __RASSERT(!(cond), ....)
> #else
> - #define RFALSE( cond, format, args... ) do {;} while( 0 )
> + #define RFALSE( cond, format, args... ) do { (void)cond; } while( 0 )
> #endif

Yes, one line change is much smarter than 107 line patch of mine :-)

Verified, and this line solved all the warnings:

  CC      fs/reiserfs/bitmap.o
  CC      fs/reiserfs/do_balan.o
  CC      fs/reiserfs/namei.o
  CC      fs/reiserfs/inode.o
  CC      fs/reiserfs/file.o
  CC      fs/reiserfs/dir.o
  CC      fs/reiserfs/fix_node.o
  CC      fs/reiserfs/super.o
  CC      fs/reiserfs/prints.o
  CC      fs/reiserfs/objectid.o
  CC      fs/reiserfs/lbalance.o
  CC      fs/reiserfs/ibalance.o
  CC      fs/reiserfs/stree.o
  CC      fs/reiserfs/hashes.o
  CC      fs/reiserfs/tail_conversion.o
  CC      fs/reiserfs/journal.o
  CC      fs/reiserfs/resize.o
  CC      fs/reiserfs/item_ops.o
  CC      fs/reiserfs/ioctl.o
  CC      fs/reiserfs/xattr.o
  CC      fs/reiserfs/lock.o
  CC      fs/reiserfs/procfs.o
  AR      fs/reiserfs/built-in.a

Just FWIW, back then in year 2000/2001 a journaling file system on my Knoppix box was a quantum
leap - it would simply replay the journal if there was a power loss before shutdown. No several
minutes of fsck.

I think your idea is great and if you wish a patch could be submitted after the merge window.

Best regards,
Mirsad

> 
> 								Honza

