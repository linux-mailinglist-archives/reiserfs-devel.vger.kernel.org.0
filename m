Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF30712D949
	for <lists+reiserfs-devel@lfdr.de>; Tue, 31 Dec 2019 14:53:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbfLaNxz (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 31 Dec 2019 08:53:55 -0500
Received: from mail-wr1-f50.google.com ([209.85.221.50]:40272 "EHLO
        mail-wr1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbfLaNxy (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 31 Dec 2019 08:53:54 -0500
Received: by mail-wr1-f50.google.com with SMTP id c14so35219250wrn.7;
        Tue, 31 Dec 2019 05:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=CC7P/qUmR+wJBNoXufQZiQIDJDbU7kG4vsk/FwfWsw0=;
        b=gGLY4AoJvbyti4tYHnYA5IQXCZz74Vubli7EhrXn6rF1mqVTx2p9I0t5opbDyx7o78
         k3mmtGCAwxAFGomG0/lPO9PEosaZnMH6YrfGes4QEkfVqPqqS0az+P1oiEdSZOUL82DO
         IVaVvTBSEsp8ev2ea2s1KEUdUFkwPS2te8L9qUYofoKrFUDxm+YlAwxNt0y4ayzo+5ip
         dL82whCtOQWzaGP5Bt/Z06fGIJqwYvBCWKw+HGf571gjw2wdUIwZgb5LTrAfNn9H7IRU
         iKZkSeyxX866nP78q81XNhQJ74A9VNg9iJrZA8IXBT5uv0YIEGFmx0zRsUFUHY7QwobM
         GmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=CC7P/qUmR+wJBNoXufQZiQIDJDbU7kG4vsk/FwfWsw0=;
        b=KX1dG12XfR+duOCWmQ9J2bVVHKLwyasm8IHncqF3uqjtAIYfomoEi3GYzoLtZpPuFL
         ssL1nKuSFfSls4vjyHB+6pgfbcsmTBsYwAEArgWqfqpnSLwlg/Z2ChI788HHPbQt0YXB
         OO5suvv8hIxn9UKokWaleutd1hnIVzemB5vPJpQWgEV2912yjpc6sfzuh75Oyys2Nt6+
         Bkg4I9WqSB9/d7I1gm4K6o0A27bcbZgfiPMEp66XUTDF0tyUbERbHDhEp13w3MUnlgFL
         SHUrBYCkNcUyRHs/TocpzB/A2apTo67GInaJxKxFgHYgHRyAEYK+pKUhfS3qnvSE7SRf
         guNA==
X-Gm-Message-State: APjAAAVP2IiXCy1tZTnwh/M9OjGFz5PdzM2X7x7Z03Jir6SSQJYZXBWm
        xCw7cVWsHRPVuOvVin2mTgNH39Tp
X-Google-Smtp-Source: APXvYqwdvPECPHklTxozGwPhKgEzPmCLoLZDK2Ns1+yXiJPdMI0dyeCFH4YHiLkPQxy677tZkDiXPA==
X-Received: by 2002:adf:e5ca:: with SMTP id a10mr71551339wrn.347.1577800426704;
        Tue, 31 Dec 2019 05:53:46 -0800 (PST)
Received: from [192.168.0.48] (HSI-KBW-046-005-005-173.hsi8.kabel-badenwuerttemberg.de. [46.5.5.173])
        by smtp.gmail.com with ESMTPSA id t81sm2678421wmg.6.2019.12.31.05.53.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Dec 2019 05:53:46 -0800 (PST)
To:     ReiserFS development mailing list 
        <reiserfs-devel@vger.kernel.org>,
        Linux kernel mailing list <linux-kernel@vger.kernel.org>
From:   Edward Shishkin <edward.shishkin@gmail.com>
Subject: [ANNOUNCE] Reiser5 (Format Release 5.X.Y)
Message-ID: <ee55ce28-2434-d3c6-0d2d-2ed1ea8f35d7@gmail.com>
Date:   Tue, 31 Dec 2019 14:53:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org


                Local volumes with parallel scaling out.
                        O(1) space allocator.
             User-defined and built-in data distribution and
                   transparent migration capabilities


I am happy to announce a brand new method of aggregation of block
devices into logical volumes on a local machine. I believe, it is a
qualitatively new level in file systems (and operating systems)
development - local volumes with parallel scaling out.

Reiser5 doesn't implement its own block layer like ZFS etc. In our
approach scaling out is performed by file system means, rather than by
block layer means. The flow of IO-requests issued against each device
is controlled by user. To add a device to a logical volume with
parallel scaling out, you first need to format that device - this is
the difference between parallel and non-parallel scaling at first
glance. The principal difference between parallel and non-parallel
scaling out will be discussed below.

Systems with parallel scaling out provide better scalability and
resolve a number of problems inherent to non-parallel ones. In logical
volumes with parallel scaling out devices of smaller size and(or)
throughput don't become a "bottlenecks", as it happens e.g. in RAID-0
and its popular modifications.


               I. Fundamental shortcomings of logical
                  volumes composed by block-layer means


1. Local file systems don't take participation in scaling out. They
    just face a huge virtual block device, for which they need to
    maintain a free space map. Such maps grow as the volume fills with
    data. It results in increasing latency on free blocks allocation
    and consequently in essential performance drop on large volumes
    which are almost full.

2. Loss of disk resources (space and throughput) on logical volumes
    composed of devices with different physical and geometric
    parameters (because of poor translations provided by "classic" RAID
    levels). Low-performance devices become a bottleneck in RAID arrays
    Attempts to replace RAID levels with better algorithms lead to
    inevitable and unfixable degradation of logical volumes. Indeed,
    defragmentation tools work only on the space of virtual disk
    addresses. If you use classic RAID levels, then everything is fine
    here: reducing fragmentation on virtual device always results in
    reducing fragmentation on physical ones. However, if you use more
    sophisticated translations to save disk space and bandwidth, then
    fragmentations on real devices tends to accumulate, and you are not
    able to reduce it just defragmenting the virtual device. Note that
    the interest is always real devices - no one actually cares what
    happens on virtual ones.

3. With only block layer means it is impossible to build heterogeneous
    storage composed of devices of different nature. You are not able
    to use different approaches to devices-components of the same
    logical volume (e.g. defragment only rotational drives, issue
    discard requests only for solid state drives, etc).

4. It is impossible to efficiently implement data migration on logical
    volumes composed by block-layer means.


                       II. The previous art


Previously, there was only one method for scaling out local volumes -
by block layer means. That is, file system deals only with virtual
disk addresses (allocation, defragmentation, etc), and the block layer
translates virtual disk addresses to real ones and backward. The most
common complaint is about performance drop on such logical volumes,
which are large and more than 70% full.

Mostly it is related to disk space allocators, which are, to put it
mildly, not excellent, and introduce big latency when searching for a
free blocks on extra-large volumes. Moreover, nothing better has been
invented for the past 30 years. Also, it easily may be that the best
algorithms for free space management simply do not exist.

Some file systems (ZFS and like) implement their own block layers.
It helps to implement a failover, however, the mentioned problem
doesn't disappear - if the block layer does its job very well, then
the file system, again, faces a huge logical block device, which is
hard to handle.

Significant progress in scaling out was made by parallel network file
systems (GPFS, Lustre, etc). However it was unclear, how to apply
their technologies to a local FS. Mostly, it is because local file
systems don't have such luxury like "backend storage" as the network
ones do. What local FS does have - is only extremely poor interface of
interaction with the block layer. For example, in Linux local FS can
only compose and issue an IO request against some buffer (page). In
other words, it was unclear, what a "local parallel file system" is.


                         III. Our approach


                        O(1) space allocator


~9 years ago I had realized that the first approach (implementation
an own block layer inside a local FS) is totally wrong. Instead we
need to pay attention to parallel network file systems to adopt their
methods. However, as I mentioned, there is no something even close to
a direct analogy - it means that for local FS we need to design
"parallelism" from scratch. The same about distribution algorithms -
I am totally unhappy with existing ones. Of course, you can deploy a
networking FS on the same local machine for a number of block devices,
but it will be something not serious. I state that a serious analogy
can be defined and implemented in properly designed local FS - meet
Reiser5.

The basic idea is pretty simple - to not mess with large free space
maps (whose sizes depend on the volume size). Instead, we need to
manage many small ones of limited size. At any moment the file system
should be able to pick up a proper such small space map, and work only
with it. Needless to say, that for any logical volume, which is as big
as you want, search time in a such map will be also limited by some
value, which doesn't depend on logical volume size. For this reason,
we'll call it O(1) - space allocator.

The simplest way is to maintain one space map per each block device,
which is a component of the logical volume. If some device is too
large, simply split it into a number of partitions to make sure that
any space map does not exceed some upper limit. Thus, users also
should put some efforts from their side to make the space allocator
be O(1).


          Parallel scaling out as disk resources conservation
                      Definitions and examples.


Here we'll consider an abstract subsystem S of the operating system
managing a logical volume composed of one, or more removable
components.

Definition 1. We'll say that S saves disk space and throughput of the
logical volume, if
1) its data capacity is a sum of data capacities of its components
2) its disk bandwidth is a sum of disk bandwidths of its components
We'll say that LV managed by such system is with parallel scaling out
(PSO).

There is a good analogy to understand the feature of PSO: imagine that
it rains and you put several cylindrical buckets with different sized
holes for collecting water. In this example raindrops represent
IO-requests, the set of bucket represents a logical volume. Note that
amount of water felt to each bucket is proportional to the square of
its hole (considered as throughput). In this example all buckets are
filled with water evenly and fairly: if one bucket is full, then other
ones is also full. Note, that non-cylindrical form of buckets will
likely break fairness of water distribution between them, so that PSO
won't take place in this case.

In practice, however, IO-systems are more complicated: IO requests are
distributed, queued, etc. And conservation of disk resources usually
doesn't take place: disk bandwidth of any logical volume turns out to
be smaller than the sum of ones of its components. Nevertheless, if
the loss of resources is small, and doesn't increase with the growth
of the volume, then we'll say that such system features parallel
scaling out.

In complex IO-systems "leak" of disk bandwidth has complex nature and
can happen on every its subsystem: on the file system, on the block
layer, etc. The loss can also be caused by interface properties, etc.
The fundamental reason of almost all resource leaks is that mentioned
subsystems were poorly designed (because better algorithms were not
known at that moment, or because of other reasons).

The classic example of disk space and throughput loss is RAID arrays.
Linear RAID saves disk space, but always drops disk bandwidth.
RAID-0, composed of different size and bandwidth devices, drops both,
disk space and disk bandwidth of the resulted logical volume. The same
is for their modifications like RAID-5. In all mentioned examples the
loss of disk bandwidth is caused by poor algorithms (specifically, by
the fact that IO requests are directed to every component in wrong
proportions).

Definition 2. A file system managing a logical volume is said to be
with parallel scaling out, if it saves disk space and bandwidth of
that logical volume. In other words, if it doesn't drop the mentioned
disk resources.

Note that file system is only a part of an IO-subsystem. And it can
easily happen that the file system saves disk resources, while the
whole system is not. For example, because of poorly designed block
layer, who puts IO requests issued for different block devices to the
same queue on a local machine, etc.

As an example, let's calculate disk bandwidth of a logical volume
composed of 2 devices, the first of which has disk bandwidth 200M/sec,
second - 300M/sec. We'll consider 3 systems: in the first one the
mentioned devices compose linear RAID, in the second one - striped
RAID (RAID-0), in the third one they are managed by a file system with
parallel scaling out.

Linear RAID distributes IO requests not evenly: first we write to the
first device. Once it is full, we write to the second one.
Disk bandwidth of linear RAID is defined by the throughput of the
device we are currently writing to. Thus it always is not more than
throughput of the faster device, i.e. 300 M/sec.

RAID-0 distributes IO requests evenly (but not fairly). In the same
interval of time the same number N/2 of IO-requests will be issued
against each device. On the first device it will be written in N/400
sec. On the second device it will be written in N/600 sec. Note that
the first device is slower, therefore we should wait N/400 sec for all
N IO-requests to be written to the array. So throughput of RAID-0 in
our case is N/(N/400) = 400 M/sec.

FS with parallel scaling out distributes IO requests evenly and
fairly. In the same interval of time the number of blocks issued
against each device is N*C, where C is relative throughput of the
device. Relative throughput of the first device is 200/(200+300) = 0.4.
Of the second one - 300/(200+300) = 0.6

Portion of IO-requests issued for each device will be written in
parallel in the same time 0.4N/200 = 0.6N/300 sec. Therefore,
throughput of our logical volume in this case is N/(0.4N/200) =
500 M/sec.

The resulted table of throughput:

Linear RAID:              <300 M/sec
RAID-0:                    400 M/sec
Parallel scaling out FS    500 M/sec

According to definitions above any local file system built on a top of
RAID/LVM does NOT possesses parallel scaling out (first, because RAID
and LVM don't save disk resources, second, because latency introduced
by free space allocator grows with volume. For the same reasons any
local FS, which implements its own block layer (ZFS, Btrfs, etc) does
NOT possesses parallel scaling out. Note that any network FS built on
a top of two or more local FS managing simple partitions as backend
saves disk resources.


              Overhead of parallelism for local FS


As we mentioned above, the characteristic feature of any FS with PSO
is that before adding a device to a logical volume you should format
it. Of course, it adds some overhead to the system. However, that
overhead is not dramatically large. Specifically, with reiser4 disk
format40 specifications the disk overhead includes 80K at the
beginning of each device-component. Next, for each device Reiser5
reads on-disk super-block and loads its to memory, Thus, memory
overhead includes one persistent memory super-block (~500 bytes) per
each device-component of a logical volume. That is, a logical volume
composed of one million devices will take ~500M of memory (pinned).
I think that a person maintaining such volume will be able to find $30
for additional memory card. That overhead is a single disadvantage of
FS with PSO. At least, we don't know other ones.


                   Asymmetric logical volumes.
                   Data and meta-data bricks


So, any logical volume with parallel scaling out is composed of block
devices formatted by mkfs utility. Such device has a special name
"brick", or "storage subvolume" of a logical volume.

For the beginning we have implemented the simplest approach, when
meta-data is located on dedicated block devices - we'll call them
"meta-data bricks". I remind that in reiser4 the notion of "meta-data"
includes all kind of items (key'ed records in the storage tree). And
the notion of data means unformatted blocks pointed out by "extent
pointers". Such unformatted nodes are used to store bodies of regular
files.

Meta-data bricks are allowed to contain unformatted data blocks. Data
bricks contain only unformatted data blocks. For obvious reasons such
logical volumes are called "asymmetric".


      Stripes. Fibers. Distribution, allocation and migration
                        Basic definitions


Stripe is a logical unit of distribution, that is a minimal object,
any parts of which can not be stored on different bricks.

A set of distribution units dispatched to the same brick is called
fiber.

Comment. In the previous art fibers were called stripes (case of
RAID-0), and logical units of distribution didn't have a special name.
For a number of adjacent sectors forming such a unit a notion of
"stripe width" was used.

Data stripe is a logical block of some size at some offset in a file.

Meta-data striping also can be defined, but we don't consider it here
for simplicity.

File system block is, as usual, an allocation unit on some brick.

Stripe is said allocated, if all its parts got disk addresses on some
brick.

 From these definitions it directly follows that file system block can
not contain more than one stripe. On the other hand, an allocated
stripe can occupy many blocks.

For any file system block its full address in a logical volume is
defined as a pair (brick-ID, disk-address).

Stripe is said dispatched, if it got the first component (brick-ID)
of its full address in the logical volume.

Stripe is said migrated, if its old disk addresses got released, and
new ones (possibly on another brick) got allocated.

The core difference between parallel and non-parallel scaling out in
terms of distribution and allocation: In PSO-systems any stripe
firstly gets distributed, then allocated. In systems with non-parallel
scaling out it is other way around - any stripe firstly gets
allocated, then distributed. An example is any local FS built a top of
RAID-0 array. Indeed, at first, such FS allocates a virtual disk
address for a logical block, then block layer assigns a real device-ID
and translates that virtual address to real one.


                 Data distribution and migration.
                  Fiber-Striping. Burst Buffers.


Distribution defines what device-component of a logical volume an IO
request composed for a dirty buffer(page) will be issued against.

In file systems with PSO "destination" device is always defined by a
virtual disk address allocated for that request. E.g. for RAID-0 ID of
destination device is defined as (N % M), where N is a virtual address
(block number), allocated by the file system, M is number of disks in
the array.

In our approach (O(1) space allocator) we allocate disk addresses on
each physical device independently, so for every IO-request we first
need to assign a destination device, then ask a block allocator
managing that device to allocate a block number for this request. So,
in our approach distribution doesn't depend on allocation.

By default Reiser5 offers distribution based on algorithms (so-called
fiber-striping) invented by Eduard Shishkin (patented stuff). With our
algorithms all your data will be distributed evenly and fairly among
all devices-components of the logical volume. It means that portion of
IO requests issued against each device is equal to relative capacity
of that device assigned by user. Operation of adding/removing a device
to/from a logical volume automatically invokes data migration, so that
resulted distribution is also fair. Portion of migrated data is always
equal to relative capacity of the added/removed device. The speed of
data migration is mostly determined by throughput of the device to be
added/removed.

Alternatively, Reiser5 allows users to control data distribution and
migration themselves. The most important application the user-defined
distribution and migration find in HPC area as so-called Burst Buffers
(dump of "hot data" on high-performance proxy-device with its
following migration to "persistent storage" in background mode).

In all cases the file system memorizes stripes location.


                   Atomicity of volume operations


Almost all volume operations (adding/removing a brick, changing
bricks capacity, etc) involve re-balancing (i.e. massive migration of
data blocks), so it is technically difficult to implement full
atomicity of such operations. Instead, we issue 2 checkpoints (first
before re-balancing, second - after), and handle 2 cases depending on
where in relation to those points the volume operation was
interrupted. In the first case user should repeat the operation again,
in the second case user should complete the operation (in the
background mode) using volume.reiser4 utility. See administration
guide on reiser4 logical volumes for details.


              Limitations on asymmetric logical volumes


Maximal number of bricks in a logical volume:
. in the "builtin" distribution mode - 2^32
. in the "custom" distribution mode - 2^64

In the "builtin" distribution mode any 2 bricks of the same logical
volume can not differ in size more than 2^19 (~1 million) times. For
example, your logical volume can not contain both, 1M and 2T bricks.

Maximal number of stripe pointers held by one 4K-metadata block: 75
(for node40 format).

Maximal number of data blocks served by 1 meta-data block: 75*S,
where S is stripe width in file system blocks. For example, for 128K-
stripes and 4K blocks (S=32) one meta-data block can serve not more
than 2400 data blocks. In particular, when all bricks are of equal
capacity, it means that one meta-data brick can serve not more than
2400 data bricks.


For the best quality of "builtin" distribution it is recommended that:
a) stripe size is not larger than 1/10000 of total volume size.
b) number of bricks in your logical volume is a power of 2 (i.e. 2, 4,
    8, 16, etc). If you cannot afford it, then make sure that number of
    hash space segments (a property of your logical volume, which can
    be increased online) is not smaller than 100 * number-of-bricks.


Not more than one volume operations on the same logical volume can be
executed in parallel. If some volume operation is not completed, then
attempts to execute other ones will return error (EBUSY).


                        Security issues


"Builtin" distribution combines random and deterministic methods.
It is "salted" with volume-ID, which is known only to root. Once
it is compromised (revealed), the logical volume can be subjected to
"free space attack" - with known volume-ID an attacker (non-privileged
user) will be able to fill some data brick up to 100%, while others
have a lot of free space. Thus, nobody will be able to write anymore
to that volume. So, keep your volume-ID a secret!


                 Software and Disk Version 5.1.3.
                         Compatibility


To implement parallel scaling out we upgraded Reiser4 code base with
the following new plugins:

1) "asymmetric" volume plugin (new interface);
2) "fsx32" distribution plugin (new interface);
3) "striped" file plugin (existing interface);
4) "extent41" item plugin (existing interface);
5) "format41" disk format plugin (existing interface).

