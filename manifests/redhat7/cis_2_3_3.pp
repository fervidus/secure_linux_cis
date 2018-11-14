# 2.3.3 Ensure talk client is not installed (Scored)
#
# Description:
# The talk software makes it possible for users to send and receive messages across systems through a terminal session.
# The talk client, which allows initialization of talk sessions, is installed by default.
#
# Rationale:
# The software presents a security risk as it uses unencrypted protocols for communication.
#
# @summary 2.3.3 Ensure talk client is not installed (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_2_3_3
class secure_linux_cis::redhat7::cis_2_3_3 (
  Boolean $enforced = true,
) {

  if $enforced {
    package { 'talk':
      ensure => purged,
    }
  }
}
