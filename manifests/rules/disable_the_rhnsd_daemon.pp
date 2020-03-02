# @api private
#  Disable the rhnsd Daemon (Not Scored)
#
#
# Description:
# The rhnsd daemon polls the Red Hat Network web site for scheduled actions and, if there are, executes those actions.
#
# @summary  Disable the rhnsd Daemon (Not Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::disable_the_rhnsd_daemon
class secure_linux_cis::rules::disable_the_rhnsd_daemon(
    Boolean $enforced = true,
) {
  if $enforced {
    service { 'rhnsd':
      ensure   => stopped,
      schedule => 'harden_schedule',
      enable   => false,
    }
  }
}
