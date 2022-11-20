# @api private
#  Ensure telnet client is not installed (Scored)
#
# Description:
# The telnet package contains the telnet client, which allows users to start connections to other systems via the telnet protocol.
#
# Rationale:
# The telnet protocol is insecure and unencrypted. The use of an unencrypted transmission medium could allow an unauthorized user
# to steal credentials. The ssh package provides an encrypted session and stronger security and is included in most Linux distributions.
#
# @summary  Ensure telnet client is not installed (Scored)
#
class secure_linux_cis::rules::ensure_telnet_client_is_not_installed {
  case $facts['os']['family'] {
    'Suse': {
      package { 'telnet':
        ensure   => absent,
      }
    }
    default: {
      package { 'telnet':
        ensure   => absent,
      }
    }
  }
}
