# 2.2.18 Ensure talk server is not enabled (Scored)
#
# Description:
# The talk software makes it possible for users to send and receive messages across systems
# through a terminal session. The talk client (allows initiate of talk sessions) is installed by default.
#
# Rationale:
# The software presents a security risk as it uses unencrypted protocols for communication.
#
# @summary 2.2.18 Ensure talk server is not enabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_2_2_18
class secure_linux_cis::redhat7::cis_2_2_18 (
  Boolean $enforced = true,
) {

  if $enforced {
    service { 'ntalk':
      ensure => stopped,
      enable => false,
    }
  }
}
