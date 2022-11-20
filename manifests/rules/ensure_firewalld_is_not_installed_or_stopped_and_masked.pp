# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_firewalld_is_not_installed_or_stopped_and_masked {
  package { 'firewalld':
    ensure => absent,
  }
}