In the best traditions we increment version numbers. The old disk and
software version was 4.0.2. "Minor" number (2) is incremented because
of (1-4). "Major" number (0) is incremented because of (5) and changes
in the format super-block. "Principal" number (4) is incremented
because of changes in master super-block. For more details about
compatibility see
https://reiser4.wiki.kernel.org/index.php/Reiser4_development_model

Old reiser4 partitions (of format 4.0.X) will be supported by Reiser5
kernel module. For this you need to enable option "support "Plan-A key
allocation scheme" (not default), when configuring the kernel. Note
that it will automatically disable support of logical volumes. Such
mutual exclusiveness is due to performance reasons.

Reiser4progs of software release number 5.X.Y don't support old
reiser4 partitions of format 4.0.X. To fsck the last ones use
reiser4progs of software release number 4.X.Y - it will exist as a
separate branch.


                               TODO


. Interface for user-defined data distribution and migration (Burst
   Buffers);
. Upgrading FSCK to work with logical volumes;
. Asymmetric LV w/ more than 1 meta-data brick per-volume;
. Symmetric logical volumes (meta-data on all bricks);
. 3D-snapshots of LV (snapshots with an ability to roll back not only
   file operations, but also volume operations);
. Global (networking) logical volumes.



=============================  APPENDIX =============================



