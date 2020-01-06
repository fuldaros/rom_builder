cd build/
mkdir $rom/
cd $rom
repo init -u git://github.com/crdroidandroid/android.git -b 9.0
repo sync -j"$(cat /proc/cpuinfo | grep processor | wc -l)" --force-sync --no-tags --no-clone-bundle
tree_type=lineage
cd ../../
