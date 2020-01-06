if ! [ -d build/ ]; then
	mkdir build/
fi
cd build/
if ! [ -d $rom/ ]; then
	mkdir $rom/
else
	rm -rf $rom
	mkdir $rom/
fi
cd $rom
if ! [ -d ../../repo_cache/ ]; then
	mkdir ../../repo_cache/
fi
if ! [ -d ../../repo_cache/$rom ]; then
	mkdir ../../repo_cache/$rom
	cd ../../repo_cache/$rom
	repo init -u git://github.com/crdroidandroid/android.git -b 9.0
else
	if ! [ -d ../../repo_cache/$rom/repo ]; then
		cd ../../repo_cache/$rom
		mv repo .repo
	else
		cd ../../repo_cache/$rom
		repo init -u git://github.com/crdroidandroid/android.git -b 9.0
	fi
fi

repo sync -j"$(cat /proc/cpuinfo | grep processor | wc -l)" --force-sync --no-tags --no-clone-bundle
mv * ../../build/$rom
tree_type=lineage
cd ../../