The most recent version of this document will be available here:
https://reiser4.wiki.kernel.org/index.php/Logical_Volumes_Administration


       Reiser5 logical volumes with builtin fair distribution and
               transparent data migration capabilities.
                Administration guide - getting started.


Logical volume (LV) can be composed of any number of block devices,
different in physical and geometric parameters. However the optimal
configuration (true parallelism) imposes some restrictions and
dependencies on the size of such devices.

WARNING: The stuff is not stable. Don't put important data to logical
volumes managed by software of release number 5.X.Y

IMPORTANT: Currently there is no tools to manage Reiser5 logical
volumes off-line, so it it strongly recommended to save/update
configurations of your LV in a file, which doesn't belong to that
volume.


                     1. Basic definitions.
             Volume configuration. Brick's capacity.
            Partitioning. Fair distribution. Balancing


Basic configuration of a logical volume is the following information:

1) Volume UUID;
2) Number of bricks in the volume;
3) List of brick names or UUIDs in the volume;
4) UUID or name of the brick to be added/removed (if any). That brick
    is not counted in (2) and (3).

For each volume its configuration should be stored somewhere (but not
on that volume!) and properly updated before and after each volume
operation performed on that volume. We make the user responsible for
this. Volume configuration is needed to facilitate deploying a volume.

