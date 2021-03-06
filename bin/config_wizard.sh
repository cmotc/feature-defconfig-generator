#!/bin/bash
source var/fdg/variables.sh
echo -e $INTRO
read -p "Press any key to continue..." 
#Configure architecture
while true; do
	read -p "$WANTMSM" yn
	case $yn in
		[Yy]* ) PDMSM="y"; break;;
		[Nn]* ) PDMSM="n"; break;;
		*) echo "Please answer Y/y or N/n";;
	esac
done
	if [ [$PDMSM="y"] ];then
		while true; do
			read -p "$WANTMSM7XXXA" yn
			case $yn in
				[Yy]* ) PDS="y"; break;;
				[Nn]* ) PDS="n"; break;;
				*) echo "Please answer Y/y or N/n";;
			esac
		done
			if [ [$PDS="n"] ]; then
				while true; do
					read -p "$WANTMSM7X30A" yn
					case $yn in
						[Yy]* ) PDSS="y"; break;;
						[Nn]* ) PDSS="n"; break;;
						*) echo "Please answer Y/y or N/n";;
					esac
				done
			fi
		while true; do
			read -p "$WANTADRENO" yn
			case $yn in
				[Yy]* ) PDRENO="y"; break;;
				[Nn]* ) PDRENO="n"; break;;
				*) echo "Please answer Y/y or N/n";;
			esac
		done
	fi
#Configure Android
while true; do
	read -p "$WANTANDROID" yn
	case $yn in
		[Yy]* ) PDA="y"; break;;
		[Nn]* ) PDA="n"; break;;
		*) echo "Please answer Y/y or N/n";;
	esac
done
	if [ [$PDA="y"] ]; then
		while true; do
			read -p "$WANTANDROIDBASE" yn
			case $yn in
				[Yy]* ) PDAB="y"; break;;
				[Nn]* ) PDAB="n"; break;;
				*) echo "Please answer Y/y or N/n";;
			esac
		done
		while true; do
			read -p "$WANTANDROIDFULL" yn
			case $yn in
				[Yy]* ) PDAF="y"; break;;
				[Nn]* ) PDAF="n"; break;;
				*) echo "Please answer Y/y or N/n";;
			esac
		done
	fi
# Configure Wi-Fi
while true; do
	read -p "$WANTWIFI" yn
	case $yn in
		[Yy]* ) PDWF="y"; break;;
		[Nn]* ) PDWF="n"; break;;
		*) echo "Please answer Y/y or N/n";;
	esac
done
	if [ [$PDWF="y"] ]; then
		while true; do
			read -p "$WANTATH6KL" yn
			case $yn in
				[Yy]* ) PDATHM="y"; break;;
				[Nn]* ) PDATHM="n"; break;;
				*) echo "Please answer Y/y or N/n";;
			esac
		done
			if [ [$PDATHM="y"] ]; then
				while true; do
					read -p "$WANTATH6KLU" yn
					case $yn in
						[Yy]* ) PDATHMU="y"; break;;
						[Nn]* ) PDATHMU="n"; break;;
						*) echo "Please answer Y/y or N/n";;
					esac
				done
				while true; do
					read -p "$WANTATH6KLD" yn
					case $yn in
						[Yy]* ) PDATHMD="y"; break;;
						[Nn]* ) PDATHMD="n"; break;;
						*) echo "Please answer Y/y or N/n";;
					esac
				done
			fi
		while true; do
			read -p "$WANTATHFOSS" yn
			case $yn in
				[Yy]* ) PDATH="y"; break;;
				[Nn]* ) PDATH="n"; break;;
				*) echo "Please answer Y/y or N/n";;
			esac
		done
			if [ [$PDATH="y"] ]; then
				while true; do
					read -p "$WANTATHFOSSD" yn
					case $yn in
						[Yy]* ) PDATHD="y"; break;;
						[Nn]* ) PDATHD="n"; break;;
						*) echo "Please answer Y/y or N/n";;
					esac
				done
			fi
	fi
# Configure SELinux
while true; do
	read -p "$WANTSELINUX" yn
	case $yn in
		[Yy]* ) PDSEL="y"; break;;
		[Nn]* ) PDSEL="n"; break;;
		*) echo "Please answer Y/y or N/n";;
	esac
done
if [ [$PDMSM="y"] ]; then
	MERGEFILES=$MSM_DEFCON
fi
if [ [$PDS="y"] ]; then
	MERGEFILES=$MERGEFILES$MSMS_DEFCON
fi
if [ [$PDSS="y"] ]; then
	MERGEFILES=$MERGEFILES$MSMSS_DEFCON
fi
if [ [$PDRENO="y"] ]; then
	MERGEFILES=$MERGEFILES$MSM_FB_DEFCON
fi
if [ [$PDAB="y"] ]; then
	MERGEFILES=$MERGEFILES$AND_DEFCON
fi
if [ [$PDAF="y"] ]; then
	MERGEFILES=$MERGEFILES$ANF_DEFCON
fi
if [ [$PDWF="y"] ]; then
	MERGEFILES=$MERGEFILES$WIFI_DEFCON
fi
if [ [$PDATHM="y"] ]; then
	MERGEFILES=$MERGEFILES$ATHM_DEFCON
fi
if [ [$PDATHMU="y"] ]; then
	MERGEFILES=$MERGEFILES$ATHMU_DEFCON
fi
if [ [$PDATHMD="y"] ]; then
	MERGEFILES=$MERGEFILES$ATHMD_DEFCON
fi
if [ [$PDATH="y"] ]; then
	MERGEFILES=$MERGEFILES$ATH_DEFCON
fi
if [ [$PDATHD="y"] ]; then
	MERGEFILES=$MERGEFILES$ATHD_DEFCON
fi
if [ [$PDSEL="y"] ]; then
	MERGEFILES=$MERGEFILES$SEL_DEFCON
fi
echo $MERGEFILES
./lib/merge_config_nomake.sh $MERGEFILES
mv .config generated_config