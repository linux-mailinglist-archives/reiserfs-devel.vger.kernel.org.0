Return-Path: <reiserfs-devel+bounces-129-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB698FBC43
	for <lists+reiserfs-devel@lfdr.de>; Tue,  4 Jun 2024 21:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AA101F23448
	for <lists+reiserfs-devel@lfdr.de>; Tue,  4 Jun 2024 19:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9706014B064;
	Tue,  4 Jun 2024 19:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XX0Ajj3Y"
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A6014AD2E
	for <reiserfs-devel@vger.kernel.org>; Tue,  4 Jun 2024 19:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717528241; cv=none; b=KDk85qmxoq+Ynm7/uwX/4+xrpjWokoIpVYDwa/vH8ZIqbpFZ7b+2swKKNTYPzEo6Jlqm5GgUopzHwYXx2j4sXJaW99OA1av/vwMeySx4pi0rUgvBEwXzGldp/1XZcNCKJog1LpGbxdl5wJaP61p2zBqErRo3wiEEbF7botVpsYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717528241; c=relaxed/simple;
	bh=6WRhNvMputCmUE8KuRCNypytBhygsDlUsvmXPlqiqT8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=MGSo1gBXTvNitxatG0BqisP8ZIVBj6DBHa/IOP0qU+UB4t91cpXHIFcAqTHvje6Dk1I6lKU6I2GuEnkYkTWPeuUch0hjHS8V+RMZWf06puxw8EJh/1vycbQgiHmsiPURvjjmFx3G7NwC4/ma6ClzZkvCWU4e7nMWPwTC2SB5Yao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XX0Ajj3Y; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-57a033c2e9fso7760759a12.2
        for <reiserfs-devel@vger.kernel.org>; Tue, 04 Jun 2024 12:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717528238; x=1718133038; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uzA8SRe4whRjxMfh3T9fimsp/JqPLwi91HrTpjRxV+U=;
        b=XX0Ajj3Y+1AZObqOfPb18cGyraQBDDLO2XIlAPS8Ly83mZMEaDukTwLl+9+4GwpKd2
         THP7pT7DLRfk9UqrlX/fGSI5cZPLFm8D0w5CUdEI3pYebM+h81FoVigV9m2nEfYj4kRC
         TonahQMlIiCAWbop+xMV9g639FTHM0BNlMfdtUrRWitQi6eLhlCZAtRVbPilZLWl0auA
         8h2mQJGO7Hs2apj6epMapIMzjz6YH5eOzwmLsxZKClVONJ1f6gxRaW+EvpI+QRaIfMhz
         7XZQpiWfGApQyh6Jx4J7T+OGwblLT6XKCE2SpIvVkKV0X1DWJhFjGQN7d0Qx/HnXjWz+
         qRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717528238; x=1718133038;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uzA8SRe4whRjxMfh3T9fimsp/JqPLwi91HrTpjRxV+U=;
        b=c1isPEPI0d9HjE3LIL5lfLO+bQ1VBA4FPAexdHYtP3za7sCPHw+LfofAs3p7mCmMFO
         gU/UtZT3WyHqXf0sPFbTlz6QiJIgxVHVVS1iryDtfjLW8P7lea7Y+Onedv1DqWmVA1wU
         LsRVRhkyKUN7jp1DToSRAzPL3/NqSM5/7OXEwt2r4dNnsEGiNzj1qUABYWejbmtapOUi
         arvQaz1YeCjrQrxhUUduBldyoVfDF9xke0dRbP4aunWg0JXU9auwdhutjyP/3NSPdm7i
         LcAFvjaaGR2hqsMri5UT7xBrAVcd2f8kd5P9w/xY5mrjnQr1LaHwSmajN8gBsBuuez4+
         8JCw==
X-Forwarded-Encrypted: i=1; AJvYcCUKArPFrNE7OcSvTCteoYSsxW0Vk8JQVUnOrP1PZFJ7VrQ8SOEC5k/QE/nNeRDLfwqGapDJDncWJrebMbYhsZ3T9VsCA6c64inEwhEh/EM=
X-Gm-Message-State: AOJu0YwqjhgQFD4S3pIWjVFcUGsOEf+upnE/hyR6y/5vqNCM6sQhU//j
	jhqlwgsyEUsLyppd0bjpPeBg6XJFeJrJNuFPkj1FeV6l/xr0add+sGWlU7AnqyQ=