Abstract capacity (or simply capacity) of a brick is a positive
integer number. Capacity is a brick's property defined by user. Don't
confuse it with the size of block device. Think of it as of brick's
"weight" in some units. And this is the user, who decides, which
property of the brick to assign as its abstract capacity and in which
units. In particular, it can be size of the block device in kilobytes,
or its size in megabytes, or its throughput in M/sec, or other
geometric or physical parameter of the device, associated with the
brick. It is important that capacities of all bricks of the same
logical volume are measured in the same units. Also, it would be
utterly pointless to assign different properties as abstract
capacities for bricks of the same LV. For example, size of block
device for one brick, and disk bandwidth for another one.

Capacity of each brick gets initialized by mkfs utility. By default it
is calculated as number of free blocks on the device at the very end
of the formatting procedure. For meta-data brick it is calculated as
70% of such amount. Capacity of any brick can be changed on-line by
user.

Capacity of a logical volume is defined as a sum of capacities of its
bricks-components.

Relative capacity of a brick is the ratio of brick's capacity to
volume's capacity. Relative capacity defines a portion of IO-requests
that will be issued against that brick.

Array of relative capacities (C1, C2, ...) of all bricks is called
volume partitioning. Obviously, C1 + C2 + ... = 1.

(Real) data space usage on a brick is number of data blocks, stored
on that brick.

