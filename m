Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39318298A8E
	for <lists+reiserfs-devel@lfdr.de>; Mon, 26 Oct 2020 11:41:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1769652AbgJZKly (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 26 Oct 2020 06:41:54 -0400
Received: from mail7.static.mailgun.info ([104.130.122.7]:16382 "EHLO
        mail7.static.mailgun.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1769589AbgJZKlx (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 26 Oct 2020 06:41:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1603708912; h=From: Date: Message-Id: To: Subject: Sender;
 bh=ITigBUdYGDFHK24+Rc32x5xA0Nff6fIJ4jxNkCjtyHA=; b=KlwkTyep5pTcnLGH3ttHpFK5SGkWr+CTQwjS/Th9S1YiDxDv5IHTSjZ1GmM8utplbKqXJTIg
 wTBL7Zjm3cFvJnl6hqjHdn9AnptCXUVMI/C7PelYGPUrxFw6zupj2lQQSmyravNF3IXvci+l
 BCY0z2/agpUFg6DPc9ttBQkNRgc=
X-Mailgun-Sending-Ip: 104.130.122.7
X-Mailgun-Sid: WyIxM2M2YSIsICJyZWlzZXJmcy1kZXZlbEB2Z2VyLmtlcm5lbC5vcmciLCAiMTdiNTQiXQ==
Received: from huitzilopochtli.metztli-it.com
 (99-130-254-3.lightspeed.sntcca.sbcglobal.net [99.130.254.3]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f96a7f01e4642bf75a36d74 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Mon, 26 Oct 2020 10:41:52 GMT
Sender: jose.r.r=metztli.com@mixtli.metztli.it
Received: by huitzilopochtli.metztli-it.com (Postfix, from userid 1000)
        id 199566FB9182; Mon, 26 Oct 2020 03:42:12 -0700 (PDT)
Subject: Re: PROBLEM: Reiser4 hard lockup
To:     <Hgntkwis@vfemail.net>, <edward.shishkin@gmail.com>,
        <linux-kernel@vger.kernel.org>, <reiserfs-devel@vger.kernel.org>
X-Mailer: mail (GNU Mailutils 3.9)
Message-Id: <20201026104213.199566FB9182@huitzilopochtli.metztli-it.com>
Date:   Mon, 26 Oct 2020 03:42:12 -0700 (PDT)
From:   Metztli Information Technology <jose.r.r@metztli.com>
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Sun, Oct 25, 2020 at 6:10 PM David Niklas <Hgntkwis@vfemail.net> wrote:
>
> I'll reply to both of you in this email.
>
> On Sun, 25 Oct 2020 02:04:22 -0700 (PDT)
> Metztli Information Technology <jose.r.r@metztli.com> wrote:
> > Niltze, David-
> >
> > A few observations are in order below:
> >
> > On Sat, Oct 24, 2020 at 1:39 PM David Niklas <Hgntkwis@vfemail.net>
> > wrote:
> > >
> > > Hello,
> > >
> <snip>
> > reiser4progs 1.1.x Software Framework Release Number (SFRN) 4.0.1 file
> > system utilities should not be used to check/fix media formatted 'a
> > priori' in SFRN 4.0.2 and vice-versa.
>
> Honestly, this is the first time I've heard about a Linux FS having
> versioning other than a major one (NTFS IIRC is infamous for it's
> incompatibilities).
>
> <snip>
>
> > Conclusion: I suggest you read up on the published reiser4
> > documentation and build *both* your kernel and reiser4progs utilities
> > conforming to the more recent stable SFRN 4.0.2.
>
> I religiously read the reiser4 documentation prior to changing my FS. No
> where do I recall seeing, on the wiki, or in the man pages, that there
> was a need to use a newer reiser4 progs.
> Ok, here it is:
> https://reiser4.wiki.kernel.org/index.php/Reiser4_development_model
> I'm not normally going to read a page that looks like it's for developers
> as an end user which is why I didn't initially read it.
>
> > Prior to build reiser4progs 1.2.1 SFRN 4.0.2:
> > libaal-1.0.7.tar.gz
> > < https://sourceforge.net/projects/reiser4/files/reiser4-utils/ >
> >
> > then build reiser4progs-1.2.1.tar.gz SFRN 4.0.2
> > <
> > https://sourceforge.net/projects/reiser4/files/reiser4-utils/reiser4progs/
> > >
> >
> > as any reiser4 patches for kernel 4.14 and higher conform to SFRN 4.0.2:
> > https://sourceforge.net/projects/reiser4/files/reiser4-for-linux-5.x/
> >
> > citing, for the third time, reference email documenting the change,
> > i.e. '2017-11-26 23:01:53 reiser4 SFRN 4.0.2 is not your father's
> > reiser4 SFRN 4.0.1' <
> > https://marc.info/?l=reiserfs-devel&m=151173731709826&w=2 >
> >
> > If you are going to use reiser4 kernel patches for linux 4.15.xy -
> > 5.4.5 range, please make sure to *also* apply: [PATCH] reiser4: prevent
> > system lockups: <
> > https://marc.info/?l=reiserfs-devel&m=158086248927420&w=2 >
> <snip>
>
> I was using 5.7.13 at the time. Should the crashes still be happening
> because this patch is missing? 
Only
"If you are going to use reiser4 kernel patches for linux 4.15.xy -  5.4.5 range,"

> It seems odd you'd mention it knowing
> which kernel version I was using.

I have to be proactive and anticipate a potential decision to use a lower version ;-)

i.e., I am really baffled at how you were using reiser4 SFRN 4.0.2 patch for linux 5.7.13 -- yet built and were using old reiser4progs 1.1.x SFRN 4.0.1 :)

It is not as if there were not reiser4 resources out there. One of the reasons I make available a reiser4 hack of Debian netboot ISOs on SourceForge is to provide some sort of reference implementation.

If you do not like/trust the Debian metaframework OS hack installed onto your computer, fair, as you can only use the bootable iso to execute the commands suggested elsewhere by Ed to find out the proper SFRN and/or versions of the kernel and reiser4progs utilities which your *own* build might strive to match.

>
>
> On Sun, 25 Oct 2020 13:50:15 +0100
> Edward Shishkin <edward.shishkin@gmail.com> wrote:
> > On 10/24/2020 10:36 PM, David Niklas wrote:
> > > Hello,
> > >   
> >
> > Hi David,
> >
> > Thanks for the comprehensive report, which is definitely useful!
> > Below you can find some hints and comments.
> >
>
> (:
>
> <snip>
> >
> > It's a pity..
> > To be honest, I received complaints that reiser4 doesn't make
> > a friendship with torrents long time ago. Unfortunately, I am in Europe,
> > where it is impossible to use torrents that simply, without conflicts
> > with local legislation. Respectively, I am not able to reproduce it,
> > and the problem is still unfixed..
> >
> I might try to reproduce this later and log the actual write patterns so
> you can reproduce these crashes. Obviously, I'll have to learn how to
> first.
>
> <snip>
> > reiser4 mount option "dont_load_bitmap" is your friend.
>
> I knew about that, but I'm uncertain if it would change how reiser4 works
> and then it will not cause the crash.
>
> > > I had also to manually chew through all the kernel .o files to find
> > > where the kernel broke at (also attached).
> > >
> > > The command I used to create the reiser4 FS was:
> > > mkfs.reiser4 -o
> > > create=reg40,fibration=ext_3_fibre,hash=r5_hash,key=key_large,node=node40,compress=lzo1,compressMode=conv /dev/md7p1
> > > I wanted to use reg40 as opposed to ccreg40 because I wanted an
> > > unencrypted partition. 
> >
> >
> > You got confused. Reiser4 doesn't support encryption without special
> > patches (which are not public). With "create=reg40" you get a "classic"
> > setup without compression.
> >
> > There is a "getting started" page, which provides some recommendations
> > on reiser4 mkfs and mount options:
> > https://reiser4.wiki.kernel.org/index.php/Reiser4_Howto
>
> Ah, I read that page 4 times but thought it out of date because the
> plugin description said something else.
>
> > > Likewise, I changed the fibration to ext_3_fibre
> > > from ext_1_fibre. Other then that, everything is set to it's defaults.
> > > Interestingly, if I try to set the key to short and change the mode to
> > > tea (a time compute trade off AFAIK), I crashes mkfs.reiser4.
> > > I need to report this to the developers. 
> >
> > Short keys is an exotic option (are you restricted in disk space?).
>
> Quite the contrary, I wanted an excuse to try using tea. IDK what the key
> lengths are (I've been really curious about that), but I decided to try
> using tea and short hashes as a fun exercise as a time/compute trade off.
>
> > But that crash needs to be fixed, of course. I'll create a ticket.
>
> Nice!
>
> > > When trying to remount the FS after this crash I got an error from
> > > fsck that I needed to rebuild the super block. Considering that all
> > > transactions are atomic, this was quite a surprise to me.
> > > This failed because the format version was somehow greater than my
> > > tools version. 
> >
> >
> > Absolutely.
> >
> > SFRN (Software Framework Release Number) of your tools is 4.0.1.
> > SFRN of your reiser4 module is 4.0.2.
> > Right after formatting your partition had format 4.0.1.
> > After mounting to the kernel of greater SFRN, it was automatically
> > upgraded to 4.0.2, so you are not able to check that partition with
> > fsck of smaller SFRN anymore. All you needed was to upgrade your
> > reiser4progs.
> >
> > More about compatibility is here:
> > https://reiser4.wiki.kernel.org/index.php/Reiser4_development_model
>
> Ah! I wondered how I could create an FS that had a larger version than my
> tools.
>
>
> > > One thing that was quite interesting about this is that the Linux
> > > kernel said I needed to upgrade my disk format of reiser 4.
> > > Sep 19 04:21:16 Phenom-II-x6 kernel: [   37.113970][ T2122]
> > > Loading Reiser4 (format release: 4.0.2) See www.namesys.com for a
> > > description of Reiser4.
> > > Sep 19 04:21:16 Phenom-II-x6 kernel: [   37.132956][ T2121]
> > > reiser4: md7p1: found disk format 4.0.2.
> > > Sep 19 04:21:16 Phenom-II-x6 kernel: [   37.133792][ T2121]
> > > reiser4: md7p1: use 'fsck.reiser4 --fix' to complete disk format
> > > upgrade.
> >
> >
> > It is expected, since you mounted partition 4.0.1 by reiser4 module
> > 4.0.2. No hurry to complete disk format upgrade. It is needed by fsck
> > only.
>
> So the upgrade was only partial?
>
> > > IDR If I tried to issue the above recommended command.
> > >
> > >
> > > Overall, after over a decade of development, I had hoped that reiser4
> > > would prove to be a fast, space efficient, and stable FS. 
> >
> >
> > So, as I understand, the only problem is stability?
> > What can I say... We are not enterprise. We are like the upstream
> > vanilla kernel, which can always be corrupted in some configuration
> > under a specific workload, despite 30 years(!) of development history.
> > Motivation to fix bugs is driven mostly by users and their bug reports
> > (similar to ones that you have provided)..
>
> I know. I know. It's just after reading several months of emails from the
> LKML where Hans goes on and on about how wonderfully stable it is and
> every bug is quickly quashed, I thought it would be as stable as a
> boulder.
> And using ext3 as a baseline didn't help either. (:
>
I have not noticed 'ext3 as a baseline' since reiser4 is an extensible file system framework. Updating the Unix plugin (i.e. module) is how Ed has been able to update the SFRN:
"Despite the name, this file system is written from scratch, although it inherited some features of its 'ideological' predecessor – reiserfs.

As well as implementing the traditional Linux filesystem functions, reiser4 provides users with a number of additional features: transparent compression and encryption of files, full data journaling (implemented only in ext3 [at that time]), as well as almost unlimited (with the help of plug-in architecture) extensibility, i.e. the ability to adapt to arbitrarily complex end user requirements. However, there is currently no support for direct IO (work has begun on implementation), quotas, and POSIX ACL."

The Design of Reiser4
< https://metztli.blog/amatl/reiser-nahui/reiser4-design >

Whenever I am provisioned a remote server and *that* ext[x] file system is imposed on (denying me the GNU freedom to choose my own file system ;-) I've always reformatted the root and data partitions to reiser4 SFRN 4.0.2

I have even published a couple of blogs on how I achieved that when the hosting provider does not offer physical/virtual CD/VD device by using a second storage media device as a temporary placeholder for my reiser4 netboot ISO image from where to boot the remote installation.
> <snip>
> > Thanks again for the report.
> > Once we fix the problem with torrents, we'll let you know..
> >
> > Edward.
>
>
> Thanks,
> David
I suggest you use this list for further communication as pretending to wear an 'invisibility cloak' under cryptic email name/domains elsewhere is essentially pointless: 'Murica's Stasi...er, NSA, is being fed data 24/7 from her fascist Five Eyes vassals, thus anyone's pretensions at privacy are largely 'child's play' for them, eh Google? ;-)

Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Buster w/ Linux 5.7.19 AMD64
---------------------------------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-------------------------------------------------------------------------------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/
