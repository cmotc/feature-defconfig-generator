#! /bin/bash
source var/fdg/supported.sh
ABD=$(<var/android/configs/android-base)
AFD=$(<var/android/configs/android-recommended)
INTRO="
=================================================================================
Generate Defconfig by feature
--------------------------------------------------------------------------------
This is a tool for generating a Linux kernel defconfig using a wizard which asks 
a series of questions about which features you require. What follows is a series 
of question trees which will merge partial defconfig files with their 
dependencies resolved in-and-of themselves to output a finished product.  
Obviously the variety of generated defconfigs cannot all be tested on all 
hardware and all kernel versions, and they cannot be fully supported all at the 
same time. This list of supported targets will be updated as I figure them out.
$SUPPORTED
"
WANTMSM="
For right now, this tool will only support Qualcomm hardware because 
Qualcomm is goddamned everywhere and it's cheap, which for me, makes it fun to 
hack on. But there are like, zillions of Qualcomm based configurations and it 
can be confusing what needs to be set to make a SOC work with a particular stack
and hence this tool. In the future, this prompt will be replaced with a list of
minimal defconfigs by architecture. 
Target the Qualcomm MSM architecture? 
"
WANTMSM7XXXA="
================================================================================
Is your target the Qualcomm Snapdragon S1(y/n)?
Flag(s) : (CONFIG_ARCH_MSM7X00A) 
Other Names : (MSM7225, MSM7625, MSM7227, MSM7627, MSM7225A, MSM7625A, MSM72271,
\tMSM7627A,MSM7225AB, QSD8250, QSD8650)
--------------------------------------------------------------------------------
"
WANTMSM7X30="
================================================================================
Is your target the Snapdragon S2(y/n)?
Flags(s) : (CONFIG_ARCH_MSM7X30) 
Other Names : (MSM7230, MSM7630, APQ8055, MSM8255, MSM8255T, MSM8655, MSM8655T)
--------------------------------------------------------------------------------
"
WANTADRENO="
================================================================================
Do you want to configure the Adreno GPU?
(y/n)?
Flags(s) : (CONFIG_FB_MSM) 
--------------------------------------------------------------------------------
"
WANTANDROID="
================================================================================
Do you want Android features enabled(y/n)?
Flags(s) : (follow-up) 
You will be prompted to choose between the base or full Android defconfig
--------------------------------------------------------------------------------
"
WANTANDROIDBASE="
================================================================================
Do you just want the base android features(y/n)?
Flags(s) : ($ABD) 
Other Names : 
--------------------------------------------------------------------------------
"
WANTANDROIDFULL="
================================================================================
Do you want the full Android features(y/n)?
Flags(s) : ($AFD) 
--------------------------------------------------------------------------------
"
WANTWIFI="
================================================================================
Do you want to configure Wi-Fi Devices?
(y/n)?
Flags(s) : (One or more of the following: CONFIG_ATH9K_HTC, 
CONFIG_ATH9K_HTC_DEBUGFS, CONFIG_CARL9170, CONFIG_CARL9170_LEDS, 
CONFIG_CARL9170_WPC, CONFIG_ATH6KL, CONFIG_ATH6KL_SDIO, CONFIG_ATH6KL_USB, 
CONFIG_ATH6KL_DEBUG) 
--------------------------------------------------------------------------------
"
WANTATH6KL="
================================================================================
Do you want to configure the Atheros mobile chipset standard Version?
(Non-Free firmware required.)
(y/n)?
Flags(s) : (CONFIG_ATH6KL, CONFIG_ATH6KL_SDIO) 
--------------------------------------------------------------------------------
"
WANTATH6KLU="
================================================================================
Do you want to configure the Atheros mobile chipset USB Version?
(Non-Free firmware required.)
(y/n)?
Flags(s) : (CONFIG_ATH6KL_USB) 
--------------------------------------------------------------------------------
"
WANTATH6KLD="
================================================================================
Do you want to configure the Atheros mobile chipset debugging tools?
(Non-Free firmware required.)
(y/n)?
Flags(s) : (CONFIG_ATH6KL_DEBUG) 
--------------------------------------------------------------------------------
"
WANTATHFOSS="
================================================================================
Do you want to configure the Atheros 9k_htc USB chipset?
(Respects your freedom.)
(y/n)?
Flags(s) : (CONFIG_ATH9K_HTC, CONFIG_CARL9170, CONFIG_CARL9170_LEDS, 
CONFIG_CARL9170_WPC) 
--------------------------------------------------------------------------------
"
WANTATHFOSSD="
================================================================================
Do you want to configure the Atheros 9k_htc USB chipset debugging tools?
(Respects your freedom.)
(y/n)?
Flags(s) : (CONFIG_ATH9K_HTC_DEBUGFS) 
--------------------------------------------------------------------------------
"
WANTSELINUX="
================================================================================
Do you want to enable SELinux(Required for Android 4.4 or later)(y/n)?
Flags(s) : () 
Other Names : 
--------------------------------------------------------------------------------
"
DPDARM="var/arch/arm/configs/"
DPDFEAT="var/feat/"
DPDSUBARCH="var/sub-arch/"
DPDANDROID="var/android/configs/"

