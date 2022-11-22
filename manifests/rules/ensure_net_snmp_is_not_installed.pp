# @api private
#
# @summary Ensure net-snmp is not installed 
#
class secure_linux_cis::rules::ensure_net_snmp_is_not_installed {
  package { 'net-snmp':
    ensure => absent,
  }
}
