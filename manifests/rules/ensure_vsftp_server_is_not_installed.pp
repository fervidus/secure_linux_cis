# @api private
#
# @summary Ensure VSFTP Server is not installed 
#
class secure_linux_cis::rules::ensure_vsftp_server_is_not_installed {
  package { 'vsftpd':
    ensure => absent,
  }
}
