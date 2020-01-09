function pull() {
cd $req
git pull
cd ../
}
export device_ca="device_cache/$DEVICE"
if ! [ -d device_cache/ ]; then
	mkdir device_cache/
fi
if ! [ -d device_cache/$DEVICE ]; then
	mkdir device_cache/$DEVICE
	cd device_cache/$DEVICE
	echo "# GET DEVICE TREE"
	git clone $repo_device device
	echo "# GET KERNEL SOURCE"
	git clone $repo_kernel kernel
	echo "# GET VENDOR"
	git clone $repo_vendor vendor
	cd ../..
else
	for req in device kernel vendor
	do
	pull
	done
fi
cd build/$rom
echo "# SYNC DEVICE TREE"
git clone ../../"$device_ca"/device device/$MAN/$DEVICE
echo "# SYNC KERNEL SOURCE"
git clone ../../"$device_ca"/kernel kernel/$MAN/$CPU
echo "# SYNC VENDOR"
git clone ../../"$device_ca"/vendor vendor/$MAN
cd ../..

