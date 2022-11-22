# @api private
#
# @summary Ensure iptables is enabled and active 
#
class secure_linux_cis::rules::ensure_iptables_is_enabled_and_active {
  service { 'iptables':
    ensure => running,
    enable => true,
  }
}
