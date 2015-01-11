#! /bin/bash
source var/fdg/supported.sh
ABD=$(<var/android/configs/android-base.cfg)
AFD=$(<var/android/configs/android-recommended.cfg)
INTRO="\n
=================================================================================\n
Generate Defconfig by feature\n
--------------------------------------------------------------------------------\n
This is a tool for generating a Linux kernel defconfig using a wizard which asks \n
a series of questions about which features you require. What follows is a series \n
of question trees which will merge partial defconfig files with their \n
dependencies resolved in-and-of themselves to output a finished product. \n 
Obviously the variety of generated defconfigs cannot all be tested on all \n
hardware and all kernel versions, and they cannot be fully supported all at the \n
same time. This list of supported targets will be updated as I figure them out.\n\n
$SUPPORTED
"
WANTMSM="\n
For right now, this tool will only support Qualcomm hardware because \n
Qualcomm is goddamned everywhere and it's cheap, which for me, makes it fun to \n
hack on. But there are like, zillions of Qualcomm based configurations and it \n
can be confusing what needs to be set to make a SOC work with a particular stack
and hence this tool. In the future, this prompt will be replaced with a list of
minimal defconfigs by architecture.\n 
"
WANTMSM7XXXA="
================================================================================\n
Is your target the Qualcomm Snapdragon S1?\n
Flag(s) : (CONFIG_ARCH_MSM7X00A) \n
Other Names : (MSM7225, MSM7625, MSM7227, MSM7627, MSM7225A, MSM7625A, MSM72271,\n
\tMSM7627A,MSM7225AB, QSD8250, QSD8650)\n
--------------------------------------------------------------------------------\n
"
WANTMSM7X30="
================================================================================\n
Is your target the Snapdragon S2?\n
Flags(s) : (CONFIG_ARCH_MSM7X30) \n
Other Names : (MSM7230, MSM7630, APQ8055, MSM8255, MSM8255T, MSM8655, MSM8655T)\n
--------------------------------------------------------------------------------\n
"
WANTANDROID="
================================================================================\n
Do you want Android features enabled?\n
Flags(s) : (follow-up) \n
You will be prompted to choose between the base or full Android defconfig
--------------------------------------------------------------------------------\n
"
WANTANDROIDBASE="
================================================================================\n
Do you just want the base android features?\n
Flags(s) : ($ABD) \n
Other Names : \n
--------------------------------------------------------------------------------\n
"
WANTANDROIDFULL="
================================================================================\n
Do you want the full Android features?\n
Flags(s) : ($AFD) \n
--------------------------------------------------------------------------------\n
"
WANTSELINUX="
================================================================================\n
Do you want to enable SELinux(Required for Android 4.4 or later)\n
Flags(s) : () \n
Other Names : \n
--------------------------------------------------------------------------------\n
"
DPDARM="var/arch/arm/configs/"
DPDFEAT="var/feat/"
DPDSUBARCH="var/sub-arch/"
DPDANDROID="var/android/configs/"
echo -e $INTRO
echo -e $WANTMSM
echo -e $WANTMSM7XXXA
echo -e $WANTMSM7X30A
echo -e $WANTANDROID
echo -e $WANTANDROIDBASE
PDANDROID=""
echo -e $WANTANDROIDFULL
PDANDROID=""
echo -e $WANTSELINUX
PDSELINUX=""
PDDMCRYPT=""