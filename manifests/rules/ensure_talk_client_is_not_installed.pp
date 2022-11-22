# @api private
#
# @summary Ensure talk client is not installed 
#
class secure_linux_cis::rules::ensure_talk_client_is_not_installed {
  case $facts['osfamily'] {
    'Suse': {
      package { 'talk':
        ensure   => absent,
      }
    }
    default: {
      package { 'talk':
        ensure   => absent,
      }
    }
  }
}