Ideal (or expected) data space usage on a brick is T*C, where T is
total number of data blocks stored in the volume. C is relative
capacity of the brick.

It is recommended to compose volumes in the way so that space-based
partitioning coincides with throughput-based one - it would be the
optimal volume configuration, which provides true parallelism. If it
is impossible for some reason, then choose a preferred partitioning
method (space-based, or throughput-based). Note that space-based
partitioning saves volume space, whereas throughput based one saves
volume throughput.

When performing regular file operations, Reiser5 distributes data
stripes throughout the volume evenly and fairly. It means that portion
of IO-requests issued against each brick is equal to its relative
capacity, that is, to the portion of capacity that the brick adds to
the total volume's capacity.

Most volume operations are accompanied by rebalancing, which keeps
fairness of distribution. For example, adding a brick to a logical
volume changes its partitioning, and hence, breaks fairness of the
distribution, so we need to move some data stripes to the new brick to
make distribution fair. Also you can not simply remove a brick from
a logical volume - all data stripes should be moved from that brick
to other bricks of the logical volume.

Every time when user performs a volume operation, Reiser5 marks LV as
"not balanced". After successful balancing the status of LV is changed
to "balanced". If balancing procedure fails for some reasons, it
should be resumed manually (with volume.reiser4 utility).

It is allowed to perform regular file operations on not balanced LV.
However, in this case:
a) we don't guarantee a good quality of data distribution on your LV.
b) you won't be able to perform volume operations on your LV except
    balancing - any other volume operation will return error (EBUSY).

So, don't forget to bring your LV to the balanced state as soon as
possible!


                 2. Prepare Software and Hardware


Build, install and boot kernel with Reiser4 of software framework
release number 5.X.Y. Kernel patches can be found here:
https://sourceforge.net/projects/reiser4/files/v5-unstable/kernel

Note that by Linux kernel and GNU utilities the testing stuff is
still recognized as "Reiser4". Make sure there is the following
message in kernel logs:

"Loading Reiser4 (Software Framework Release: 5.X.Y)"

Build and install the latest libaal library:

https://sourceforge.net/projects/reiser4/files/reiser4-utils/libaal/

Download, build and install the latest version 2.A.B of Reiser4progs
package:

https://sourceforge.net/projects/reiser4/files/v5-unstable/progs

Make sure that utility for managing logical volumes is installed (as
a part of reiser4progs package) on your machine:

# volume.reiser4 -?


                   3. Creating a logical volume


Start from choosing a unique ID (uuid) of your volume. By default it
is generated by mkfs utility. However, user can generate it himself by
proper tools (e.g. uuid(1)) and store in an environment variable for
convenience:

# VOL_ID=`uuid -v4`
# echo "Using uuid $VOL_ID"

Choose a stripe size for your logical volume. For a good quality of
distribution it is recommended that stripe doesn't exceed 1/10000 of
volume size. On the other hand, too small stripes will increase space
consumption on your meta-data brick. In our example we choose stripe
size 256K.

Start from creating the first brick of your volume - meta-data brick,
passing volume-ID and stripe size to mkfs.reiser4 utility:

# mkfs.reiser4 -U $VOL_ID -t 256K /dev/vdb1

Currently only one meta-data brick per volume is supported, so it is
recommended that size of block device for meta-data brick in not too
small. In most cases it will be enough, if your meta-data brick is not
smaller than 1/200 of maximal volume size. For example, 100G meta-data
brick will be able to service ~20T logical volume.

