# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_only_authorized_users_own_audit_log_files
class secure_linux_cis::rules::ensure_only_authorized_users_own_audit_log_files {
  exec { 'Fix user audit file ownership':
    command => 'cd /root; [ -f /etc/audit/auditd.conf ] && find "$(dirname $(awk -F "=" \'/^\s*log_file/ {print $2}\' /etc/audit/auditd.conf | xargs))" -type f ! -user root -exec stat -Lc "%n %U" {} +',
    unless  => 'test -z `[ -f /etc/audit/auditd.conf ] && find "$(dirname $(awk -F "=" \'/^\s*log_file/ {print $2}\' /etc/audit/auditd.conf | xargs))" -type f ! -user
root -exec chown root {} +`',
    path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
  }
}
