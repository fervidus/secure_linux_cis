# 2.2.19 Ensure telnet server is not enabled (Scored)
#
# Description:
# The telnet-server package contains the telnet daemon, which accepts connections
# from users from other systems via the telnet protocol.
#
# Rationale:
# The telnet protocol is insecure and unencrypted. The use of an unencrypted transmission
# medium could allow a user with access to sniff network traffic the ability to steal credentials.
# The ssh package provides an encrypted session and stronger security.
#
# @summary 2.2.19 Ensure telnet server is not enabled (Scored)
#
# @example
#   include secure_linux_cis::redhat7::cis_2_2_19
class secure_linux_cis::redhat7::cis_2_2_19 (
  Boolean $enforced = true,
) {

  if $enforced {
    service { 'telnet.socket':
      ensure => stopped,
      enable => false,
    }
  }
}
