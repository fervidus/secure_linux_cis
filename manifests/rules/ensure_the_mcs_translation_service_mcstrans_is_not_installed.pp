# @api private
#  Ensure the MCS Translation Service (mcstrans) is not installed (Scored)
#
#
# Description:
# The mcstransd daemon provides category label information to client processes requesting information. The label
# translations are defined in /etc/selinux/targeted/setrans.conf
#
# @summary  Ensure the MCS Translation Service (mcstrans) is not installed (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_the_mcs_translation_service_mcstrans_is_not_installed
class secure_linux_cis::rules::ensure_the_mcs_translation_service_mcstrans_is_not_installed(
    Boolean $enforced = true,
) {
  if $enforced {
    case $facts['osfamily'] {
      'Suse': {
        package { 'mcstrans':
          ensure   => absent,
          schedule => 'harden_schedule',
        }
      }
      default: {
        package { 'mcstrans':
          ensure   => purged,
          schedule => 'harden_schedule',
        }
      }
    }
  }
}
