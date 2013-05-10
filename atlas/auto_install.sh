#!/bin/bash

# SETTINGS
NUM_THREADS=8

# Install required packages for building
sudo apt-get -y build-dep atlas

# Set CPU governor to performance for all CPUs
for i in $(seq 0 $((NUM_THREADS-1))); do
  sudo cpufreq-set -g performance -c $i
done

# Download source code, compile and build package
apt-get source atlas
cd atlas-*
dpkg-buildpackage -j$NUM_THREADS --target custom

# Install the created package
cd ..
sudo dpkg -i libatlas3-base*.deb

# Clean the folder leaving the generated .deb files
rm -rf atlas[-_]*
