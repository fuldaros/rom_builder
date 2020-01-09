cd build/$rom
. build/envsetup.sh
lunch "$tree_type"_"$DEVICE"-"$2"
mka -j"$(cat /proc/cpuinfo | grep processor | wc -l)" bacon
cd ../../
mv repo_cache/$rom/.repo repo_cache/$rom/repo
