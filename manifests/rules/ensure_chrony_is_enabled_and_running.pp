# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include secure_linux_cis::rules::ensure_chrony_is_enabled_and_running
class secure_linux_cis::rules::ensure_chrony_is_enabled_and_running {
  if $secure_linux_cis::time_sync == 'chrony' {
    service { 'chrony':
      ensure => running,
      enable => true,
    }
  }
}
