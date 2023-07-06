Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3488B7494A4
	for <lists+reiserfs-devel@lfdr.de>; Thu,  6 Jul 2023 06:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232488AbjGFER1 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Thu, 6 Jul 2023 00:17:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjGFER1 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Thu, 6 Jul 2023 00:17:27 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2115.outbound.protection.outlook.com [40.107.20.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7B3319AB
        for <reiserfs-devel@vger.kernel.org>; Wed,  5 Jul 2023 21:17:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffQ6UG5lHpgtBIqXPwEo4Q/7N5NH9llSN+Q2Zv5kADI2G6Zd6Xqhyg9WUKOgQ/iMt1JOeEQvndKDopBn248UvRKpTO/dBeIjc7GFJ5HvpNCShxf6uDW3KtqzVCf8wHizV4Nc017hINOW40ikxd0uSQePTgf5mHub+g2FKw2OhskxuP3MXZpI6R0NCrHg2EgNOXox9N/nxtRC3XaGz1IPMdmtpnj3/8grUthllkVj4NxZsIUV2bEoZSXsfnarxIn3K+PAh9khXL7sgQyVhuux2ilADJbpKZo1NRLO/0O0hNJdeM3bhV+AYjAVbcvUSRtyjl2rpAKjr7tpt/V76QlcfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2qqGbAUQHB26VidUb/Ntio3HCPsHbc8Yk1a6vThyKw=;
 b=Grx06lvcgR2a/CL4SVkD2qSLllP9l3+EgMM61lPn7tV+IX3Nd/S/1gqrhwXwLn9TtrYH60fPglEOT/UXCS4jz+vSGEzhL3RgiIU2YU5GbPCaNrvcgdm21kVMew5Jm6K66GbkmX68HvVIx8ZxpAqdWtNMu65m1iwfuSOn+oBzTICl48WY7TscbhNrTMAcugdiRMIUvli/1Ov0SUBzCrmiIbtWx62j1faMcx4NX+GfMFi/MaaAJjqC90VsKmSomNG05/LG43bQ1BLMv0tiBrWENnXKaglC5MO3Na2CeujRDJN4bOh1T3Oy+BuTtMHd/GTXe65X4jzu6wAdwmRD4dtVbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2qqGbAUQHB26VidUb/Ntio3HCPsHbc8Yk1a6vThyKw=;
 b=ZNErpjkQ0+409CqXs307S7KSE2dpZGzqG61KuGWQqTCd6z4Cf/2PDjpsa/uZ+1eSmCVXWc39rhzH4FtznHZa6ip+mMopJRXxE07Ss8kkg6FAgVy1gidABUS9GhpWqr0cQVESko29qVeiAp7wwCILG8LnuXJCrkfU2gXI7na950CEIUMO4hTlaYXy/88WE2DfRiuMo3hQPYTo+3k1xk7zI0g1HTqlQKemgAjOq8JXhUdCUiLJQtSUkOXIw+kktqyR24qccnEfFC/tIIT8xlZMWDebZei1E4eBBQ4Lqqq5SyT/NFw1jsB+bx+4xZSBekcnDsvaG2GZMLpnOt1ifl7Kuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3298.eurprd08.prod.outlook.com (2603:10a6:208:5e::31)
 by AS2PR08MB10227.eurprd08.prod.outlook.com (2603:10a6:20b:647::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 04:17:22 +0000
Received: from AM0PR08MB3298.eurprd08.prod.outlook.com
 ([fe80::aa:c32e:533:4c6d]) by AM0PR08MB3298.eurprd08.prod.outlook.com
 ([fe80::aa:c32e:533:4c6d%5]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 04:17:21 +0000
Message-ID: <d5507d3b-d23d-1e3f-4b30-880823a143da@virtuozzo.com>
Date:   Thu, 6 Jul 2023 07:17:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: ru-RU, en-US
To:     reiserfs-devel@vger.kernel.org
From:   Michael Labiuk <michael.labiuk@virtuozzo.com>
Subject: BUG kernel page fault in kernel v6.4+
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: GV3P280CA0047.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::15) To AM0PR08MB3298.eurprd08.prod.outlook.com
 (2603:10a6:208:5e::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR08MB3298:EE_|AS2PR08MB10227:EE_
X-MS-Office365-Filtering-Correlation-Id: 601f4cf7-47de-41b6-b073-08db7dd7e4e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3B+pdWuzRpJ+Y8BGfKNe7os12VMXddeej7snMXR7/RSfEce9WuVnYOBx1Gm5hG+BgEzaJQiAmwkuUkXNehIv3G/G4+uarMhXJ4N3DJ24+PRLt/BAYru27+cOzduA5DHHz2lwDDF3b8vgExRUCvYu11j+rQozeorRsREHumh9woDfinX0vKOpBFSoY040KlyerXqqSTR9m/87p7bO3wHumWo3/J58yvcQI7QRqg3DFfl4ZsyTz1N8v5vzM80XHrhtbRiKA4gv7zfsoBCI8SWSCg75mMNHRkgfcsRpOpErPwfWnvpr3O7IxDm9nNbSTkN9tnPTR9carQyaHx7xC3cb2FT790NmUUMg0iBaTSdZdrstJgauVwSQvY/0c17vK7M8bqSuyl5WUO7ABA1p3vECGC0BQkxU4GXVbpUlPCASE3dKI1HxJR/XfZrcUYtYHpSM/IxG1Ci05t3KVxhHdLxX6M2VSb/fAaIC6Wi+MY5x6jrV7Ro3mMILmOa3o2DSObQaKf6IWxRGdlBbvKUnJJmA2MOY2tKURtTiIJJNBQvA+dAHyhKSHeMnTRKNPURSaUOeXfMPs1WCo88cYhTMkp4wDZ947jwGYfNHO0Bb5EY1+y/wBJAK9JI2wgALz+9oG08V8uYULPMvAoluzYt1JfnVFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3298.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39850400004)(136003)(366004)(346002)(396003)(451199021)(31686004)(2616005)(186003)(38100700002)(6512007)(45080400002)(31696002)(36756003)(66946007)(2906002)(86362001)(6486002)(6916009)(316002)(478600001)(66556008)(66476007)(966005)(6506007)(6666004)(83380400001)(26005)(41300700001)(5660300002)(8936002)(30864003)(8676002)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1ZXV1lGWFZhekNscWlnMXRvNlNJc0dvRWMzdFlXUE5nQ0FQTk5wZFlWNnVy?=
 =?utf-8?B?allTWklEd0pMZ0pYOG45VDRLc3BvaXhpRktUSEI3SlNwVXBZNERRVFR3RTVQ?=
 =?utf-8?B?MkNmTGZtdFc1YlBBN2RxdFAzdms5dm9nZk1nQ0VXOFl0SGJ4UHRFb0dWQ0g4?=
 =?utf-8?B?MU9maDJpMi9na3dHcFkvbm5XZnNLUGhVS04wc0psNzVUbTlvcnFhcjNkQ2FN?=
 =?utf-8?B?b0tZYnVWemRMVXpxNkMzVHNqejB1TVk0U3RoZnNzOXpnOUdKMzhoa0lFck5C?=
 =?utf-8?B?RUppbnA3ZnFrRE9lemhlWUZEUU0vOXpwWVdxMDdlRFp4aHF5U0wxcDB6QjNB?=
 =?utf-8?B?TTU4bWhiektTUW9sYzFCS1B6U2RHaWV4c0JNcDBnN2NPRk44S1BDUG1ON2tZ?=
 =?utf-8?B?WXJkb3QvNlFSaytRZFBBRDhXcTg2WE81TGp1eDE3SUVNdXdDVUNPaE1qYTh4?=
 =?utf-8?B?VTd6emNGVktkY0MwUXlpaThqb3JjdTBvRVhXdUFxTk10Y1g4MnNQRXZFQzl2?=
 =?utf-8?B?b1dvZzI4V0RsM0UzTFcrRTkvSnBQaXg5UEZGbjNzMWQraU5aSDl2YUFySFI2?=
 =?utf-8?B?bmRLTUt6MzEyWm1qbC96dms5RnIwbmtpZ1VFSjhZVnArTzI1bHlHSkFpWG9n?=
 =?utf-8?B?Q2M4NmZMQUFmbzFlcEpmNnFINzJsK056WUU1L0xTTUtzM0hiaEg3SVcxTGJQ?=
 =?utf-8?B?Uk13cGpCU3dLUmhZdEtUU3pGSUJQc1lPKzJxbzNDREo0OHI2UitBTnRXQW1H?=
 =?utf-8?B?OWl2c2ZPdmdMM05vbGZ5Kysvb2ZvM2JNMjRzWEhxcWg2c0RZNjZpaWlSN0tB?=
 =?utf-8?B?QWk2UWl0eXd0LzhTaWRieHY5U3h2VEUzWTFmaUdZb0ttLzB5OWVFT2MzWTRX?=
 =?utf-8?B?N0RaeEMwblNKdlVtdlM1QnN6N1ExUnV5Q2FXL21RNGNlOHJPTmIrSUJNZVcw?=
 =?utf-8?B?bDV6WE9pZGY4dzdyUEF3eVE3S2djRVpkUVgvTjZ4cW9UR3I3MG1OWnRGS2wy?=
 =?utf-8?B?bHJNaDdja2dGUEt4dnpaOEFCazhQa3pFUkdHeEhkam9NQjdxVFBkTHJnOXhy?=
 =?utf-8?B?dnFGZWUvcWpxekxreDFhQkpubENCeEw2Q2FZOVlwYXZnbVdyQXNXWTZKcEwz?=
 =?utf-8?B?KzI3cDUzWnFUTnYwOGpqNTdDVmVZWGc5MFFXQitHZVpiZVorSndSRVEybktX?=
 =?utf-8?B?eVlzNVdrd1MxdnJQY1FmeG5jekIwL00yZmNrdGJiNVVyOUNtSndGL1NGYVZX?=
 =?utf-8?B?b1pSV1NDOWRBeWYxWlQwVjBiQmZCQ1NoZWJqNVFLMW8wektxaTVPN09BcTJW?=
 =?utf-8?B?TmtzVUNQaWRCZHpDSXJrYS81SWNNaFJDcTNBVWU2QUVHbDhLTkJUVWxCb2ZQ?=
 =?utf-8?B?bzRHaTJUdUprc3p5VGhMSndRaHRZN3U5dWMxT0RkRUtnakdFcDVLU2J6WkZJ?=
 =?utf-8?B?L2RmbVRaczhTUlF3dHIrTUtoVGdzc1Ivbkl1TUNjZU5oT2NTNlEvcEhHVWVo?=
 =?utf-8?B?aVRsem1TdFZ0K0V6ZVFzQVpDKzg0RHRiZERIa2pZK1hVU3pHS24zTkc3dnRI?=
 =?utf-8?B?RmFWeXJNK3NhVzQ5UFJyejBDanlYRm9YQkVqWkJvU1VjTldPdmRwWDl2RUhr?=
 =?utf-8?B?dndJYStDb3JudUNwZnlCL05qUGxlR3JWU0RDcWtVWW0yRVFVTVZKWk51Yjcr?=
 =?utf-8?B?NjBaZnZwM0dCeUFyVmdsbnFadzNhc2w0dzJzN1lVSTNXSXBGenhEQ2g3ZkJP?=
 =?utf-8?B?TWVuazM5VnNFcVVlMTRLT0cxejFlakJnUzRUcGZBSTRVbUNONnRIVEdkRWtq?=
 =?utf-8?B?VWJFSTNKWnl2cTZ5dDhHdWxVMWNVbmdpTTVCeWJITzk4T0NFeFpNcStIdmVF?=
 =?utf-8?B?cEZQT04zSWFXSmc5WHcrbmhjdFdUYUtYcWg3ZnhweitrWWZwbE4zQ3BnQkV2?=
 =?utf-8?B?SWVhVEc3ajRsS3FZVUpWSG1xT2ZEaTBMM3YxN3ZEWFFtb1l2U1BUbGQ4eCtK?=
 =?utf-8?B?cFlFbzRaaEhlYVY3ME9mRG05Q3VYazUzQjFMejBsUitGZVdTWkxTZ3EzaWJ6?=
 =?utf-8?B?RDVZM1FBRUNVaUdxZ3EyTzhyTml2QlRmNzBKWDA4alkyNkYwMDIxVTRJV1Q3?=
 =?utf-8?B?OEV5elFSL2V5UlJaaC9XNndhelg1TE9lelplbThRYm1OaVZSWkMzMTY2bVhN?=
 =?utf-8?B?TVE9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 601f4cf7-47de-41b6-b073-08db7dd7e4e3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3298.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 04:17:21.6158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Krq2ALUzeM/h4FWUyV9KwYYfcWrXVS47riojqeSSW9EuEtyTDBCuru7bhLCcQtCBOXQhQHqYTKR9o6yyC3T6Fh6A6lMXe5RV3MPql5sk0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10227
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hello.
I've found issue after update to kernel to 6.4. I am using reiserfs for 
gentoo portage git repository. Kernel 6.4 crashes with high probability 
during git operation like change revision or merging. Many files created 
or deleted between commits in gentoo repository 
https://github.com/gentoo-mirror/gentoo

Unmount may deadlock and filesystem does not  unmount clear after crash. 
reiserfsck will replay journal.


dmesg:

[Mon Jul  3 21:56:04 2023] REISERFS warning:  read_super_block: reiserfs 
filesystem is deprecated and scheduled to be removed from the kernel in 2025
[Mon Jul  3 21:56:04 2023] REISERFS (device dm-1): found reiserfs format 
"3.6" with standard journal
[Mon Jul  3 21:56:04 2023] REISERFS (device dm-1): using ordered data mode
[Mon Jul  3 21:56:04 2023] reiserfs: using flush barriers
[Mon Jul  3 21:56:04 2023] REISERFS (device dm-1): journal params: 
device dm-1, size 8192, journal first block 18, max trans len 1024, max 
batch 900, max commit age 30, max trans age 30
[Mon Jul  3 21:56:04 2023] REISERFS (device dm-1): checking transaction 
log (dm-1)
[Mon Jul  3 21:56:04 2023] REISERFS (device dm-1): Using r5 hash to sort 
names
[Mon Jul  3 21:56:33 2023] ------------[ cut here ]------------
[Mon Jul  3 21:56:33 2023] kernel BUG at fs/reiserfs/journal.c:3039!
[Mon Jul  3 21:56:33 2023] invalid opcode: 0000 [#1] PREEMPT SMP PTI
[Mon Jul  3 21:56:33 2023] CPU: 2 PID: 1165 Comm: git Tainted: G     
U             6.3.0+ #9
[Mon Jul  3 21:56:33 2023] Hardware name: LENOVO 20H9CTO1WW/20H9CTO1WW, 
BIOS N1VET63W (1.53 ) 12/20/2022
[Mon Jul  3 21:56:33 2023] RIP: 0010:do_journal_begin_r+0x36e/0x390 
[reiserfs]
[Mon Jul  3 21:56:33 2023] Code: 00 e8 16 8c d9 f7 8b 93 00 02 02 00 e9 
55 fe ff ff 83 78 08 01 0f 8e 0e fe ff ff 0f 0b 48 89 ef e8 17 a1 ff ff 
e9 0d fd ff ff <0f> 0b e8 1b 7c 29 f7 48 89 83 80 00 00 00 e9 b4 fe ff 
ff e8 ba 16
[Mon Jul  3 21:56:33 2023] RSP: 0018:ffff9e7603a57ad8 EFLAGS: 00010293
[Mon Jul  3 21:56:33 2023] RAX: 0000000000000400 RBX: ffff9e7601c59000 
RCX: 0000000000000000
[Mon Jul  3 21:56:33 2023] RDX: 00000000168750d6 RSI: ffffffffc0aa49ab 
RDI: 0000000000000000
[Mon Jul  3 21:56:33 2023] RBP: ffff91689d77c000 R08: 0000000000000000 
R09: 0000000000000000
[Mon Jul  3 21:56:33 2023] R10: 0000000000000000 R11: 0000000000000000 
R12: 00000000168750d6
[Mon Jul  3 21:56:33 2023] R13: 0000000000000000 R14: ffff9168af921900 
R15: 00000000168750d6
[Mon Jul  3 21:56:33 2023] FS:  00007f00daa6d740(0000) 
GS:ffff916bd0700000(0000) knlGS:0000000000000000
[Mon Jul  3 21:56:33 2023] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[Mon Jul  3 21:56:33 2023] CR2: 00007f00b224834b CR3: 0000000154fb2004 
CR4: 00000000003706e0
[Mon Jul  3 21:56:33 2023] Call Trace:
[Mon Jul  3 21:56:33 2023]  <TASK>
[Mon Jul  3 21:56:33 2023]  ? kmem_cache_alloc_lru+0x2ad/0x560
[Mon Jul  3 21:56:33 2023]  ? reiserfs_alloc_inode+0x1e/0x80 [reiserfs]
[Mon Jul  3 21:56:33 2023]  journal_begin+0x79/0x140 [reiserfs]
[Mon Jul  3 21:56:33 2023]  reiserfs_create+0x134/0x280 [reiserfs]
[Mon Jul  3 21:56:33 2023]  ? generic_permission+0x35/0x240
[Mon Jul  3 21:56:33 2023]  ? _raw_spin_lock+0x13/0x40
[Mon Jul  3 21:56:33 2023]  path_openat+0xe18/0x10b0
[Mon Jul  3 21:56:33 2023]  do_filp_open+0xb4/0x160
[Mon Jul  3 21:56:33 2023]  ? __check_object_size+0x25d/0x2d0
[Mon Jul  3 21:56:33 2023]  ? _raw_spin_unlock+0x12/0x40
[Mon Jul  3 21:56:33 2023]  do_sys_openat2+0xa3/0x160
[Mon Jul  3 21:56:33 2023]  __x64_sys_openat+0x6a/0xa0
[Mon Jul  3 21:56:33 2023]  do_syscall_64+0x58/0x90
[Mon Jul  3 21:56:33 2023]  ? syscall_exit_to_user_mode+0x1d/0x50
[Mon Jul  3 21:56:33 2023]  ? __x64_sys_close+0xd/0x50
[Mon Jul  3 21:56:33 2023]  ? do_syscall_64+0x67/0x90
[Mon Jul  3 21:56:33 2023]  ? __rseq_handle_notify_resume+0x36f/0x4f0
[Mon Jul  3 21:56:33 2023]  ? fpregs_assert_state_consistent+0x28/0x60
[Mon Jul  3 21:56:33 2023]  ? exit_to_user_mode_prepare+0x44/0x170
[Mon Jul  3 21:56:33 2023]  ? syscall_exit_to_user_mode+0x1d/0x50
[Mon Jul  3 21:56:33 2023]  ? do_syscall_64+0x67/0x90
[Mon Jul  3 21:56:33 2023]  ? fpregs_restore_userregs+0x9/0xf0
[Mon Jul  3 21:56:33 2023]  ? exit_to_user_mode_prepare+0x13d/0x170
[Mon Jul  3 21:56:33 2023] entry_SYSCALL_64_after_hwframe+0x72/0xdc
[Mon Jul  3 21:56:33 2023] RIP: 0033:0x7f00dab63a40
[Mon Jul  3 21:56:33 2023] Code: 44 8b 54 24 40 75 93 44 89 54 24 0c e8 
89 d4 f8 ff 41 89 c0 44 8b 54 24 0c 89 da 48 89 ee bf 9c ff ff ff b8 01 
01 00 00 0f 05 <48> 3d 00 f0 ff ff 77 38 44 89 c7 89 44 24 0c e8 dc d4 
f8 ff 8b 44
[Mon Jul  3 21:56:33 2023] RSP: 002b:00007fffb0836d90 EFLAGS: 00000293 
ORIG_RAX: 0000000000000101
[Mon Jul  3 21:56:33 2023] RAX: ffffffffffffffda RBX: 00000000000000c1 
RCX: 00007f00dab63a40
[Mon Jul  3 21:56:33 2023] RDX: 00000000000000c1 RSI: 000055e1a8ab7fd0 
RDI: 00000000ffffff9c
[Mon Jul  3 21:56:33 2023] RBP: 000055e1a8ab7fd0 R08: 0000000000000000 
R09: 0000000000000000
[Mon Jul  3 21:56:33 2023] R10: 00000000000001b6 R11: 0000000000000293 
R12: 0000000000000000
[Mon Jul  3 21:56:33 2023] R13: 0000000000008000 R14: 00007f0092894670 
R15: 0000000000000000
[Mon Jul  3 21:56:33 2023]  </TASK>
[Mon Jul  3 21:56:33 2023] Modules linked in: reiserfs snd_seq_dummy 
snd_hrtimer snd_seq snd_seq_device dm_crypt encrypted_keys 
algif_skcipher snd_hda_codec_hdmi sch_fq_codel snd_ctl_led 
snd_hda_codec_realtek snd_hda_codec_generic btusb btintel uvcvideo uvc 
videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_common 
videodev mc uas usb_storage iwlmvm intel_tcc_cooling 
x86_pkg_temp_thermal kvm_intel mac80211 intel_xhci_usb_role_switch kvm 
libarc4 snd_hda_intel snd_intel_dspcfg snd_hda_codec xhci_pci mei_hdcp 
snd_hwdep iwlwifi xhci_hcd snd_hda_core mei_pxp irqbypass crc32_pclmul 
crc32c_intel polyval_clmulni polyval_generic thinkpad_acpi 
ghash_clmulni_intel tpm_crb ucsi_acpi sha512_ssse3 snd_pcm ledtrig_audio 
typec_ucsi snd_timer mei_me aesni_intel usbcore crypto_simd typec 
tpm_tis platform_profile i2c_hid_acpi cfg80211 e1000e cryptd mei snd 
tpm_tis_core usb_common intel_pch_thermal roles soundcore tpm i2c_hid 
i915 wmi_bmof think_lmi firmware_attributes_class intel_wmi_thunderbolt 
i2c_algo_bit cec drm_buddy video wmi
[Mon Jul  3 21:56:33 2023]  drm_display_helper ttm drm_kms_helper zram 
zsmalloc syscopyarea sysfillrect sysimgblt msr fuse dm_mod configfs 
efivarfs dmi_sysfs
[Mon Jul  3 21:56:33 2023] ---[ end trace 0000000000000000 ]---
[Mon Jul  3 21:56:33 2023] RIP: 0010:do_journal_begin_r+0x36e/0x390 
[reiserfs]
[Mon Jul  3 21:56:33 2023] Code: 00 e8 16 8c d9 f7 8b 93 00 02 02 00 e9 
55 fe ff ff 83 78 08 01 0f 8e 0e fe ff ff 0f 0b 48 89 ef e8 17 a1 ff ff 
e9 0d fd ff ff <0f> 0b e8 1b 7c 29 f7 48 89 83 80 00 00 00 e9 b4 fe ff 
ff e8 ba 16
[Mon Jul  3 21:56:33 2023] RSP: 0018:ffff9e7603a57ad8 EFLAGS: 00010293
[Mon Jul  3 21:56:33 2023] RAX: 0000000000000400 RBX: ffff9e7601c59000 
RCX: 0000000000000000
[Mon Jul  3 21:56:33 2023] RDX: 00000000168750d6 RSI: ffffffffc0aa49ab 
RDI: 0000000000000000
[Mon Jul  3 21:56:33 2023] RBP: ffff91689d77c000 R08: 0000000000000000 
R09: 0000000000000000
[Mon Jul  3 21:56:33 2023] R10: 0000000000000000 R11: 0000000000000000 
R12: 00000000168750d6
[Mon Jul  3 21:56:33 2023] R13: 0000000000000000 R14: ffff9168af921900 
R15: 00000000168750d6
[Mon Jul  3 21:56:33 2023] FS:  00007f00daa6d740(0000) 
GS:ffff916bd0700000(0000) knlGS:0000000000000000
[Mon Jul  3 21:56:33 2023] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[Mon Jul  3 21:56:33 2023] CR2: 00007f00b224834b CR3: 0000000154fb2004 
CR4: 00000000003706e0


Sometimes page fault occurs immediately in do_filp_open+0xb4/0x160


I've bisected between 6.3 and 6.4-rc1 and found commit:

git bisect start
# status: waiting for both good and bad commits
# good: [a5624566431de76b17862383d9ae254d9606cba9] Merge branch 'x86-rep-insns': x86 user copy clarifications
git bisect good a5624566431de76b17862383d9ae254d9606cba9
# status: waiting for bad commit, 1 good commit known
# bad: [4a4075ada6a5f51087d6c046b024046bf3864beb] Merge tag 'locktorture.2023.04.04a' of git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu
git bisect bad 4a4075ada6a5f51087d6c046b024046bf3864beb
# bad: [1a0beef98b582b69a2ba44e468f7dfecbcfab48e] Merge tag 'tpmdd-v6.4-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd
git bisect bad 1a0beef98b582b69a2ba44e468f7dfecbcfab48e
# bad: [08e30833f86ba25945e416b9f372791aacfef153] Merge tag 'lsm-pr-20230420' of git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm
git bisect bad 08e30833f86ba25945e416b9f372791aacfef153
# good: [e261301c851aee401cfc63179ca4d3facd2f098b] lsm: move the remaining LSM hook comments to security/security.c
git bisect good e261301c851aee401cfc63179ca4d3facd2f098b
# bad: [d82dcd9e21b77d338dc4875f3d4111f0db314a7c] reiserfs: Add security prefix to xattr name in reiserfs_security_write()
git bisect bad d82dcd9e21b77d338dc4875f3d4111f0db314a7c
# good: [42994ee3cd7298b27698daa6848ed7168e72d056] security: Introduce LSM_ORDER_LAST and set it for the integrity LSM
git bisect good 42994ee3cd7298b27698daa6848ed7168e72d056
# bad: [52ca4b6435a493e47aaa98e7345e19e1e8710b13] reiserfs: Switch to security_inode_init_security()
git bisect bad 52ca4b6435a493e47aaa98e7345e19e1e8710b13
# good: [b9b8701b43146f5ebd7fe13d89103cfc545cda34] security: Remove integrity from the LSM list in Kconfig
git bisect good b9b8701b43146f5ebd7fe13d89103cfc545cda34
# first bad commit: [52ca4b6435a493e47aaa98e7345e19e1e8710b13] reiserfs: Switch to security_inode_init_security()

commit 52ca4b6435a493e47aaa98e7345e19e1e8710b13
Author: Roberto Sassu <roberto.sassu@huawei.com>
Date:   Tue Mar 14 09:17:15 2023 +0100

     reiserfs: Switch to security_inode_init_security()
     
     In preparation for removing security_old_inode_init_security(), switch to
     security_inode_init_security(). Commit 572302af1258 ("reiserfs: Add missing
     calls to reiserfs_security_free()") fixed possible memory leaks and another
     issue related to adding an xattr at inode creation time.
     
     Define the initxattrs callback reiserfs_initxattrs(), to populate the
     name/value/len triple in the reiserfs_security_handle() with the first
     xattr provided by LSMs. Make a copy of the xattr value, as
     security_inode_init_security() frees it.
     
     After the call to security_inode_init_security(), remove the check for
     returning -EOPNOTSUPP, as security_inode_init_security() changes it to
     zero.
     
     Multiple xattrs are currently not supported, as the
     reiserfs_security_handle structure is exported to user space. As a
     consequence, even if EVM is invoked, it will not provide an xattr (if it
     is not the first to set it, its xattr will be discarded; if it is the
     first, it does not have xattrs to calculate the HMAC on).
     
     Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
     Reviewed-by: Casey Schaufler <casey@schaufler-ca.com>
     Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
     Signed-off-by: Paul Moore <paul@paul-moore.com>

  fs/reiserfs/xattr_security.c | 23 ++++++++++++++++++-----
  1 file changed, 18 insertions(+), 5 deletions(-)



Thanks,
Michael

