#!/bin/sh

# Update packages
apt update
apt upgrade -y
apt install -y libllvm cmake make git build-essential

# Delete directory if exists
rm -rf ./xmrig

# Clone MoneroOcean xmrig version
git clone https://github.com/MoneroOcean/xmrig.git

# Create build directory
mkdir ./xmrig/build
cd ./xmrig/build

# Prepare files for compiler
cmake -DWITH_HWLOC=OFF -DWITH_TLS=OFF ..

# Compile xmrig
make -j$(nproc || sysctl -n hw.ncpu || sysctl -n hw.logicalcpu)

# Make it executable
chmod +x ./xmrig-notls
