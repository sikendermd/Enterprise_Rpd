<#--

    THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
    FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.

-->
#!/bin/bash
#
# This file will read the archive files that are unzipped in /tmp/webcatmigration
#

/bin/dos2unix /tmp/webcatmigration/archive/Catalog_Deployment.csv /tmp/webcatmigration/archive/Catalog_Deployment.csv1
rm /tmp/webcatmigration/archive/Catalog_Deployment.csv
mv /tmp/webcatmigration/archive/Catalog_Deployment.csv1 /tmp/webcatmigration/archive/Catalog_Deployment.csv
while IFS=, read file path
do
echo ""
echo First Column in Catalog_Deployment - $file
echo Second Column in Catalog_Deployment - $path
echo ""
/export/obiee/11g/instances/instance1/bifoundation/OracleBIPresentationServicesComponent/coreapplication_obips1/catalogmanager/runcat.sh -cmd unarchive -offline /export/obishare/catalog/webcatalog -inputFile /tmp/webcatmigration/archive/$file -folder "$path"
done < /tmp/webcatmigration/archive/Catalog_Deployment.csv
~