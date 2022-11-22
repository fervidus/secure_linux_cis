# @api private
#
# @summary Ensure LDAP client is not installed 
#
class secure_linux_cis::rules::ensure_ldap_client_is_not_installed {
  case $facts['osfamily'] {
    'Suse': {
      package { ['openldap-clients', 'ldap-utils']:
        ensure   => absent,
      }
    }
    default: {
      package { ['openldap-clients', 'ldap-utils']:
        ensure   => absent,
      }
    }
  }
}
