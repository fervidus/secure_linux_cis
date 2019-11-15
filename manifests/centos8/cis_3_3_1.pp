#
class secure_linux_cis::centos8::cis_3_3_1 {
  include secure_linux_cis::rules::ensure_DCCP_is_disabled
}
