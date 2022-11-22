# @api private
#
# @summary Ensure iptables is enabled and running 
#
class secure_linux_cis::rules::ensure_iptables_is_enabled_and_running {
  service { 'iptables':
    ensure => running,
    enable => true,
  }
}
