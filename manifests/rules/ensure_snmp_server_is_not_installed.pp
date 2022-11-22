# @api private
#
# @summary Ensure SNMP Server is not installed 
#
class secure_linux_cis::rules::ensure_snmp_server_is_not_installed {
  package { 'snmpd':
    ensure => absent,
  }
}
