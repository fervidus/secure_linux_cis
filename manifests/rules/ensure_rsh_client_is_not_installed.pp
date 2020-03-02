# @api private
#  Ensure rsh client is not installed (Scored)
#
# Description:
# The rsh package contains the client commands for the rsh services.
#
# Rationale:
# These legacy clients contain numerous security exposures and have been replaced with the more secure SSH package.
# Even if the server is removed, it is best to ensure the clients are also removed to prevent users from inadvertently attempting
# to use these commands and therefore exposing their credentials.
# Note that removing the rsh package removes the clients for rsh , rcp and rlogin .
#
# @summary  Ensure rsh client is not installed (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_rsh_client_is_not_installed
class secure_linux_cis::rules::ensure_rsh_client_is_not_installed(
    Boolean $enforced = true,
) {
  if $enforced {
    case $facts['osfamily'] {
      'Suse': {
        package { ['rsh', 'rsh-client', 'rsh-redone-client']:
          ensure   => absent,
          schedule => 'harden_schedule',
        }
      }
      default: {
        package { ['rsh', 'rsh-client', 'rsh-redone-client']:
          ensure   => purged,
          schedule => 'harden_schedule',
        }
      }
    }
  }
}
