#!/bin/bash

echo "Starting firmware build..."

PROFILE="ubnt_nanostation-m-xw"

wget https://downloads.openwrt.org/releases/23.05.3/targets/ath79/generic/openwrt-imagebuilder-23.05.3-ath79-generic.Linux-x86_64.tar.xz

tar -xf openwrt-imagebuilder-*.tar.xz
cd openwrt-imagebuilder-*

make image PROFILE="$PROFILE" PACKAGES="luci luci-ssl"

mkdir -p ../output
cp -r bin/* ../output/
