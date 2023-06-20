To be implemented: 20-Jun-23

Systems:
dcim-inv01n.addev
dcim-inv01.ad

Check that 'archive' resource from server.pp is employed

On dev:
disable puppet
# puppet agent --disable "DCIM upgrade"
stop apache
# apachectl stop

Change version number in puppet:
https://github.com/ucl-isd/puppet-hiera_dcim/blob/master/nodes/dcim-inv01n.addev.ucl.ac.uk.eyaml
Add:
profile_dcim::server8::opendcim_version = 'openDCIM-23.01'

Download new source file to:
puppet-master-a.isdapp:/etc/puppetlabs/puppet/installer_files/dcim/

## Where is 'installer_files' in puppet?
## Test extract to another folder

Puppet dry run to install package

Backup /opt/openDCIM/openDCIM-18.01/

Prun

copy application data between local dcim trees
  drawings
  pictures
  vendor/mpdf/mpdf/ttfontdata

# cd openDCIM-18.01
# tar cvzf ../copyfiles.tgz drawings/ pictures/ vendor/mpdf/mpdf/ttfontdata/
# cd ../openDCIM-23.01
# tar xvzf ../copyfiles.tgz
# cp -p install.php install.php.orig
(save install.php)

check selinux
semanage to allow appache to write to above three directories
^ this looks to be handled by puppet

start apache and test ...

** Needs PHP 8


enable puppet

---

Repeat for prod
