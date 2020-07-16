Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD15322243C
	for <lists+reiserfs-devel@lfdr.de>; Thu, 16 Jul 2020 15:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728110AbgGPNsr (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 16 Jul 2020 09:48:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47944 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726537AbgGPNsq (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 16 Jul 2020 09:48:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594907324;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GfvtRZl6XjjqgsUho+mp1mDesIN25Q1M46CfrAHyf5E=;
        b=SfqKe+gNMqaMKgHfybf+ieUujVXBmxQ/gBRrVTTN8McUsJqsb+7ADFiOrBJs5M6Xhfh7vu
        /5n1z4KNRfm+UPnpkH5rJx7Yl2NtZe1Chd67Oui4ccPEJkfwC+jDpGwUbxF9uGc717vbya
        HSsDULINrxLwQg6xK2YFH2qai5OWw8k=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-jrPgqqIbPCqMv5bSooWxuA-1; Thu, 16 Jul 2020 09:48:43 -0400
X-MC-Unique: jrPgqqIbPCqMv5bSooWxuA-1
Received: by mail-qv1-f70.google.com with SMTP id r19so3450356qvz.7
        for <reiserfs-devel@vger.kernel.org>; Thu, 16 Jul 2020 06:48:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=GfvtRZl6XjjqgsUho+mp1mDesIN25Q1M46CfrAHyf5E=;
        b=V33CSQtf/ujH55JEdLJnT3QjMf8IltdmJKw29VZVdWKSLKsQOOVuUvCVYZHbfHEMv8
         YhrfuyWduP8W4tI4qoEXrTXzfRXhglBxYuUa3i9v5j7dO7ws47MM3gaJUCeT0LMWZ8Bn
         HiPMFCq30z7OPLttdENvGzWaljFeK/Z4SRAW+yvHX77j8a3A2XixO+YzpnAdgcnH/Gum
         7TsVmo0URpQNbbU/hfPR0hAubWdU1CS9P6yCxW4zDPEkXgLzT0u4AyyLKpCQtG15jC9q
         O61K2+HXARrTZeLbbqux8IePwCgfIEV7SblZkp7mqsWVufHPlrV3uikmEZ4ctIJxzWkc
         pQbw==
X-Gm-Message-State: AOAM531FRnz6pc9JZBSeeNopzJQL2yKeV8vDc9AI8V9Tp1aSbWqKqFAC
        gsvTbbGSc5zaVNSOZZk8f0YPUgjDFcR41/mJ1cuI4gGfQ+ltplb0BaEqj/fAciiaLA27/3Hssg5
        hFjOEPhzLuGak0EYvVi0+YkaCDoo=
X-Received: by 2002:a05:6214:a72:: with SMTP id ef18mr4342617qvb.166.1594907322451;
        Thu, 16 Jul 2020 06:48:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0Oubl/AqRtyIxgKrCGuB+yjKyn9Gpk897PmC3Xhvn7arTCjRXwWZ17enUl/Seg7/aLuCVeA==
X-Received: by 2002:a05:6214:a72:: with SMTP id ef18mr4342587qvb.166.1594907322139;
        Thu, 16 Jul 2020 06:48:42 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id k197sm7161963qke.133.2020.07.16.06.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2020 06:48:41 -0700 (PDT)
Subject: Re: [PATCH] reiserfs : fix improper free in reiserfs_get_block
To:     Jan Kara <jack@suse.cz>
Cc:     Matthew Wilcox <willy@infradead.org>, william.kucharski@oracle.com,
        jeffm@suse.com, joseph.qi@linux.alibaba.com,
        liao.pingfang@zte.com.cn, reiserfs-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200714130509.11791-1-trix@redhat.com>
 <20200714131043.GB12769@casper.infradead.org>
 <bc5a13bd-54c4-509d-7202-20c93f43e2f6@redhat.com>
 <20200715080451.GK23073@quack2.suse.cz>
From:   Tom Rix <trix@redhat.com>
Message-ID: <41a5b57f-2bea-04a6-3510-6d76bd5098d5@redhat.com>
Date:   Thu, 16 Jul 2020 06:48:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200715080451.GK23073@quack2.suse.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org


On 7/15/20 1:04 AM, Jan Kara wrote:
> On Tue 14-07-20 06:12:47, Tom Rix wrote:
>> On 7/14/20 6:10 AM, Matthew Wilcox wrote:
>>> On Tue, Jul 14, 2020 at 06:05:09AM -0700, trix@redhat.com wrote:
>>>> From: Tom Rix <trix@redhat.com>
>>>>
>>>> clang static analysis flags this error
>>>>
>>>> inode.c:1083:5: warning: Argument to kfree() is the address of the
>>>>   local variable 'unf_single', which is not memory allocated by
>>>>   malloc() [unix.Malloc]
>>>>                                 kfree(un);
>>>>                                 ^~~~~~~~~
>>>> Assignment of 'un'
>>>>
>>>> 	/*
>>>> 	 * We use this in case we need to allocate
>>>> 	 * only one block which is a fastpath
>>>> 	 */
>>>> 	unp_t unf_single = 0;
>>>>
>>>> 	...
>>>>
>>>> 	if (blocks_needed == 1) {
>>>> 		un = &unf_single;
>>>> 	} else {
>>>> 		un = kcalloc(min(blocks_needed, max_to_insert),
>>>> 			     UNFM_P_SIZE, GFP_NOFS);
>>>> 		if (!un) {
>>>> 			un = &unf_single;
>>>> 			blocks_needed = 1;
>>>> 			max_to_insert = 0;
>>>> 		}
>>>> 	}
>>>>
>>>> The logic to free 'un'
>>>>
>>>> 	if (blocks_needed != 1)
>>>> 		kfree(un);
>>>>
>>>> Because the kcalloc failure falls back to using unf_single,
>>>> the if-check for the free is wrong.
>>> I think you mean "Because clang's static analysis is limited, it
>>> warns incorrectly about this".  There's no path to get to the
>>> kfree with blocks_needed != 1 and un being equal to &unf_single.
>> Ok.
> I agree with Matthew the patch will make the code more obviously correct so
> it's a sensible cleanup. But the changelog needs to redone to reflect this
> is just a cleanup before the patch can be merged.
>
> 									Honza

I am going to look into the problem with the analyzer because that is where the fix should go.

If the problem isn't resolvable, i will loop back to this clean up.

Tom

