if [[ "${UID}" -eq 0 ]]
then
  echo ' '
  echo 'You are root.'
else
  echo 'You are not root please run the script with root privilege.'
  exit 1
fi

echo " 

CPU Details
-----------
"
cat /etc/os-release | head -n 2 | sed -e 's/NAME=/OS NAME = / ' -e  's/VERSION=/VERSION = /' -e 's/"//g'

ver=`uname -r | awk -F - '{ print $1 }'`

echo "Kernel Version = ${ver}"

cat /proc/cpuinfo | grep 'vendor' | uniq | sed 's/vendor_id/CPU Manufacturer/'  | column -t 

cat /proc/cpuinfo | grep 'model name' | uniq | sed 's/model name/CPU Model Name/'

lscpu | grep MHz | sed 's/CPU MHz:/CPU Clock speed :/' | column -t 

arch | sed  -e 's/x86_64/CPU Architecture : 64bit/' -e 's/i686/CPU Architecture : 32bit/'

echo "

RAM Usages Detail
-----------------
"

free -h | sed -n '1,2p' | sed 's/Mem/RAM/'


echo "

Allowd services in OS firewall
------------------------------
"
firewall-cmd --list-services  | column -t

echo "

Allowd Ports in OS firewall
---------------------------
"
firewall-cmd --list-port  | column -t

echo "

Disk Details
------------
"

df -Th | column -t | sed 's/Mounted         on/Mounted on/'

echo " "
echo "

Logged In User
--------------
"
w

echo "

"

