# @api private
# 1 Ensure IMAP and POP3 server is not enabled (Scored)
#
# Description:
# dovecot is an open source IMAP and POP3 server for Linux based systems.
#
# Rationale:
# Unless POP3 and/or IMAP servers are to be provided by this system,
# it is recommended that the service be disabled to reduce the potential attack surface.
#
# @summary 1 Ensure IMAP and POP3 server is not enabled (Scored)
#
# @param enforced Should this rule be enforced
#
# @example
#   include secure_linux_cis::ensure_imap_and_pop3_server_is_not_installed
class secure_linux_cis::rules::ensure_imap_and_pop3_server_is_not_installed {
  package { 'dovecot':
    ensure => absent,
  }
}
