Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB6C72A2ED
	for <lists+reiserfs-devel@lfdr.de>; Sat, 25 May 2019 06:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbfEYE41 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sat, 25 May 2019 00:56:27 -0400
Received: from mail7.static.mailgun.info ([104.130.122.7]:61572 "EHLO
        mail7.static.mailgun.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbfEYE40 (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sat, 25 May 2019 00:56:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1558760182; h=From: Date: Message-Id: To: Subject: Sender;
 bh=EeExCq4EgGO1gZC02X4qVhpiTBJLFCaJ8TMgjZZAkME=; b=h1AGcFzehot0ZVOpghybfRnTpsdBLfd/xl/+fYYt5An1L4Vum779Ucf3LInCH/oUaMnDS7ao
 4HSTu95v3/J3BGamms/AJrOepUPbO7ZF33BBLiAuJ2oBkQBXgkqmPcID/jaOUehGgDvYv8M4
 GK4LsqADwqbl4y5PNI9T+iw0/S0=
X-Mailgun-Sending-Ip: 104.130.122.7
X-Mailgun-Sid: WyIxM2M2YSIsICJyZWlzZXJmcy1kZXZlbEB2Z2VyLmtlcm5lbC5vcmciLCAiMTdiNTQiXQ==
Received: from huitzilopochtli.metztli-it.com (99-130-254-3.lightspeed.sntcca.sbcglobal.net [99.130.254.3])
 by mxa.mailgun.org with ESMTP id 5ce8caf1.7f334d2fbae0-smtp-out-n02;
 Sat, 25 May 2019 04:56:17 -0000 (UTC)
Received: by huitzilopochtli.metztli-it.com (Postfix, from userid 1000)
        id ABDC73C5C02A; Fri, 24 May 2019 21:56:16 -0700 (PDT)
Subject: Re: bug#22113: PATCH: Updated Reiser4 probe enabled against GNU Parted git://git.sv.gnu.org/parted.git
To:     <usr.src.linux@gmail.com>, <edward.shishkin@gmail.com>,
        <reiserfs-devel@vger.kernel.org>, <22113@debbugs.gnu.org>,
        <bcl@redhat.com>
X-Mailer: mail (GNU Mailutils 3.1.1)
Message-Id: <20190525045616.ABDC73C5C02A@huitzilopochtli.metztli-it.com>
Date:   Fri, 24 May 2019 21:56:16 -0700 (PDT)
From:   jose.r.r@metztli.com (Metztli Information Technology)
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org


On Fri, May 24, 2019 at 4:03 PM Harry Duncan <usr.src.linux@gmail.com> wrote:
>
>
>
> On Fri, May 24, 2019 at 11:02 PM Metztli Information Technology <jose.r.r@metztli.com> wrote:
>>
>>
>>
>> On Fri, May 24, 2019 at 7:46 AM Edward Shishkin <edward.shishkin@gmail.com> wrote:
>> >
>> > On 05/24/2019 01:05 AM, Metztli Information Technology wrote:
>> > > Niltze [Hello]-
>> > >
>> > > Just updated Reiser for patch against GNU Parted
>> > > git clone git://git.sv.gnu.org/parted.git
>> >
>> > Uh, it is in upstream already?
>> LOL, no.
>>
>> I just followed Debian maintainer's original advice on updating patch against git branch of GNU Parted.
>> < https://marc.info/?l=reiserfs-devel&m=155865303620491&w=2 >
>>
>> > Someone must have died ...
>
>
> Or someone was perhaps convicted of second degree murder after a plea deal for revealing the location of his wife's corpse. 

umh...  why cherry pick? Below is reprint of complementary argument you are omitting:

I just wonder if now that 'Big Blue' acquired Red Hat, the GNU Parted gatekeeper will act in a consistent
manner and quit his employer on 'ethical and moral' grounds in light of Watson's complicity tainting the company.
< https://russia-insider.com/en/head-ibm-sympathized-hitler-conducted-census-jews-preparation-camps-russian-tv-news/ri26587 >
< https://youtu.be/tCBT8H47sZ0 >
(and/or "Democracy For The Few" by Michael Parenti).

i.e., "...I have absolutely
no desire to see [IBM]'s work or name do anything but disappear into
obscurity."
< http://lists.gnu.org/archive/html/bug-parted/2015-12/msg00008.html >

Well, maybe I quoted him too soon. Unlike Reiser, who is down and dirt-poor and thus all the West 'morally and ethically righteous' developers kick and pile 
scorn onto, 'Big Blue's wealth quells USA technology ecosystem and their employees' ethical and moral sophistry, as is evidenced by, say no issues with JFS,
for instance.

> ReiserFS wasn't production quality when it was mainstream, ie. its own filessystem check tools were incapable of repairing a filesystem that was improperly closed under the majority of scenarios.

The topic is Reiser4 different technology and thus different beast than ReiserFS. Apropos, hang issues and corruption are prevalent in BtrFS and ext4,
i.e., for a couple of instances,
< https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=908216 >
< https://www.phoronix.com/scan.php?page=news_item&px=EXT4-Linux-4.19-Corruption >

 > I'd strongly suggest whatever your need is for this filesystem, re-evaluate your position.
thus your advice should be directed at the 'ethically and morally righteous' maintainers of those filesystems.
With all its quirks and issues, Reiser4 is a different beast which has not corrupted any of my data during my several years of daily use in Google Cloud images
as well as in remote bare metal servers and/or my local development environment(s) where I develop my kernels and installers.

Accordingly, and with all due respect, I don't request sanctimonious crap from mudslingers.


Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Stretch w/ Linux 5.0.15 AMD64
---------------------------------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-------------------------------------------------------------------------------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/
