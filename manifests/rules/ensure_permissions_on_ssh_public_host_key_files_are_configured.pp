# @api private
#
# @summary Ensure permissions on SSH public host key files are configured 
#
class secure_linux_cis::rules::ensure_permissions_on_ssh_public_host_key_files_are_configured {
  include secure_linux_cis::sshd_service

  file { $facts['ssh_host_pub_keys']:
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => 'u-x,go-wx',
  }
}
