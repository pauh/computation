==================
Installation HOWTO
==================

This document explains how to build optimized ATLAS libraries for a system
running Ubuntu 13.04. 

Requirements (tested system)
----------------------------
- (K)Ubuntu 13.04

Fast Install
------------
Use the provided script ``auto_install.sh``::

$ ./auto_install.sh

Detailed Installation
---------------------
First install packages required for ATLAS Debian package building::

$ sudo apt-get build-dep atlas

Once this install completes, CPU frequency scaling must be disabled in order
to not interfere with the optimization process. The next command has to be run
for each CPU of the computer. For example, if the computer has 8 CPUs::

$ sudo cpufreq-set -g performance -c 0 # 1st core
$ sudo cpufreq-set -g performance -c 1 # 2nd core
$ sudo cpufreq-set -g performance -c 2 # 3rd core
$ sudo cpufreq-set -g performance -c 3 # 4th core
$ sudo cpufreq-set -g performance -c 4 # 5th core
$ sudo cpufreq-set -g performance -c 5 # 6th core
$ sudo cpufreq-set -g performance -c 6 # 7th core
$ sudo cpufreq-set -g performance -c 7 # 8th core

Now we can start compiling optimized ATLAS libraries and building the package::

$ apt-get source atlas
$ cd atlas-3.8.4
$ dpkg-buildpackage --target custom

The optimized packages have been built and can be found in the parent folder.
They can be installed with the usual ``dpkg -i ...`` command::

$ sudo dpkg -i ../libatlas3-base_3.8.4-9ubuntu1+custom1_amd64.deb


