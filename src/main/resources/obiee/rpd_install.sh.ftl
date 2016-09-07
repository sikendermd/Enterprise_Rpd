#!/bin/bash
# -----------------------------------------------------------------------------
# script_to _deploy_rpd
#
# -----------------------------------------------------------------------------
Init_Location=${1}
ll *.rpd
echo ${deployed.file}
cp ${deployed.file} /tmp
echo "copied"
echo ${deployed.file.name}
Init_Location=/u01/app/oracle/product/fmw/instances/instance1/bifoundation/OracleBIApplication/coreapplication/setup
cd $Init_Location
. bi-init.sh
cd ${deployed.container.home}
echo "home"
echo "${deployed.file}"
echo "${deployed.file.name}"
./nqudmlgen -P ${deployed.container.password} -R ${deployed.file} -O ${deployed.UDMLtargetPath}/Final.txt
sleep 5
echo "here"
./nqudmlexec -P ${deployed.container.password} -I /tmp/rpdupdate_install.txt -B /tmp/${deployed.file.name} -O ${deployed.targetPath}/Generated.rpd
mv Generated.rpd ${deployed.file}
sleep 5
rm -rf *.rpd
rm -rf *.txt
