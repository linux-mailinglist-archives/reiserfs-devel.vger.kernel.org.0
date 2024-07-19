Return-Path: <reiserfs-devel+bounces-143-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09238937D6C
	for <lists+reiserfs-devel@lfdr.de>; Fri, 19 Jul 2024 22:51:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22F751C20AFA
	for <lists+reiserfs-devel@lfdr.de>; Fri, 19 Jul 2024 20:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 447686214D;
	Fri, 19 Jul 2024 20:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KADZ7bGN"
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6879F1B86EC;
	Fri, 19 Jul 2024 20:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721422278; cv=none; b=T3LPCCXiD2jaRBKwgyVlUpQjoHbOMWfuFSZnLDOz9sM4Z9pknXascDqIlyfrXMeiPdgqFbrCnzUjq9QfMtvqjTZiYsZeGfOF4FhsKMSsotPBNkR6G6g4mSi2k2E4Kl6MEzC9TEDs8uJ2OT9BbRu6rhv720xA1M/DZfQoXnajqTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721422278; c=relaxed/simple;
	bh=8oxTPFuB/qY+8a8IQ1CWy2LI/me2zWEKXQ5cSIHx5Hw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XxUWrttIYcjBNxKrswvTfS97zM5iQA9dktA6jkyrUmQKfEmfxKw/GQ7QAN4IJ2uSPLsw9H6rz8Lv3sVEPStQKygKWJFk+qBy95rRTB+3RmBrvjRcJrLlKqBlvigXHVpYwYN/52/688SfDTp1ozwzujlgI4rayLlttqnO9Ko3Pmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KADZ7bGN; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-368584f9e36so937236f8f.2;
        Fri, 19 Jul 2024 13:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721422275; x=1722027075; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0CFHn6Wu32vFr5LZh8Mesp3cm8j3Wz+OTXQhTF7EJnQ=;
        b=KADZ7bGN72qkkqwrW96EnTXQ4BdbjhcGHKyFlRo4TsofD4GZjKI4gAtgJk7Z3tTsz8
         GRAUg+lAQbGU4845QwlIya+P/OkijthpL3e/Gzm488MFbgG19WSmit2P7zpwb3oyKIad
         6k6h1M5mL66ZoLiSGk+Fjp+ii7unT6b4LO975yyJpuPp/p7uDhkEDJrBuxOtKA+gFwQZ
         6HEVw050KaOkvriG7ADZDef3jKyCKqJHYwfei2CnvDKChcWNs6DuCQKeRtcrQPlR3h8d
         CKa94axi0mBM1r9zrD5WPy6ossj3H5SeXuGRXE7+50TNWs3KO11abk81ilNQ67SuT5+e
         4jtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721422275; x=1722027075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0CFHn6Wu32vFr5LZh8Mesp3cm8j3Wz+OTXQhTF7EJnQ=;
        b=LPlXPIFGenauPOzdBWIuSmq1LqCoSWIjSQccnNWPqHwyIR19IVHRqeNYcfAsuFcbnj
         kbZzVXbfJmazMaQmVtwZtLMvofW+6Zn6rNX7Fm4mWgT8+ThlLc9NV9MHp3Jv3rERNmeq
         5Q5d+GUnBWplnaSEX0z+FN06vduMBiXa7WbstRDwA/nFR0xxR07OCx/GJRHT9q/Zxm0G
         +TRCeNMv9WGp9jxOUdtU26R2Ib0VI+YO+bs3n1TXCcUruyMGXzH2ygXdjueswezwHZev
         zzP7BwR59HPueUo93fMEAWDvTLmcqCPTKT8VMdgwUcdt/rv9IxNhl96wlR628V07gry9
         FGfA==
X-Forwarded-Encrypted: i=1; AJvYcCXqNutWfrr2PQsGZEUHCH3Jhe8jVUJyVH0JA19OBu+bGAUPHbMryIPyd+vFWNSa4mOQu7a+cvJBbAMSaBL6hYtRUEShiwLTT8l2xw8xmWM=
X-Gm-Message-State: AOJu0YwW3ySiuZJ9pwFeoah+LC6tusC2TRIpnrLLwz8s9d3L/xpFEK2Y
	rJaNNZhdw3cKX2IYwH1bg31MHiFhSx/cJDkdWbN/82jq1Ly2sLsq
X-Google-Smtp-Source: AGHT+IEWY7bsu3Bhb+bWavd5JlwwyDzl+3bvZRG9h3qhyOHQWRfn9gBEuRGthGQeJ87U2FLDK8BLzQ==
X-Received: by 2002:a5d:5006:0:b0:368:714e:5a59 with SMTP id ffacd0b85a97d-368714e5bd6mr2617514f8f.11.1721422274664;
        Fri, 19 Jul 2024 13:51:14 -0700 (PDT)
