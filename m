Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C10204F0D54
	for <lists+reiserfs-devel@lfdr.de>; Mon,  4 Apr 2022 03:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236423AbiDDBDN (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sun, 3 Apr 2022 21:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240336AbiDDBDM (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 3 Apr 2022 21:03:12 -0400
X-Greylist: delayed 312 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 03 Apr 2022 18:01:17 PDT
Received: from mta-out-02.alice.it (mta-out-02.alice.it [217.169.118.8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5B0F9369E4
        for <reiserfs-devel@vger.kernel.org>; Sun,  3 Apr 2022 18:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alice.it; s=20211207; t=1649034077; 
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        h=Reply-To:From:To:Date:Message-ID:MIME-Version;
        b=OT9ylYIMKckXZIuU6bXD3xqmaAWJu0Bemt/UufVq5L2wNb2gBKvM+5Za6y1kZ09yXPQiEkEqLilaVi55G3k5pPUmd+02lKzJAhgIlPn2ZzaoQPjvUWorktLm7pTj6DrkCBHy0ntbllZ9OZ1OGiylkr3WZnNXgQco3IOE8EjysoSR1RwyC/nnlf4Ya/+8ZhX5x2mgbbUIpSiiE8j9HVUAEpFjwmJZQ9LXyGCmGGGQeYWYF6rmPARrmEE3R3SMy0mE68q+7EvhuHdMknwNRgW6KOAxKrFZZgeJYLeC8ZVuWAOz5GktB2+TxWdZu+cZ80Z8LBiCO8LVXtL+yeWYpdRt6Q==
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedvvddrudejuddggeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuvffgnffgvefqoffkvfetnffktedpqfgfvfenuceurghilhhouhhtmecufedtudenucfgmhhpthihuchsuhgsjhgvtghtucdluddtmdengfhmphhthicusghougihucdlhedtmdenucfjughrpehrhffvfffkggestddtfedttddttdenucfhrhhomhephggvuchhrghvvgcurghnuchofhhfvghruchtohcuihhnvhgvshhtuchinhcuhihouhhrucgtohhunhhtrhihuchunhguvghrucgruchjohhinhhtuchvvghnthhurhgvuchprghrthhnvghrshhhihhpuchplhgvrghsvgcurhgvphhlhicufhhorhcumhhorhgvucguvghtrghilhhsuceofhgpphgvnhhnrgesrghlihgtvgdrihhtqeenucggtffrrghtthgvrhhnpeehjeetgefhleetiedtkeelfffgjeeugeegleekueffgfegtdekkeeifedvvdffteenucfkphepudejiedrvddvjedrvdegvddrudeltdenucevlhhushhtvghrufhiiigvpedvkeejnecurfgrrhgrmhephhgvlhhopegrlhhitggvrdhithdpihhnvghtpedujeeirddvvdejrddvgedvrdduledtpdhmrghilhhfrhhomhepfhgpphgvnhhnrgesrghlihgtvgdrihhtpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprhgvihhsvghrfhhsqdguvghvvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-RazorGate-Vade-Verdict: clean 60
X-RazorGate-Vade-Classification: clean
Received: from alice.it (176.227.242.190) by mta-out-02.alice.it (5.8.807.04) (authenticated as f_penna@alice.it)
        id 623C9D0B010D77A5 for reiserfs-devel@vger.kernel.org; Mon, 4 Apr 2022 02:56:03 +0200
Reply-To: dougfield20@inbox.lv
From:   We have an offer to invest in your country under a
         joint venture partnership please reply for more
         details <f_penna@alice.it>
To:     reiserfs-devel@vger.kernel.org
Date:   03 Apr 2022 17:56:02 -0700
Message-ID: <20220403175602.AF03AD9FBE55BFEE@alice.it>
MIME-Version: 1.0
X-Spam-Status: Yes, score=6.6 required=5.0 tests=BAYES_50,BODY_EMPTY,
        DKIM_INVALID,DKIM_SIGNED,EMPTY_MESSAGE,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,MISSING_SUBJECT,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_L3,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
        *       low trust
        *      [217.169.118.8 listed in list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5020]
        *  0.9 RCVD_IN_MSPIKE_L3 RBL: Low reputation (-3)
        *      [217.169.118.8 listed in bl.mailspike.net]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [dougfield20[at]inbox.lv]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [f_penna[at]alice.it]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 RCVD_IN_MSPIKE_BL Mailspike blacklisted
        *  1.8 MISSING_SUBJECT Missing Subject: header
        *  2.3 EMPTY_MESSAGE Message appears to have no textual parts and no
        *      Subject: text
        *  0.1 DKIM_INVALID DKIM or DK signature exists, but is not valid
        *  0.0 BODY_EMPTY No body text in message
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

