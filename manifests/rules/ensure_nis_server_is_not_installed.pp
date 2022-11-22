# @api private
#
# @summary Ensure NIS Server is not installed 
#
class secure_linux_cis::rules::ensure_nis_server_is_not_installed {
  package { ['ypserv', 'nis']:
    ensure => absent,
  }
}
