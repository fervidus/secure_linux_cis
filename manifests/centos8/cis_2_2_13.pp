#
class secure_linux_cis::centos8::cis_2_2_13 {
  include secure_linux_cis::rules::ensure_RPC_is_not_enabled
}
