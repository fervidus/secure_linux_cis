# 2.1.1 Ensure xinetd is not installed (Scored)
#
# Description:
# The eXtended InterNET Daemon ( xinetd ) is an open source super daemon that replaced
# the original inetd daemon. The xinetd daemon listens for well known services and
# dispatches the appropriate daemon to properly respond to service requests.
#
# Rationale:
# If there are no xinetd services required, it is recommended that the package be removed.
#
# @summary 2.1.1 Ensure xinetd is not installed (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::debian9::cis_2_1_1
class secure_linux_cis::debian9::cis_2_1_1 (
  Boolean $enforced = true,
) {

  if $enforced {

    package { 'xinetd':
      ensure => absent,
    }

  }
}
