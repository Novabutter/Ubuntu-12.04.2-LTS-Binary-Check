#!/bin/bash
##################### RUN AS ROOT ####################
echo "--- System Binaries ---"
echo ""
for i in /bin/*
do
	binary=$(echo $i | cut -d "/" -f3)
	md5sum=$(md5sum $i | cut -d " " -f1)
	inputSum=$(cat $1 | grep "$i " | cut -d " " -f2)
	refinedInputSum=$(echo $inputSum | cut -d " " -f1)
	echo "-- $binary --"
	if [ $refinedInputSum = $md5sum ] ; then
		echo -e "[ \e[32mValid\e[39m ]"
	else
		echo -e "[ \e[31mINVALID\e[39m ]"
		echo "$i did not match. Check Recommended." >> invalid.txt
	fi
	#echo "$inputSum == $md5sum"
	#echo "$binary $md5sum"
	echo -e "\e[39m"
done
echo ""
echo "--- Admin Binaries ---"
echo ""
for i in /sbin/*
do
	binary=$(echo $i | cut -d "/" -f3)
	md5sum=$(md5sum $i | cut -d " " -f1)
	inputSum=$(cat $1 | grep "$i " | cut -d " " -f2)
	refinedInputSum=$(echo $inputSum | cut -d " " -f1)
	echo "-- $binary --"
	if [ $refinedInputSum = $md5sum ] ; then
		echo -e "[ \e[32mValid\e[39m ]"
	else
		echo -e "[ \e[31mINVALID\e[39m ]"
		echo "$i did not match. Check Recommended." >> invalid.txt
	fi
	#echo "$inputSum == $md5sum"
	#echo "$binary $md5sum"
	echo -e "\e[39m"
done
echo ""
echo "--- User Binaries ---"
echo ""
for i in /usr/bin/*
do
	binary=$(echo $i | cut -d "/" -f4)
	md5sum=$(md5sum $i | cut -d " " -f1)
	inputSum=$(cat $1 | grep "$i " | cut -d " " -f2)
	refinedInputSum=$(echo $inputSum | cut -d " " -f1)
	echo "-- $binary --"
	if [ $refinedInputSum = $md5sum ] ; then
		echo -e "[ \e[32mValid\e[39m ]"
	else
		echo -e "[ \e[31mINVALID\e[39m ]"
		echo "$i did not match. Check Recommended." >> invalid.txt
	fi
	#echo "$inputSum == $md5sum"
	#echo "$binary $md5sum"
	echo -e "\e[39m"
done
echo ""
echo "Scanning complete. Please check verify.txt for invalid hashes."
