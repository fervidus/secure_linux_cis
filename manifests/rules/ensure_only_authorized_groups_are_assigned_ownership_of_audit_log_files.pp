# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_only_authorized_groups_are_assigned_ownership_of_audit_log_files {
  exec { 'Fix log files group ownership':
    command => 'find $(dirname $(awk -F"=" \'/^\s*log_file/ {print $2}\' /etc/audit/auditd.conf | xargs)) -type f \( ! -group adm -a ! -group root \) -exec chgrp adm {} +',
    unless  => 'test -z `stat -c "%n %G" "$(dirname $(awk -F"=" \'/^\s*log_file\s*=\s*/ {print $2}\' /etc/audit/auditd.conf | xargs))"/* | grep -Pv \'^\h*\H+\h+(adm|root)\b\'`',
    path    => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
  }

  file { '/etc/audit/auditd.conf':
    group => 'adm',
  }

  file_line { 'set the log_group parameter in the audit configuration':
    path                                  => '/etc/audit/auditd.conf',
    line                                  => 'log_group = adm',
    match                                 => '^\h*log_group\h*=\h*(?~adm|root)\b',
    replace                               => true,
    replace_all_matches_not_matching_line => true,
  }
}
