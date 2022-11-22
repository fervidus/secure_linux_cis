# @api private
#
# @summary Ensure permissions on SSH private host key files are configured 
#
class secure_linux_cis::rules::ensure_permissions_on_ssh_private_host_key_files_are_configured {
  include secure_linux_cis::sshd_service

  unless $facts['ssh_host_keys'].empty {
    file { $facts['ssh_host_keys']:
      ensure => 'file',
      owner  => 'root',
      group  => 'root',
      mode   => '0600',
    }
  }
}
