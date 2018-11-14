# 2.3.4 Ensure telnet client is not installed (Scored)
#
# Description:
# The telnet package contains the telnet client, which allows users to start connections to other systems via the telnet protocol.
#
# Rationale:
# The telnet protocol is insecure and unencrypted. The use of an unencrypted transmission medium could allow an unauthorized user
# to steal credentials. The ssh package provides an encrypted session and stronger security and is included in most Linux distributions.
#
# @summary 2.3.4 Ensure telnet client is not installed (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_2_3_4
class secure_linux_cis::redhat7::cis_2_3_4 (
  Boolean $enforced = true,
) {

  if $enforced {
    package { 'telnet':
      ensure => purged,
    }
  }
}
