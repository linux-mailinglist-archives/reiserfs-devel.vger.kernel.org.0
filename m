Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E778C6395B3
	for <lists+reiserfs-devel@lfdr.de>; Sat, 26 Nov 2022 12:18:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbiKZLSU (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sat, 26 Nov 2022 06:18:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbiKZLSK (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sat, 26 Nov 2022 06:18:10 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54A841DDEA
        for <reiserfs-devel@vger.kernel.org>; Sat, 26 Nov 2022 03:18:09 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id n1so3117212ljg.3
        for <reiserfs-devel@vger.kernel.org>; Sat, 26 Nov 2022 03:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t7wrZvAkKeCjMLmhReJxhxYIm3R/2GcWH+genrPm1HQ=;
        b=aADf2iNJTA/bkSDKx7MWH1Xm1vQm3u4/uaMKdtHLRmenOoMkyv9TtBuz2xIcsgBHHp
         qbol0SpnbB28DGuvnd83gjdnqosiaxjh/gCsjKE1NqabwQJdD4As8NzhYRewCKaaHpvp
         KNHFZd/4bW5BP/Op6MjFVP6QPapsQk/uDJH2jqF8JSpzbikewfI20MPYDoRA3jCe5ryf
         FoGArd3bf3gXOqkLaDPRtdkcWlvfyosQ2H/oWVfeNJiqrniW0v41G1FYw7pYvqpK8Lo1
         nUCe6hMwMrcafJZ7GeQWfSfdJzFIFSRcQqYpdNSOQ68n3srScpAPYD/sOwTzDUocmVDF
         m48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t7wrZvAkKeCjMLmhReJxhxYIm3R/2GcWH+genrPm1HQ=;
        b=TQp4s4vZUWpxwLaY2Rxa1CGO2Ul9EkznYBdVb4KZkq45vKIbpSlAxt91c+yybqcM1C
         o5CgawbXPuPu0YeKIaaaDSADrJ8LnqAr+5gHT2dzitcQsSZha4vdCVUPXbixLYYYkl7i
         ffgCduXPz7JC5l7XdkH2srYt1wUBj2RqLfFbrT36th7H9XRkOnZvc0pUkDXCEzyJ/FJz
         fUKUOFJBKkJd29J8M8jhlWChvDlWpfTJiIg8hTtOGhEp2cK4ptBp/xVg5mMcWMbfHPJm
         M8V35PipoX8JjhrwjUX4s2wwbmKExyOilAt+3ysyVrCy3pl1uOHCIDiovXKJdApDWQMY
         /KGA==
X-Gm-Message-State: ANoB5pkBF0k9RUJV+aDJaum34j3cPnKNJVOSDd9OQoGBOfs7+PjNCgKY
        0kOuLnsl8j/mvmD6d/keqIh6NAX/w/DxpviubzQ=
X-Google-Smtp-Source: AA0mqf64JJNKie+1tUO4lSrl3fxDWWgi/jXBazLpAWpkZS6k+ZngvltP4hEF28XHwV5XcZPRkknJ/W5XsFgr38hCLl8=
X-Received: by 2002:a2e:a806:0:b0:277:4b35:d94a with SMTP id
 l6-20020a2ea806000000b002774b35d94amr6358320ljq.21.1669461487621; Sat, 26 Nov
 2022 03:18:07 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a2e:9a91:0:0:0:0:0 with HTTP; Sat, 26 Nov 2022 03:18:07
 -0800 (PST)
Reply-To: ninacoulibaly03@myself.com
From:   nina coulibaly <ninacoulibaly90@gmail.com>
Date:   Sat, 26 Nov 2022 11:18:07 +0000
Message-ID: <CAMPxFenzWOD10V=kSciY1h8Yn7yxHamsmVitPzttWMgkhuxQog@mail.gmail.com>
Subject: from nina coulibaly
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

-- 
Dear,

Please grant me permission to share a very crucial discussion with
you.I am looking forward to hearing from you at your earliest
convenience.

Mrs. Nina Coulibaly