X-Google-Smtp-Source: AGHT+IGlsLGfRHK0f6DmqF44S64KIFY4M3R+3mRgGUK5rWCZG7z77L7iKZ+bC3jDwWK1rj3XV48eRQ==
X-Received: by 2002:a50:d4db:0:b0:57a:242e:806b with SMTP id 4fb4d7f45d1cf-57a8b6acd8emr362804a12.18.1717528237801;
        Tue, 04 Jun 2024 12:10:37 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31bb825esm7847800a12.32.2024.06.04.12.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 12:10:37 -0700 (PDT)
Date: Tue, 4 Jun 2024 22:10:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Hyeonwoo Cha <chw1119@hanyang.ac.kr>,
	david.sterba@suse.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, aivazian.tigran@gmail.com,
	viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz,
	tytso@mit.edu, adilger.kernel@dilger.ca,
	hirofumi@mail.parknet.co.jp, sfr@canb.auug.org.au,
	chw1119@hanyang.ac.kr, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-ext4@vger.kernel.org,
	reiserfs-devel@vger.kernel.org
Subject: Re: [PATCH v2] Fix issue in mark_buffer_dirty_inode
Message-ID: <97ac9280-4c7b-4466-9cb8-2a81882f0b80@moroto.mountain>
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604060636.87652-1-chw1119@hanyang.ac.kr>

Hi Hyeonwoo,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hyeonwoo-Cha/Fix-issue-in-mark_buffer_dirty_inode/20240604-140958
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20240604060636.87652-1-chw1119%40hanyang.ac.kr
patch subject: [PATCH v2] Fix issue in mark_buffer_dirty_inode
config: i386-randconfig-141-20240604 (https://download.01.org/0day-ci/archive/20240605/202406050218.U7c0DL3C-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406050218.U7c0DL3C-lkp@intel.com/

smatch warnings:
fs/buffer.c:673 mark_buffer_dirty_fsync() warn: if statement not indented
fs/buffer.c:682 mark_buffer_dirty_fsync() warn: inconsistent indenting

vim +673 fs/buffer.c

73295b4ed00de6 Hyeonwoo Cha            2024-06-04  667  void mark_buffer_dirty_fsync(struct buffer_head *bh, struct address_space *mapping)
^1da177e4c3f41 Linus Torvalds          2005-04-16  668  {
abc8a8a2c7dc7b Matthew Wilcox (Oracle  2022-12-15  669) 	struct address_space *buffer_mapping = bh->b_folio->mapping;
^1da177e4c3f41 Linus Torvalds          2005-04-16  670  
^1da177e4c3f41 Linus Torvalds          2005-04-16  671  	mark_buffer_dirty(bh);
73295b4ed00de6 Hyeonwoo Cha            2024-06-04  672  
73295b4ed00de6 Hyeonwoo Cha            2024-06-04 @673  	if (bh->b_assoc_map)
73295b4ed00de6 Hyeonwoo Cha            2024-06-04  674          return;

The code is okay, but the indenting is messed up.

73295b4ed00de6 Hyeonwoo Cha            2024-06-04  675  
600f111ef51dc2 Matthew Wilcox (Oracle  2023-11-17  676) 	if (!mapping->i_private_data) {
600f111ef51dc2 Matthew Wilcox (Oracle  2023-11-17  677)     	mapping->i_private_data = buffer_mapping;
^1da177e4c3f41 Linus Torvalds          2005-04-16  678      } else {
600f111ef51dc2 Matthew Wilcox (Oracle  2023-11-17  679)         BUG_ON(mapping->i_private_data != buffer_mapping);
^1da177e4c3f41 Linus Torvalds          2005-04-16  680      }
73295b4ed00de6 Hyeonwoo Cha            2024-06-04  681  
600f111ef51dc2 Matthew Wilcox (Oracle  2023-11-17 @682)     spin_lock(&buffer_mapping->i_private_lock);
73295b4ed00de6 Hyeonwoo Cha            2024-06-04  683      list_move_tail(&bh->b_assoc_buffers, &mapping->i_private_list);
58ff407bee5a55 Jan Kara                2006-10-17  684      bh->b_assoc_map = mapping;
600f111ef51dc2 Matthew Wilcox (Oracle  2023-11-17  685)     spin_unlock(&buffer_mapping->i_private_lock);
^1da177e4c3f41 Linus Torvalds          2005-04-16  686  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


