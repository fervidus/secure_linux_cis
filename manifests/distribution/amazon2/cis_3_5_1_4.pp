#
class secure_linux_cis::distribution::amazon2::cis_3_5_1_4 {
  include secure_linux_cis::rules::ensure_firewall_rules_exist_for_all_open_ports
}
