#
class secure_linux_cis::debian9::cis_3_5_3 {
  include secure_linux_cis::rules::ensure_iptables_is_installed
}