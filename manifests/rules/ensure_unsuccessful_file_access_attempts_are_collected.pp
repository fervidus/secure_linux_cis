# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_unsuccessful_file_access_attempts_are_collected
class secure_linux_cis::rules::ensure_unsuccessful_file_access_attempts_are_collected {
  $system_audit_rules = @("SYSTEMAUDITRULES"/L)
    -a always,exit -F arch=b64 -S creat,open,openat,truncate,ftruncate -F exit=- EACCES -F auid>=${facts['uid_min']} -F auid!=unset -k access
    -a always,exit -F arch=b64 -S creat,open,openat,truncate,ftruncate -F exit=- EPERM -F auid>=${facts['uid_min']} -F auid!=unset -k access
    -a always,exit -F arch=b32 -S creat,open,openat,truncate,ftruncate -F exit=- EACCES -F auid>=${facts['uid_min']} -F auid!=unset -k access
    -a always,exit -F arch=b32 -S creat,open,openat,truncate,ftruncate -F exit=- EPERM -F auid>=${facts['uid_min']} -F auid!=unset -k access
    | SYSTEMAUDITRULES

  file { '/etc/audit/rules.d/50-access.rules':
    ensure  => file,
    content => $system_audit_rules,
  }

  Class['secure_linux_cis::rules::ensure_unsuccessful_file_access_attempts_are_collected']
  ~> Class['secure_linux_cis::refresh_mount_options']
}