Received: from [192.168.178.20] (dh207-42-168.xnet.hr. [88.207.42.168])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3687868423bsm2498649f8f.14.2024.07.19.13.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jul 2024 13:51:14 -0700 (PDT)
Message-ID: <42924f6d-32e3-4519-9616-5438e6527e90@gmail.com>
Date: Fri, 19 Jul 2024 22:51:09 +0200
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
Content-Language: en-US
From: Mirsad Todorovac <mtodorovac69@gmail.com>
In-Reply-To: <20240718093943.qtyc2bdt4oerjuek@quack3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/18/24 11:39, Jan Kara wrote:
> On Thu 18-07-24 00:14:24, Mirsad Todorovac wrote:
>>
>>
>> On 7/17/24 17:44, Jan Kara wrote:
>>> On Tue 16-07-24 19:17:05, Mirsad Todorovac wrote:
>>>> On 7/15/24 19:28, Jan Kara wrote:
>>>>> Hello Mirsad!
>>>>>
>>>>> On Wed 10-07-24 20:09:27, Mirsad Todorovac wrote:
>>>>>> On the linux-next vanilla next-20240709 tree, I have attempted the seed KCONFIG_SEED=0xEE7AB52F
>>>>>> which was known from before to trigger various errors in compile and build process.
>>>>>>
>>>>>> Though this might seem as contributing to channel noise, Linux refuses to build this config,
>>>>>> treating warnings as errors, using this build line:
>>>>>>
>>>>>> $ time nice make W=1 -k -j 36 |& tee ../err-next-20230709-01a.log; date
>>>>>>
>>>>>> As I know that the Chief Penguin doesn't like warnings, but I am also aware that there are plenty
>>>>>> left, there seems to be more tedious work ahead to make the compilers happy.
>>>>>>
>>>>>> The compiler output is:
>>>>>>
>>>>>> ---------------------------------------------------------------------------------------------------------
>>>>>> fs/reiserfs/do_balan.c: In function ‘balance_leaf_new_nodes_paste_whole’:
>>>>>> fs/reiserfs/do_balan.c:1147:13: error: variable ‘leaf_mi’ set but not used [-Werror=unused-but-set-variable]
>>>>>>  1147 |         int leaf_mi;
>>>>>>       |             ^~~~~~~
>>>>>
>>>>> Frankly, I wouldn't bother with reiserfs. The warning is there for ages,
>>>>> the code is going to get removed in two releases, so I guess we can live
>>>>> with these warnings for a few more months...
>>>>
>>>> In essence I agree with you, but for sentimental reasons I would like to
>>>> keep it because it is my first journaling Linux system on Knoppix 🙂
>>>
>>> As much as I understand your sentiment (I have a bit of history with that
>>> fs as well) the maintenance cost isn't really worth it and most fs folks
>>> will celebrate when it's removed. We have already announced the removal
>>> year and half ago and I'm fully for executing that plan at the end of this
>>> year.
>>>
>>>> Patch is also simple and a no-brainer, as proposed by Mr. Cook:
>>>>
>>>> -------------------------------><------------------------------------------
>>>> diff --git a/fs/reiserfs/do_balan.c b/fs/reiserfs/do_balan.c
>>>> index 5129efc6f2e6..fbe73f267853 100644
>>>> --- a/fs/reiserfs/do_balan.c
>>>> +++ b/fs/reiserfs/do_balan.c
>>>> @@ -1144,7 +1144,9 @@ static void balance_leaf_new_nodes_paste_whole(struct tree_balance *tb,
>>>>  {
>>>>  	struct buffer_head *tbS0 = PATH_PLAST_BUFFER(tb->tb_path);
>>>>  	int n = B_NR_ITEMS(tbS0);
>>>> +#ifdef CONFIG_REISERFS_CHECK
>>>>  	int leaf_mi;
>>>> +#endif
>>>
>>> Well, I would not like this even for actively maintained code ;) If you
>>> want to silence these warnings in this dead code, then I could live with
>>> something like:
>>>
>>> #if defined( CONFIG_REISERFS_CHECK )
>>> #define RFALSE(cond, format, args...) __RASSERT(!(cond), ....)
>>> #else
>>> - #define RFALSE( cond, format, args... ) do {;} while( 0 )
>>> + #define RFALSE( cond, format, args... ) do { (void)cond; } while( 0 )
>>> #endif
>>
>> Yes, one line change is much smarter than 107 line patch of mine :-)
>>
>> Verified, and this line solved all the warnings:
>>
>>   CC      fs/reiserfs/bitmap.o
>>   CC      fs/reiserfs/do_balan.o
>>   CC      fs/reiserfs/namei.o
>>   CC      fs/reiserfs/inode.o
>>   CC      fs/reiserfs/file.o
>>   CC      fs/reiserfs/dir.o
>>   CC      fs/reiserfs/fix_node.o
>>   CC      fs/reiserfs/super.o
>>   CC      fs/reiserfs/prints.o
>>   CC      fs/reiserfs/objectid.o
>>   CC      fs/reiserfs/lbalance.o
>>   CC      fs/reiserfs/ibalance.o
>>   CC      fs/reiserfs/stree.o
>>   CC      fs/reiserfs/hashes.o
>>   CC      fs/reiserfs/tail_conversion.o
>>   CC      fs/reiserfs/journal.o
>>   CC      fs/reiserfs/resize.o
>>   CC      fs/reiserfs/item_ops.o
>>   CC      fs/reiserfs/ioctl.o
>>   CC      fs/reiserfs/xattr.o
>>   CC      fs/reiserfs/lock.o
>>   CC      fs/reiserfs/procfs.o
>>   AR      fs/reiserfs/built-in.a
>>
>> Just FWIW, back then in year 2000/2001 a journaling file system on my
>> Knoppix box was a quantum leap - it would simply replay the journal if
>> there was a power loss before shutdown. No several minutes of fsck.
> 
> Well, there was also ext3 at that time already :-) That's where I became
> familiar with the idea of journalling. Reiserfs was interesting to me
> because of completely different approach to on-disk format (b-tree with
> formatted items), packing of small files / file tails (interesting in 2000,
> not so much 20 years later) and reasonable scalability for large
> directories.
> 
>> I think your idea is great and if you wish a patch could be submitted
>> after the merge window.
> 
> I'll leave it up to you. If the warnings annoy you, send the patch along
> the lines I've proposed (BTW (void)cond should better be (void)(cond) for
> macro safety) and I'll push it to Linus.
> 
> 								Honza

Sure thing. Yes, (ovid)(cond) makes much more sense against i.e.
expanding RFALSE(a + b, ...).

Best regards,
Mirsad Todorovac

