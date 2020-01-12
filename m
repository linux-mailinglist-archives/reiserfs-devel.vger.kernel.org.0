Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Original-To: lists+reiserfs-devel@lfdr.de
Delivered-To: lists+reiserfs-devel@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22A751384AF
	for <lists+reiserfs-devel@lfdr.de>; Sun, 12 Jan 2020 04:52:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732105AbgALDwD (ORCPT <rfc822;lists+reiserfs-devel@lfdr.de>);
        Sat, 11 Jan 2020 22:52:03 -0500
Received: from mail3.iservicesmail.com ([217.130.24.75]:47544 "EHLO
        mail3.iservicesmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732104AbgALDwD (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sat, 11 Jan 2020 22:52:03 -0500
X-Greylist: delayed 302 seconds by postgrey-1.27 at vger.kernel.org; Sat, 11 Jan 2020 22:52:00 EST
IronPort-SDR: 5WeNe7bD8+q6F2T39rj5NXsTb4y7wiS4/LhGvKRi1UA25tJ7IvdotZYwnuQScx7o7eivYjSaM/
 sYiw4sU2AZag==
IronPort-PHdr: =?us-ascii?q?9a23=3AFeezZB/whU0p/P9uRHKM819IXTAuvvDOBiVQ1K?=
 =?us-ascii?q?B20+gcTK2v8tzYMVDF4r011RmVBN6dsawawLSM+4nbGkU4qa6bt34DdJEeHz?=
 =?us-ascii?q?Qksu4x2zIaPcieFEfgJ+TrZSFpVO5LVVti4m3peRMNQJW2aFLduGC94iAPER?=
 =?us-ascii?q?vjKwV1Ov71GonPhMiryuy+4ZLebxhGiTanf79/LRS7oQrQu8UInIBvNrs/xh?=
 =?us-ascii?q?zVr3VSZu9Y33loJVWdnxb94se/4ptu+DlOtvwi6sBNT7z0c7w3QrJEAjsmNX?=
 =?us-ascii?q?s15NDwuhnYUQSP/HocXX4InRdOHgPI8Qv1Xpb1siv9q+p9xCyXNtD4QLwoRT?=
 =?us-ascii?q?iv6bpgRBnvhCkaKzE26mTXi8xpgK9FpxKhvQR/w4nOYI6PKPpxYLrRcs0cRW?=
 =?us-ascii?q?ZYQstRSzBBDZmgYIsPEeUBOPhXr4/hp1cXsxS+AxCgCuToyj9OmHD33bQ23P?=
 =?us-ascii?q?onEQrb2AAtEc4CvGjRoNjzKawcU/26zLPQwDvNb/1Wwynz5ovVfB8uvf6CUq?=
 =?us-ascii?q?l9cdbTxEYzCw/JkkmcpZLjMjiI1uoNqW+b7+94WOy1lWEntx9+oiKyzcgsjY?=
 =?us-ascii?q?nJgI0VwU3D+CVh3ok1OcO3SFR1YN6jFptQuDqXN4ttQsw5X25kojo1yroDuZ?=
 =?us-ascii?q?KhfCgKy40qyhjCYPKEa4iF+gzvWPuTLDtimX5odq6ziwys/UWv0OHxWMm53V?=
 =?us-ascii?q?BXpSRfiNbMrGoC1xnL58iCTfty41mu1C6U1wDW9uFEOUc0lbfHK5I5wr4/iJ?=
 =?us-ascii?q?4TsUPbEy/zgkr2jauWdl869eis9+jqba/qpoGbN4BpkA7+PKMumsqhDugiLA?=
 =?us-ascii?q?cORHCX+eW61LL94U30WKtGguA0n6XDrZzXK9gXqrSnDwJayIou5RayAy+j0N?=
 =?us-ascii?q?sCnHkHKFxFeAiAj4jsI1zOOO73DeuhjFS2njZrwPbGPrL6D5XNNXjMi6vuca?=
 =?us-ascii?q?xh5E5bzQo/19Bf55FMBrEbPP3zQlPxtMDfDhIhKQy73efnCM5j2YMEV2KPGb?=
 =?us-ascii?q?aVP77Mvl+W+O0vJ/KBZJEauDnjMfgp/f3ugmEjmV8bY6ap2YEbaHeiHvRpcA?=
 =?us-ascii?q?2lZi/2j9YaHH0EpU8yQfLnjHWcXjNJIXW/RaQx4nc8Eo31N4rbQpGRh+m50T?=
 =?us-ascii?q?u2BNVpYWZJQgSUHGvlbZqDXfgMayKJKMRJnTkNVLznQIgkg0KArgj/noJqMu?=
 =?us-ascii?q?fOshIfs52rgMB4++DJihY0+hR0FM6WlWqKSid0nTVbFHcNwKljrBkkmR+42q?=
 =?us-ascii?q?9ijqkDTYRe?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GfAgAKlhpelyMYgtlMGBoBAQEBAQE?=
 =?us-ascii?q?BAQEDAQEBAREBAQECAgEBAQGBaAQBAQEBCwEBGwgBgSWBTVIgEpNQgU0fg0O?=
 =?us-ascii?q?LY4EAgx4VhgcUDIFbDQEBAQEBNQIBAYRATgEXgQ8kNQgOAgMNAQEFAQEBAQE?=
 =?us-ascii?q?FBAEBAhABAQEBAQYYBoVzgh0MHgEEAQEBAQMDAwEBDAGDXQcZDzlKDEABDgF?=
 =?us-ascii?q?TgwSCSwEBM51zAY0EDQ0ChR2CNgQKgQmBGiOBNgGMGBqBQT+BIyGCKwgBggG?=
 =?us-ascii?q?CfwESAWyCSIJZBI1CEiGBB4gpmBeCQQR2iUyMAoI3AQ+IAYQxAxCCRQ+BCYg?=
 =?us-ascii?q?DhE6BfaM3V3QBgR5xMxqCJhqBIE8YDYgbji1AgRYQAk+MW4IyAQE?=
X-IPAS-Result: =?us-ascii?q?A2GfAgAKlhpelyMYgtlMGBoBAQEBAQEBAQEDAQEBAREBA?=
 =?us-ascii?q?QECAgEBAQGBaAQBAQEBCwEBGwgBgSWBTVIgEpNQgU0fg0OLY4EAgx4VhgcUD?=
 =?us-ascii?q?IFbDQEBAQEBNQIBAYRATgEXgQ8kNQgOAgMNAQEFAQEBAQEFBAEBAhABAQEBA?=
 =?us-ascii?q?QYYBoVzgh0MHgEEAQEBAQMDAwEBDAGDXQcZDzlKDEABDgFTgwSCSwEBM51zA?=
 =?us-ascii?q?Y0EDQ0ChR2CNgQKgQmBGiOBNgGMGBqBQT+BIyGCKwgBggGCfwESAWyCSIJZB?=
 =?us-ascii?q?I1CEiGBB4gpmBeCQQR2iUyMAoI3AQ+IAYQxAxCCRQ+BCYgDhE6BfaM3V3QBg?=
 =?us-ascii?q?R5xMxqCJhqBIE8YDYgbji1AgRYQAk+MW4IyAQE?=
X-IronPort-AV: E=Sophos;i="5.69,423,1571695200"; 
   d="scan'208";a="303921767"
Received: from mailrel04.vodafone.es ([217.130.24.35])
  by mail01.vodafone.es with ESMTP; 12 Jan 2020 04:46:56 +0100
Received: (qmail 31435 invoked from network); 12 Jan 2020 03:10:06 -0000
Received: from unknown (HELO 192.168.1.3) (quesosbelda@[217.217.179.17])
          (envelope-sender <peterwong@hsbc.com.hk>)
          by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
          for <reiserfs-devel@vger.kernel.org>; 12 Jan 2020 03:10:06 -0000
Date:   Sun, 12 Jan 2020 04:10:05 +0100 (CET)
From:   Peter Wong <peterwong@hsbc.com.hk>
Reply-To: Peter Wong <peterwonghkhsbc@gmail.com>
To:     reiserfs-devel@vger.kernel.org
Message-ID: <20490971.116403.1578798606248.JavaMail.cash@217.130.24.55>
Subject: Investment opportunity
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: reiserfs-devel-owner@vger.kernel.org
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

Greetings,
Please read the attached investment proposal and reply for more details.
Are you interested in loan?
Sincerely: Peter Wong




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.

