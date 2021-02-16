Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A903D31CD58
	for <lists+reiserfs-devel@lfdr.de>; Tue, 16 Feb 2021 16:58:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbhBPP5l (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 16 Feb 2021 10:57:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbhBPP5h (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 16 Feb 2021 10:57:37 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF271C061756
        for <reiserfs-devel@vger.kernel.org>; Tue, 16 Feb 2021 07:56:57 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id h17so7767449oih.5
        for <reiserfs-devel@vger.kernel.org>; Tue, 16 Feb 2021 07:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :organization:user-agent:mime-version:content-transfer-encoding;
        bh=I6NuW0fc+nwANoYqf21WbfWaEXZvQBSNDg4ASWjBDTI=;
        b=dZzbUlhOCf3ojyyRwQAXF3poqL6bgbq2lBD7led1Kc6rXOFT/7UVPvpBaoCPYVA4tG
         qYZFbaDjnhJs1ERRvqkXO6o2TgR0Paqu6dN6s24/XdNQmQjIxPTEhpfgkSN/CiZEvKMN
         W/BTLG9MuzUwjQ1Ud8m8mySSibMnuYulldgM2x9H/tEnrHy6MsTT5QkFRJE50pJ7il4j
         JVyCHEILSEGuZVlk9J8RDCwM/ktOFynAof48j8Ic7JtLG5b83CV4RcH3wVIMUnUhQrsS
         8tDWFLQsruBTQhGSc10izb14/QbXLkFbkhq++RINnOPC5IiqsIuuZnfoTgXAgy1qAHsb
         yxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=I6NuW0fc+nwANoYqf21WbfWaEXZvQBSNDg4ASWjBDTI=;
        b=DnVFJq0QvVCGJjGyEWDNgdqKY7DwHmavYCoha4WyeWQHJEZJWaiJ5ptcOIeoVsL+lQ
         SkZSp+XSOujTZxfICrowZPwaZA3Zkm7AuuxRtIRMqwpZ22zngdcWVWGxc8bHGETzFYLh
         Cin1VoxFNjtmyHwQr7MSHNsOzdbbeoX/EjwMD0ZF2qrF3UX51lGdTVUQbabZw4k0LbuL
         iFGf/TZ8v33jFJWcZNEXUF+VuQG6pYsFUn4jtr/Q5Vu4R6ENzFPyZ9C3ZYxZ3TGmRAJ1
         RScrgFqxCFT9e29pcC4bMmaAko4+l1RsIRVej8JyN/cbBoBKe7sFkY4W619f9lGEs4ju
         KWTw==
X-Gm-Message-State: AOAM530HnGF1sRIbPKZUEwtjkQH701tP8+nvI3zRCYjYatLJ+JPwXjzU
        mrqyLyisqXTOodGplN6AEW9xLA==
X-Google-Smtp-Source: ABdhPJw49mEJ664TeJZdPS8HdsQNbXDUW34dwlsQd0q/FdvaRQHnPcscgpHc95aIk7QrILNzngTKew==
X-Received: by 2002:a54:4415:: with SMTP id k21mr2939191oiw.38.1613491016784;
        Tue, 16 Feb 2021 07:56:56 -0800 (PST)
Received: from ?IPv6:2600:1700:6470:27a0:9384:191b:b59:6836? ([2600:1700:6470:27a0:9384:191b:b59:6836])
        by smtp.gmail.com with ESMTPSA id m10sm2834522otp.44.2021.02.16.07.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 07:56:56 -0800 (PST)
Message-ID: <97064703c2016908cebb8f1496d67d9751e21a67.camel@metztli.com>
Subject: Re: [reiser4 SFRN 5.1.3] kernel [5.10.x] read not supported for
 file /test-exec \(pid: 10094 comm: debootstrap\)
From:   Jose R Rodriguez <jose.r.r@metztli.com>
To:     Edward Shishkin <edward.shishkin@gmail.com>
Cc:     reiserfs-devel@vger.kernel.org, hch@lst.de,
        linux-kernel@vger.kernel.org
Date:   Tue, 16 Feb 2021 07:56:54 -0800
In-Reply-To: <e37d5585-318e-3130-82c9-7a740b9af8af@gmail.com>
References: <20210208125427.CFC7C75EED90@huitzilopochtli.metztli-it.com>
         <e37d5585-318e-3130-82c9-7a740b9af8af@gmail.com>
Organization: Metztli Information Technology
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Mon, 2021-02-08 at 17:03 +0100, Edward Shishkin wrote:
> On 02/08/2021 01:54 PM, Metztli Information Technology wrote:
> > On Wed, Dec 23, 2020 at 3:40 PM Edward Shishkin < 
> > edward.shishkin@gmail.com> wrote:
> > > 
> > > On 12/23/2020 05:01 PM, Metztli Information Technology wrote:
> > > > Niltze [Ð—Ð´Ñ€Ð°Ð²Ñ Ñ‚Ð²ÑƒÐ¹Ñ‚Ðµ : Hello], Ed-
> > > > 
> > > > I built Linux kernel 5.10.1-1 within the 'Debian way' -- as
> > > > usual -- to generate a kernel component for my Debian-Installer
> > > > (d-i).
> > > > The patch I applied is reiser4-for-5.10-rc3.patch.gz from v5-
> > > > unstable.
> > > > 
> > > > Once I built the proper reiser4progs-2.0.4.tar.gz and generated
> > > > one set of components for d-i I built the d-i image.
> > > > 
> > > > Fact is, the installer throws an error in *both* bare metal and
> > > > VirtualBox 6.1.16:
> > > > ...
> > > > Dec 22 20:19:56 main-menu[330]: INFO: Menu item 'bootstrap-
> > > > base' selected
> > > > Dec 22 20:19:56 debootstrap: /usr/sbin/debootstrap --
> > > > components=main --debian-installer --resolve-deps --
> > > > keyring=/usr/share/keyrings/archive.gpg buster /target  
> > > > http://deb.debian.org/debian/
> > > > Dec 22 20:19:56 debootstrap: /usr/sbin/debootstrap: line 1596:
> > > > /target/test-exec: Invalid argument
> > > > Dec 22 20:19:56 kernel: [ 1018.632648] kernel read not
> > > > supported for file /test-exec (pid: 10077 comm: debootstrap)
> > > > Dec 22 20:19:56 debootstrap: E: NOEXEC
> > > > Dec 22 20:19:56 debootstrap: EF: Cannot install into target
> > > > '/target' mounted with noexec or nodev
> > > > Dec 22 20:20:12 base-installer: error: exiting on error base-
> > > > installer/debootstrap-failed
> > > > Dec 22 20:20:14 main-menu[330]: WARNING **: Configuring
> > > > 'bootstrap-base' failed with error code 1
> > > > Dec 22 20:20:14 main-menu[330]: WARNING **: Menu item
> > > > 'bootstrap-base' failed.
> > > > Dec 22 20:20:15 main-menu[330]: INFO: Falling back to the
> > > > package description for brltty-udeb
> > > > 
> > > 
> > > [...]
> > > 
> > > > 
> > > > Apparently, d-i [Debian-installer] complains about being unable
> > > > to set the test file executable and causes the error when 1 is
> > > > returned.
> > > > Notwithstanding, I manually verified that I am able to touch a
> > > > file and set it +x executable.
> > > > 
> > > > Furthermore, tricking the function return value to 0 I am able
> > > > to make d-i continue with the latest SFRN5 installation (see
> > > > [*trick*] below); yet, subsequently halts again with
> > > > an apparently related error --can not proceed any further.
> > > > 
> > > > Digging deeper with dmesg, we can see that apparently it is the
> > > > kernel which cannot 'read' properly. Please find a partial
> > > > dmesg log with relevant output
> > > > from an attempt on my physical development machine.
> > > > ...
> > > > [  508.614488] Loading Reiser4 (Software Framework Release:
> > > > 5.1.3). See reiser4.wiki.kernel.org for a description of
> > > > Reiser4.
> > > > [  508.661951] SGI XFS with ACLs, security attributes,
> > > > realtime, quota, no debug enabled
> > > > [  509.326270] device-mapper: uevent: version 1.0.3
> > > > [  509.326505] device-mapper: ioctl: 4.43.0-ioctl (2020-10-01)
> > > > initialised: dm-devel@redhat.com
> > > > [  509.902828]  sda: sda1 sda2 sda3 sda4 sda5 sda6
> > > > [  509.915300]  sdb: sdb1 sdb2 sdb3
> > > > [  511.973360]  sdb: sdb1 sdb2 sdb3
> > > > [  627.525371] Adding 9765884k swap on /dev/sda3.  Priority:-2
> > > > extents:1 across:9765884k FS
> > > > [  636.240812] reiser4[mount(9430)]: reiser4_register_subvol
> > > > (fs/reiser4/init_volume.c:222)[edward-1932]:
> > > > [  636.240812] NOTICE: brick /dev/sda6 has been registered
> > > > [  636.243003] reiser4 (sda6): found disk format 5.1.3.
> > > > [  643.759971] reiser4 (/dev/sda6): using Hybrid Transaction
> > > > Model.
> > > > [  643.759980] reiser4: brick /dev/sda6 activated
> > > > [  643.788537] EXT4-fs (sda1): mounting ext2 file system using
> > > > the ext4 subsystem
> > > > [  643.813474] EXT4-fs (sda1): mounted filesystem without
> > > > journal. Opts: (null)
> > > > [  643.813488] ext2 filesystem being mounted at /target/boot
> > > > supports timestamps until 2038 (0x7fffffff)
> > > > [  648.168730] kernel read not supported for file /test-exec
> > > > (pid: 9876 comm: debootstrap) [*trick*]
> > > > [  898.761385] reiser4: brick /dev/sda6 deactivated
> > > > [  991.001332] reiser4 (sda6): found disk format 5.1.3.
> > > > [  999.093471] reiser4 (/dev/sda6): using Hybrid Transaction
> > > > Model.
> > > > [  999.093480] reiser4: brick /dev/sda6 activated
> > > > [ 1009.340117] EXT4-fs (sda1): mounting ext2 file system using
> > > > the ext4 subsystem
> > > > [ 1009.362722] EXT4-fs (sda1): mounted filesystem without
> > > > journal. Opts: (null)
> > > > [ 1009.362737] ext2 filesystem being mounted at /target/boot
> > > > supports timestamps until 2038 (0x7fffffff)
> > > > [ 6373.748413] kernel read not supported for file /test-exec
> > > > (pid: 10094 comm: debootstrap)
> > > > [ 6413.169920] kernel read not supported for file /usr/bin/true
> > > > (pid: 15960 comm: chroot)
> > > 
> > > 
> > > Hello.
> > > 
> > > This is because of VFS changes in Linux-5.10.X.
> > > Specifically, because of the following patch:
> > > https://lkml.org/lkml/2020/8/17/174
> > > In the upstream git repository it is commit
> > > 4d03e3cc59828c82ee89ea6e2
> > > 
> > > So, Christoph, what to do now for file systems which implement
> > > ->read() method of file operations?
> > 
> > *deafening silence* it appears that -- in the best of cases --
> > Christoph engaged in an act of _iter masturbation [1];
> > and in the worst of cases, the gentleman was aiming straight at
> > reiser4.
> > 
> > > ... It seems that chroot doesn't work
> > > for them. And people are not able to release distros with
> > > upgraded
> > > kernels..
> > 
> > Not only 'chroot doesn't work' for us, but even after replacing the
> > kernel in a reiser4 (proper SFRN ;) instance and
> >   upon an initial Linux 5.10.x kernel boot:
> > ...
> > kernel read not supported for file usr/lib/systemd/systemd (pid: 1
> > comm: run-init)
> > kernel panic -- not syncing: Attempted to kill init!
> > exitcod=0x00000100
> > ...
> > 
> > Fact is some of us have commercial interests when deploying
> > reiser4, both in cloud instances, baremetal, and on-premises.
> > 
> > In the future if -- and only if -- our reiser4 efforts come to
> > successful fruition, quite likely in due time we will be
> >   able to financially commit to the Penguin's Linux Foundation
> > temple, just like large corporations do
> >   in exchange for indulgences[2] which virtue-wash their past
> > and/or current corp. officers' *substantially darker deeds*;
> >   heck, 'indulgence trafficking' seems to assuage->numb->arg(STFU)
> > that 'virtuous' cult of GNU/Linux
> >   developers/gatekeepers/maintainers' frivolous, *narcissist*,
> > ethics and/or moralities so often piled up against
> >   Reiser's work --which, paradoxically(!?), actually was largely
> > implemented by Russian developers ;)
> > 
> > In the meantime, I hacked a reverse patch that undoes some(all) of
> > the surreptitious lethal attack on reiser4 fs
> >   -- at least on AMD64 architectures (I did away with other
> > arch/Kconfigs).
> > And no, I am not a git pro-, undoing what I could of commit
> > 4d03e3cc59828c82ee89ea6e27a2f3cdf95aaadf (as your hinted, Ed)
> >   does not fix the 'kernel read' issue.
> > 
> > Notwithstanding, I would appreciate if you can take a look at the
> > attached patch. Probably it can be streamlined and/or improved
> >   further to minimize pain on subsequent Linux kernel upgrades.
> 
> 
> That patch is an attempt to swim against the current ;)
In a sense all of us who prefer reiser4 do not have a herd mentality.
So, yes, we 'swim against the current', if you will put it in those
terms, because we value data integrity (atomicity).

