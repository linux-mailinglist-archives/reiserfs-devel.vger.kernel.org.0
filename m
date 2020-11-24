Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42C4F2C1F61
	for <lists+reiserfs-devel@lfdr.de>; Tue, 24 Nov 2020 09:06:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730221AbgKXIEz (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Tue, 24 Nov 2020 03:04:55 -0500
Received: from mail-bn7nam10on2117.outbound.protection.outlook.com ([40.107.92.117]:1889
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730403AbgKXIEz (ORCPT <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 24 Nov 2020 03:04:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EjN5+6QQUvYMg3Pd6ukvQinEjtJET8GH/laZ9HK0oFn/r2/eeuL5bSXS+M3cfhQIYfINz+MDikOwU6H1BJ896cjCHMe33PEiTNtokbe1ywtW2CzXj8LoY11ARVRNU06FyLZ1W1TAmVo3qIFJf7yF+8sESedD/KpHbw4CfeftkRxKT3oATs/rz+a04Jcq996pFc30Of4T68cVBWVVKdnIir9/9jn9zworaNooJHyJqzSqq5lTPgnxbE/Pyqpf89JrYNaDLVDRqE04+kfI31J34+9mt77w6atu3u7+0WiYlqLkUi/X3JRM6musWjgyW8fV4kwoFbuswmQhWc6MWmGLrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KsqZ/3XHNUdO379dr3N9JRk4uJs7bVyodSmjdZsRL8=;
 b=AkJB49lV/5Kj59rVtBYbZ+/tK58pwSMPvX3uS1umoi7mhwh3NIDS9DLe56BizgDYJQd8jeGOcWG9BMBTiwb+zLYwf/G2WDOWsyOwD6D7y9Q5U8IGc87KQ3JehwY3AHTa4ixvY+s5aid5kSEq4oa1uFdAje8zC/pBD89DhosTT9U0Eauggz+gqlSucLuBip/xJktbSCt60HozzrCt4l1O9xBuV/rD3MM+/wyQwBCJ1caSqUD6t9PBaEjjPp3Fj3C9FgZdrifNYNnrXpY6WuU/paHcBFXJhpVchDBlXLeRJYptABoRme2fw7AshKQEndX4qlq//L6x5jJZr2pp1797lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=northeastern.edu; dmarc=pass action=none
 header.from=northeastern.edu; dkim=pass header.d=northeastern.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northeastern.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KsqZ/3XHNUdO379dr3N9JRk4uJs7bVyodSmjdZsRL8=;
 b=ShLHgIXPNKNiWiiuxbwR3XCOmUUBJTmVu97pI0THtLZDscD9pPWqtRl2GxdKUgGLKi0hBdwfFNpQ8U/l3K7Og8O0xMky0s/DeGlhWGfgxjp0vqW4oW0eQJ6QfBjyjj5G4ibieG1WDZ0eBBhUUNxauXqq1LKSGu6Ly4T//6OylYI=
Received: from DM5PR06MB2570.namprd06.prod.outlook.com (2603:10b6:3:44::14) by
 DM5PR06MB2876.namprd06.prod.outlook.com (2603:10b6:3:11d::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.22; Tue, 24 Nov 2020 08:04:49 +0000
Received: from DM5PR06MB2570.namprd06.prod.outlook.com
 ([fe80::e922:7241:13fa:aded]) by DM5PR06MB2570.namprd06.prod.outlook.com
 ([fe80::e922:7241:13fa:aded%12]) with mapi id 15.20.3589.022; Tue, 24 Nov
 2020 08:04:49 +0000
From:   Changming Liu <liu.changm@northeastern.edu>
To:     "reiserfs-devel@vger.kernel.org" <reiserfs-devel@vger.kernel.org>
CC:     yaohway <yaohway@gmail.com>,
        Digest recipients <syzkaller@googlegroups.com>
Subject: [UBSAN Bug report]: signed integer overflow in UB in yura_hash of
 fs/reiserfs/hashes.c
Thread-Topic: [UBSAN Bug report]: signed integer overflow in UB in yura_hash
 of fs/reiserfs/hashes.c
Thread-Index: AdbCOEnY66yEP/52QFuPrENdOXJ+fw==
Date:   Tue, 24 Nov 2020 08:04:48 +0000
Message-ID: <DM5PR06MB2570ED77EF6C579796B00E95E5FB0@DM5PR06MB2570.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=northeastern.edu;
x-originating-ip: [173.48.78.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21ff46d6-0236-49e9-30b4-08d8904f9d7e
x-ms-traffictypediagnostic: DM5PR06MB2876:
x-ld-processed: a8eec281-aaa3-4dae-ac9b-9a398b9215e7,ExtAddr
x-microsoft-antispam-prvs: <DM5PR06MB28766A52A6FB99189E006B2AE5FB0@DM5PR06MB2876.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NpfYt5wITDgkf+bAL05IYmwkYTxHHTH8MTY9gT+cHFZ5jk1rQx9irw5wENmw1Hz2TRBYCfoLbJbXyzysb1jnMzLin9FugBRiGQNrBCofnCmqiFKJEjgK30cqS2V5X5Jq8mdT4OOCcIo7JDOphotKsJbaarXxoquGTFCKH/fjRsj4QaSf7jJAOdA06eM3DIPShxtplh75ax30Lxqs6/F45jPWYtGVWJ4nys24QmSbTihaTIGPv52dDRWa6viOnW8LkyKJe+UJq8tG6DL7jMDgIYDWUiKaJpNwsspluxJ+Hnm2ATQ2JeTDqlWD8zlvbOj7Vuap+2Y1cCXkld+cDjN4k+eFNkzEoPiciWa71Xem+JDekr7k6i7jV84s7VVuquhZQCDSuaerKfTjpPOmNvtwyzXodfsh2QiQlx+mNUuH9NIztbZ3MxOZ67uMsoCe/WA4WPjmam0IgAmkoxuiLY3g5A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR06MB2570.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(396003)(346002)(366004)(71200400001)(75432002)(83380400001)(6916009)(7696005)(9686003)(4326008)(54906003)(86362001)(26005)(186003)(76116006)(316002)(52536014)(786003)(5660300002)(55016002)(478600001)(2906002)(8936002)(6506007)(33656002)(66946007)(8676002)(66476007)(66556008)(64756008)(66446008)(309714004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: FgLHQMOMwqpVaXuBRVqiMzRnR4dKVUjziQBTxg8pX/KWKkFPgDQAP/bc9yowczJ7w4PUHZY/HOVg/EGDpTKZY0n98FpJ1z9AO+g0WLJhIAbN+Fv/5LYlDEcYrLrsmtcUfsRMhJH7npY/tQyHdU7MW4uZWm1/qi9jJYZWteqoQ4DO7+4FmwgiFGiyj4/fDCXrWs/uewfPPqgCa2PBQAQ2HPr2+8FclgO8nWXW6DWWqhf0P4AL+EL1Qvt4P3fOM3vpvVqvJV1nvTAd/fQdlVXDgOgVXA+JDHdwTixZRWMUPrTa2KbFvArYrGwLmbwLhwxrZmvBf4H9f3/Nfnq/nID1CvcbUT9M49fMU2nkK0N4GaE7gYLbUDi6f26Cdgx9zzMLP/wev00BBh7EWwySvK+ynfaSbqSKpQKz9wbC9LZdUp+tmBO5Un3p0/7Yqjxuo2BXLAzwkh1+t9meQ1SU9tG6CCjzCQ/4n/wdhD2yvWls7dYfsZNZ/8idftcWloBnAx3bRyI5IaFBRYDGBSaFEdbQUEFjs0OF6kcZ4rja+Ny3bQYcY1dfr4mVOonoCHwOWrLyNS6p8gKftC8pLXsL6afvZh8OPdft14XDlLawUJX7bPS8rBAa9BmK1LGtViPiqXuSBzd2jxAgVSOz3MG9BdAv9UdB8qn5vl2rjgzEVOzuFYvO+Bez87L85jcuOIZ4BfBRdsBFMuqpjhBsIxgv1YfQuwri0OBBlANQGlRo6Q/DULBFU1l3FAC8+RYfk+FhAQV3F6cm9YKCEmEDr0ZlipwREAuplR0W74k/3++giIkZ8pWZMTdxCnAiT1o35coPsxAhq+jdfCPWhcKR2EMhFxMfEZD+pEqDTtwCNxpol6EgEC924oTyyZsocBXK2tLmrQb0i75o++xfFrjpzaLsjquTPA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: northeastern.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR06MB2570.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ff46d6-0236-49e9-30b4-08d8904f9d7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2020 08:04:49.0714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a8eec281-aaa3-4dae-ac9b-9a398b9215e7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /TLWfFKidSrgyVbHURV0sLDG+9i0Z6sfX3V5RzmTtjb9WSgcQanT1bDOwbi9MR9H8Gmjyza7hlsCzu7l/P3FtphDyHXn+FkBT3s47LeuMPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR06MB2876
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hi Folks,

I'm a PhD student interested in testing kernel with UBSan,
syzkaller reported this UBSan report on function yura_hash in fs/reiserfs/h=
ashes.c:135.

From brief manual validation, the result of this signed-overflow is undefin=
ed.

If I remember correctly, it is said that all signed overflow in the kernel
module are essentially wrap-arounds, rather than being undefined.
I'm wondering does it apply to this case?

This will help me understand linux and UB a lot, any feedback is greatly ap=
preciated.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
REISERFS (device loop0): checking transaction log (loop0)
REISERFS (device loop0): Using rupasov hash to sort names
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
UBSAN: Undefined behaviour in fs/reiserfs/hashes.c:135:7
signed integer overflow:
1000000000 * 10 cannot be represented in type 'int'
CPU: 0 PID: 10804 Comm: syz-executor.0 Not tainted 5.4.0+ #27
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Ubuntu-1.8.2-1u=
buntu1 04/01/2014
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xc6/0x11e lib/dump_stack.c:118
 ubsan_epilogue+0xe/0x40 lib/ubsan.c:158
 handle_overflow+0xdf/0xf0 lib/ubsan.c:189
 yura_hash+0x266/0x2e0 fs/reiserfs/hashes.c:135
 get_third_component+0x97/0x1b0 fs/reiserfs/namei.c:195
 reiserfs_find_entry.part.4+0xc9/0x13b0 fs/reiserfs/namei.c:316
 reiserfs_find_entry fs/reiserfs/namei.c:367 [inline]
 reiserfs_lookup+0x238/0x410 fs/reiserfs/namei.c:366
 __lookup_slow+0x217/0x410 fs/namei.c:1663
 lookup_one_len+0x150/0x180 fs/namei.c:2533
 reiserfs_lookup_privroot+0x90/0x230 fs/reiserfs/xattr.c:964
 reiserfs_fill_super+0x1dc7/0x2540 fs/reiserfs/super.c:2173
 mount_bdev+0x2aa/0x360 fs/super.c:1415
 legacy_get_tree+0x103/0x200 fs/fs_context.c:647
 vfs_get_tree+0x86/0x340 fs/super.c:1545
 do_new_mount fs/namespace.c:2822 [inline]
 do_mount+0x109a/0x1730 fs/namespace.c:3142
 ksys_mount+0xa8/0x120 fs/namespace.c:3351
 __do_sys_mount fs/namespace.c:3365 [inline]
 __se_sys_mount fs/namespace.c:3362 [inline]
 __x64_sys_mount+0xba/0x150 fs/namespace.c:3362
 do_syscall_64+0x9d/0x5a0 arch/x86/entry/common.c:290
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x4608aa
Code: b8 a6 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 ad 89 fb ff c3 66 2e 0f =
1f 84 00 00 00 00 00 66 90 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff f=
f 0f 83 8a 89 fb ff c3 66 0f 1f 84 00 00 00 00 00
RSP: 002b:00007f167680ca88 EFLAGS: 00000202 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007f167680cb20 RCX: 00000000004608aa
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007f167680cae0
RBP: 00007f167680cae0 R08: 00007f167680cb20 R09: 0000000020000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000020000000
R13: 0000000020000100 R14: 0000000020000200 R15: 0000000020011500
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D




C reproducer:
// autogenerated by syzkaller (https://github.com/google/syzkaller)

#define _GNU_SOURCE

#include <endian.h>
#include <errno.h>
#include <fcntl.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/mount.h>
#include <sys/stat.h>
#include <sys/syscall.h>
#include <sys/types.h>
#include <unistd.h>

#include <linux/loop.h>

static unsigned long long procid;

struct fs_image_segment {
  void* data;
  uintptr_t size;
  uintptr_t offset;
};

#define IMAGE_MAX_SEGMENTS 4096
#define IMAGE_MAX_SIZE (129 << 20)

#define sys_memfd_create 319

static unsigned long fs_image_segment_check(unsigned long size,
                                            unsigned long nsegs,
                                            struct fs_image_segment* segs)
{
  if (nsegs > IMAGE_MAX_SEGMENTS)
    nsegs =3D IMAGE_MAX_SEGMENTS;
  for (size_t i =3D 0; i < nsegs; i++) {
    if (segs[i].size > IMAGE_MAX_SIZE)
      segs[i].size =3D IMAGE_MAX_SIZE;
    segs[i].offset %=3D IMAGE_MAX_SIZE;
    if (segs[i].offset > IMAGE_MAX_SIZE - segs[i].size)
      segs[i].offset =3D IMAGE_MAX_SIZE - segs[i].size;
    if (size < segs[i].offset + segs[i].offset)
      size =3D segs[i].offset + segs[i].offset;
  }
  if (size > IMAGE_MAX_SIZE)
    size =3D IMAGE_MAX_SIZE;
  return size;
}
static int setup_loop_device(long unsigned size, long unsigned nsegs,
                             struct fs_image_segment* segs,
                             const char* loopname, int* memfd_p, int* loopf=
d_p)
{
  int err =3D 0, loopfd =3D -1;
  size =3D fs_image_segment_check(size, nsegs, segs);
  int memfd =3D syscall(sys_memfd_create, "syzkaller", 0);
  if (memfd =3D=3D -1) {
    err =3D errno;
    goto error;
  }
  if (ftruncate(memfd, size)) {
    err =3D errno;
    goto error_close_memfd;
  }
  for (size_t i =3D 0; i < nsegs; i++) {
    if (pwrite(memfd, segs[i].data, segs[i].size, segs[i].offset) < 0) {
    }
  }
  loopfd =3D open(loopname, O_RDWR);
  if (loopfd =3D=3D -1) {
    err =3D errno;
    goto error_close_memfd;
  }
  if (ioctl(loopfd, LOOP_SET_FD, memfd)) {
    if (errno !=3D EBUSY) {
      err =3D errno;
      goto error_close_loop;
    }
    ioctl(loopfd, LOOP_CLR_FD, 0);
    usleep(1000);
    if (ioctl(loopfd, LOOP_SET_FD, memfd)) {
      err =3D errno;
      goto error_close_loop;
    }
  }
  *memfd_p =3D memfd;
  *loopfd_p =3D loopfd;
  return 0;

error_close_loop:
  close(loopfd);
error_close_memfd:
  close(memfd);
error:
  errno =3D err;
  return -1;
}

static long syz_mount_image(volatile long fsarg, volatile long dir,
                            volatile unsigned long size,
                            volatile unsigned long nsegs,
                            volatile long segments, volatile long flags,
                            volatile long optsarg)
{
  struct fs_image_segment* segs =3D (struct fs_image_segment*)segments;
  int res =3D -1, err =3D 0, loopfd =3D -1, memfd =3D -1, need_loop_device =
=3D !!segs;
  char* mount_opts =3D (char*)optsarg;
  char* target =3D (char*)dir;
  char* fs =3D (char*)fsarg;
  char* source =3D NULL;
  char loopname[64];
  if (need_loop_device) {
    memset(loopname, 0, sizeof(loopname));
    snprintf(loopname, sizeof(loopname), "/dev/loop%llu", procid);
    if (setup_loop_device(size, nsegs, segs, loopname, &memfd, &loopfd) =3D=
=3D -1)
      return -1;
    source =3D loopname;
  }
  mkdir(target, 0777);
  char opts[256];
  memset(opts, 0, sizeof(opts));
  if (strlen(mount_opts) > (sizeof(opts) - 32)) {
  }
  strncpy(opts, mount_opts, sizeof(opts) - 32);
  if (strcmp(fs, "iso9660") =3D=3D 0) {
    flags |=3D MS_RDONLY;
  } else if (strncmp(fs, "ext", 3) =3D=3D 0) {
    if (strstr(opts, "errors=3Dpanic") || strstr(opts, "errors=3Dremount-ro=
") =3D=3D 0)
      strcat(opts, ",errors=3Dcontinue");
  } else if (strcmp(fs, "xfs") =3D=3D 0) {
    strcat(opts, ",nouuid");
  }
  res =3D mount(source, target, fs, flags, opts);
  if (res =3D=3D -1) {
    err =3D errno;
    goto error_clear_loop;
  }
  res =3D open(target, O_RDONLY | O_DIRECTORY);
  if (res =3D=3D -1) {
    err =3D errno;
  }

error_clear_loop:
  if (need_loop_device) {
    ioctl(loopfd, LOOP_CLR_FD, 0);
    close(loopfd);
    close(memfd);
  }
  errno =3D err;
  return res;
}

int main(void)
{
  syscall(__NR_mmap, 0x1ffff000ul, 0x1000ul, 0ul, 0x32ul, -1, 0ul);
  syscall(__NR_mmap, 0x20000000ul, 0x1000000ul, 7ul, 0x32ul, -1, 0ul);
  syscall(__NR_mmap, 0x21000000ul, 0x1000ul, 0ul, 0x32ul, -1, 0ul);

  memcpy((void*)0x20000000, "reiserfs\000", 9);
  memcpy((void*)0x20000100, "./file0\000", 8);
  *(uint64_t*)0x20000200 =3D 0x20010000;
  memcpy((void*)0x20010000,
         "\x00\x04\x00\x00\xec\x01\x00\x00\x13\x02\x00\x00\x12\x00\x00\x00\=
x00"
         "\x00\x00\x00\x00\x02\x00\x00\x00\x01\x00\x00\x61\x1c\xad\x49\xe1\=
x00"
         "\x00\x00\x1e\x00\x00\x00\x00\x00\x00\x00\x00\x10\xcc\x03\x02\x00\=
x01"
         "\x00\x52\x65\x49\x73\x45\x72\x33\x46\x73\x00\x00\x00\x02\x00\x00\=
x00"
         "\x02\x00\x01\x00\x02\x00\x01\x02\x00\x00\x00\x00\x01\x00\x00\x00\=
x12"
         "\x31\x23\x12\x12\x33\x12\x33\x12\x31\x12\x34\x13\x41\x24\x12\x73\=
x79"
         "\x7a\x6b\x61\x6c\x6c\x65\x72\x00\x00\x00\x00\x00\x00\x00\x01\x00\=
x1e"
         "\x00\x3a\xc1\x65\x5f\x00\x4e\xed\x00",
         128);
  *(uint64_t*)0x20000208 =3D 0x80;
  *(uint64_t*)0x20000210 =3D 0x10000;
  *(uint64_t*)0x20000218 =3D 0;
  *(uint64_t*)0x20000220 =3D 0;
  *(uint64_t*)0x20000228 =3D 0x100c0;
  *(uint64_t*)0x20000230 =3D 0;
  *(uint64_t*)0x20000238 =3D 0;
  *(uint64_t*)0x20000240 =3D 0x11000;
  *(uint64_t*)0x20000248 =3D 0x20011200;
  memcpy((void*)0x20011200,
         "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x12\x00\x00\x00\=
x00"
         "\x00\x00\x00\x00\x02\x00\x00\x00\x01\x00\x00\x61\x1c\xad\x49\xe1\=
x00"
         "\x00\x00\x1e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\=
x00"
         "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00",
         64);
  *(uint64_t*)0x20000250 =3D 0x40;
  *(uint64_t*)0x20000258 =3D 0x212000;
  *(uint64_t*)0x20000260 =3D 0x20011300;
  memcpy((void*)0x20011300,
         "\x01\x00\x02\x00\x5c\x0f\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\=
x00"
         "\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\x00\=
x00"
         "\x00\x00\x00\x00\x00\x00\x00\x00\x2c\x00\xd4\x0f\x01\x00\x01\x00\=
x00"
         "\x00\x02\x00\x00\x00\x01\x00\x00\x00\xf4\x01\x00\x00\x02\x00\x30\=
x00"
         "\xa4\x0f\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\=
x00"
         "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00",
         96);
  *(uint64_t*)0x20000268 =3D 0x60;
  *(uint64_t*)0x20000270 =3D 0x213000;
  *(uint64_t*)0x20000278 =3D 0x20011400;
  memcpy((void*)0x20011400,
         "\x00\x00\x00\x00\x01\x00\x00\x00\x01\x00\x00\x00\x02\x00\x00\x00\=
x28"
         "\x00\x04\x00\x02\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x20\=
x00"
         "\x04\x00\x2e\x2e\x00\x00\x00\x00\x00\x00\x2e\x00\x00\x00\x00\x00\=
x00"
         "\x00\xed\x41\x00\x00\x03\x00\x00\x00\x30\x00\x00\x00\x00\x00\x00\=
x00"
         "\x5c\xf9\x01\x00\x53\x5f\x01\x00\x3a\xc1\x65\x5f\x3a\xc1\x65\x5f\=
x3a"
         "\xc1\x65\x5f\x01\x00\x00\x00\x00\x00\x00\x00",
         96);
  *(uint64_t*)0x20000280 =3D 0x60;
  *(uint64_t*)0x20000288 =3D 0x213fa0;
  *(uint8_t*)0x20011500 =3D 0;
  syz_mount_image(0x20000000, 0x20000100, 0x400000, 6, 0x20000200, 0,
                  0x20011500);
  return 0;
}



Best,
Changming Liu
