#
class secure_linux_cis::cis_rhel6::cis_2_2_14 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_snmp_server_is_not_enabled
}
