# @api private
#
# @summary Ensure TFTP client is not installed 
#
class secure_linux_cis::rules::ensure_tftp_client_is_not_installed {
  package { 'tftp':
    ensure => absent,
  }
}
