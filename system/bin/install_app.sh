#!/system/bin/sh
FLAG=$(getprop persist.sys.first_run)
dest_dir=/data/app/
source_dir=/custom/
#$1 is the dir, $2 is the dest dir
copy_apk() {
	local parent_dir cur_dir
	parent_dir=`find $1 -name *.apk`
	for cur_dir in $parent_dir
	do
		cp $cur_dir $dest_dir
	done
}

cur=
apk_dir=
#FLAG=$?
if [ 1 -eq $FLAG ];then
	setprop persist.sys.first_run 0
	apk_dir=`find $source_dir -type d -name apk`
	echo $apk_dir
	for cur in $apk_dir
	do
		echo "aaa $cur"
		copy_apk $cur
	done

	app_file=`find $dest_dir -name *.apk`
	for cur in $app_file
	do
		chgrp 1000 $cur
		chown 1000 $cur
		chmod 0644 $cur
	done
fi
