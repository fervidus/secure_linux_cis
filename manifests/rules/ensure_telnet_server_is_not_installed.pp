# @api private
#
# @summary Ensure telnet-server is not installed 
#
class secure_linux_cis::rules::ensure_telnet_server_is_not_installed {
  package { 'telnet-server':
    ensure => absent,
  }
}
