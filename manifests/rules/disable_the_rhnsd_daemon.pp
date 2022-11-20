# @api private
#
#  Disable the rhnsd Daemon (Not Scored)
#
# Description:
# The rhnsd daemon polls the Red Hat Network web site for scheduled actions and, if there are, executes those actions.
#
# @summary  Disable the rhnsd Daemon (Not Scored)
#
class secure_linux_cis::rules::disable_the_rhnsd_daemon {
  service { 'rhnsd':
    ensure => stopped,
    enable => false,
  }
}
