#
class secure_linux_cis::distribution::debian8::cis_3_3_4 {
  include secure_linux_cis::rules::ensure_permissions_on_etc_hosts_allow_are_configured
}
