#!/bin/bash

# SETTINGS
NUM_THREADS=8


# Check if MKL is installed
if [ ! -d /opt/intel/mkl ]; then
  echo "MKL must be installed in '/opt/intel/mkl'"
  exit 1
fi


#########
# NumPy #
#########

# Enter NumPy folder
cd numpy

# Install required packages for building
sudo apt-get -y install build-essential devscripts
sudo apt-get -y build-dep python-numpy

# Download source code
apt-get source python-numpy
cd python-numpy-*

# Copy the config file with MKL settings
cp ../site.cfg .

# Load MKL env variables
source /opt/intel/mkl/bin/mklvars.sh intel64

# Increase deb package version number
dch -n "Compile with MKL optimized libraries."

# Compile and build the packages
dpkg-buildpackage -j$NUM_THREADS -b

# Install the created packages
cd ..
sudo dpkg -i *.deb

# Clean the folder leaving the generated .deb files
rm -rf python-numpy-[0-9]*
rm python-numpy_*.tar.gz
rm python-numpy_*.dsc
rm python-numpy_*.changes

# Exit NumPy folder
cd ..


#########
# SciPy #
#########

# Enter SciPy folder
cd scipy

# Install required packages for building
sudo apt-get -y build-dep python-scipy

# Download source code
apt-get source python-scipy
cd python-scipy-*

# Increase deb package version number
dch -n "Compile with MKL optimized libraries."

# Compile and build the packages
dpkg-buildpackage -j$NUM_THREADS -b

# Install the created packages
cd ..
sudo dpkg -i *.deb

# Clean the folder leaving the generated .deb files
rm -rf python-scipy-[0-9]*
rm python-scipy_*.tar.gz
rm python-scipy_*.dsc
rm python-scipy_*.changes

# Exit SciPy folder
cd ..

