#
class secure_linux_cis::distribution::centos8::cis_2_2_17 {
  include secure_linux_cis::rules::ensure_NIS_Server_is_not_enabled
}
