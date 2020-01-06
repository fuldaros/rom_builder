cd build/$rom
echo "# GET DEVICE TREE"
git clone $repo_device device/$MAN/$DEVICE
echo "# GET KERNEL SOURCE"
git clone $repo_kernel kernel/$MAN/$CPU
echo "# GET VENDOR"
git clone $repo_vendor vendor/$MAN
cd ../..