Mount your logical volume consisting of one meta-data brick:

# mount /dev/vdb1 /mnt

Find a record about your volume in the output of the following
command:

# volume.reiser4 -l

Create configuration of your logical volume (its definition is above)
and store it somewhere, but not on that volume!

Your logical volume is now on-line and ready to use. You can perform
regular file operations and volume operations (e.g. add a data brick
to your LV).


                 4. Adding a data brick to LV.


At any time you are able to add a data brick to your LV. You can do it
in parallel with regular file operations executing on this volume.
Make sure, however, that there is no other volume operations (e.g.
removing a brick) over your volume in progress, otherwise your
operation will fail with EBUSY.

Obviously, adding a brick will increase capacity of your volume.

Choose a block device for the new data brick. Make sure that it is not
too large, or too small. Capacities of any 2 bricks of the same
logical volume can not differ more than 2^19 (~1 million) times. E.g.
your logical volume can not contain both, 1M and 2T bricks. Any
attempts to add a brick of improper capacity will fail with error.

Format it by the same way as meta-data brick, but specify also "-a"
option (to let mkfs know that it is data brick).

# mkfs.reiser4 -U $VOL_ID -t 256K -a /dev/vdb2

Important: make sure you specified the same volume ID and stripe size
as other bricks of the logical volume do have. Otherwise, operation of
adding a data brick will fail.

