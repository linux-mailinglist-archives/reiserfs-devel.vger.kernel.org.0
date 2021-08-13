Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 542833EB939
	for <lists+reiserfs-devel@lfdr.de>; Fri, 13 Aug 2021 17:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242562AbhHMP0M (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 13 Aug 2021 11:26:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243608AbhHMPYb (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 13 Aug 2021 11:24:31 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4B70C0613A4
        for <reiserfs-devel@vger.kernel.org>; Fri, 13 Aug 2021 08:20:08 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id w10so8527574qtj.3
        for <reiserfs-devel@vger.kernel.org>; Fri, 13 Aug 2021 08:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=gJTQPe82ol2Y2TFU2cBPWUy+VdEbYpoVUQKUyB1Hzq8=;
        b=woW/vHNHHNJ79tr32hXJugdwUbdUtMUQLjgy8lpO+8EpabQofYFHWxui3lv442GlAe
         BnEDksye9hb3YLdk0VCewpeYNFSfMX9YvUVQ0+xP/RFBI4o2mdZ7UFgfifrhZrlH/thy
         45xzTgG9se/HdGrSeoFDh3IOxnnZR203ebV6+Cwm1JZ1gY7hXQlsHhQ/cmF38heiokuw
         0vFI6rBMyf5sNOpypOxlVVDeUVYpR+8/T6aUQjqXg5U2VTUbhHVlGD+hJfDpnuCfRSMv
         sLBC7ogl+3XH3wc70MLs3qiRz840ktRANWaCVPkgCi7yRpA2+wwmTn9LseNctTJgri7e
         3Rsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=gJTQPe82ol2Y2TFU2cBPWUy+VdEbYpoVUQKUyB1Hzq8=;
        b=aEsV462vK0dxyRnd99WtKu6W5SgBL8HRrnAoaljuWFyWsNPsJPoHV6qhh1ty2oTP3l
         vBowiDeqwQZIIWQt3GK855dgsc+urA1T+xMJ/WdDzL2VI3Re28DCrvOUvwjGseex9miw
         tJQAuzRN5hT9VkIxFTL93xBkdKjCcU5QqvgvgaGqBLE8b2PIi3ZiJnuY3JvJ+XQOhGXz
         o+EzE242s5eNp2PuubNZtB82ud4TV/WtplCRfCexKahtWZB558wclbL4OKKkHD9nyTGf
         DOmq0ZtV04jIMbIVrVpUdeE7931lXNTpjZMswOq4QbAYKFj5pzHnCM+WT55csHouQSZw
         uSyg==
X-Gm-Message-State: AOAM532twryurK0r2oMU4jxJYlyxPxHhryim/nLC8SvTK1twQgI9LTrZ
        36pwgAtOX3cb4MK1dEQygSV3hg==
X-Google-Smtp-Source: ABdhPJzsK6Dwz9gzAPHOWMJlhusctbRSwtuHs1Y+Kwfx6+BcF9uW8tYq5dIMcnk+AszYmvLK1aVblA==
X-Received: by 2002:ac8:5ac6:: with SMTP id d6mr2441190qtd.261.1628868007694;
        Fri, 13 Aug 2021 08:20:07 -0700 (PDT)
Received: from ?IPv6:2600:1700:6470:27a0:4e80:93ff:fe00:3ff7? ([2600:1700:6470:27a0:4e80:93ff:fe00:3ff7])
        by smtp.gmail.com with ESMTPSA id s185sm1123454qkd.2.2021.08.13.08.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 08:20:06 -0700 (PDT)
Message-ID: <d85555853f76b7f46ce3b7514d2890091b304c12.camel@metztli.com>
Subject: Re: [reiser4 SFRN 5.1.3] kernel [5.10.x] read not supported for
 file /test-exec \(pid: 10094 comm: debootstrap\)
From:   Metztli Information Technology <jose.r.r@metztli.com>
To:     Edward Shishkin <edward.shishkin@gmail.com>
Cc:     reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
Date:   Fri, 13 Aug 2021 08:20:04 -0700
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
      
   Your updated reiser4 patch implementation enables the reiser4 Debian
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
   
   
Niltze, Ed-

I finally got around to creating an SFRN 5.1.3 -enabled Debian
Installer (d-i) for upcoming Debian 11 (codenamed Bullseye). Applied
your unstable reiser4 for 5.12 patch onto my debianized hack packaging
for Linux kernel 5.12.19 EOL.

I gave the d-i a spin in VirtualBox 6.1.26 and it choked on the
following code fragment:
---------------------------------------------------------------------
setup_dev_linux () {
        # Ensure static device nodes created during install are
preserved
        # Tests in MAKEDEV require this is done in the D-I environment
        mkdir -p /dev/.static/dev
        chmod 700 /dev/.static/
        mount --bind /target/dev /dev/.static/dev
        # Mirror device nodes in D-I environment to target
        mount --bind /dev /target/dev/
}
-----------------------------------------------------------------------

specifically:
mount --bind /target/dev /dev/.static/dev

See relevant code fragment next to VirtualBox VM, where I manually
entered the above directive:
< https://metztli.it/bullseye-reiser5/d-i-sfrn5-fail.jpg >

i.e., '--bind' is causing the SFRN5 -enabled installer to bail out
*only* for this reiser4 unstable SFRN 5.1.3 -patched kernel. On the
other hand, as reported previously, no such issue occurs with your
reiser4 stable SFRN 4.0.2 patch applied to the *same* debianized kernel
source tree, Ed.


Best Professional Regards.

-- 
-- 
Jose R R
http://metztli.it
-----------------------------------------------------------------------
----------------------
Download Metztli Reiser4: Debian Buster w/ Linux 5.9.26 AMD64
-----------------------------------------------------------------------
----------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-----------------------------------------------------------------------
----------------------
or SFRN 5.1.3, Metztli Reiser5 https://sf.net/projects/debian-reiser4/
-----------------------------------------------------------------------
--------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/


