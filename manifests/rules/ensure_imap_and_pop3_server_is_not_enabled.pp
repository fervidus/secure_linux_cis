# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_imap_and_pop3_server_is_not_enabled {
  service { ['dovecot']:
    ensure => stopped,
    enable => false,
  }
}
