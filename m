Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36C1A256C74
	for <lists+reiserfs-devel@lfdr.de>; Sun, 30 Aug 2020 09:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbgH3HEs (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sun, 30 Aug 2020 03:04:48 -0400
Received: from mail7.static.mailgun.info ([104.130.122.7]:47400 "EHLO
        mail7.static.mailgun.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726201AbgH3HEr (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 30 Aug 2020 03:04:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1598771085; h=From: Date: Message-Id: To: Subject: Sender;
 bh=RKlOvLy0FhCW9JvWrJl/c2N/eBgziZDhPlr2MnVbGCw=; b=IvfvFd896et1ROshqyj4ESWl6o9x3H+L73G0WsQyS1ofnkDFIIJ8E1Lehv6joFbjwRJrNcWL
 GV4ffnUgdyZ4eCRY5KNHXnoQnXvJSYKHWbq1mHg0s9tWVSiqNP5Y8zxBJr3xcfP9lAXFJQ4T
 Uc6i/f67QdEgeyISI3/AoPefdQo=
X-Mailgun-Sending-Ip: 104.130.122.7
X-Mailgun-Sid: WyIxM2M2YSIsICJyZWlzZXJmcy1kZXZlbEB2Z2VyLmtlcm5lbC5vcmciLCAiMTdiNTQiXQ==
Received: from huitzilopochtli.metztli-it.com
 (99-130-254-3.lightspeed.sntcca.sbcglobal.net [99.130.254.3]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f4b4f8d12acec35e2018f3d (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Sun, 30 Aug 2020 07:04:45 GMT
Received: by huitzilopochtli.metztli-it.com (Postfix, from userid 1000)
        id A2FE96902BB7; Sun, 30 Aug 2020 00:04:43 -0700 (PDT)
Subject: Re: [ANNOUNCE] Reiser5: Selective File Migration - User Interface
To:     <edward.shishkin@gmail.com>, <reiserfs-devel@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: mail (GNU Mailutils 3.9)
Message-Id: <20200830070443.A2FE96902BB7@huitzilopochtli.metztli-it.com>
Date:   Sun, 30 Aug 2020 00:04:43 -0700 (PDT)
From:   Metztli Information Technology <jose.r.r@metztli.com>
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Sat, Aug 29, 2020 at 2:54 AM Edward Shishkin <edward.shishkin@gmail.com> wrote:
>
> On 08/28/2020 01:50 AM, Edward Shishkin wrote:
> >
> >
> > On 08/27/2020 11:53 PM, Metztli Information Technology wrote:
> >> On Wed, Aug 26, 2020 at 2:13 PM Edward Shishkin
> >> <edward.shishkin@gmail.com> wrote:
> >>>
> >>> [...]
> >>>
> >>>>
> >>>> FYI Although not officially, the Debian metaframework Buster AMD64
> >>>> distribution might be the first to support native installation of
> >>>> Reiser4 SFRN 5.1.3, kernel and reiser4progs 2.0.3, file system
> >>>> utilities.
> >>>>
> >>>> I have already made a couple of successful Metztli Reiser4 SFRN 5
> >>>> native installations onto ~100 GB slices, which root file system is
> >>>> formatted in 'Reiser5' and 1 GB /boot in JFS.
> >>>> https://metztli.it/reiser5 (Screenshot 600x338 size)
> >>>>
> >>>> The upgraded netboot installation media metztli-reiser4-sfrn5.iso is
> >>>> available at:
> >>>> https://sourceforge.net/projects/debian-reiser4/
> >>>> as well as
> >>>> https://metztli.it/buster-reiser5/metztli-reiser4-sfrn5.iso
> >>>> https://metztli.it/buster-reiser5/metztli-reiser4-sfrn5.iso.SHA256SUM
> >>>>
> >>>> Likely the brick/volume feature(s) will be useful in Cloud fabric
> >>>> infrastructures, like Google's, where reiser4 excels.
> >>>>
> >>>> The current SFRN 5.1.3 -patched Zstd -compressed kernel in the
> >>>> installation media is Debian's 5.7.10.
> >>>
> >>>
> >>> wow, reiser5 from the box? I might want to try..
> >> Well, it is more of a 'reference implementation' as there are persons
> >> who reached out to me because their builds succeeded, they were able
> >> to format in reiser4 SFRN x.y.z, but they were not able to mount their
> >> partition(s).
> >> Turns out, they were inadvertently mixing SFRN 4.0.2 with 5.1.3,
> >> either in the reiser4 kernel patch -- released with the same in both
> >> instances -- or in the reiser4progs.
> >
> >
> > Yeah, some confusion can take place. Plus unsupported old 4.0.2
> > volumes (a special build with CONFIG_REISER4_OLD=y is required to
> > mount them), which is a payment for performance.
> >
> >
> >>
> >>>
> >>>>
> >>>> The installer defaults to create the root system reiser5 -formatted
> >>>> partition as:
> >>>> mkfs.reiser4 -yo "create=reg42"
> >>>
> >>>
> >>> "reg42" is default profile in reiser4progs-2.0.3 (check by
> >>> "mkfs.reiser4 -p") - there is no need to specify it via option.
> >> Acknowledged. Thanks.
> >>
> >>>
> >>> Have you had a chance to play with logical volumes (add/remove
> >>> bricks, etc)?
> >> That is coming up. I still have to create/customize an image of
> >> Metztli Reiser4 SFRN5 for a Google Compute Engine (GCE) minimal ~200GB
> >> instance for evaluation.
> >> Fact is 'not all clouds are created equal' -- even if KVM -based. For
> >> instance, reiser4 SFRN 4.0.2 on a trial Linode small ~80GB SSD
> >> slice(s) with 2 virtual cpus frequently hung under short sustained
> >> disk/network I/O usage.
> >> I have not experienced that with reiser4 SFRN 4.0.2 on GCE -- where
> >> sometimes I allocate eight to sixteen virtual cpus with 16, 32, or
> >> even 64, GBs of RAM, on a region hosting AMD Epyc, for fast kernel
> >> building ops.
> >>
> >> But testing a relatively small bootable image first will usually
> >> provide insight if adding one, two... eight, TB slices will make sense
> >> later on.
> >
> >
> > I played with your media on a virtual machine. The basic volume
> > operations work, however, I guess, adding brick(s) to "/" will cause
> > problems at next boot: someone has to register all the bricks before
> > mounting "/"...
>
>
> It is important to register all bricks *before* mounting "/", as the
> registration procedure collects information need for volume activation
> (including transaction replay, etc).
>
> So at boot time before mounting "/" we need to scan the system and for
> each found block device call a brick registration procedure. The problem
> is that I don't know what do we actually have before mounting "/".
>
> Brick registration can be performed by calling "volume.reiser4 -g".
> However, it accepts device name, that we obviously don't have, as all
> the names are in "/", which is not yet mounted.
>
> I guess that solution exists (and possibly locates in initrd), because,
> it is perfectly possible to boot e.g. with root over LVM (a special
> utility scans the system and collects information about devices-
> components of the logical volume). Any ideas?
man initramfs-tools

Under debian there are: 
/etc/initramfs-tools/hooks/
/usr/share/initramfs-tools/hooks/

Observing the latter, we can see that it contains executable scripts for reiserfs, lvm2, etc.; hence, every time an
update-initramfs command is performed to create/update an initrd.img-`uname -r` these scripts are bundled into the initrd image.

An executable script, i.e., named reiser5, might also be added to perform the 'brick registration procedure', then subsequently running
update-initramfs for its inclusion into the initrd image.

>
> Thanks,
> Edward.

Best Professional Regards


-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Buster w/ Linux 5.7.10 AMD64
---------------------------------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-------------------------------------------------------------------------------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/
