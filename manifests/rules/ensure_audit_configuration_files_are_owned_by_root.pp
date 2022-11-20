# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_audit_configuration_files_are_owned_by_root {
  file { '/etc/audit':
    ensure  => directory,
    recurse => true,
    owner   => 'root',
    group   => 'root',
  }
}
