======================
MKL Installation HOWTO
======================

Download Links
--------------
- Non-Commercial Free Download Link
   http://software.intel.com/en-us/non-commercial-software-development

- Free 30-Day Evaluation Version
   http://software.intel.com/en-us/intel-math-kernel-library-evaluation-options

- Academic Purchase Link
   http://software.intel.com/en-us/intel-education-offerings


Installation
------------
Before the installation, g++ and Java need to be installed::

$ sudo apt-get install g++ openjdk-7-jre

Extract the downloaded folder and run the installer::

$ tar zxf parallel_studio_xe_2013_update3_intel64.tgz
$ cd parallel_studio_xe_2013_update3_intel64
$ ./install.sh

Installer process:

1. Choose option "2. Install to root for system wide access for all users using sudo privileges and password"
2. Insert sudo password
3. Welcome screen: Press "Enter" key to continue
4. Missing Optional Pre-requisite(s): if in all pre-reqs it says "unsupported OS", you can skip them as the MKL libs will still be installed. Choose option "1. Skip missing optional pre-requisites [default]"
5. Press space to go through the license terms and write "accept" at the end to continue
6. Choose option "1. I want to activate my product using a serial number [default]"
7. Insert serial number from the Intel email
8. Once activated, Press "Enter" key to continue
9. Decide if you want to participate in the Intel Software Improvement Program
10. With option 2 you can change the install directory, in this document the default "/opt/intel" is used later
11. With option 3 you can choose not to install some of the components, by default everything is installed
12. Choose option "1. Start installation Now"
13. If a warning appears, just answer "Yes" to overwrite the directory
14. If missing Optional Pre-requisite(s) page appears, just choose option "1. Skip missing optional pre-requisites [default]"
15. Once the install completes, just press Enter to quit, the final message is available in the ``EndOfInstallMsg`` text file


Other Links
-----------
- Intel® Math Kernel Library Link Line Advisor
   http://software.intel.com/en-us/articles/intel-mkl-link-line-advisor

