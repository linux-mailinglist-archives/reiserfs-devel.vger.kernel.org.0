Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10B2B1C21B7
	for <lists+reiserfs-devel@lfdr.de>; Sat,  2 May 2020 01:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgEAXyj (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Fri, 1 May 2020 19:54:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726524AbgEAXyi (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Fri, 1 May 2020 19:54:38 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACE25C061A0C
        for <reiserfs-devel@vger.kernel.org>; Fri,  1 May 2020 16:54:37 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id e9so6419699iok.9
        for <reiserfs-devel@vger.kernel.org>; Fri, 01 May 2020 16:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=jM94nNBrNF36elR9SpxnlLBXmyEcl3UvUFgw939tv+U=;
        b=YtueJY7X8tRoRuTVZ/gr5n+Wz7F4tQCYPX0N0cWcxURznMZ7pfWZ+9Nk97Vr+auovD
         4ChRrnAVqfqsiYjS78QpKW0Qk1DAM5MRc85IVjGm1UcMBtdL6z8Odtxz755r26vSqUwz
         KpwFQ4pGeCPaZ3+Eb7DpqE1Grl913mQZFQE7K6Bh9dUltQ/0TolVSKRvLvCmqmBMIsnk
         VmD/Di1VYjQPUrbQ3dHd/LBg5V6kcMWcxhSk6S4tPmIslfOt0O70r7tQdhNa/YcV8Y29
         gTif6qohlqruWdAksJmC60x/qv++BPpQwD2Psm/n8aYEbFell38ns8NKAwyDWKswhnuU
         lYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=jM94nNBrNF36elR9SpxnlLBXmyEcl3UvUFgw939tv+U=;
        b=VBWd26CmV6pFQ5H/hO4rN5E0xcoH8liYbFrz9bXmUofVZPL14y7E5C4XroyCNb8Jr7
         MIswjvcFfTtyf41j6Ywz91N89RE+85ikPz7NUIwaamJ7nhuZgm8r3s5iPe3oX2OLdvhJ
         OeSTQzu8MtbU4AMYHO0Dboj7l8+dWEchWtl8yXWQ8jky1Ol5t3yieykQMNSMOtS2f8Ha
         HtXa8FO08ZnxijXW6uI96l2cLvmBcba4KTv/bxViY/dqOhaNbOeq7I+O8n3DQYjd7YnB
         l/PdnF+0pg7l3CebroXVXXO8Cgd1jP7k98F7vNbkzHnNE8kvBNNe+SYCJIRXBRMbj2Hq
         qFjA==
X-Gm-Message-State: AGi0PuYDXZrVpsZx3O01W4cmjHn3kLrw5QJaK4N8kSSPTqP9ZmvkKUWN
        4e9AnI+iAUpjyUDvDD+I0S/4QUGvSuJw2rC3Qn4=
X-Google-Smtp-Source: APiQypItasFeLDQn1QfTQAIhuwZZPOVs2wurVW6/LFwGTKQa+mEz0S7eT/zOUUIM0dc9bHw5ooproExYIdA/zxhNZe8=
X-Received: by 2002:a5e:8616:: with SMTP id z22mr6231617ioj.130.1588377276739;
 Fri, 01 May 2020 16:54:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:b31e:0:0:0:0:0 with HTTP; Fri, 1 May 2020 16:54:36 -0700 (PDT)
Reply-To: robertmrwilson@gmail.com
From:   "Mr. Wilson Robert" <s.samuel0r@gmail.com>
Date:   Sat, 2 May 2020 00:54:36 +0100
Message-ID: <CAARCaUffRDkw=2P_-VL2qAEp4d3hQt9bPYmA0oMGcwWBFQWVkg@mail.gmail.com>
Subject: Dear Owner,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

From: Mr. Wilson Robert
 Director Inspection Unit
 Hartsfield=E2=80=93Jackson International
 Airport, Atlanta Georgia United-States
 Regional Division Shipment
 Officer, Atlanta Georgia.

 Dear Owner,

I am Mr. Wilson Robert, Head Officer-in-Charge, and Administrative
Service Inspection Unit United Nations Inspection Agency in
Hartsfield=E2=80=93Jackson International Airport Atlanta, Georgia. During o=
ur
investigation, I discovered an abandoned shipment through a Diplomat
from United Kingdom which was transferred from JF Kennedy Airport to
our facility here in Atlanta, and when scanned it revealed an
undisclosed sum of money in 2 Metal Trunk Boxes weighing approximately
130kg each.

 The consignment was abandoned because the Content was not properly
declared by the consignee as money rather it was declared as personal
effect/classified document to either avoid diversion by the Shipping
Agent or confiscation by the relevant authorities. The diplomat's
inability to pay for Non Inspection fees among other things are the
reason why the consignment is delayed and abandoned.

 By my assessment, each of the boxes contains about $8.5M or more.They
are still left in the airport storage facility till today. The
Consignments like I said are two metal trunk boxes weighing about 65kg
each (Internal dimension: W61 x H156 x D73 (cm) effective capacity:
680 L) Approximately. The details of the consignment including your
name and email on the official document from United Nations' office in
London where the shipment was tagged as personal effects/classified
document is still available with us. As it stands now, you have to
reconfirm your full name, Phone Number, full address so I can
cross-check and see if it corresponds with the one on the official
documents. It is now left to you to decide if you still need the
consignment or allow us repatriate it back to UK (place of origin) as
we were instructed.  (REPLY TO THIS EMAIL:robertmrwilson@gmail.com)

 As I did say again, the shipper abandoned it and ran away most
importantly because he gave a false declaration, he could not pay for
the yellow tag, he could not secure a valid non inspection
document(s), etc. I am ready to assist you in any way I can for you to
get back this packages provided you will also give me something out of
it (financial gratification). You can either come in person, or you
engage the services of a secure shipping/delivery Company/agent that
will provide the necessary security that is required to deliver  the
package to your doorstep or the destination of your choice. I need the
 entire guarantee that I can get from you before I can get involved in
 this project.

 Please reply this email strictly at  .

 Best Regards,
 Mr. Wilson Robert
 Head Officer-in-Charge
 Administrative Service Inspection Unit
