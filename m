Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0908A348898
	for <lists+reiserfs-devel@lfdr.de>; Thu, 25 Mar 2021 06:39:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbhCYFiz (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 25 Mar 2021 01:38:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbhCYFig (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 25 Mar 2021 01:38:36 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A99EC06174A
        for <reiserfs-devel@vger.kernel.org>; Wed, 24 Mar 2021 22:38:36 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id i19so875665qtv.7
        for <reiserfs-devel@vger.kernel.org>; Wed, 24 Mar 2021 22:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=nAGyZ2In7VszTwOnMrhSva5040ZhpZIx3Cx/fJu9Cmg=;
        b=kIX2x9hY9GxzR7Wsg/XYHZPej3XO+zlKqiZ8X7cXdoQnuiJAkvJ4JhpQqQ4hdVQmy/
         KzdZga8TKpl8dhYjA5S6ScTByzWLBfP3hQj4tjrXUdYSlx66KU2Iw2EjGRub/oWQIWGd
         vt2lqD1vsZVKubY9nQ1RYNVoBZVgMeGt45LFguGt0jRKJgNL9W2juDlq3uje26grGoKF
         OKvN1+/wzOJheHHtPIQg67Bq8271axNXmEoIAbThrkypSjvwztSs1VMUzi/LlcjLvPn1
         apOOSZ+4HSx7F12MpDxLhqkuzSo0U9bQvvqV5s4G/8JjiNzX5JDaPtcpp0lc60d3HKVe
         uhOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=nAGyZ2In7VszTwOnMrhSva5040ZhpZIx3Cx/fJu9Cmg=;
        b=klg48rbDGRwja8RWFNhpTLt9DEjwu2HW6kQLehDPrUmHM2w0DAmJJt5V8Iy8z8jJcg
         giG1CmWIGui7Omd4Z4V9y+manVg07wg8IQVZYbpSpV8K0m0NaImNahIszHec1HchRigQ
         i60bomE6Bwv4uYv9LBTnyHu3ZFAvmHBA4vyAWnaCg3Q5p5u5BlZ48sg42WtdMQ0Yjcc+
         OwMi4rsZGSX4fqlqpq+NGyIS6Pt5FlQCLSRtgiTqSpFTOG9DAeAvyt/HMdqtguNX2KKc
         ZE6tj9m1F9dHfUYvWb4jjVbLw3fQZghjUcNq9OVp+Fb2XL8RgiWmuXlqFaBi6QfBwWOl
         9IJw==
X-Gm-Message-State: AOAM532qsxqbcl9GINlFLlvyArdHsOFa5p3WVfcyKrF+hI/LJiJ2njwo
        r47KZYDDl47yeHjrw83qoaYmEg==
X-Google-Smtp-Source: ABdhPJxzv29tMqaJPEIBKLH6blbNrRt4pn5aGuUPqIWIdAn9bjETVrcZ1k+/UJjlvSRG25OSkV3nUQ==
X-Received: by 2002:ac8:519a:: with SMTP id c26mr6149145qtn.342.1616650715250;
        Wed, 24 Mar 2021 22:38:35 -0700 (PDT)
Received: from ?IPv6:2600:1700:6470:27a0:4e80:93ff:fe00:3ff7? ([2600:1700:6470:27a0:4e80:93ff:fe00:3ff7])
        by smtp.gmail.com with ESMTPSA id 19sm3337249qkv.95.2021.03.24.22.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 22:38:34 -0700 (PDT)
Message-ID: <3502816731a314939e4dc04edd5c1ce2744bda11.camel@metztli.com>
Subject: Re: Making a test version of Bullseye as a GCE image available?
From:   Metztli Information Technology <jose.r.r@metztli.com>
To:     Theodore Ts'o <tytso@mit.edu>, debian-cloud@lists.debian.org
Cc:     Edward Shishkin <edward.shishkin@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Date:   Wed, 24 Mar 2021 22:38:33 -0700
In-Reply-To: <YFjZS8DsVQQeE5Ov@mit.edu>
References: <YFjZS8DsVQQeE5Ov@mit.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Niltze [Hello]-

On Mon, 2021-03-22 at 13:52 -0400, Theodore Ts'o wrote:
> Hey, now that we've hit hard freeze for Bullseye, I was hoping that
> perhaps we could start making a GCE image for Debian-11 availble?
> 
> For Debian 10, a few months before it was released, there was a test
> image that was made available in the debian-cloud-testing project:
> 
> % gcloud compute images --project debian-cloud-testing list --no-
> standard-images
> NAME                        PROJECT               FAMILY     
> DEPRECATED  STATUS
> debian-10-buster-v20191205  debian-cloud-testing  debian-
> 10               READY
> debian-sid-v20190812        debian-cloud-testing  debian-
> sid              READY
> 
> Perhaps it would make sense to make an image for Bullseye in
> debian-cloud-testing, so it doesn't accidentally get picked up and
> used in production environments before Bullseye gets released as
> Debian Stable?
> 
> I've never built a GCE image from scratch before, but if someone
> wants
> to point me at the instructions, I'm happy to give it a try,
You may want to refer to GCE documentation:
< https://cloud.google.com/compute/docs/images/building-custom-os >

And for the Linux guest tools:
<
https://cloud.google.com/compute/docs/images/install-guest-environment
>

Note, however, that when I built reiser4 SFRN 4 -enabled 5.10.23 kernel
for Debian 11 Bullseye a few days ago, I had to use the guest
environment for Debian 10 Buster since there was not even a repo for
bullseye 
< https://github.com/GoogleCloudPlatform/compute-image-packages > to
include in /etc/apt/sources.list.d/google-cloud.list

So it seems your request cought the GCE developers, essentially, 'with
their pants down' since -- as of today, at least -- there is only an
empty Google Bullseye repo on their side.

Notwithstanding, the Buster Linux env. was enough for my Bullseye
Debian Reiser -enhanced image for PoC/testing. If you care to give it a
spin, you may import the TARred file to create your own image -- from
which to generate your own GCE instances -- with a suggestion like
this:
gcloud compute images create reiser4-bullseye-v20210325 --
family="debian-11-reiser4" --source-uri
g://metztli.it/bullseye_disk_raw.tar.gz

After a successful reference image creation, your may spin up your
instance(s), with similar as:
gcloud compute instances create [instance-name] --custom-cpu=[X] --
custom-memory=[Y]GB --metadata-from-file startup-script=./reghostkey.sh
--tags [your tag] --image reiser4-bullseye-v20210325 --boot-disk-
size=200GB  --zone [your-preferred-zone]

where ./reghostkey.sh contains something like:
------------------------------
#! /bin/bash
# Regenerates deleted host keys upon Bullseye GCE image first boot
sudo su -
apt-get update
dpkg-reconfigure --frontend=noninteractive openssh-server
##/etc/init.d/ssh restart
systemctl try-reload-or-restart ssh
-----------------------------------------

and the boot image size is 200GB -- indeed, we do not have resizing
feature at the moment. I operate with that minimum Google -recommended
disk storage capacity when possible.

The GPT hybrid boot image was modified with Gdisk utility and it boots
from JFS /boot, has a ~3Gig swap, and the rest is reiser4 SFRN 4.0.2 -
formatted. A seven(7) minute overview may be found at either of these
two links:

< https://youtu.be/WvieIZNH8KM >

< https://metztli.blog/amatl/aS4 >


As for building your own images, you may start with these excellent
bare-bones instructions in this video by a Google dame engineer:
'How to build a custom image for Compute Engine'
< https://youtu.be/YlcR6ZLebTM >

>  and would
> be willing to help with updating the debian-cloud-testing project.
> 
> Thanks!!
> 
>                                         - Ted
> 

Best Professional Regards.

P.S. Someone tell Mr. Andrew Morton that it is time for him to update
his reiser4 Linux source tree hack to version 5.10.x -- as that
statement "is so 2006":
'more speculative things which aren't intended for mainline in the
short-term, such as new filesystems (eg #reiser4).'

<
https://www.networkworld.com/article/2280848/kernel-space--interview-with-andrew-morton.html
>

-- 
-- 
Jose R R
http://metztli.it
-----------------------------------------------------------------------
----------------------
Download Metztli Reiser4: Debian Buster w/ Linux 5.9.16 AMD64
-----------------------------------------------------------------------
----------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-----------------------------------------------------------------------
----------------------
or SFRN 5.1.3, Metztli Reiser5 https://sf.net/projects/debian-reiser4/
-----------------------------------------------------------------------
--------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/


