#!/data/data/com.termux/files/usr/bin/bash

## Colors
c='\033[1;36m'
y='\033[1;33m'
p='\033[1;35m'
RE='\033[0m'
g="\033[1;32m"
r="\033[1;31m"
b="\033[1;34m"
w="\033[0m"
transparent="\e[0m"

unset LD_PRELOAD
DIR=$HOME/SARA
DI=/data/data/com.termux/files/home
null="> /dev/null 2>&1"

function check_root() {
if [ -e .suroot ]; then
	echo -e $G"Success!"$transparent
	sleep 3
else
	echo -e $r"[!]requires root access!!"
 echo -e $r"[!]Use tsu"
	sleep 3
exit
fi
}
clear

cp /system/framework/framework-res.apk $DI/SARA/1.apk
echo
echo -e $y" [*] Setting Up Program ..."$c
echo
chmod 777 $DIR/.data/binaries/lib/libld.so
chmod +x $DIR/.data/apktool
chmod +x $DIR/.data/signapk
chmod 777 $DIR/.data/binaries/java
chmod 777 $DIR/.data/binaries/bin/java
chmod 777 $DIR/.data/binaries/bin/keytool

if [ -L $PREFIX/bin/apktool ]; then
rm $PREFIX/bin/apktool
fi

ln -s $DIR/.data/apktool $PREFIX/bin/
ln -s $DIR/.data/binaries/java $PREFIX/bin/

echo -e $r"Import Framework "$transparent
sh $DIR/.data/apktool if $DI/SARA/1.apk
echo
echo -e $g" [*] DONE!"
sleep 1
echo -e $b">"$w" use command "$g"python3 tehsara.py"$w" for start the console"
check_root
echo

