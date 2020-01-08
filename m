Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7CB13500E
	for <lists+reiserfs-devel@lfdr.de>; Thu,  9 Jan 2020 00:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgAHXnB (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 8 Jan 2020 18:43:01 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:36910 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgAHXnB (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 8 Jan 2020 18:43:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:Cc:References:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=fzCIX28C4ZAC3u5qLAUDVcEdFKR+Sd0vbPoA2LC1SLo=; b=unEY8eZyBDUlUUgSjehECSefM
        EzW+niSQLElUiK2BUPNlO87WoFdIuL5PZFYcS0E9tIE9jXT4pCRSJksAwY+ADVKc/gQMySCe1tL6a
        IFsm2PcJLVq9fpjgTZrarTVXxPA39KsFwDKcZl7gptdgYEEx17JDCJB0G3JGtCVBihkDw9KUeazVF
        rUJVa9P5DrNBtI+rrO13g/g4qbJVjZBEnmfndVWg5VNESl5c9RZjMfb6O1k+5k+F1iYirOTB+4wUk
        beJW8dxyn5MRf8UPnFFAq8ec7IX2gjc/6Ne7vQS7Sol/KzQ6AMot4lZ+oAIqW8TQNs6XdQ7VO4R70
        9ein7qXFg==;
Received: from [2601:1c0:6280:3f0::ed68]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ipKyZ-0005Fa-RS; Wed, 08 Jan 2020 23:42:59 +0000
Subject: Re: reiserfs broke between 4.9.205 and 4.9.208
To:     Michael Brunnbauer <brunni@netestate.de>,
        linux-kernel@vger.kernel.org
References: <20200108193634.GA17390@netestate.de>
Cc:     reiserfs-devel@vger.kernel.org, Jan Kara <jack@suse.cz>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <481c595b-46c9-0b4d-c618-a998ab6247c6@infradead.org>
Date:   Wed, 8 Jan 2020 15:42:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20200108193634.GA17390@netestate.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On 1/8/20 11:36 AM, Michael Brunnbauer wrote:
> 
> hi
> 
> after upgrading from 4.9.205 to 4.9.208, I get errors on two different
> reiserfs filesystems when doing cp -a (the chown part seems to fail) and
> on other occasions:
> 
>  kernel: REISERFS warning (device sda1): jdm-20004 reiserfs_delete_xattrs: Couldn't delete all xattrs (-95)
> 
>  kernel: REISERFS warning (device sdc1): jdm-20004 reiserfs_delete_xattrs: Couldn't delete all xattrs (-95)
> 
> This behaviour disappeared after a downgrade to 4.9.205.
> 
> I understand there have been changes to the file system code but I'm not
> sure they affect reiserfs, e.g.
> 
>  https://bugzilla.kernel.org/show_bug.cgi?id=205433
> 
> Any Idea?
> 
> Regards,
> 
> Michael Brunnbauer
> 

Looks to me like 4.9.207 contains reiserfs changes.

Adding CC's.

-- 
~Randy

