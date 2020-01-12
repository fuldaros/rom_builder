cd build/"$rom"_"$ANDROID"
. build/envsetup.sh
lunch "$tree_type"_"$DEVICE"-"$2"
mka -j"$(cat /proc/cpuinfo | grep processor | wc -l)" bacon
cd ../../
mv repo_cache/"$rom"_"$ANDROID"/.repo repo_cache/"$rom"_"$ANDROID"/repo
