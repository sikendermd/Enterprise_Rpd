export INFA_HOME=${deployed.container.home}
export LD_LIBRARY_PATH=${deployed.container.home}/server/bin

<#assign pmrep=deployed.container.home + "/server/bin/pmrep">
<#assign exitCodeCheck>
res=$?
if [ $res != 0 ] ; then
  exit $res
fi
</#assign>
${pmrep} connect -r ${deployed.container.repository} -d ${deployed.container.domain} -n ${deployed.container.username} -x ${deployed.container.password}
${exitCodeCheck}

echo ------------------------------------------------------------------------

${pmrep} objectimport -i ${deployed.file} -c ${deployed.targetPath}/import_Infa_Objects_Control.txt -p > ${deployed.targetPath}/import.Infa_objects.log.txt

${exitCodeCheck}
