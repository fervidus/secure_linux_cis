#
class secure_linux_cis::rhel8::cis_3_4_4_1_4 {
  include secure_linux_cis::rules::ensure_firewall_rules_exist_for_all_open_ports_scored_configured
}