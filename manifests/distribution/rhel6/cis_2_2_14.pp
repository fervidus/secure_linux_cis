# @api private
#
class secure_linux_cis::distribution::rhel6::cis_2_2_14 {
  include secure_linux_cis::rules::ensure_snmp_server_is_not_enabled
}
