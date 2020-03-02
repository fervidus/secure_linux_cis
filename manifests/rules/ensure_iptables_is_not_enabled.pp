# @api private
#  Ensure xinetd is not enabled (Scored)
#
# Description:
# The eXtended InterNET Daemon ( xinetd ) is an open source super daemon that replaced the original inetd daemon.
# The xinetd daemon listens for well known services and dispatches the appropriate daemon to properly respond to service requests.
#
# Rationale:
# If there are no xinetd services required, it is recommended that the daemon be disabled.
#
# @summary  Ensure xinetd is not enabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_iptables_is_not_enabled
class secure_linux_cis::rules::ensure_iptables_is_not_enabled(
    Boolean $enforced = true,
) {
  if $enforced {
    service { 'iptables':
      ensure   => stopped,
      schedule => 'harden_schedule',
      enable   => mask,
    }
  }
}
