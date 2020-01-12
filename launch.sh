#!/bin/bash
set -e
echo "XPROJ ROM BUILDER"
sleep 1
echo "BASH SCRIPT v$(cat info/version)"
sleep 1
echo "GET device SPEC HERE:"
if [ -n "$1" ]; then
	echo "	device is [$1]"
else
	echo "error: No parameters for DEVICE. "
	echo "usage: ./launch.sh [device] [buildtype]. "
	exit
fi
if [ -n "$2" ]; then
	echo "	build type is [$2]"
else
	echo "error: No parameters for BUILD TYPE. "
	echo "usage: ./launch.sh [device] [buildtype]. "
	exit
fi
echo "	geting info from xp_$1_$2.conf..."
sleep 2
source device/xp_$1_$2.conf
echo "	cheking config compatibility..."
sleep 1
rm -rf build
for comp in $(cat info/co_ver)
do
sleep 0.1
if grep -q "CONF=$comp" device/xp_$1_$2.conf; then
	echo " config $comp is set"
	export COMP="1"
	mkdir build
	mkdir build/conf
	source device/base/xp_$comp.conf 
	break
else
	echo " is not $comp"
fi
done
if [ "$IS_PREMAKE" == "yes" ]; then
echo " "
echo " "
echo " "
echo " "
echo "###################################"
echo "###################################"
echo " WARNING! USE PREBUILT CONFIGS"
echo "###################################"
echo "###################################"
sleep 2
fi
echo "###################################"
echo "	DEVICE SPEC"
echo "Device:= $DEVICE"
echo "CPU:= $CPU"
echo "Developer:= $DEV"
echo "Git* host:= $HOST"
echo "Android version:= $ANDROID"
echo "Device:= $repo_device"
echo "Kernel:= $repo_kernel"
echo "Vendor:= $repo_vendor"
echo "BUILD:= $ROMS"
echo "###################################"
for rom in $ROMS
do
source base/roms/"$rom"_"$ANDROID".conf
source base/android_rom.sh
source base/device_get_repo.sh
source base/android_build.sh
done
