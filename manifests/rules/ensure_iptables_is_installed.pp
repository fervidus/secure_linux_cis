# @api private
#
# @summary Ensure iptables is installed 
#
class secure_linux_cis::rules::ensure_iptables_is_installed {
  package { 'iptables':
    ensure => installed,
  }
}
