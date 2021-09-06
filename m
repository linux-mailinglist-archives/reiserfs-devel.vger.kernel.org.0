Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 013FB401EA9
	for <lists+reiserfs-devel@lfdr.de>; Mon,  6 Sep 2021 18:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbhIFQri (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Mon, 6 Sep 2021 12:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244457AbhIFQpS (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 6 Sep 2021 12:45:18 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A892C061575
        for <reiserfs-devel@vger.kernel.org>; Mon,  6 Sep 2021 09:44:13 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id a10so7387692qka.12
        for <reiserfs-devel@vger.kernel.org>; Mon, 06 Sep 2021 09:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=Hi0ERA05Hh6q+34+Ou3AtyiRWoG/jVLdZcB+Ekv+M3g=;
        b=ApgcCstn24VfKjTpp0kUAmz1RC21FgpjGJOyIYdoQSTDEXeTG0BeoqglhNcni2j8cl
         D0x5L3Q2cTTt7+OXMEZx/SXaLbqoX5saYCKr6t9/gbG1gjnXQOg6mVWk4mC7BrlykqCw
         /S+bLkAOoGEqAqXPMW3tBdLP5vkB7qLKULfAMlpvzZcGoLEEkAnBXQbN9nUDbTSRCn5C
         6v4+AicDx0oFZZKkuqgHw+13WpFyuDD323FEQ/OJiA5UrXSe4mabE5SuJ67q/x5iheOt
         6/2emIrLE6VYK/KPkk5dTr41fOhH8gAIbC+R8Z5TjCEHQ2Jj2OQKPVgOYsG5fz7J3S6Y
         X/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=Hi0ERA05Hh6q+34+Ou3AtyiRWoG/jVLdZcB+Ekv+M3g=;
        b=t8zfFakGIC0HQh/45Zf1+XdeCzvTZlc6SsfJcMF6K0U/lxd4DugrydrMf9NSqGGh6w
         jA0qHBmh0tDI/q3ys7XLb7dcH/rOmMmnqJAsEqsOWUdhPWpDJ9UJnQ0YaOvQGbSaa6J6
         i9bgSuotkXyCVAzigUhoxvWeDBQjLf/4QnSfFF+6QOB6l7lyBJh34tw8Zu2I1b9Ikgu4
         i5f4dZAKmBkgpFmU0RQrsVTHY/X48VvfXMHOlYLeRGSeVvvaRbZRAKRUQsBbxE52cIo8
         qKTSI2w9IZi8N0A8Q+kVzbgSZLUCQZFfFNBzh+QG6I4I3EY+a16LdXHT1b5XbosmXKFg
         L7Vg==
X-Gm-Message-State: AOAM531jP7MBUWTkxodzkxWVpCJoawO5XSdC3ZWR++HWRhf0dwKkCYFm
        4IYJVX/0+MorWKJTYFbCvfXHj/TyeBiEZ/i+tYs=
X-Google-Smtp-Source: ABdhPJzmNCIlZ5TzAfTQy1RtHJXPEU0YvQVh8it5WhyzUCpOZZiK+c/7fkdqTswTRcXIeYLxski4MRxOqlYZKIkLtUo=
X-Received: by 2002:a05:620a:29c7:: with SMTP id s7mr11650945qkp.186.1630946652111;
 Mon, 06 Sep 2021 09:44:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:74c1:0:0:0:0:0 with HTTP; Mon, 6 Sep 2021 09:44:11 -0700 (PDT)
Reply-To: suzara.wan2020@gmail.com
From:   Mrs Suzara Maling Wan <draliameddrali@gmail.com>
Date:   Mon, 6 Sep 2021 09:44:11 -0700
Message-ID: <CAF04NJBEXGh33Jwjn6FHg0i0Z8jg1POz-15NmyxRXQqhqKdRYw@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

-- 
My names are Mrs Suzara Maling Wan, I am a Nationality of the Republic
of the Philippine presently base in West Africa B/F, dealing with
exportation of Gold, I was diagnose of blood Causal decease, and my
doctor have announce to me that I have few days to leave due to the
condition of my sickness.

I have a desire to build an orphanage home in your country of which i
cannot execute the project myself due to my present health condition,
I am willing to hand over the project under your care for you to help
me fulfill my dreams and desire of building an orphanage home in your
country.

Reply in you are will to help so that I can direct you to my bank for
the urgent transfer of the fund/money require for the project to your
account as I have already made the fund/money available.

With kind regards
Mrs Suzara Maling Wan
