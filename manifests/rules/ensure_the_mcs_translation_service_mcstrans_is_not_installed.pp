# @api private
#
# @summary Ensure the MCS Translation Service (mcstrans) is not installed 
#
class secure_linux_cis::rules::ensure_the_mcs_translation_service_mcstrans_is_not_installed {
  case $facts['osfamily'] {
    'Suse': {
      package { 'mcstrans':
        ensure   => absent,
      }
    }
    default: {
      package { 'mcstrans':
        ensure   => absent,
      }
    }
  }
}
