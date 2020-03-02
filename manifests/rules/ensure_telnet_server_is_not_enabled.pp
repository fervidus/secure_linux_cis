# @api private
# 9 Ensure telnet server is not enabled (Scored)
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
# @summary 9 Ensure telnet server is not enabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_telnet_server_is_not_enabled
class secure_linux_cis::rules::ensure_telnet_server_is_not_enabled(
    Boolean $enforced = true,
) {
  if $enforced {
    service { 'telnet.socket':
      ensure   => stopped,
      schedule => 'harden_schedule',
      enable   => false,
    }
  }
}
