#
class secure_linux_cis::cis_amazon1::cis_3_6_5 (
  Boolean $enforced = true,
) {
  contain secure_linux_cis::rules::ensure_firewall_rules_exist_for_all_open_ports
}
