# @api private
#  Ensure talk client is not installed (Scored)
#
# Description:
# The talk software makes it possible for users to send and receive messages across systems through a terminal session.
# The talk client, which allows initialization of talk sessions, is installed by default.
#
# Rationale:
# The software presents a security risk as it uses unencrypted protocols for communication.
#
# @summary  Ensure talk client is not installed (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_talk_client_is_not_installed
class secure_linux_cis::rules::ensure_talk_client_is_not_installed(
    Boolean $enforced = true,
) {
  if $enforced {
    case $facts['osfamily'] {
      'Suse': {
        package { 'talk':
          ensure   => absent,
          schedule => 'harden_schedule',
        }
      }
      default: {
        package { 'talk':
          ensure   => purged,
          schedule => 'harden_schedule',
        }
      }
    }
  }
}
