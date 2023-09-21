# @api private
#
# @summary Ensure the audit log directory is 0750 or more restrictive
#
class secure_linux_cis::rules::ensure_the_audit_log_directory_is_0750_or_more_restrictive {
  exec { 'Ensure the audit log directory is 0750 or more restrictive':
    command => 'chmod g-w,o-rwx "$(dirname $( awk -F"=" \'/^\s*log_file\s*=\s*/ {print $2}\' /etc/audit/auditd.conf))"',
    unless  => 'test -z `stat -Lc "%n %a" "$(dirname $( awk -F"=" \'/^\s*log_file\s*=\s*/ {print $2}\' /etc/audit/auditd.conf))" | grep -Pv --  \'^\h*\H+\h+([0,5,7][0,5]0)\'`',
    path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
  }
}
