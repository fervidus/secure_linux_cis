# 2.2.17 Ensure rsh server is not enabled (Scored)
#
# Description:
# The Berkeley rsh-server ( rsh , rlogin , rexec ) package contains legacy services that exchange credentials in clear-text.
#
# Rationale:
# These legacy services contain numerous security exposures and have been replaced with the more secure SSH package.
#
# @summary 2.2.17 Ensure rsh server is not enabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_2_2_17
class secure_linux_cis::redhat7::cis_2_2_17 (
  Boolean $enforced = true,
) {

  if $enforced {
    $rsh_services = [
      'rsh.socket',
      'rlogin.socket',
      'rexec.socket',
    ]

    service { $rsh_services:
      ensure => stopped,
      enable => false,
    }
  }
}
