# @api private
#
# @summary Ensure chrony is enabled and running 
#
class secure_linux_cis::rules::ensure_chrony_is_enabled_and_running {
  if $secure_linux_cis::time_sync == 'chrony' {
    service { 'chrony':
      ensure => running,
      enable => true,
    }
  }
}
