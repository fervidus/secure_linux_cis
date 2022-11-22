# @api private
#
# @summary Ensure audit configuration files are owned by root 
#
class secure_linux_cis::rules::ensure_audit_configuration_files_are_owned_by_root {
  file { '/etc/audit':
    ensure  => directory,
    recurse => true,
    owner   => 'root',
    group   => 'root',
  }
}
