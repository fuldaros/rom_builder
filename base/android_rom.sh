if ! [ -d build/ ]; then
	mkdir build/
fi
cd build/
if ! [ -d "$rom"-"$ANDROID"/ ]; then
	mkdir "$rom"-"$ANDROID"/
else
	rm -rf "$rom"-"$ANDROID"
	mkdir "$rom"-"$ANDROID"/
fi
cd "$rom"-"$ANDROID"
if ! [ -d ../../repo_cache/ ]; then
	mkdir ../../repo_cache/
fi
if ! [ -d ../../repo_cache/"$rom"-"$ANDROID" ]; then
	mkdir ../../repo_cache/"$rom"-"$ANDROID"
	cd ../../repo_cache/"$rom"-"$ANDROID"
	repo init -u $repos
else
	if ! [ -d ../../repo_cache/"$rom"-"$ANDROID"/repo ]; then
		cd ../../repo_cache/"$rom"-"$ANDROID"
		repo init -u $repos	
	else
		cd ../../repo_cache/"$rom"-"$ANDROID"
		mv repo .repo
	fi
fi

repo sync -j"$(cat /proc/cpuinfo | grep processor | wc -l)" --force-sync --no-tags --no-clone-bundle
mv * ../../build/"$rom"-"$ANDROID"
tree_type=lineage
cd ../../
