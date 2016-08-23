${Container.Init.home}
. bi-init.sh
${deployed.container.home}
./nqudmlgen -P ${deployed.container.password} -R ${deployed.file} -O ${deployed.UDMLtargetPath}/Final.txt
./nqudmlexec -P ${deployed.container.password} -I rpdupdate_install.txt -B ${deployed.file} -O ${deployed.targetPath}/Generated.rpd
mv Generated.rpd ${deployed.file}

