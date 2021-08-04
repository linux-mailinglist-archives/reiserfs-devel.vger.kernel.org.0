Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 172EC3DFF43
	for <lists+reiserfs-devel@lfdr.de>; Wed,  4 Aug 2021 12:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236649AbhHDKRf (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 4 Aug 2021 06:17:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235066AbhHDKRe (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 4 Aug 2021 06:17:34 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50CDCC061798
        for <reiserfs-devel@vger.kernel.org>; Wed,  4 Aug 2021 03:17:22 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id e14so2223710qkg.3
        for <reiserfs-devel@vger.kernel.org>; Wed, 04 Aug 2021 03:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=BU4gaEXMUC4dk3AbuhMq06nooKvFSA+rLb2MZ4hroZo=;
        b=JHt41geswPE+Gq38BYwP8Wost4DpJFkPEZ5784KofcHmCIRdsk3kDFoRz8rFVc6Dcd
         VFxU9HSR6OYN6b0lbqKUasVMy4/Sdw5ij9PlOdATAl5+g3RwkFFo1pVl7/RSRXDUDbAt
         4Yt50YdQgjqfJe/sa2guBwVDd1vUXzrSq28PiSsqBbiewJWW5OIbMsHzv+ZglMcORSJV
         AeCoNHkdGBM83262X/Zw08ljsBlO65cqYKhyKaF/f+BppiNf6gPyNqFagHd7hHnYiDk8
         Mo49qxLRV+GsIUlWU1UxH3IOgOlI28WynlBoSJ2zuvMOMRUGHkYt6bEwsRbwOAXY/QqH
         jWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=BU4gaEXMUC4dk3AbuhMq06nooKvFSA+rLb2MZ4hroZo=;
        b=X6UF/yIbwzi6WxtFVjAkr/jcXQsobeTCRxOT/Bmwgyn+RDuJoSMCAQQ7Ak7xBzBx9V
         p9QnGFNHt22GCK7p0ldu0s/e20PXj/lVD+IbfXTEtqg2XIoVb/xfNwGXni0phf5Gsx3W
         S0aOJTt79jdug01a7r5QVSmW70UfyX3idv3aORT6QwK3tElmwaVV/2VAQJMBC78zC6I6
         wd12wWSsQOYgbdwGdKFekuaUp+SC0T7pBCoL95AwCGFzavgEV0ZL40XbxEauccbX+lcc
         J3QI0qLQvmIJqTXuCes7ODpPXr52iIdLDfSO+HZYJbxsUsjQyq3yoE4uEKnPsll5FwcG
         TERg==
X-Gm-Message-State: AOAM5331dNYisANedZjE127jwuC4Sg10WeYBPED2+MoOOWl2u2FZLiG8
        0bkJZXA+oOH7fLLWDOYIAzOV8A==
X-Google-Smtp-Source: ABdhPJy6hwyyqIlltJpn+cBQ8x8SrdTlBIQ92vzycg/+F4OGNn35/K7Mmg5iMpf08LQB7MyzboNv/g==
X-Received: by 2002:a37:2d04:: with SMTP id t4mr25081661qkh.463.1628072241418;
        Wed, 04 Aug 2021 03:17:21 -0700 (PDT)
Received: from ?IPv6:2600:1700:6470:27a0:4e80:93ff:fe00:3ff7? ([2600:1700:6470:27a0:4e80:93ff:fe00:3ff7])
        by smtp.gmail.com with ESMTPSA id w5sm683795qtv.3.2021.08.04.03.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 03:17:20 -0700 (PDT)
Message-ID: <ef36436b5889fd1b7b545a56f196400f16e2e4d3.camel@metztli.com>
Subject: Re: [reiser4 SFRN 5.1.3] kernel [5.10.x] read not supported for
 file /test-exec \(pid: 10094 comm: debootstrap\)
From:   Metztli Information Technology <jose.r.r@metztli.com>
To:     Edward Shishkin <edward.shishkin@gmail.com>
Cc:     reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
Date:   Wed, 04 Aug 2021 03:17:18 -0700
In-Reply-To: <e37d5585-318e-3130-82c9-7a740b9af8af@gmail.com>
References: <20210208125427.CFC7C75EED90@huitzilopochtli.metztli-it.com>
         <e37d5585-318e-3130-82c9-7a740b9af8af@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Mon, 2021-02-08 at 17:03 +0100, Edward Shishkin wrote:
> On 02/08/2021 01:54 PM, Metztli Information Technology wrote:
> > On Wed, Dec 23, 2020 at 3:40 PM Edward Shishkin
> > <edward.shishkin@gmail.com> wrote:
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

On Sun, Jun 20, 2021 at 10:45 AM Edward Shishkin
<edward.shishkin@gmail.com> wrote:
   So, I have implemented ->read_iter() for all plugins (*). It is
   included
   to reiser4-for-5.12 stuff. Not sure if it is enough to make distro with
   root over reiser4 though: ->write_iter() is not yet implemented (not so
   trivial because of transactions).
   
   (*)
   https://github.com/edward6/reiser4/commit/ac72aba7e8bb16a28755c1b2b762971927d17c3c
   
   https://github.com/edward6/reiser4/commit/4d3200fbcb2003c680cdb822e3f616d3fa83c391
   
   Edward.
   
You updated reiser4 patch implementation enables the reiser4 Debian
Installer (d-i) to proceed with the installation into a reiser4 root fs
disk media, Sir, much appreciated.

< https://metztli.it/bullseye/netboot-ng/metztli-reiser4.iso >
< https://metztli.it/bullseye/netboot-ng/metztli-reiser4.iso.SHA256SUM
>

Took me a while because there is no Debian packaging for the Linux
kernel 5.12, i.e., the Debian kernel package maintainers/developers'
last package is for 5.10.46-zt and then they skipped 5.11 and 5.12 to
begin experimenting with packaging for 5.13.xy-zt. I had to come up
with a crude hack -- based on inductive reasoning -- to combine patches
from those two packaging extremes and thus test if your patch actually
solved the installation issue.

Apropos, I have been running that reiser4 linux 5.12.19 EOL build
locally, as well, for a couple of days without apparent issues thus
far.
< https://metztli.it/bullseye/tezcatlipoca.jpg >


Best Professional Regards.


-- 
-- 
Jose R R
http://metztli.it
-----------------------------------------------------------------------
----------------------
Download Metztli Reiser4: Debian Buster w/ Linux 5.10.26 AMD64
-----------------------------------------------------------------------
----------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-----------------------------------------------------------------------
----------------------
or SFRN 5.1.3, Metztli Reiser5 https://sf.net/projects/debian-reiser4/
-----------------------------------------------------------------------
--------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/


