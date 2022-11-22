# @api private
#
# @summary Ensure FTP Server is not installed 
#
class secure_linux_cis::rules::ensure_ftp_server_is_not_installed {
  package { 'ftp':
    ensure => absent,
  }
}
