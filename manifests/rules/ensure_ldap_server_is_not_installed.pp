# @api private
#
# @summary Ensure LDAP server is not installed 
#
class secure_linux_cis::rules::ensure_ldap_server_is_not_installed {
  package { 'openldap-servers':
    ensure => absent,
  }
}
