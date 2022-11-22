# @api private
#
# @summary Ensure telnet client is not installed 
#
class secure_linux_cis::rules::ensure_telnet_client_is_not_installed {
  case $facts['osfamily'] {
    'Suse': {
      package { 'telnet':
        ensure   => absent,
      }
    }
    default: {
      package { 'telnet':
        ensure   => absent,
      }
    }
  }
}
