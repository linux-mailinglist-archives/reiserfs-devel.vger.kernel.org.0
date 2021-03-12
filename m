Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46D2B339777
	for <lists+reiserfs-devel@lfdr.de>; Fri, 12 Mar 2021 20:37:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234256AbhCLTg4 (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 12 Mar 2021 14:36:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233407AbhCLTgY (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 12 Mar 2021 14:36:24 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB510C061574
        for <reiserfs-devel@vger.kernel.org>; Fri, 12 Mar 2021 11:36:23 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id c131so26514754ybf.7
        for <reiserfs-devel@vger.kernel.org>; Fri, 12 Mar 2021 11:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=65E4h54/Ffn1yUoq5KkFEnpBoleESy6EUfah9Q4U0VM=;
        b=JET/fQborEmcSTb2XYu3hZrB5n9oH0HaTBSUirLai0IMxwVN6ufjXUlUCh33RFC9na
         NrlPHslGtnqI07ZA0zmw4LvSVTV+g8ZoqDu8w6kUbhgPi8c1Q10uwfUOTyWpLlxR4dkR
         HgCxYZXZtdeXgfYmUVyTThBlDIWNBWi7nbQ/RdFzg4hwRelz3FgYH5TQ1Lldzyogsxug
         FmCN2YygH/meOhLrBJjkgQLNYDrYNTF3rDttPbOfvW8ECn0ejQ1AcZ52a85y/ePIvqGQ
         D61qYiITkUIR3gr7Jo6Ae4pX3M+lVz50prAY6jqEYo7Q2SogSrqIirYTN7Ge43Ow+coY
         rW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=65E4h54/Ffn1yUoq5KkFEnpBoleESy6EUfah9Q4U0VM=;
        b=gSoAbxI8ZR3HmA3SmmAcDjsrIzRDs5yMBNykxBdAcd5ruGOPhxSh9t7i4s92rXFOGu
         Fg7FnsjsPHJpiOyiIQLT3IAZXToUwxTOYQgHdkWTCaiprzSWJIXF/v3Hb/Ez5nJgcNfr
         osLpDk9hTBpYaugAs74rFHdh5gljbjbEKaCgnep3Xnkpr5IpYFwlI4L8e1nkJr5T69Cq
         5WFLjEKaefO2TEtHzLQEwA1LZtVPOyionktPpoBc9DPs6MXbhFe2ygqk8sFKdvjT5m2T
         ar4ihvjspvKOHPslHle7OhRfoEB172qX87grtiEi35y56vqHNIjaPDOFDlEvDdBnXpwS
         uJZA==
X-Gm-Message-State: AOAM533vvZpR/jG4YfMyEzsgn7F36/BuWpmPC0Scuz2e7ZKVsoZoZcF4
        n0lA7OgBhasu85MhDJPTc7BfQxtkzSpf0FYgXELtoLdGj1PyIA==
X-Google-Smtp-Source: ABdhPJxSQafQmyX92F+9oFuglltLhh8uYkyFumLc3/6lt0icx2PbUt5dY9tIrSAwzspAE21WW3rZJMyzwiK6ml5rFr4=
X-Received: by 2002:a25:7613:: with SMTP id r19mr21223109ybc.212.1615577782901;
 Fri, 12 Mar 2021 11:36:22 -0800 (PST)
MIME-Version: 1.0
From:   Mike Fleetwood <mike.fleetwood@googlemail.com>
Date:   Fri, 12 Mar 2021 19:36:10 +0000
Message-ID: <CAMU1PDjpaE0g=S5iVQFY1oC8=c1ru114wwrGMUqEDu5=9N9_ZA@mail.gmail.com>
Subject: Occasionally mkfs.reiser4 creates a file system without a UUID
To:     reiserfs-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Hi,

Occasionally mkfs.reiser4 creates a file system without a UUID,
debugfs.reiser4 reports UUID as '<none>'.  This is being detected in
GParted's file system interface CI tests [1] which exercises the resier4
commands.

In a Ubuntu 20.04 LTS VM with both resier4progs-1.2.1-1 package and
current code from GIT, the fault can easily be replicated like this:

truncate -s 256M test.img
i=1
while :
do
  mkfs.reiser4 --force --yes --label '' test.img
  line=`debugfs.reiser4 test.img 2> /dev/null | egrep '^uuid:'`
  echo "[$i] $line"
  ((i++))
  echo "$line" | grep -q '<none>' && break
done

Output fragment:
[1] uuid:        17073919-e41d-4892-9b22-4294d1544c4a
[2] uuid:        af2821de-ea85-4f20-9621-4fbd128b3fb8
[3] uuid:        c0fb805b-e224-4695-a504-d87460d158ae
...
[35] uuid:        d604794d-097f-4810-bbb3-01a1518f3ef1
[36] uuid:        9634100c-1f98-42b3-a684-c9df77ab54e2
[37] uuid:        <none>

Performing the same test with resierfs and ext4 runs for many hours
doing 100,000s of iterations without issue.

Thanks,
Mike

[1] Sporadic failure of test case
My/SupportedFileSystemsTest.CreateAndReadUUID/reiser4
    https://gitlab.gnome.org/GNOME/gparted/-/issues/145
