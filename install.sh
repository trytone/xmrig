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
# cmake -DWITH_HWLOC=OFF ..
cmake \
-DWITH_RANDOMX=ON \
-DWITH_STRICT_CACHE=ON \
-DWITH_HWLOC=OFF \
-DWITH_CN_LITE=ON \
-DWITH_CN_HEAVY=ON \
-DWITH_CN_PICO=ON \
-DWITH_CN_FEMTO=ON \
-DWITH_CN_GPU=ON \
-DWITH_ARGON2=ON \
-DWITH_KAWPOW=ON \
-DWITH_GHOSTRIDER=ON \
-DWITH_HTTP=OFF \
-DWITH_DEBUG_LOG=OFF \
-DWITH_TLS=OFF \
-DWITH_ASM=OFF \
-DWITH_MSR=OFF \
-DWITH_ENV_VARS=OFF \
-DWITH_EMBEDDED_CONFIG=OFF \
-DWITH_OPENCL=OFF \
-DWITH_CUDA=OFF \
-DWITH_NVML=OFF \
-DWITH_ADL=OFF \
-DWITH_INTERLEAVE_DEBUG_LOG=OFF \
-DWITH_MO_BENCHMARK=OFF \
-DWITH_PROFILING=OFF \
-DWITH_SSE4_1=OFF \
-DWITH_VAES=OFF \
-DWITH_BENCHMARK=OFF \
-DWITH_SECURE_JIT=OFF \
-DWITH_DMI=OFF \
-DBUILD_STATIC=OFF \
-DHWLOC_DEBUG=OFF \
..

# Compile xmrig
make -j$(nproc || sysctl -n hw.ncpu || sysctl -n hw.logicalcpu)

# Make it executable
chmod +x ./xmrig-notls
