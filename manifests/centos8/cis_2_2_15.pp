#
class secure_linux_cis::centos8::cis_2_2_15 {
  include secure_linux_cis::rules::ensure_DHCP_Server_is_not_enabled
}
