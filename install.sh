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
#cmake -DWITH_HWLOC=OFF ..
cmake \
-DWITH_RANDOMX=ON \
-DWITH_MO_BENCHMARK=ON \
-DWITH_BENCHMARK=ON \
-DWITH_HTTP=ON \
-DWITH_SSE4_1=ON \
-DWITH_VAES=ON \
-DWITH_HWLOC=OFF \
-DWITH_CN_LITE=OFF \
-DWITH_CN_HEAVY=OFF \
-DWITH_CN_PICO=OFF \
-DWITH_CN_FEMTO=OFF \
-DWITH_CN_GPU=OFF \
-DWITH_ARGON2=OFF \
-DWITH_KAWPOW=OFF \
-DWITH_GHOSTRIDER=OFF \
-DWITH_TLS=OFF \
-DWITH_ASM=OFF \
-DWITH_MSR=OFF \
-DWITH_ENV_VARS=OFF \
-DWITH_OPENCL=OFF \
-DWITH_CUDA=OFF \
-DWITH_NVML=OFF \
-DWITH_ADL=OFF \
-DWITH_STRICT_CACHE=OFF \
-DWITH_DMI=OFF \
-DWITH_DEBUG_LOG=OFF \
-DWITH_EMBEDDED_CONFIG=OFF \
-DWITH_INTERLEAVE_DEBUG_LOG=OFF \
-DWITH_PROFILING=OFF \
-DWITH_SECURE_JIT=OFF \
-DBUILD_STATIC=OFF \
-DHWLOC_DEBUG=OFF \
..

# Compile xmrig
make -j$(nproc || sysctl -n hw.ncpu || sysctl -n hw.logicalcpu)

# Make it executable
chmod +x ./xmrig-notls
