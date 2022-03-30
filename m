Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95D7B4ECC4A
	for <lists+reiserfs-devel@lfdr.de>; Wed, 30 Mar 2022 20:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240176AbiC3Sbo (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Wed, 30 Mar 2022 14:31:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349169AbiC3Sbb (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Wed, 30 Mar 2022 14:31:31 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A15EF3EA9F
        for <reiserfs-devel@vger.kernel.org>; Wed, 30 Mar 2022 11:28:14 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id bp39so18862730qtb.6
        for <reiserfs-devel@vger.kernel.org>; Wed, 30 Mar 2022 11:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=BUnAD3xqyyj2lm0zvOZVtbyxWcA123m5vBtT7P90vEA=;
        b=S22Ra8ZboCcT3bpVIIVLTSge+LKjzGt7Sro6WhT+fBRLE99jO+PdMRSnm32CDt/Zek
         32ZEdCNETighh1bfEgHJhdDZv+EpJmc8qSxS+x4Ieu9b1xV0uBQJytYUvfHF3CiT70k2
         sVgZSZX2bteb/iL7TryUL/Y2r3YZNqFbh8W5vzxF4gOwzLzp/weytfCc2/1YeYkjGX0V
         qFsYl0Zz1PqqUvyeTIiqjkQIP1E7KPNcE5UuCl9gMWlYlxAzBNVsMPfWGlgjZhrNFsGb
         pUOMDjNaxX3e3TTrqfKCh985jXAIRmN9n0TaE7emvckQG/HMYGjOZrUeqSJZCHWHNxxc
         kLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=BUnAD3xqyyj2lm0zvOZVtbyxWcA123m5vBtT7P90vEA=;
        b=Syz3sxKsKcmudYorBNbDZTXh2zs6O0QWs8hTEBSsvfyXVcQ+p4hJreZwzl1qigIRGq
         UIKzXtrCO7GlXje9FMzS5BLqrL1NX3IdX6FyvntQPWIaSjfcQKgPsgrpujsBoCQaz+cm
         BJRR/iEQZcQv3z0Td3FmrGfk4KsYSzNbqPQAid6IDOkxh9YyUSr1QFmlMQ7kM7t3jwdH
         ojpQqCMl2l0kOxzJW9SJJUq1NrzVgXj3kEUQ+GXSP5sHrAsm66BNFExImh9H0MHx64Y0
         pfA6TTcaM3m84nLkqDF4zkW2KH0IZavphJLQSnHNU9q9Qs5XgO8eCp2w8Jv9SvvdgzXY
         ujaw==
X-Gm-Message-State: AOAM531vcfoXSrWBD+xaGY1ao0gqPPu4S3LpsVR0eb7+xdWE8XIuuIr6
        S4eIcowDw0g0p7XzRXf5xJ8JaPbUuqhTVFob0Ug=
X-Google-Smtp-Source: ABdhPJyuXXDqeqf2IQv8gmJImNdr+zOdQcMfLRBcpOKIKRFuOyiJlM+6rrLD3wDeLJnOkUGSwgy4nVW088v6XvaOpnA=
X-Received: by 2002:ac8:7f01:0:b0:2e1:e86f:fd59 with SMTP id
 f1-20020ac87f01000000b002e1e86ffd59mr839990qtk.448.1648664893052; Wed, 30 Mar
 2022 11:28:13 -0700 (PDT)
MIME-Version: 1.0
Reply-To: isabellasayouba0@gmail.com
Sender: stjohncatholic155@gmail.com
Received: by 2002:ac8:57c3:0:0:0:0:0 with HTTP; Wed, 30 Mar 2022 11:28:12
 -0700 (PDT)
From:   Mrs Isabella Sayouba <isabellasayouba0@gmail.com>
Date:   Wed, 30 Mar 2022 18:28:12 +0000
X-Google-Sender-Auth: 9y4lw18rt2QcBlh2FXI5qEcxuOQ
Message-ID: <CAHjLdGfz+jbSbP_H4n1q8DZNPsVtx2OfwWm6X_5FEcTB54Kpow@mail.gmail.com>
Subject: =?UTF-8?B?44GC44GE44GV44Gk44CC?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

44GC44GE44GV44Gk44CCDQoNCua2meOCkua1geOBl+OBquOBjOOCieOBk+OBruODoeODvOODq+OC
kuabuOOBhOOBpuOBhOOBvuOBmeOAguengeOBruebruOBq+OBr+Wkp+OBjeOBquaCsuOBl+OBv+OB
jOOBguOCiuOBvuOBmeOAguengeOBruWQjeWJjeOBr+OCpOOCtuODmeODqeODu+OCteODqOOCpuOD
kOOBleOCk+OBp+OBmeOAguODgeODpeODi+OCuOOCouWHuui6q+OBp+OAgeODluODq+OCreODiuOD
leOCoeOCveOBrueXhemZouOBi+OCiemAo+e1oeOCkuWPluOCiuOBvuOBmeOAguengeOBr+OBguOB
quOBn+OBq+W/g+OCkumWi+OBhOOBpuaEn+WLleOBl+OBn+OBruOBp+OAgeOBguOBquOBn+OBq+ip
seOBmeS7peWkluOBq+mBuOaKnuiCouOBr+OBguOCiuOBvuOBm+OCk+OAguengeOBr+OAgTIwMTHl
ubTjgavkuqHjgY/jgarjgovliY3jgavjg5bjg6vjgq3jg4rjg5XjgqHjgr3jga7jg4Hjg6Xjg4vj
grjjgqLlpKfkvb/jgag55bm06ZaT5YON44GE44Gm44GE44GfU2F5b3ViYUJyb3du5rCP44Go57WQ
5ama44GX44G+44GX44Gf44CC5a2Q5L6b44Gq44GX44GnMTHlubTplpPntZDlqZrjgZfjgZ/jgIIN
Cg0K5b2844Gv44Gf44Gj44GfNeaXpemWk+e2muOBhOOBn+efreOBhOeXheawl+OBruW+jOOBp+at
u+OBq+OBvuOBl+OBn+OAguW9vOOBruatu+W+jOOAgeengeOBr+WGjeWpmuOBl+OBquOBhOOBk+OB
qOOBq+axuuOCgeOBvuOBl+OBn+OAguS6oeOBj+OBquOBo+OBn+Wkq+OBjOeUn+OBjeOBpuOBhOOB
n+OBqOOBjeOAgeW9vOOBr+e3j+mhjTg1MOS4h+ODieODq+OCkumgkOOBkeOBvuOBl+OBn+OAgg0K
77yIODAw5LiHNTAwMOODieODq++8ieilv+OCouODleODquOCq+OBruODluODq+OCreODiuODleOC
oeOCveOBrummlumDveODr+OCrOODieOCpeOCsOODvOOBrumKgOihjOOBp+OAguePvuWcqOOAgeOB
k+OBruOBiumHkeOBr+OBvuOBoOmKgOihjOOBq+OBguOCiuOBvuOBmeOAguW9vOOBr+OBk+OBruOB
iumHkeOCkuODluODq+OCreODiuODleOCoeOCveOBrumJsealreOBi+OCieOBrumHkeOBrui8uOWH
uuOBq+WIqeeUqOOBp+OBjeOCi+OCiOOBhuOBq+OBl+OBvuOBl+OBn+OAgg0KDQrmnIDov5HjgIHn
p4Hjga7ljLvogIXjga/np4HjgYznmYzjgajohLPljZLkuK3jga7llY/poYzjga7jgZ/jgoHjgas3
44O25pyI6ZaT44Gv57aa44GL44Gq44GE44Gg44KN44GG44Go56eB44Gr6KiA44GE44G+44GX44Gf
44CC56eB44KS5pyA44KC5oKp44G+44Gb44Gm44GE44KL44Gu44Gv6ISz5Y2S5Lit44Gu55eF5rCX
44Gn44GZ44CC56eB44Gu54q25oWL44KS55+l44Gj44Gf44Gu44Gn44CB56eB44Gv44GT44Gu44GK
6YeR44KS44GC44Gq44Gf44Gr5rih44GX44Gm44CB5oG144G+44KM44Gq44GE5Lq644CF44Gu5LiW
6Kmx44KS44GZ44KL44GT44Go44Gr44GX44G+44GX44Gf44CC44GC44Gq44Gf44Gv44GT44Gu44GK
6YeR44KS56eB44GM44GT44GT44Gn5oyH56S644GZ44KL5pa55rOV44Gn5Yip55So44GZ44KL44Gn
44GX44KH44GG44CC56eB44Gv44GC44Gq44Gf44Gr44GC44Gq44Gf44Gu5YCL5Lq655qE44Gq5L2/
55So44Gu44Gf44KB44Gr57eP44GK6YeR44GuMzDjg5Hjg7zjgrvjg7Pjg4jjgpLlj5bjgaPjgabm
rLLjgZfjgYTjgafjgZnjgILjgYrph5Hjga43MO+8heOBr+engeOBruWQjeWJjeOBp+WtpOWFkOmZ
ouOCkuW7uuOBpuOAgemAmuOCiuOBruiyp+OBl+OBhOS6uuOAheOCkuWKqeOBkeOCi+OBn+OCgeOB
q+S9v+OBhuOBp+OBl+OCh+OBhuOAguengeOBr+WtpOWFkOOBqOOBl+OBpuiCsuOBoeOBvuOBl+OB
n+OBjOOAgeelnuOBruWutuOCkue2reaMgeOBmeOCi+OBn+OCgeOBoOOBkeOBq+OAgeWutuaXj+OB
q+OBr+iqsOOCguOBhOOBvuOBm+OCk+OAguOBk+OBrueXheawl+OBjOengeOCkuOBqOOBpuOCguiL
puOBl+OCgeOBn+OBruOBp+OAgeelnuOBjOengeOBrue9quOCkui1puOBl+OAgealveWckuOBp+en
geOBrumtguOCkuWPl+OBkeWFpeOCjOOCi+OCiOOBhuOBq+OBk+OCjOOCkuOBl+OBpuOBhOOCi+OB
ruOBp+OBmeOAgg0KDQrov5Tkv6HjgpLlj5fjgZHlj5bjgormrKHnrKzjgIHjg5bjg6vjgq3jg4rj
g5XjgqHjgr3jga7pioDooYzjga7pgKPntaHlhYjjgpLjgYrnn6XjgonjgZvjgZfjgb7jgZnjgILj
gb7jgZ/jgIHpioDooYzjga7nj77lnKjjga7lj5flj5bkurrjgafjgYLjgovjgZPjgajjgpLoqLzm
mI7jgZnjgovmqKnpmZDmm7jjgpLnmbrooYzjgZnjgovjgojjgYbpioDooYzplbfjgavmjIfnpLrj
gZfjgb7jgZnjgILnp4HjgYzjgZPjgZPjgafov7DjgbnjgZ/jgojjgYbjgavjgYLjgarjgZ/jgYzj
gZ3jgozjgavlv5zjgZjjgabooYzli5XjgZnjgovjgZPjgajjgpLnp4Hjgavkv53oqLzjgZfjgabj
gY/jgaDjgZXjgYTjgIINCg0K44Kk44K244OZ44Op44O744K144Oo44Km44OQ5aSr5Lq644GL44KJ
44CCDQo=
