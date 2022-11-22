# @api private
#
# @summary Ensure iptables package is installed 
#
class secure_linux_cis::rules::ensure_iptables_package_is_installed {
  package { 'iptables':
    ensure => installed,
  }
}