Notwithstanding, it is only an ephemeral hack for AMD64 architectures.
I have running locally reiser4 -enabled 5.10.13-2, 5.10.14-2, whereas I
have an Google Compute Engine (GCE), on an AMD Epyc (reizer4 label)
zone, custom instance testing with a cloud kernel 5.10.15-2.

< https://metztli.it/buster/cloud-5.10.15-2+reizer4_0_2.png >

Heck, I have updated the reiser4, Software Framework Release Number
(SFRN) 5.1.3, d-i netboot installer media with a test kernel 5.10.16-2
< https://metztli.it/buster-reiser5/5.10.x/metztli-reiser4-sfrn5-ng.iso
>
<
https://metztli.it/buster-reiser5/5.10.x/metztli-reiser4-sfrn5-ng.iso.SHA256SUM
>

... крутые?
> 
> I no longer remember, why they want to get rid of set_fs for already
> 15
> years, but ->read() and ->write() methods seem to be deprecated, and
> the
> correct way would be to implement the new ->read_iter() and
> write_iter()
> methods, where reiser4 works with "chunked" streams, represented by
> iov_iter structure, rather than with "continuous" streams,
> represented
> by char __user *buf. The task is not that difficult, but rather time
> consuming - I don't have a time for this right now..
> 
> Thanks,
> Edward.
> 
> > 
> > The patch has been tested in my local development machine
> > environment --
> >   as I intalled the generated reiser4 -enabled linux 5.10.13/14
> > meta/kernel into a Debian Bullseye already running reiser4 (with
> > proper SFRN)
> >   and the kernel booted nicely. Subsequently, after installing the
> > linux headers, etc. I built a couple of upgraded kernels
> >   in Debian Buster GCC-8 and Bullseye GCC-10 environments -- thus
> > the hack seems to be stable.
> > 
> > Additionally, I have just made a Debian-Installer (d-i) with a
> > 'kernel read' -patched Linux 5.10.14.1 which successfully installed
> >   into a VirtualBox 6.1.18 VM:
> > < 
> > https://metztli.it/buster/reiser4_0_2-linux-5.10.14-kernel-read-patched.png
> >  >
> > 
> > > 
> > > Thanks,
> > > Edward.
> > 
> > Best Professional Regards.
> > 
> > [1]
> > "The bug was fixed, again way back in 2010, and over time chip-
> > designers have moved on to improved memory management techniques.
> > Torvalds wrote that this sort of memory space override has been
> > banished from the x86, powerpc, s390 and RISC-V architectures."
> > < https://www.theregister.com/2020/10/25/linux_5_10_rc1/ >
> > 
> > [2] https://www.britannica.com/topic/indulgence
> > 

Best Professional Regards.

-- 
Jose R R
http://metztli.it
-----------------------------------------------------------------------
Download Metztli Reiser4: Debian Buster w/ Linux 5.9.16 AMD64
-----------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-----------------------------------------------------------------------
or SFRN 5.1.3, Metztli Reiser5 https://sf.net/projects/debian-reiser4/
-----------------------------------------------------------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/

