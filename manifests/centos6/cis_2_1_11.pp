#
class secure_linux_cis::centos6::cis_2_1_11 {
  include secure_linux_cis::rules::ensure_xinetd_is_not_enabled
}