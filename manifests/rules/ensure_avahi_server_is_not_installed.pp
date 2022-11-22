# @api private
#
# @summary Ensure Avahi Server is not installed 
#
class secure_linux_cis::rules::ensure_avahi_server_is_not_installed {
  package { ['avahi-autoipd', 'avahi']:
    ensure => absent,
  }
}
