# @api private
#
# @summary Ensure DNS Server is not installed 
#
class secure_linux_cis::rules::ensure_dns_server_is_not_installed {
  package { 'bind':
    ensure => absent,
  }
}
