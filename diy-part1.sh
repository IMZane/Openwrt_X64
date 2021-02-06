#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
# 添加ADGuard Home插件包
git clone https://github.com/rufengsuixing/luci-app-adguardhome package/lean/luci-app-adguardhome/
./scripts/feeds update -a
./scripts/feeds install -a
# 添加passwall插件包
https://github.com/xiaorouji/openwrt-passwall/tree/main/luci-app-passwall package/lean/luci-app-passwall
./scripts/feeds update -a
./scripts/feeds install -a
