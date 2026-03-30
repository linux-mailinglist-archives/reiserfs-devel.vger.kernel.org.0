Return-Path: <reiserfs-devel+bounces-176-lists+reiserfs-devel=lfdr.de@vger.kernel.org>
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HAFAjn9yWnJ3wUAu9opvQ
	(envelope-from <reiserfs-devel+bounces-176-lists+reiserfs-devel=lfdr.de@vger.kernel.org>)
	for <lists+reiserfs-devel@lfdr.de>; Mon, 30 Mar 2026 06:34:01 +0200
X-Original-To: lists+reiserfs-devel@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8603554E6
	for <lists+reiserfs-devel@lfdr.de>; Mon, 30 Mar 2026 06:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9EC1E3004C20
	for <lists+reiserfs-devel@lfdr.de>; Mon, 30 Mar 2026 04:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8860026FA60;
	Mon, 30 Mar 2026 04:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metztli.com header.i=@metztli.com header.b="r4Xw/bbM"
X-Original-To: reiserfs-devel@vger.kernel.org
Received: from payinal.metztli.com (payinal.metztli.com [74.208.129.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB5B1E5724
	for <reiserfs-devel@vger.kernel.org>; Mon, 30 Mar 2026 04:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.208.129.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774844841; cv=none; b=sruvcojBuzzc6NzTpqspr7d0xi90Hp3knTVpeoPuAvTwLbd1TzfXUV7+0m+0DD5dPoFvYdxAAEdfFI0IrvIFZDGu2RD16jiGcYK1cTheX5HOgfH9dC839HtfXIQALqL6GKmb5h3ceeIF5JLu9W7SPkimtSPziC4Cog9vBrXzUjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774844841; c=relaxed/simple;
	bh=4NdygbLIZJlJwks0V6kEQPo6Tg4sxU3TDWSp0APctsU=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=jgJPgW8lE1WH8XgHi8MrYK1zSZfdd6aJo0l35kQe7y0JuPkG/7JOMzKJjpIf7UpaIKcoCt5jVxItGhd5EoAv80Xzj9j2aKxLz5mUvIlIHaTSXDDVKrc0drMXiAn4sTksNAVrCy9ENBr//L2k+4GQpk9+B3/nERoRcGx0AfYPsOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metztli.com; spf=pass smtp.mailfrom=metztli.com; dkim=pass (2048-bit key) header.d=metztli.com header.i=@metztli.com header.b=r4Xw/bbM; arc=none smtp.client-ip=74.208.129.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metztli.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metztli.com
Received: from payinal.metztli.com (localhost [127.0.0.1])
	by payinal.metztli.com (Postfix) with ESMTP id 4fkdKD5p4XzKLVw
	for <reiserfs-devel@vger.kernel.org>; Sun, 29 Mar 2026 21:18:24 -0700 (PDT)
Authentication-Results: payinal.metztli.com (amavis); dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)" header.d=metztli.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=metztli.com; h=
	content-transfer-encoding:content-type:organization:message-id
	:user-agent:references:in-reply-to:subject:to:from:date
	:mime-version; s=dkim; t=1774844304; x=1777436305; bh=4NdygbLIZJ
	lJwks0V6kEQPo6Tg4sxU3TDWSp0APctsU=; b=r4Xw/bbMlkcCaePqL6cLGN3Axq
	CeNwMP4GyFhL2yKkX3MrcnGkB/ur5/pVw+z8OlU1YzKskRzQauXFj4Zs/6zQzIkx
	6nx2cZD5KeAaJmVssi8bN+ho87hdG+hTYtLr047YaSjzqNm5Puqddb6LAplGRAiZ
	J0IExFepQGSCJabURT2bdPSXK+u4wH3HYiKVW7R4Wg5+ScxDhCQNKfvkMjIHYds8
	p5Lb7cq54W1ra2A3SZ8R/OKmvb0HAutrszgiKRRzSw0CJUUeAKmKTOkUp80y5lW5
	9nIDOasaGPUj80eAYXb0f1DcyF0P8GrNNOfmeiq5rWcinhxGefSv44daJ/2w==
X-Virus-Scanned: Debian amavis at payinal.metztli.com
Received: from payinal.metztli.com ([127.0.0.1])
 by payinal.metztli.com (payinal.metztli.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id JYRoDbUiXTL0 for <reiserfs-devel@vger.kernel.org>;
 Sun, 29 Mar 2026 21:18:24 -0700 (PDT)
Received: from metztli.com (localhost [127.0.0.1])
	by payinal.metztli.com (Postfix) with ESMTPSA id 4fkdKD0Xd9zKLVT;
	Sun, 29 Mar 2026 21:18:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: reiserfs-devel@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
List-Subscribe: <mailto:reiserfs-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:reiserfs-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 29 Mar 2026 21:18:23 -0700
From: Jose R Rodriguez <jose.r.r@metztli.com>
To: Marc Haber <mh+debian-boot@zugschlus.de>
Cc: debian-boot@lists.debian.org, dankamongmen@gmail.com,
 edward.shishkin@gmail.com, reiserfs-devel@vger.kernel.org
Subject: Re: Feedback from bigger installations - installer improvment
 potential
In-Reply-To: <ab1Z3cniQvwMWIdd@torres.zugschlus.de>
References: <ab1Z3cniQvwMWIdd@torres.zugschlus.de>
User-Agent: Roundcube Webmail
Message-ID: <653b70650a783fa46f55acc7ab0dec6e@metztli.com>
X-Sender: jose.r.r@metztli.com
Organization: Metztli IT
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [8.85 / 15.00];
	URIBL_BLACK(7.50)[metztli.blog:url];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	R_DKIM_ALLOW(0.00)[metztli.com:s=dkim];
	TAGGED_FROM(0.00)[bounces-176-lists,reiserfs-devel=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,body];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[metztli.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[lists.debian.org,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[metztli.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jose.r.r@metztli.com,reiserfs-devel@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[reiserfs-devel,debian-boot];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[1.000];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 6C8603554E6
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

Sorry I missed, too, your detailed email ;-)

On 2026-03-20 07:29, Marc Haber wrote:
> Hi,
>=20
> =3D me =3D
>=20
> I'm Marc. I have not been present much on debian-boot in the last=20
> decades, but I have been around for a while. I do remember Debian when=20
> d-i was not yet availebl. You might know me as the person taking care=20
> of adduser and sudo.
>=20
> In my other life, I am not only the can-opener for four lovely cats,=20
> but also a freelance IT consultant in Germany. I do quite some work in=20
> larger Linux environments, and customers using Debian get a (small)=20
> discount. My largest (sadly, ex-) customer is running a mid-size=20
> five-digit number of Debian installations, the majority of those on=20
> bare metal.
>=20
> =3D Why this mail =3D
>=20
> First let me thank you to provide d-i. Debian would not be here without=
=20
> you guys providing the way to get Debian on systems and running. But I=20
> am kind of concerned about recent developments in Debian, for example=20
> debian-live growing more and more into "the method to install Debian on=
=20
> Laptop and desktop" recommended in the press, social media and user=20
> groups, leaving d-i as the method to install servers, moving into the=20
> role of a second-class citizen.
>=20
> Whenever I talk with people running mid-size to large numbers of Debian=
=20
> installations, people roll their eyes when one talks about the=20
> Installer, in particular its way to partition disks. I must admit that=20
> I am not partman's best friend either.

A few years back there was an effort to introduce Growlight as a Partman=20
replacement. I even began to experiment by preliminary adding reiser4/5=20
support to Growlight code at the time. Please see old thread:
< https://lists.debian.org/debian-devel/2021/09/msg00401.html >

Additionally, I even created a small video clip taken from an Debian=20
native reiser5 installation into a VirtualBox slice instance which /root=20
was formatted with reiser5 filesystem and showcasing a test Growlight=20
invocation:
<=20
https://metztli.blog/media/blogs/calli/Bullseye-SFRN5/xonecuiltzin-5.13.1=
9-reizer4-sfrn-5.1.3.mp4?mtime=3D1636642043=20
 >

Yet, I do not know what happen to the project as it went silent.=20
Probably the developer of Growlight might be interested in working with=20
you on such an ambitious project[?!]

> Most of those installation don't use d-i to install Debian on their=20
> systems (rolling their own installer or using a golden image to clone=20
> new systems from), and I have seen sites migrate away from Debian=20
> because Anaconda is so much better automatable.
>=20
> The big installation mentioned above is the only larger installation I=20
> have ever been working with who actually uses d-i: They boot d-i from=20
> the network, using a preseed-file that is generated from their CMDB and=
=20
> after installation hand over the system to puppet, using a=20
> 400-or-so-character late_command that made my eyes water. In this=20
> installation, the inflexibility of disk partitioning has been constant=20
> gripe of the other workgroups that end up using the systems installed=20
> by this method. They all want more flexibility. I haven't worked with=20
> them in eight years so I don't know whether they still use this.
>=20
> Myself, I developed my own Debian installation method that involves=20
> booting a live linux=C2=B9 and then running debootstrap and and a numbe=
r of=20
> idempotent scripts. That was before d-i was invented and I just never=20
> got around to migrate to d-i beause my method was still working=20
> reasonably well. Nowadays, I use an ansible playbook to install Debian=20
> (which allows me to reuse code from the normal configuration management=
=20
> that takes care of my Debian systems during their lifecycle). I am=20
> therefore not very familiar with current d-i mechanisms. I do=20
> occasionally use d-i to install Debian on notebooks and desktop=20
> computers that don't run in a datacenter and in installations where=20
> only a handful of Debian systems are in use (or when the customer=20
> explicitly doesn't want automation).
>=20
> =C2=B9 you might remember Linuxcare's Bootable Business Card from the e=
arly=20
> 2000 years, and there is a reason why the first grml-small release had=20
> the codename "Zugschlus" back in - i think - 2005.
>=20
> Whenever I use d-i manually, partman shows up as my nemesis. I don't=20
> think that I ever was able to get partman non-trivial partitioning=20
> right on the first try.
>=20
> I would like to give you input to improve this. Sadly, I neither do=20
> have time nor the knowledge to be of actual help, but I'd like to offer=
=20
> my input, wishlist reports to help you improve and I am also willing to=
=20
> write docs and specs. I might be able to contribute code, but please=20
> don't expect my code to be directly useable. I am way too bad a=20
> programmer for that. But I am willing to test.
>=20
> I'd like to provide input about the following topics.
>=20
> =3D Find preseeding data, make it easy to place preseeding data =3D
>=20
> Preseeding usually means network boot or rolling your own .iso. As far=20
> as I know, if you do neither, you have to give a (network) path to the=20
> preseed file on the boot prompt otherwise. That doesn't scale, and it=20
> is even not nice for just installing a single system. I am wondering=20
> whether you have considered more default places to have the installer=20
> look for preseed files. For example, I'd like to have the following=20
> default places for preseed files in addition to the places where the=20
> installer already looks for:
>  * (any EFI partition on any hdd)/d-i/preseed.cfg
>    * that is likely to already exist or can trivially be pre-created
>  * /d-i/preseed.cfg on the (virtual) cdrom on the second CD-ROM drive
>    * having a second CD-ROM drive is trivially achievable in     =20
> virtualization
>  * /d-i/preseed.cfg on any filesystem carrying a certain label or   =20
> partlabel.
>    * that can be on the target disk as well, or on an USB key, ...
>  * /d-i/preseed.cfg on a second filesystem on the installer .iso
>    * not sure whether this will actually work with an (emulated) cd-rom=
=20
>      drive, but live linuxes use this mechanism on usb boot media to   =
=20
>   allow customization of system boot with an unchanged .iso
> The file names searched for could be mutated using a firmware asset=20
> tag, MAC address prefixes of different length (like PXE clients already=
=20
> do), ISO release numbers, etc bla foo.
>=20
> The installer then could put up a dialog "preseed file foo found on=20
> (path), do you want to use it?" by default. Of course, to facilitate a=20
> fully automated install, there must be a (preseedable) option to=20
> silence this.
>=20
> Gold Plating: If no preseed file was found, the (expert) installer=20
> could put up a dialog "No preseed file found, do you want to enter the=20
> path to one" to allow the user to add a preseed file after missing the=20
> timeout boot prompt (that could also be used as an indicator that the=20
> search for a preseed file failed).
>=20
> =3D verification of preseed files =3D
>=20
> There is the option to add a checksum to the preseed file option. The=20
> fact that md5 is ths only option offered here suggests that this part=20
> hasnt been touched in quite a while. Have there been thoughts of=20
> introducing signed preseed files, putting the public part(s) of key(s)=20
> in there and just processing preseed files that have the right=20
> signature?
>=20
> =3D Kickstart, anyone? =3D
>=20
> Other installers after a manual install leave a file in the installed=20
> system that can directly be used to preseed another installation, which=
=20
> then will run identically to the one that was just finished, just=20
> unattended. Searching for this on the Web suggests that this was left=20
> out of d-i intentionally, but I didn't find the rationale for that. I=20
> one was in charge of a classroom setting with 15 identical machines,=20
> and I would have been really nice be able to tell a tutor "Just do the=20
> install manually on machine 1, and I can then identically repeat the=20
> installation on machines 2-15".
>=20
> The method outlined in the installation manual B.3 is a bit arcane, I=20
> am not very happy about that. There could be a framework to automate=20
> this, probably removing those items that "should not be preseeded".
>=20
> Also the recommendation to use an editor in a running installation to=20
> check for possible options sounds like an excuse. Nobody should be=20
> forced to manually read debconf template files.
>=20
> There could be a framework that reads the templates when the installer=20
> is built and as a corollary generates a nice web page or an .md=20
> document giving the templates and the possible values. Or, the example=20
> preseed file (like=20
> https://www.debian.org/releases/trixie/example-preseed.txt) could be=20
> automatically augmented with the valid values.
>=20
> =3D Which preseed setting corresponds to which question in d-i =3D
>=20
> In addition, I have found it quite hard to see the connection between=20
> the questions that the installer asked and the respective configuration=
=20
> being put into the debconf database. If the Installer would write its=20
> own preseed file instead of referring people to debconf-get-selections=20
> --installer, it would be possible to put the title of the respective=20
> installer dialog in a comment, making it way easier to find out which=20
> answer to the installer dialogs has resulted in this particular preseed=
=20
> option being generated.
>=20
> =3D Interactive Preseed Preparation =3D
>=20
> I would love to have a possibility to run through a virtual installer=20
> inside a running Debian system in a window, and get a preseed file that=
=20
> contains my answers. I could live with running an actual installation=20
> in a VM and having some side-channel into that VM to interactively and=20
> directly see what is being written to the installer's debconf database=20
> without having to change virtual console hundreds of times. Maybe=20
> another virtual serial port that I could attach to would be a good=20
> method.
>=20
> =3D syslog =3D
>=20
> Can the Installer be made to optionally log to syslog once the network=20
> is up? Maybe I could give a syslog=3Dsyslogserver.example.com on the=20
> kernel command line? In an ideal world, dmesg and everything that is=20
> already logged at this time would be (optionally) dumped to the syslog=20
> server at the beginning, and a meaningful host name would be given in=20
> the syslog messages as well.
>=20
> =3D Make early_command easier =3D
>=20
> Would it make sense to automatically search for an=20
> (preseed|partman)/early_command in the same way than it looks for the=20
> preseed file? That might be an easier way to influence installation and=
=20
> partitioning without having to do a full preseed? I guess that it would=
=20
> be easier for many people to just drop a shell script in some=20
> pre-defined place than having to grok the preseeding file format.
>=20
> When this is addressed, a similar process could be used for the=20
> late_command that many installations use to hand over the system to=20
> puppet, ansible or relatives.
>=20
> =3D Partitioning =3D
>=20
> This is a huge issue in Linux installation, always. I have yet to see a=
=20
> Linux installation tool for any distribution that does this as flexibly=
=20
> as big installations want. Most installations that I am aware of that=20
> have rolled their own installation procedure did that because of the=20
> inflexibility of the distribution-provided partitioning tools. This is=20
> probably caused by the fact that partitioning naturally happens before=20
> anything is installed and that a partitioning process therefore is=20
> spartanic at best.
>=20
> I don't expect Debian to be the first distribution to provide a perfect=
=20
> partitioning tool. But I would like to have some methods to=20
> bypass/replace partman while still being able to use Debian Installer=20
> proper.
>=20
> I think there is too much documentation out there that explains how to=20
> use partman. Therefore, partman as it is should stay. While part of me=20
> is all for a rewrite (see above), I would also be happy with=20
> alternative ways to partition for a Debian installation, while still=20
> making it possible to make use of the Installer.
>=20
> =3D=3D early_command =3D=3D
>=20
> I could for example imagine having an early_command (or even a partman=20
> early_command) that does the partitioning in the way I want it.=20
> Probably the easiest way I can imaging would be making partman and the=20
> rest of the Installer assume that if something is mounted on /target at=
=20
> the point when partman gets invoked, that is already the way the system=
=20
> should be installed. That way, partman could (preseedably) ask "do you=20
> want to use /target as already mounted" and if yes, just advance in d-i=
=20
> wihout even doing anything.
>=20
> =3D=3D pre-partition =3D=3D
>=20
> Just in case one is too lazy to write a proper early_command (which=20
> probably must run in busybox with a rather limited userland), the=20
> system could first be booted to a rescue system with more capabilities=20
> to do the partitioning and building the file systems, with a much=20
> simpler early_command that only needs to mount the prepared filesystems=
=20
> once the installer is booted.
>=20
> =3D=3D fstab import =3D=3D
>=20
> Developing the use cases outlined above further leads to the idea of=20
> the preparation system leaving an /etc/fstab file around that the=20
> installer could directly use to mount /target and as /etc/fstab for the=
=20
> installed system. That would completely eliminate the need for an=20
> early_command if partitioning is done before the actual installer is=20
> booted.
>=20
> =3D=3D YAML Import =3D=3D
>=20
> Partman could be extended in a form that allows it to read YAML, which=20
> could be  * pasted into a free-text field of the installer
>  * read from the network
>  * searched for in a similar way like preseed and (early|late)_command
> That YAML input could be pre-crafted or generated to allow the=20
> partitioning to be exactly like people want it, without having to learn=
=20
> partman's preseed partitioning syntax, and without having to live with=20
> partman-auto's limitations.
>=20
> After having written this, I feel that I begin to be a fan of the=20
> early_command approach.
>=20
> That's what I have for you today, I hope that we can discussion the=20
> options and what I missed. Once the discussion is finished, I intend to=
=20
> file wishlist bug requests against the appropraite parts of d-i to=20
> suggest implementation of our results, if feasible.
>=20
> I will join #debian-boot later today and will be available there in the=
=20
> next weeks.
>=20
> Greetings
> Marc

(I am cc'ing the Growlight developer and hope he does not mind.)

--=20
Best Professional Regards.

--
Jose R R
http://metztli.it
-------------------------------------------------------------------------=
--------------------
Download Metztli Reiser4: Debian Trixie w/ Linux 5.17.15-2 AMD64
-------------------------------------------------------------------------=
--------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-------------------------------------------------------------------------=
------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/

