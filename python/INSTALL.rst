==================================
Numpy+Scipy+MKL Installation HOWTO
==================================

Fast Install
------------
Use the provided ``auto_install.sh`` script. Note that all the compilation files will be deleted at the end of the script, leaving only the generated .deb files.

Read about the details in the following sections.

MKL
---
Follow the instructions in the MKL folder.

NumPy
-----
**Requirement**: MKL needs to be installed!

First get the packaging tools, sources of the package and its build-dependencies::

$ sudo apt-get install build-essential devscripts
$ sudo apt-get build-dep python-numpy
$ source /opt/intel/mkl/bin/mklvars.sh intel64
$ apt-get source python-numpy                # <-- without root!

Now add the provided ``site.cfg``, check that the paths are correct::

$ cp site.cfg python-numpy-[0-9]*

and type the following from the numpy source subdir::

$ cd python-numpy-[0-9]*
$ dch -n "Compile with MKL optimized libraries."
$ dpkg-buildpackage -b

it should produce the package ``python-numpy_..._amd64.deb`` in the parent folder and some other packages, which can be installed with::

$ sudo dpkg -i ../*.deb

Testing NumPy
^^^^^^^^^^^^^
Once this package is installed, to be able to run ``import numpy`` in Python, the MKL library path needs to be loaded in the shell environment.

In every new shell::

$ source /opt/intel/mkl/bin/mklvars.sh intel64
$ python your_program.py

There are some tests provided in the ``numpy`` folder:

- ``test_intel.py``
- ``test_xavi.py``
- ``test_xavi_mat.py``

SciPy
-----
**Requirement**: MKL and NumPy need to be installed!

First get the packaging tools, sources of the package and its build-dependencies::

$ sudo apt-get install build-essential devscripts
$ sudo apt-get build-dep python-scipy
$ source /opt/intel/mkl/bin/mklvars.sh intel64
$ apt-get source python-scipy                # <-- without root!

and type the following from the scipy source subdir::

$ cd python-scipy-[0-9]*
$ dch -n "Compile with MKL optimized libraries."
$ dpkg-buildpackage -b

it should produce the package ``python-scipy_..._amd64.deb`` in the parent folder and some other packages, which can be installed with::

$ sudo dpkg -i ../*.deb