Update configuration of your volume with UUID or name of the brick you
want to add (item #4).

To add a brick simply pass its name as an argument for the option "-a"
and specify your LV via its mount point:

# volume.reiser4 -a /dev/vdb2 /mnt

The procedure of adding a brick automatically invokes re-balancing,
which moves a portion of data stripes to the newly added brick (so
that the resulted distribution will fair).

Portion of data blocks moved during such rebalancing is equal to the
relative capacity of the new brick, that is to the portion of capacity
that the new brick adds to updated LV's capacity. This important
property defines the cost of balancing procedure. If the portion of
capacity added by a brick is small, then number of stripes moved
during balancing is also small.

Like other user-space utilities, the operation of adding a brick can
return error, even in the assumption that the brick you wanted to add
is properly formatted. In this case check the status of your LV:

# volume.reiser4 /mnt

If the volume is unbalanced, then simply complete balancing manually:

# volume.reiser4 -b /mnt

Otherwise, check number of bricks in your LV. Most likely that it is
the same as it was before the failed operation. In this case simply
repeat the operation of adding a brick from scratch.

Upon successful completion update your volume configuration. That is,
increment (#2), add info about the new brick to (#3) and remove
records at (#4).


                5. Removing a data brick from LV


At any time you are able to remove a data brick from your LV. You can
do it in parallel with regular file operations executing on this
volume. Make sure, however, that there is no other volume operations
(e.g. adding a brick) over your volume in progress, otherwise your
operation will fail with EBUSY.

Obviously, removing a brick will decrease abstract capacity of your
LV. Note that other bricks should have enough space to store all data
blocks of the brick you want to remove, otherwise, the removal
operation will return error (ENOSPC).

Suppose you want to remove brick /dev/vdb2 from your LV mounted at
/mnt.

Update your volume configuration with the UUID and name of the brick
you want to remove (#item #4).

To remove a brick simply pass its name as an argument for option "-r"
and specify the logical volume by its mount point:

# volume.reiser4 -r /dev/vdb2 /mnt

The procedure of brick removal automatically invokes re-balancing,
which distributes data of the brick to be removed among other bricks,
so that resulted distribution is also fair. Portion of data stripes
moved during such rebalancing is equal to the relative capacity of the
brick to be removed (that it to the portion of capacity that the brick
added to LV's capacity).

It can happen, that the command above completes with error (like other
user-space applications). In this case check the status of your LV:

# volume.reiser4 /mnt

If volume is not balanced, then simply complete balancing manually:

# volume.reiser4 -b /mnt

Otherwise, check the number of the bricks in your logical volume - it
should be the same as before the failed operation. The error -ENOSPC
indicates that free space on other bricks is not enough to fit all the
data of the brick you want to remove.

On success update your volume configuration: remove information about
the removed brick at #3 and #4.


                   6. Changing brick's capacity


At any time (in the assumption that no other volume operation is in
progress) you can change abstract capacity of any brick to some new
value, different from 0. Changing capacity always changes volume
partitioning, and therefore, breaks fairness of distribution, so
Reiser5 automatically launches rebalancing to make sure that resulted
distribution is fair for the new set of capacities.

In particular, increasing bricks capacity will move some data from
other bricks to the brick, whose capacity was increased. Decreasing
bricks capacity will move some data from the brick, whose capacity was
decreased, to other bricks.

To change abstract capacity of a brick /dev/vdb1 to a new value (e.g.
200000), simply run

# volume.reiser4 -z /dev/vdb1 -c 200000 /mnt

Pronounced as "resize brick /dev/vdb1 to new capacity 200000 in volume
mounted at /mnt".

The operation of changing capacity can return error. Most likely, it
is -ENOSPC, which is a side effect of concurrent regular file writes.
In this case check the status of your LV. If it is unbalanced, then
consider removing some files from your LV and complete balancing by
running

# volume.reiser4 -b /mnt

Otherwise, repeat the operation from scratch.

Comment. Changing bricks capacity to 0 is undefined and will return
error. Consider brick removal operation instead.


                7. Operations with meta-data brick


Meta-data brick can also contain data stripes and participate in data
distribution like other data bricks. So that all the volume operations
described above are also applicable to meta-data brick. Note, however,
that it is impossible to completely remove meta-data brick from the
logical volume for obvious reasons (meta-data need to be stored
somewhere), so brick removal operation applied to the meta-data brick
actually removes it from Data-Storage Array (DSA), not from the
logical volume. DSA is a subset of LV consisting of bricks,
participating in data distribution. Once you remove meta-data brick
from DSA, that brick will be used only to store meta-data. Operation
of adding a brick, being applied to a meta-data brick, returns the
last one back to DSA.

Important: Reiser5 doesn't count busy data and meta-data blocks
separately. So in contrast with data bricks (which contain only data)
you are not able to find out real space occupied by data blocks on the
meta-data brick - Reiser5 knows only total space occupied.

To check the status of meta-data brick sumply run

# volume.reiser4 /mnt

and compare values of "bricks total" and "bricks in DSA". If they are
equal, then meta-data brick participates in data distribution.
Otherwise, "bricks total" should be 1 more than "bricks in DSA" -
it indicates that meta-data brick doesn't participate in data
distribution (and therefore, doesn't contain data blocks). Note that
other cases are impossible: for data bricks participation in LV and
DSA is always equivalent.


                 8. Unmounting a logical volume


To terminate a mount session just issue usual umount command with the
mount point specified.

Note that after unmounting the volume all bricks by default remain to
be registered in the system till system shutdown. If you want to
unregister a brick before system shutdown, then simply issue the
following command:

# volume.reiser4 -u BRICK_NAME


                9. Deploying a logical volume
                     after correct unmount


Make sure (by checking your volume configuration) that all bricks of
the volume are registered in the system. The list of all volumes and
bricks registered in the system can be found in the output of the
following command:

# volume.reisrer4 -l

Issue usual mount command against one of the bricks of your volume. It
is recommended to specify meta-data brick in the mount command. If not
all bricks of the volume are registered, then attempts to mount such
volume will fail with a respective kernel message.

NOTE: Reiser5 will refuse to mount a logical volume, in the case, when
a wrong set of bricks is registered in the system. It can happen due
to careless handling of off-line volumes, leading to the appearance of
"artifacts" in the list of registered bricks. If you want to re-format
a brick, make sure it is unregistered.


                10. Deploying a logical volume
                      after correct shutdown


To be able to mount your LV make sure that all its bricks (data and
meta-data) are registered in the system. If not all bricks of the
volume are registered, then attempts to mount such volume will fail
with a respective kernel message. For this reasons we strongly
recommend for user to keep a track of his LV - store its configuration
somewhere, but not in this volume! And don't forget to update that
configuration after _every_ volume operation. If you lost
configuration of your LV and don't remember it (wich is most likely
for large volumes), then it will be rather painful to restore it:
currently there is no tools for to manage offline logical volumes.
So that, users are prompted to do this on their own. It is not at all
difficult.

To register a brick in the system use the following command:

# volume.reiser4 -g BRICK_NAME

To print a list of all registered bricks use

# volume.reiser4 -l

To mount your LV just issue a mount command for any one brick of your
LV.

Comment. Reiser5 always tries to register the brick which is passed to
the mount command as an argument, so it is not needed to preregister
bricks you want to issue a mount command against.


                 11. Deploying a logical volume
                 after hard reset or system crash


If no volume operations were interrupted by hard reset or system
crash, then just follow the instructions in section 9.

In Reiser5 only restricted number of bricks participate in every
transaction. Maximal number of such bricks can be specified by user.
At mount time a transaction replay procedure will be launched on each
such brick independently in parallel.

Depending on a kind of interrupted volume operation, perform one of
the following actions:


                 a. Adding a brick was interrupted.


Check your volume configuration. Register the old set of bricks (that
is, the set of brick that the volume had before applying the
operation) and try to mount. In the case of error register also the
brick you wanted to add and try to mount again.

Check the status of your LV by running

# volume.reiser4 /mnt

In the volume is unbalanced, then complete balancing manually by
running

# volume.reiser4 -b /mnt

Check "bricks total" of your LV in the output of

# volume.reiser4 /mnt

Compare it with the old number of bricks in the configuration. The new
value should be an increment of the old one. If the number of bricks
is the same, then your operation of adding a brick was completely
rolled back by the transaction manager, so that you need to repeat it
from scratch. Otherwise, your operation was successfully completed -
update your volume configuration respectively.


                 b. Brick removal was interrupted.


Check your volume configuration. Register the old set of bricks (that
is, the set of brick that volume had before applying the interrupted
operation) except the brick you wanted to remove. Try to mount the
volume. In the case of error register also the brick you wanted to
remove and try to mount again.

Check the status of your LV:

# volume.reiser4 /mnt

If the volume is unbalanced then complete balancing manually by
running

# volume.reiser4 -b /mnt

Comment. After successful balancing completion the brick will be
automatically removed form the volume. Make sure of it by checking
status of your LV:

# volume.reiser4 /mnt

Update your volume configuration respectively.


            c. Another volume operation was interrupted


Using the volume configuration, register the new set of bricks and
try to mount the volume. The mount should be successful.

Check the status of your LV:

# volume.reiser4 /mnt

If the volume is unbalanced then complete balancing manually by
running

# volume.reiser4 -b /mnt


                        12. LV monitoring.


Common info about LV mounted at /mnt

# volume.reiser4 /mnt

ID:             Volume UUID
volume:         ID of plugin managing the volume
distribution:   ID of distribution plugin
stripe:         Stripe size in bytes
segments:       Number of hash space segments (for distribution)
bricks total:   Total number of bricks in the volume
bricks in DSA:  Number of bricks participating in data distribution
balanced:       Balanced status of the volume


Info about any its brick of index J

# volume.reiser4 -p J /mnt

internal ID:    Brick's "internal ID" and its status in the volume
external ID:    Brick's UUID
device name:    Name of the block device associated with the brick
block count:    Size of the block device in blocks
blocks used:    Total number of occupied blocks on the device
system blocks:  Minimal possible number of busy blocks on that device
data capacity:  Abstract capacity of the brick
space usage:    Portion of occupied blocks on the device


Comment. When retrieving brick's info make sure that no volume
operations over that volume are in progress. Otherwise  the command
above will return error (EBUSY).

WARNING. Bricks info provided by such way is not necessarily the most
recent one. To get an actual info run sync(1) and make sure that no
regular file operations are in progress.


                   13. Checking free space


To check number of available free blocks on a volume mounted at /mnt,
make sure that no regular file operations, as well as volume
operations, are in progress on that volume, then run

# sync
# df --block-size=4K /mnt

To check number of free blocks on the brick of index J run

# volume.reiser4 -p J /mnt

Then calculate the difference between block count and blocks used

Comment. Not all free blocks on a brick/volume are available for use.
Number of available free blocks is always ~95% of total number of free
blocks (Reiser4 reserves 5% to make sure that regular file truncate
operations won't fail).

NOTE: volume.reiser4 shows total number of free blocks, whereas df(1)
shows number of available free blocks.

"Space usage" statistics shows a portion of busy blocks on individual
brick. For the reasons explained above "space usage" on any brick can
not be more than 0.95


            14. Checking quality of data distribution


Quality of data distribution is a measure of deviation of the real
data space usage from the ideal one defined by volume partitioning.
The smaller the deviation, the better the distribution quality.

Checking quality of distribution makes sense only in the case when
your volume partitioning is space-based, or if it coincides with the
space-based one.

If your partitioning is throughput-based, and it doesn't coincide
with the space-based one, then quality of actual data distribution
can be rather bad, as in this case the file system is worried for
low-performance devices to not become a bottleneck, and effective
space usage in this case is not a high priority.

Checking quality of data distribution is based on the free blocks
accounting, provided by the file system. Note that file system doesn't
count busy data and meta-data blocks separately, so you are not able
to find real data space usage, and hence to check quality of
distribution in the case when meta-data brick contains data blocks.

To check quality of distribution

1) make sure that meta-data brick doesn't contain data blocks;
2) make sure that no regular file and volume operations are currently
    in progress;
3) find "blocks used", "system blocks" and "data capacity" statistics
    for each data brick:

# sync
# volume.reiser4 -p 1 /mnt
...
# volume.reiser4 -p N /mnt

4) find real data space usage on each brick;
5) calculate partitioning and ideal data space usage on each data
    brick;
6) find deviation of (4) from (5).

