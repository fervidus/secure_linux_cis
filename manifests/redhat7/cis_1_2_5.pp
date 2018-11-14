# 1.2.5 Disable the rhnsd Daemon (Not Scored)
#
#
# Description:
# The rhnsd daemon polls the Red Hat Network web site for scheduled actions and, if there are, executes those actions.
#
# @summary 1.2.5 Disable the rhnsd Daemon (Not Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_1_2_5
class secure_linux_cis::redhat7::cis_1_2_5 (
  Boolean $enforced = true,
) {

  if $enforced {

    service { 'rhnsd':
      ensure => stopped,
      enable => false,
    }
  }
}
