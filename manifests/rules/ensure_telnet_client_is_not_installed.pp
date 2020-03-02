# @api private
#  Ensure telnet client is not installed (Scored)
#
# Description:
# The telnet package contains the telnet client, which allows users to start connections to other systems via the telnet protocol.
#
# Rationale:
# The telnet protocol is insecure and unencrypted. The use of an unencrypted transmission medium could allow an unauthorized user
# to steal credentials. The ssh package provides an encrypted session and stronger security and is included in most Linux distributions.
#
# @summary  Ensure telnet client is not installed (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_telnet_client_is_not_installed
class secure_linux_cis::rules::ensure_telnet_client_is_not_installed(
    Boolean $enforced = true,
) {
  if $enforced {
    case $facts['osfamily'] {
      'Suse': {
        package { 'telnet':
          ensure   => absent,
          schedule => 'harden_schedule',
        }
      }
      default: {
        package { 'telnet':
          ensure   => purged,
          schedule => 'harden_schedule',
        }
      }
    }
  }
}