Example.

Let' build a LV of 3 bricks (one 10G meta-data brick sdb1, and two
data bricks: sdc1 (10G), sdd1(5G)) with space-based partitioning:

# VOL_ID=`uuid -v4`
# echo "Using uuid $VOL_ID"

# mkfs.reiser4 -U $VOL_ID -y    -t 256K /dev/vdb1
# mkfs.reiser4 -U $VOL_ID -y -a -t 256K /dev/vdc1
# mkfs.reiser4 -U $VOL_ID -y -a -t 256K /dev/vdd1

# mount /dev/vdb1 /mnt

Fill the meta-data brick with data:

# dd if=/dev/zero of=/mnt/myfile bs=256K

No space left on device...

Add data-bricks /dev/sdc1 and dev/sdd1 to the volume:

# volume.reiser4 -a /dev/vdc1 /mnt
# volume.reiser4 -a /dev/vdd1 /mnt

Move all data blocks to the newly added bricks:

# volume.reiser4 -r /dev/vdb1 /mnt
# sync

Now meta-data brick doesn't contain data blocks (only meta-data ones),
so that we can calculate quality of data distribution

# volume.reiser4 /mnt -p0
blocks used: 503

# volume.reiser4 /mnt -p1
blocks used: 1657203
system blocks: 115
data capacity: 2621069

# volume.reiser4 /mnt -p2
blocks used: 833001
system blocks: 73
data capacity: 1310391

Basing on the statistics above calculate quality of distribution.

Total data capacity of the volume: 2621069 + 1310391 = 3931460
Relative capacities of data bricks:

C1 = 2621069 /(2621069 + 1310391) = 0.6667
C2 = 1310464 /(2621069 + 1310391) = 0.3333

Real space usage on data bricks (blocks used - system blocks):

R1 = 1657203 - 115 = 1657088
R2 = 833001 - 73 = 832928

Real space usage on the volume:

R = R1 + R2 = 1657088 + 832928 = 2490016

Ideal data space usage on data bricks:

I1 = C1 * T = 0.6667 * 2490016 = 1660094
I2 = C2 * T = 0.3333 * 2490016 = 829922

Deviation: D = (R1, R2) - (I1, I2) = (3006, -3006)

Relative deviation: D/R = (-0.0012, 0.0012)

Quality of distribution:

Q = 1 - max(|D1|, |D1|) = 1 - 0.0012 = 0.9988

Comment. For any specified number of bricks N and quality of
distribution Q it is possible to find a configuration of a logical
volume composed of N bricks, so that quality of distribution on
that volume will be better than Q.

Comment. Quality of distribution Q doesn't depend on the number of
bricks in the logical volume. This is a theorem, which can be strictly
proven.
