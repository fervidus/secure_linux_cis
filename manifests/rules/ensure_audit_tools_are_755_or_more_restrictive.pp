# @api private
#
# @summary Ensure audit tools are 755 or more restrictive
#
class secure_linux_cis::rules::ensure_audit_tools_are_755_or_more_restrictive {
  exec { 'Ensure audit tools are 755 or more restrictive':
    command => 'chmod go-w /sbin/auditctl /sbin/aureport /sbin/ausearch /sbin/autrace /sbin/auditd /sbin/augenrules',
    unless  => 'test -z `stat -c "%n %a" /sbin/auditctl /sbin/aureport /sbin/ausearch /sbin/autrace /sbin/auditd /sbin/augenrules | grep -Pv -- \'^\h*\H+\h+([0-7][0,1,4,5][0,1,4,5])\h*$\'`',
    path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
  }
}
