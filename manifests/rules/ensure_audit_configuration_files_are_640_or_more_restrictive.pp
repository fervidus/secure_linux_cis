# @api private
#
# @summary Ensure audit configuration files are 640 or more restrictive
#
class secure_linux_cis::rules::ensure_audit_configuration_files_are_640_or_more_restrictive {
  exec { 'Ensure audit configuration files are 640 or more restrictive':
    command => 'find /etc/audit/ -type f \( -name "*.conf" -o -name "*.rules" \) -exec chmod u-x,g-wx,o-rwx {} +',
    unless  => 'test -z `find /etc/audit/ -type f \( -name "*.conf" -o -name "*.rules" \) -exec stat -Lc "%n %a" {} + | grep -Pv -- \'^\h*\H+\h*([0,2,4,6][0,4]0)\h*$\' | grep -Pv --  \'^\h*\H+\h+([0,2,4,6][0,4]0)\'`',
    path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
  }
}
