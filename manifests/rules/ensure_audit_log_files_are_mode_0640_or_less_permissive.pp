# @api private
#
# @summary Ensure audit log files are mode 0640 or less permissive
#
class secure_linux_cis::rules::ensure_audit_log_files_are_mode_0640_or_less_permissive {
  exec { 'Ensure audit log files are mode 0640 or less permissive':
    command => 'find $(dirname $(awk -F"=" \'/^\s*log_file/ {print $2}\' /etc/audit/auditd.conf | xargs)) -type f \( ! -perm 600 -a ! -perm 0400 -a ! -perm 0200 -a ! -perm 0000 -a ! -perm 0640 -a ! -perm 0440 -a ! -perm 0040 \) -exec chmod u-x,g-wx,o-rwx {} +',
    unless  => 'test -z `stat -Lc "%n %#a" "$(dirname $(awk -F"=" \'/^\s*log_file\s*=\s*/ {print $2}\' /etc/audit/auditd.conf | xargs))"/* | grep -Pv \'^\h*\H+\h+(0600|0400|0200|0000|0640|0440|0040)\b\'`',
    path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
  }
}
