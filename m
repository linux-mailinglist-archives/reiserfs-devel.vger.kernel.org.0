Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83BA7253964
	for <lists+reiserfs-devel@lfdr.de>; Wed, 26 Aug 2020 22:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbgHZUwh (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 26 Aug 2020 16:52:37 -0400
Received: from mail7.static.mailgun.info ([104.130.122.7]:39588 "EHLO
        mail7.static.mailgun.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726753AbgHZUwg (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 26 Aug 2020 16:52:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1598475154; h=From: Date: Message-Id: To: Subject: Sender;
 bh=4mM7lZI0WJB8/HIQLK95PAbDBu1JGlWchh8x/AU54+s=; b=aQqBAutC+TAftlVcTvRK3/AeSWF5Tzdq2tWBvWt2zz49fCcMkcP7SIxTFT1KDlXndE6vD827
 lCygwftsK/iud3LDzuu63hiqH4PZCjv5FeEeXRoEUJ/Qy52r/q4INSk/Cy+s/iiJhiq/sCpL
 QdbwUpWyUsa5wTe2n4ld+U4JZtk=
X-Mailgun-Sending-Ip: 104.130.122.7
X-Mailgun-Sid: WyIxM2M2YSIsICJyZWlzZXJmcy1kZXZlbEB2Z2VyLmtlcm5lbC5vcmciLCAiMTdiNTQiXQ==
Received: from huitzilopochtli.metztli-it.com
 (99-130-254-3.lightspeed.sntcca.sbcglobal.net [99.130.254.3]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f46cb82e82a078aef5d5182 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Wed, 26 Aug 2020 20:52:18 GMT
Received: by huitzilopochtli.metztli-it.com (Postfix, from userid 1000)
        id 07BC868EF679; Wed, 26 Aug 2020 13:52:15 -0700 (PDT)
Subject: Re: [ANNOUNCE] Reiser5: Selective File Migration - User Interface
To:     <edward.shishkin@gmail.com>, <reiserfs-devel@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: mail (GNU Mailutils 3.9)
Message-Id: <20200826205216.07BC868EF679@huitzilopochtli.metztli-it.com>
Date:   Wed, 26 Aug 2020 13:52:15 -0700 (PDT)
From:   Metztli Information Technology <jose.r.r@metztli.com>
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Sun, Jul 5, 2020 at 4:13 AM Edward Shishkin <edward.shishkin@gmail.com> wrote:
>
>
>
>                    Reiser5: selective file migration.
>                 Setting/clearing file "immobile" status
>
>
> Earlier any migration of data blocks in reiser5 logical volumes
> occurred only in the context of some volume balancing procedure, which
> actually is a massive migration, aiming to keep fairness of
> distribution on the whole logical volume. Typically such migrations
> complete some volume operations, e.g. adding a device to a logical
> volume, removing a device from a logical volume, increasing data
> capacity of a device, flushing a proxy-device, etc).
>
> Now user can perform selective data migration. That is, migrate only
> data of some specified regular file to any specified device-component
> of the logical volume.
>
> Also, for any specified regular file user can mark it as "immobile",
> so that volume balancing procedures will ignore that file.
>
> Finally, for any specified regular file user can clear its "immobile"
> status, so that the file will be movable again by volume balancing
> procedures.
>
> In particular, using this functionality, user is able to push out
> "hot" files on any high-performance device (e.g. proxy device) and pin
> them there.
>
> To test the new functionality use reiser4-for-5.7.4.patch of
> v5-unstable branch(*) and reiser4progs-2.0.2 (or newer stuff)
>
> (*) https://sourceforge.net/projects/reiser4/files/v5-unstable/
>
>
> ------------------------ File Migration: API -------------------------
>
>
> /*
>   * Migrate file to specified target device.
>   * @fd: file descriptor
>   * @idx: serial number of target device in the logical volume
>   */
>
> /*
>   * Provide correct path here.
>   * This header file can be found in reiser4 kernel module, or
>   * reiser4progs sources
>   */
> #include "reiser4/ioctl.h"
>
> struct reiser4_vol_op_args args;
> memset(&args, 0, sizeof(args));
> args.opcode = REISER4_MIGRATE_FILE;
> args.val = idx;
> result = ioctl(fd, REISER4_IOC_VOLUME, &args);
>
>
> ----------------------------------------------------------------------
>
>
> COMMENT. After ioctl successful completion the file is not necessarily
> written to the target device! To make sure of it, call fsync(2) after
> successful ioctl completion, or open the file with O_SYNC flag before
> migration.
>
> COMMENT. File migration is a volume operation (like adding, removing a
> device to/from a logical volumes), and all volume operations are
> serialized. So, any attempt to migrate a file, while performing other
> operation on that volume will fail. If some file migration procedure
> fails (with EBUSY, or other errors), or was interrupted by user, then
> it should be repeated in the current mount session. File migration
> procedures interrupted by system crash, hared reset, etc) should be
> repeated in the next mount sessions.
>
>
> ------------------ Set file immobile status: API ---------------------
>
>
> /*
>   * Set file "immobile".
>   * @fd: file descriptor
>   */
>
> /*
>   * Provide correct path here.
>   * This header file can be found in reiser4 kernel module, or
>   * reiser4progs sources
>   */
> #include "reiser4/ioctl.h"
>
> struct reiser4_vol_op_args args;
> memset(&args, 0, sizeof(args));
> args.opcode = REISER4_SET_FILE_IMMOBILE;
> result = ioctl(fd, REISER4_IOC_VOLUME, &args);
>
> COMMENT. The immobile status guarantees that any data block of that
> file won't migrate to another device-component of the logical volume.
> Note, however, that such block can be easily relocated within device
> where it currently resides (once the file system finds better location
> for that block, etc).
>
>
> ----------------------------------------------------------------------
>
>
> NOTE: All balancing procedures, which complete device removal, will
> ignore "immobile" status of any file. After device removal successful
> completion all data blocks of "immobile" files will be relocated to
> the remaining devices in accordance with current distribution policy.
>
> NOTE: Any selective file migration described above will ignore
> "immobile" status of the file! So the "immobile" status is honored
> only by volume balancing procedures, completing some operations such
> as adding a device to the logical volume, changing capacity of some
> device or flushing a proxy device.
>
>
> ----------------- Clear File immobile status: API --------------------
>
>
> /*
>   * Clear file "immobile" status.
>   * @fd: file descriptor
>   */
>
> /*
>   * Provide correct path here.
>   * This header file can be found in reiser4 kernel module, or
>   * reiser4progs sources
>   */
> #include "reiser4/ioctl.h"
>
> struct reiser4_vol_op_args args;
> memset(&args, 0, sizeof(args));
> args.opcode = REISER4_CLR_FILE_IMMOBILE;
> result = ioctl(fd, REISER4_IOC_VOLUME, &args);
>
>
> ----------------------------------------------------------------------
>
>
> NOTE: Selective file migration can make your distribution unfair!
> Currently it is strongly recommended to migrate files only to devices,
> which don't participate in regular data distribution e.g. proxy device
>
> In the future it will be possible to turn off builtin distribution on
> any volume. in this case user will be responsible for appointing a
> destination device for any file on that volume.
>
>
>                 File migration by volume.reiser4 tool
>
>
> You can use volume.reiser4(8) utility for file migration as well as
> for setting/clearing file "immobile" status.
>
> To migrate a regular file just execute
>
> #volume.reiser4 -m N FILENAME
>
> where N is serial number of target device (i.e. device, that the file
> is supposed to migrate to), FILENAME is name of the file to migrate.
>
> To set immobile status simply execute
>
> #volume.reiser4 -i FILENAME
>
> To clear immobile status:
>
> #volume.reiser4 -e FILENAME
>
>
>                 Holding "hot" files on Proxy Device
>
>
> It makes sense to relocate data of "hot" files to one, or more
> devices, which have the highest performance in the logical volume,
> e.g. to proxy device. For this you will need to mark every such file
> as "immobile" and move it to the desired device, so that balancing
> procedures (including flushing a proxy device) will ignore those
> files. See Appendix below for example.
>
>
>                                 FAQ
>
>
> Q: How to find out serial number of device /dev/sdc1 in my logical
>     volume mounted at /mnt
>
> A: Find out total number of devices in your logical volume, executing
>     "volume.reiser4 /mnt". Then print all volume components by
>     executing "volume.reiser4 /mnt -p i" in a loop for i = 0,.., N-1,
>     where N - number of devices in your logical volume. Find out, which
>     i is corresponding to /dev/sdc1
>
>     If you find this too complicated, feel free to send a patch for
>     more simple procedure of serial number calculation :)
>
>
>            Migration and immobile status of directories (TODO)
>
>
> Relocation of individual files and marking them as immobile/mobile is
> rather expensive operations. If you want all files of some directory
> to be stored on the same specified device, it makes sense to mark that
> directory by a special way, so that data of all regular files -
> children will be automatically dispatched to that device and all
> directories - children will inherit the immobile property from the
> parent directory. Reiser4 has all needed means for this (so-called
> per-inode "heir set").
>
>
>                                Appendix
>
>
>    Migrating a file to specified device and pinning it there (examples)
>
>
> In this example we'll move a file to 1) proxy and 2) regular data
> brick and pin it there.
>
> Create ID of logical volume:
>
> # VOL_ID=`uuidgen`
>
> Prepare 2 bricks for our logical volume, /dev/vdc2 for meta-data
> brick and /dev/vdc3 for proxy-device:
>
> # DEV1=/dev/vdc2
> # DEV2=/dev/vdc3
>
> # mkfs.reiser4 -U $VOL_ID -y    -t 256K $DEV1
> # mkfs.reiser4 -U $VOL_ID -y -a -t 256K $DEV2
>
> Mount a logical volume consisting of one meta-data brick:
>
> # MNT=/mnt/test
> # mount $DEV1 $MNT
>
> Add proxy-device to the logical volume
>
> # volume.reiser4 -x $DEV2 $MNT
>
> Create a 400K file (100 logical blocks) on our logical volume:
>
> # dd if=/dev/zero of=${MNT}/myfile bs=4K count=100
> # sync
>
> Print all bricks:
>
> # volume.reiser4 $MNT -p0
>
> Brick Info:
> internal ID:    0 (meta-data brick)
> external ID:    6ee9927e-04c3-4683-a451-f1329de66222
> device name:    /dev/vdc2
> num replicas:   0
> block count:    2621440
> blocks used:    116
> system blocks:  115
> data capacity:  1843119
> space usage:    0.000
> volinfo addr:   0 (none)
> in DSA:         Yes
> is proxy:       No
>
> # volume.reiser4 $MNT -p1
>
> Brick Info:
> internal ID:    1 (data brick)
> external ID:    2cc41c8a-b3cd-4690-b3fc-bd840e067131
> device name:    /dev/vdc3
> num replicas:   0
> block count:    2621440
> blocks used:    215
> system blocks:  115
> data capacity:  2621325
> space usage:    0.000
> volinfo addr:   0 (none)
> in DSA:         No
> is proxy:       Yes
>
> As we can see, the proxy device /dev/vdc3 contains 100
> data blocks (blocks used - system blocks) = 215 - 115
>
> Flush proxy device:
>
> # volume.reiser4 -b $MNT
>
> Print all bricks:
>
> # sync
> # volume.reiser4 $MNT -p0
>
> Brick Info:
> internal ID:    0 (meta-data brick)
> external ID:    6ee9927e-04c3-4683-a451-f1329de66222
> device name:    /dev/vdc2
> num replicas:   0
> block count:    2621440
> blocks used:    216
> system blocks:  115
> data capacity:  1843119
> space usage:    0.000
> volinfo addr:   0 (none)
> in DSA:         Yes
> is proxy:       No
>
> # volume.reiser4 $MNT -p1
>
> Brick Info:
> internal ID:    1 (data brick)
> external ID:    2cc41c8a-b3cd-4690-b3fc-bd840e067131
> device name:    /dev/vdc3
> num replicas:   0
> block count:    2621440
> blocks used:    115
> system blocks:  115
> data capacity:  2621325
> space usage:    0.000
> volinfo addr:   0 (none)
> in DSA:         No
> is proxy:       Yes
>
> As we can see all 100 data blocks were migrated to the
> meta-data brick /dev/vdc2 (block used = system blocks + data blocks +
> meta-data blocks = 115 + 100 + 1 = 216)
>
> Mark myfile as immobile and migrate it to the proxy-device:
>
> # volume.reiser4 -i ${MNT}/myfile
> # volume.reiser4 -m 1 ${MNT}/myfile
>
> Print all bricks:
>
> # sync
> # volume.reiser4 $MNT -p0
>
> Brick Info:
> internal ID:    0 (meta-data brick)
> external ID:    6ee9927e-04c3-4683-a451-f1329de66222
> device name:    /dev/vdc2
> num replicas:   0
> block count:    2621440
> blocks used:    116
> system blocks:  115
> data capacity:  1843119
> space usage:    0.000
> volinfo addr:   0 (none)
> in DSA:         Yes
> is proxy:       No
>
> # volume.reiser4 $MNT -p1
>
> Brick Info:
> internal ID:    1 (data brick)
> external ID:    2cc41c8a-b3cd-4690-b3fc-bd840e067131
> device name:    /dev/vdc3
> num replicas:   0
> block count:    2621440
> blocks used:    215
> system blocks:  115
> data capacity:  2621325
> space usage:    0.000
> volinfo addr:   0 (none)
> in DSA:         No
> is proxy:       Yes
>
> As we can see, the proxy device /dev/vdc3 again contains
> all the data blocks. NOTE: file was migrated in spite of
> immobile status, because selective migration ignores that
> status.
>
> Now flush proxy device and make sure that the file remains
> on the proxy device:
>
> # volume.reiser4 -b $MNT
>
> # sync
> # volume.reiser4 $MNT -p0
> # volume.reiser4 $MNT -p1
>
> As we can see, flushing procedure respects immobile status.
>
> Finally, remove the proxy device from the logical volume:
>
> # volume.reiser4 -r $DEV2 $MNT
>
> Print the single remaining brick of our logical volume:
>
> # volume.reiser4 $MNT -p0
>
> Brick Info:
> internal ID:    0 (meta-data brick)
> external ID:    6ee9927e-04c3-4683-a451-f1329de66222
> device name:    /dev/vdc2
> num replicas:   0
> block count:    2621440
> blocks used:    216
> system blocks:  115
> data capacity:  1843119
> space usage:    0.000
> volinfo addr:   0 (none)
> in DSA:         Yes
> is proxy:       No
>
> As we can see, file was migrated to the remaining brick /dev/vdc2 in
> spite of its immobile status. This is because operation of removing a
> device ignores that status.
>
> NOTE: the file remains immobile!
>
> Now add /dev/vdc3 as regular device (not proxy) and move the file to
> that device:
>
> # volume.reiser4 -a $DEV2 $MNT
> # volume.reiser4 -m 1 ${MNT}/myfile
>
> Print info about all bricks:
>
> # sync
> # volume.reiser4 $MNT -p0
>
> Brick Info:
> internal ID:    0 (meta-data brick)
> external ID:    6ee9927e-04c3-4683-a451-f1329de66222
> device name:    /dev/vdc2
> num replicas:   0
> block count:    2621440
> blocks used:    116
> system blocks:  115
> data capacity:  1843119
> space usage:    0.000
> volinfo addr:   0 (none)
> in DSA:         Yes
> is proxy:       No
>
> # volume.reiser4 $MNT -p1
>
> Brick Info:
> internal ID:    1 (data brick)
> external ID:    2cc41c8a-b3cd-4690-b3fc-bd840e067131
> device name:    /dev/vdc3
> num replicas:   0
> block count:    2621440
> blocks used:    215
> system blocks:  115
> data capacity:  2621325
> space usage:    0.000
> volinfo addr:   0 (none)
> in DSA:         Yes
> is proxy:       No
>
> As we can see, all data blocks of the file now reside at /dev/vdc3

FYI Although not officially, the Debian metaframework Buster AMD64 distribution might be the first to support native installation of Reiser4 SFRN 5.1.3, kernel and reiser4progs 2.0.3, file system utilities.

I have already made a couple of successful Metztli Reiser4 SFRN 5 native installations onto ~100 GB slices, which root file system is formatted in 'Reiser5' and 1 GB /boot in JFS.
https://metztli.it/reiser5 (Screenshot 600x338 size)

The upgraded netboot installation media metztli-reiser4-sfrn5.iso is available at:
https://sourceforge.net/projects/debian-reiser4/
as well as
https://metztli.it/buster-reiser5/metztli-reiser4-sfrn5.iso
https://metztli.it/buster-reiser5/metztli-reiser4-sfrn5.iso.SHA256SUM

Likely the brick/volume feature(s) will be useful in Cloud fabric infrastructures, like Google's, where reiser4 excels.

The current SFRN 5.1.3 -patched Zstd -compressed kernel in the installation media is Debian's 5.7.10.

The installer defaults to create the root system reiser5 -formatted partition as:
mkfs.reiser4 -yo "create=reg42" 

Your continued work on Reiser4 is appreciated, Sir.


Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Buster w/ Linux 5.7.10 AMD64
---------------------------------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-------------------------------------------------------------------------------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/
