To be implemented: 20-Jun-23

Systems:
dcim-inv01n.addev
dcim-inv01.ad

Check that 'archive' resource from server.pp is employed

On dev:
disable puppet
stop apache

Change version number in puppet:
https://github.com/ucl-isd/puppet-hiera_dcim/blob/master/nodes/dcim-inv01n.addev.ucl.ac.uk.eyaml
Add:
profile_dcim::server8::opendcim_version = 'openDCIM-23.01'

Where is 'installer_files' in puppet?
Test extract to another folder

Puppet dry run to install package

copy application data between local dcim trees
  drawings
  pictures
  vendor/mpdf/mpdf/ttfontdata

check selinux
semanage to allow appache to write to above three directories

start apache and test ...

enable puppet

---

Repeat for prod
