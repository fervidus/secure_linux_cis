# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
class secure_linux_cis::rules::ensure_cups_is_not_enabled {
  service { 'cups':
    ensure => stopped,
    enable => false,
  }
}
