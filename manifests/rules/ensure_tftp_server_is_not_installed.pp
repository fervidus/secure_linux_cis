# @api private
#
# @summary Ensure TFTP Server is not installed 
#
class secure_linux_cis::rules::ensure_tftp_server_is_not_installed {
  package { 'tftp-server':
    ensure => absent,
  }
}
