cd /u01/app/oracle/product/fmw/instances/instance1/bifoundation/OracleBIApplication/coreapplication/setup
. bi-init.sh
cd ${deployed.container.home}
./nqudmlgen -P ${deployed.container.password} -R ${deployed.file} -O ${deployed.UDMLtargetPath}/Final.txt
sleep 5
./nqudmlexec -P ${deployed.container.password} -I rpdupdate_install.txt -B ${deployed.file} -O ${deployed.targetPath        }/Generated.rpd
mv Generated.rpd ${deployed.file}
sleep 5
