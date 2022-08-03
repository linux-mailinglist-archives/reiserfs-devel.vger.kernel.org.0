Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9845588AAA
	for <lists+reiserfs-devel@lfdr.de>; Wed,  3 Aug 2022 12:38:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232706AbiHCKiL (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 3 Aug 2022 06:38:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbiHCKiK (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 3 Aug 2022 06:38:10 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3FDADEA9
        for <reiserfs-devel@vger.kernel.org>; Wed,  3 Aug 2022 03:38:08 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id d14so13910871lfl.13
        for <reiserfs-devel@vger.kernel.org>; Wed, 03 Aug 2022 03:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc;
        bh=9Q86IpDBWLEP7oSSTnvQ9orLNIQkjNwJszaZE/TDKss=;
        b=qB+jefKfRK1A2iRr2ROTx71MHFcMWB8+boTOa4RJAzleHpK/X6BYMy5S2lKOoITM8y
         JQCb6afg0uyA9nWRr67Zxe/n4JjdUuDIj4Dw1epcKVpwQd6QeXCaC+lVcdCLWvVW5Nth
         vlbfqNQNhoIDMFKxBIMuOJjkWM5eTqJLjEEQc5/x1KZvg2xa8/C0+aBhDuEN3YWlAUFP
         HFkG/NVdPopvqNc/nDAcTUYsH8nsEm5I65BkuQSHSEBQtIIEfR+IUswNd/f9v/qhH/q+
         l1XJyD2TZRJNHN4fC5B0sqGoOxGkgHvFFObZVLQwLJYsA3HuOA+wyHxDuMarXXSLW0t+
         I+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc;
        bh=9Q86IpDBWLEP7oSSTnvQ9orLNIQkjNwJszaZE/TDKss=;
        b=Skt59oPBPKzllEeLC4byXZf5WIxe8AF5mkdGuYj3o6YpJPXZFswGpbfDsJxapXLx8V
         aQR841oA9/rciwKrEwl6iCsloPfnzSJl91oiueQHNWxCC9AXP+7hGHl+jM+GBdWKtNNt
         nGZ/yWatrxbgSklsQ5aRLwF+FiXfOSx6ksz3RKZqTxOkG0/6TiKwuHsFTkSRQvSEV6hY
         RCaGwyeZMHcZY7kb42FOve6z7B9yHeF2CTaOe7ndbHDzsInG5jI9TQ4GbnCH2QFCUEnW
         jQV8zVhHY9E9QaYHexTJdGZ6KBKgPWOBEOCrWErMtb1DkXv8FonN/AJMetuuFdFgDOzp
         0dgw==
X-Gm-Message-State: AJIora8AKxVdebISRRKgG7l6iaNZ8j10oai5lSxbgVnkGEChy1o68qtQ
        qYGcxLRxdYKqRj8J3Q56IKY/S50cNIw1sV9SjMU=
X-Google-Smtp-Source: AGRyM1v+N4KrMijpejTYnVcuYW9Sjmlnzjdy/SAkUaP8FADPqd6GoT+ouqaDArsARHNyXNqVtDIPlSAYe16jFSUTvb4=
X-Received: by 2002:a05:6512:3f91:b0:48a:d31:4a16 with SMTP id
 x17-20020a0565123f9100b0048a0d314a16mr10020559lfa.639.1659523086937; Wed, 03
 Aug 2022 03:38:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab3:6309:0:0:0:0:0 with HTTP; Wed, 3 Aug 2022 03:38:06 -0700 (PDT)
Reply-To: OLSONFINANCIAL.DE@gmail.com
From:   OLSON FINANCIAL GROUP <amadip120@gmail.com>
Date:   Wed, 3 Aug 2022 03:38:06 -0700
Message-ID: <CAHb0K2Gypdi86rvSuE9Bf-dcVjS6VNCLmPfg-JEiiT7K5qm3YA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:141 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [amadip120[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [amadip120[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

--=20
Hallo guten Morgen,
Ben=C3=B6tigen Sie dringend einen Kredit f=C3=BCr den Hauskauf? oder ben=C3=
=B6tigen
Sie ein Gesch=C3=A4fts- oder Privatdarlehen, um zu investieren? ein neues
Gesch=C3=A4ft er=C3=B6ffnen, Rechnungen bezahlen? Und zahlen Sie uns
Installationen zur=C3=BCck? Wir sind ein zertifiziertes Finanzunternehmen.
Wir bieten Privatpersonen und Unternehmen Kredite an. Wir bieten
zuverl=C3=A4ssige Kredite zu einem sehr niedrigen Zinssatz von 2 %. F=C3=BC=
r
weitere Informationen
mailen Sie uns an: olsonfinancial.de@gmail.com......
