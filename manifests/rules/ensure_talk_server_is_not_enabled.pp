# @api private
# 8 Ensure talk server is not enabled (Scored)
#
# Description:
# The talk software makes it possible for users to send and receive messages across systems
# through a terminal session. The talk client (allows initiate of talk sessions) is installed by default.
#
# Rationale:
# The software presents a security risk as it uses unencrypted protocols for communication.
#
# @summary 8 Ensure talk server is not enabled (Scored)
#
class secure_linux_cis::rules::ensure_talk_server_is_not_enabled {
  service { 'ntalk':
    ensure => stopped,
    enable => false,
  }
}
