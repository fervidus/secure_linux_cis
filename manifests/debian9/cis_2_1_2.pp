# 2.1.2 Ensure openbsd-inetd is not installed (Scored)
#
# Description:
# The inetd daemon listens for well known services and dispatches the appropriate daemon
# to properly respond to service requests.
#
# Rationale:
# If there are no inetd services required, it is recommended that the package be removed.
#
# @summary 2.1.2 Ensure openbsd-inetd is not installed (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::debian9::cis_2_1_2
class secure_linux_cis::debian9::cis_2_1_2 (
  Boolean $enforced = true,
) {

  if $enforced {

    package { 'openbsd-inetd':
      ensure => absent,
    }

  }
}
