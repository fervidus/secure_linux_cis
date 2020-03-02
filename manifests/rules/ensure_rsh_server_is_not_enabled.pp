# @api private
# 7 Ensure rsh server is not enabled (Scored)
#
# Description:
# The Berkeley rsh-server ( rsh , rlogin , rexec ) package contains legacy services that exchange credentials in clear-text.
#
# Rationale:
# These legacy services contain numerous security exposures and have been replaced with the more secure SSH package.
#
# @summary 7 Ensure rsh server is not enabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_rsh_server_is_not_enabled
class secure_linux_cis::rules::ensure_rsh_server_is_not_enabled(
    Boolean $enforced = true,
) {
  if $enforced {
    $rsh_services = [
      'rsh.socket',
      'rlogin.socket',
      'rexec.socket',
    ]
    service { $rsh_services:
      ensure   => stopped,
      schedule => 'harden_schedule',
      enable   => false,
    }
  }
}
