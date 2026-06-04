#!/bin/bash
set -e

echo "== START BUILD =="

apt update
apt install -y wget tar gzip

cd /tmp

echo "Downloading ImageBuilder..."

wget https://downloads.openwrt.org/releases/23.05.3/targets/ath79/generic/openwrt-imagebuilder-23.05.3-ath79-generic.Linux-x86_64.tar.xz

tar -xf openwrt-imagebuilder-*.tar.xz
cd openwrt-imagebuilder-*

echo "Building firmware..."

make image PROFILE="generic" PACKAGES="luci luci-ssl"

mkdir -p /tmp/output

find . -name "*.bin" -exec cp {} /tmp/output/ \;

echo "DONE"
ls /tmp/output
