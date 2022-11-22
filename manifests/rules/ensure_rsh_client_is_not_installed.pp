# @api private
#
# @summary Ensure rsh client is not installed 
#
class secure_linux_cis::rules::ensure_rsh_client_is_not_installed {
  case $facts['os']['family'] {
    'Suse': {
      package { ['rsh', 'rsh-client', 'rsh-redone-client']:
        ensure   => absent,
      }
    }
    default: {
      package { ['rsh', 'rsh-client', 'rsh-redone-client']:
        ensure   => absent,
      }
    }
  }
}
