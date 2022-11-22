# @api private
#
# @summary Ensure permissions on /etc/ssh/sshd_config are configured 
#
class secure_linux_cis::rules::ensure_permissions_on_etc_ssh_sshd_config_are_configured {
  file { '/etc/ssh/sshd_config':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
  }
}
