# 2.3.2 Ensure rsh client is not installed (Scored)
#
# Description:
# The rsh package contains the client commands for the rsh services.
#
# Rationale:
# These legacy clients contain numerous security exposures and have been replaced with the more secure SSH package.
# Even if the server is removed, it is best to ensure the clients are also removed to prevent users from inadvertently attempting
# to use these commands and therefore exposing their credentials.
# Note that removing the rsh package removes the clients for rsh , rcp and rlogin .
#
# @summary 2.3.2 Ensure rsh client is not installed (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_2_3_2
class secure_linux_cis::redhat7::cis_2_3_2 (
  Boolean $enforced = true,
) {

  if $enforced {
    package { 'rsh':
      ensure => purged,
    }
  }
}
