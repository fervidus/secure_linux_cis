# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_email_services_are_not_enabled {
  service { 'dovecot':
    ensure => stopped,
    enable => false,
  }
}
